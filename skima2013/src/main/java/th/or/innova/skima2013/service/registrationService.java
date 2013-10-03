package th.or.innova.skima2013.service;

import org.springframework.binding.message.MessageContext;
import org.springframework.data.domain.Page;

import th.or.innova.skima2013.model.Person;

public interface registrationService {
	public void registerPerson(Person person);
	
	public Person getNewPerson();
	
	public Person findPersonByRegistrationInfoRefCode(String refCode);
	
	public Boolean checkRegistratorByEmailAndRefCode(Person registrator, MessageContext context);
	public Person getRegistratorByEmailAndRefCode(Person registrator);
	
	public Page<Person> findAllRegisters(String filter, Integer index);

	public void save(Person person);
	
	public void sendRegistrationMail(Person p);

	public void sendReceiptMail(Person p);
	
}
