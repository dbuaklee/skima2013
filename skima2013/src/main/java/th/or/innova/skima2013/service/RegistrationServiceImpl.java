package th.or.innova.skima2013.service;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.servlet.ServletContext;

import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.util.JRLoader;

import org.apache.velocity.app.VelocityEngine;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.InputStreamResource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.springframework.web.servlet.view.jasperreports.AbstractJasperReportsView;
import org.springframework.web.servlet.view.jasperreports.JasperReportsMultiFormatView;

import com.mysema.query.types.expr.BooleanExpression;



import th.or.innova.skima2013.model.Address;
import th.or.innova.skima2013.model.Person;
import th.or.innova.skima2013.model.QPerson;
import th.or.innova.skima2013.model.RegistrationInfo;
import th.or.innova.skima2013.model.RegistrationStatus;
import th.or.innova.skima2013.repository.PersonRepository;

@Service
public class RegistrationServiceImpl implements registrationService {

	private static final Logger logger = LoggerFactory.getLogger(RegistrationInfo.class);
	
	private static final Integer PAGE_SIZE=20;
	
	@Autowired
	private PersonRepository personRepository;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private VelocityEngine velocityEngine;
	
	@Autowired
	private ServletContext servletContext;
	
	@Override
	public void registerPerson(Person person) {
		if(person.getSameBillingAddress() == true) {
			logger.debug("same billing address");
			person.setBillingAddress(person.getMainAddress());
		}
		person.getRegistrationInfo().setJunkRegister(false);
		personRepository.save(person);
		
		// now generate refcode which will be 2012-0001
		person.getRegistrationInfo().setRefCode("2013-" + String.format("%05d", person.getId()));
		person.getRegistrationInfo().setRegisterDate(new Date());
		//
		
		personRepository.save(person);
		return;
	}

	@Override
	public Person getNewPerson() {
		Person p = new Person();
		
		// now initialize
		p.setBillingAddress(new Address());
		p.setMainAddress(new Address());
		p.setRegistrationInfo(new RegistrationInfo());
		p.getRegistrationInfo().setStatus(RegistrationStatus.Unpaid);
		p.setSameBillingAddress(true);
		
		// return
		return p;
	}

	@Override
	public Person findPersonByRegistrationInfoRefCode(String refCode) {
		return personRepository.findByRegistrationInfo_refCodeLike(refCode);
	}

	@Override
	public Page<Person> findAllRegisters(String filter, Integer index) {
		QPerson person = QPerson.person;
		BooleanExpression pred;
		
		if(filter.equals("JUNK")) {
			pred = person.registrationInfo.junkRegister.eq(true);
		} else if(filter.equals("PAID")) {
			pred = person.registrationInfo.status.eq(RegistrationStatus.Paid);
			pred = pred.and(person.registrationInfo.junkRegister.eq(false));
		} else if(filter.equals("UNPAID")) {
			pred = person.registrationInfo.status.eq(RegistrationStatus.Unpaid);
			pred = pred.and(person.registrationInfo.junkRegister.eq(false));
		} else if(filter.equals("ALL")) {
			pred = person.registrationInfo.junkRegister.eq(false);
		} else {
			pred = person.isNotNull();
		}
		
		return personRepository.findAll(pred, new PageRequest(index, PAGE_SIZE , new Sort(new Order(Direction.DESC, "id"))));
	}

	@Override
	public Boolean checkRegistratorByEmailAndRefCode(Person registrator, MessageContext context) {
		// now find the person
		Person p = personRepository.findByEmailAndRegistrationInfo_refCode(
				registrator.getEmail(),registrator.getRegistrationInfo().getRefCode());
		
		if( p != null && p.getId() != null) {
			//registrator = p;
			//logger.debug(registrator.getTitleDisplayValue());
			return true;
		}
		
		context.addMessage(new MessageBuilder().error()
				.defaultText("There is no record of such Email and Invoice Number, Please Enter both information again.").build());
				return false;
		
		
	}
	
	@Override
	public Person getRegistratorByEmailAndRefCode(Person registrator) {
		return personRepository.findByEmailAndRegistrationInfo_refCode(
				registrator.getEmail(),registrator.getRegistrationInfo().getRefCode());
	}
	
	@Override
	public void save(Person person) {
		personRepository.save(person);
	}

	@Override
	public void sendRegistrationMail(final Person p) {
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
	         public void prepare(MimeMessage mimeMessage) throws Exception {
	        	MimeMessageHelper message = new MimeMessageHelper(mimeMessage);
	        	message.setTo(p.getEmail());
	            message.setFrom("skima2013@innova.or.th"); // could be parameterized...
	            message.setSubject("SKIMA 2013 Regirstration");
	            Map model = new HashMap();
	            model.put("p", p);
	            String text = VelocityEngineUtils.mergeTemplateIntoString(
	               velocityEngine, "registration-email.vm", model);
	            message.setText(text, true);
	         }
	      };
	      this.mailSender.send(preparator);
		
	}
	
	@Override
	public void sendReceiptMail(final Person p) {
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
	         public void prepare(MimeMessage mimeMessage) throws Exception {
	        	MimeMessageHelper message = new MimeMessageHelper(mimeMessage, true);
	        	message.setTo(p.getEmail());
	            message.setFrom("skima2013@innova.or.th"); // could be parameterized...
	            message.setSubject("SKIMA 2013 Regirstration Receipt");
	            Map model = new HashMap();
	            model.put("p", p);
	            String text = VelocityEngineUtils.mergeTemplateIntoString(
	               velocityEngine, "receipt-email.vm", model);
	            message.setText(text, true);
	            
	            Map<String, Object> map = new HashMap<String, Object>();
	            //map.put("list", p.getRegistrationInfo().getLineItemReceipt());
				map.put("PERSON", p);
				map.put("SHOW_SIGNATURE", true);
				
				AbstractJasperReportsView  view = new JasperReportsMultiFormatView();
				view.setUrl("/WEB-INF/reports/simpleReport.jasper");
				view.setContentType("application/pdf");
				
				FileSystemResource file = new FileSystemResource(
						servletContext.getRealPath("/WEB-INF/reports/simpleReport.jasper"));
				
	            JasperPrint jp = JasperFillManager.fillReport(file.getPath(), map,
	            		new JRBeanCollectionDataSource(p.getRegistrationInfo().getLineItemReceipt()));
	            ByteArrayOutputStream baos = new ByteArrayOutputStream();
	            
		         // Export to output stream
		         // The data will be exported to the ByteArrayOutputStream baos
		         // We delegate the exporting  to a custom Exporter instance
		         // The Exporter is a wrapper class I made. Feel free to remove or modify it
		        JRPdfExporter exporter = new JRPdfExporter();
		        exporter.setParameter(JRExporterParameter.JASPER_PRINT, jp);
		        exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, baos);
	            exporter.exportReport();
	            
	            
	            
	            
	            message.addAttachment("SKIMA2013_receipt_" + p.getRegistrationInfo().getRefCode() +".pdf", 
	            		new ByteArrayResource(baos.toByteArray()), "application/pdf");
	         }
	      };
	      this.mailSender.send(preparator);
	}

}
