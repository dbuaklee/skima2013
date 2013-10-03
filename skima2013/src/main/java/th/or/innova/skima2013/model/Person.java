package th.or.innova.skima2013.model;

import java.io.Serializable;
import java.text.DecimalFormat;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;
import org.springframework.binding.validation.ValidationContext;

@Entity
@Table(name="SKIMA2013_PERSON")
@SequenceGenerator(name="PERSON_SEQ", sequenceName="PERSON_SEQ", allocationSize=1)
public class Person implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -6597374913475005956L;
	private static final DecimalFormat nf = new DecimalFormat("#,##0");

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator="PERSON_SEQ")
	private Integer id;

	@Enumerated(EnumType.STRING)
	private Title title;
	
	private String middleName;
	
	private String firstName;

	private String lastName;

	private String email;

	@ManyToOne(cascade = CascadeType.ALL)
	private Address mainAddress;

	@ManyToOne(cascade = CascadeType.ALL)
	private Address billingAddress;

	private Boolean sameBillingAddress = true;

	@OneToOne(cascade = CascadeType.ALL)
	private RegistrationInfo registrationInfo;

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public Title getTitle() {
		return title;
	}

	public void setTitle(Title title) {
		this.title = title;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Address getMainAddress() {
		return mainAddress;
	}

	public void setMainAddress(Address mainAddress) {
		this.mainAddress = mainAddress;
	}

	public Address getBillingAddress() {
		return billingAddress;
	}

	public void setBillingAddress(Address billingAddress) {
		this.billingAddress = billingAddress;
	}

	public Boolean getSameBillingAddress() {
		return sameBillingAddress;
	}

	public void setSameBillingAddress(Boolean sameBillingAddress) {
		this.sameBillingAddress = sameBillingAddress;
	}

	public RegistrationInfo getRegistrationInfo() {
		return registrationInfo;
	}

	public void setRegistrationInfo(RegistrationInfo registrationInfo) {
		this.registrationInfo = registrationInfo;
	}
	
	@Transient
	public String getTitleDisplayValue() {
		return title.getDisplayValue();
	}

	@Transient
	public Title[] getTitleList() {
		return Title.values();
	}
	
	@Transient
	public String getFullName() {
		return this.title.getDisplayValue() + " " + this.firstName + " " + this.lastName;
	}
	
	@Transient
	public String getBillingAddressString() {
		Address print = this.mainAddress;
		
		if(!this.sameBillingAddress) {
			print = this.billingAddress;
		}
		
		String ret = "";
		if(print.getOrganizationName() != null && print.getOrganizationName().length() > 0) { 
			ret = print.getOrganizationName() + "\n";
		}
		ret += print.getAddress1() + "\n";
		if(print.getAddress2() != null && print.getAddress2().length() > 0) {
			ret += print.getAddress2() + "\n";
		}
		
		ret += print.getCity() + " " + print.getZip() + "\n" + print.getCountry();
		
		
		return ret;
	}
	
	public void validateEnterRegistration(ValidationContext context) {
		MessageContext messages = context.getMessageContext();
		if (this.firstName == null || this.firstName.trim().length() == 0) {
			messages.addMessage(new MessageBuilder().error()
					.source("firstName")
					.defaultText("First/Given Name is Required!").build());
		}
		if (this.lastName == null || this.lastName.trim().length() == 0) {
			messages.addMessage(new MessageBuilder().error().source("lastName")
					.defaultText("Last/Family Name is Required!").build());
		}
		if (this.email == null || this.email.trim().length() == 0) {
			messages.addMessage(new MessageBuilder().error().source("email")
					.defaultText("Email is Required!").build());
		} else if (!this.email.trim().matches(
				"(.+)@(.+\\.)(.+)(\\..+)*")) {
			messages.addMessage(new MessageBuilder().error().source("email")
					.defaultText("Please enter a valid email address!").build());
		}
	}

	public void validateRegistrationItemSelecting(ValidationContext context) {
		MessageContext messages = context.getMessageContext();
		if (this.mainAddress.getAddress1() == null
				|| this.mainAddress.getAddress1().trim().length() == 0) {
			messages.addMessage(new MessageBuilder().error().source("mainAddress.address1")
					.defaultText("Address 1 is Required!").build());
		}
		if (this.mainAddress.getCity() == null
				|| this.mainAddress.getCity().trim().length() == 0) {
			messages.addMessage(new MessageBuilder().error().source("mainAddress.city")
					.defaultText("city name is Required!").build());
		}
		if (this.mainAddress.getZip() == null
				|| this.mainAddress.getZip().trim().length() == 0) {
			messages.addMessage(new MessageBuilder().error().source("mainAddress.zip")
					.defaultText("ZIP/Postal Codes is Required!").build());
		}
		if (this.mainAddress.getCountry() == null
				|| this.mainAddress.getCountry().trim().length() == 0
				|| this.mainAddress.getCountry().equals("0")) {
			messages.addMessage(new MessageBuilder().error().source("mainAddress.country")
					.defaultText("Please select a country").build());
		}
		if (this.mainAddress.getTelephone() == null
				|| this.mainAddress.getTelephone().trim().length() == 0) {
			messages.addMessage(new MessageBuilder().error()
					.source("mainAddress.telephone").defaultText("Telepone is Required!")
					.build());
		}
		// comment out hotel reservation
//		if (this.registrationInfo.getHotelReservation() == null) {
//			messages.addMessage(new MessageBuilder().error()
//					.source("registrationInfo.hotelReservation")
//					.defaultText("Please select Hotel Reservation").build());
//		}
		if (this.registrationInfo.getRegistrationItem() == null) {
			messages.addMessage(new MessageBuilder().error()
					.source("registrationInfo.registrationItem")
					.defaultText("Please select Registration").build());
		}
		if (this.registrationInfo.getWorkshopItem() == null) {
			this.registrationInfo.setWorkshopItem(WorkshopItem.notSelected);
		}
		
		if(this.sameBillingAddress == false) {
			if (this.billingAddress.getOrganizationName() == null
					|| this.billingAddress.getOrganizationName().trim().length() == 0) {
				messages.addMessage(new MessageBuilder().error().source("billingAddress.organizationName")
						.defaultText("Organization Name is Required for Billing Address!").build());
			}
			if (this.billingAddress.getAddress1() == null
					|| this.billingAddress.getAddress1().trim().length() == 0) {
				messages.addMessage(new MessageBuilder().error().source("billingAddress.address1")
						.defaultText("Address 1 is Required!").build());
			}
			if (this.billingAddress.getCity() == null
					|| this.billingAddress.getCity().trim().length() == 0) {
				messages.addMessage(new MessageBuilder().error().source("billingAddress.city")
						.defaultText("city name is Required!").build());
			}
			if (this.billingAddress.getZip() == null
					|| this.billingAddress.getZip().trim().length() == 0) {
				messages.addMessage(new MessageBuilder().error().source("billingAddres.szip")
						.defaultText("ZIP/Postal Codes is Required!").build());
			}
			if (this.billingAddress.getCountry() == null
					|| this.billingAddress.getCountry().trim().length() == 0
					|| this.billingAddress.getCountry().equals("0")) {
				messages.addMessage(new MessageBuilder().error().source("billingAddress.country")
						.defaultText("Please select a country").build());
			}
			if (this.billingAddress.getTelephone() == null
					|| this.billingAddress.getTelephone().trim().length() == 0) {
				messages.addMessage(new MessageBuilder().error()
						.source("billingAddress.telephone").defaultText("Telepone is Required!")
						.build());
			}
			
		}
		
		if(messages.getMessagesBySource("registrationInfo.numExtraBanquet").length == 0) {
			if(this.registrationInfo.getNumExtraBanquet() == null) {
				messages.addMessage(new MessageBuilder().error()
						.source("registrationInfo.numExtraBanquet").defaultText("Please type in number of extra banquet you want")
						.build());
			}
		}
		
		if(messages.getMessagesBySource("registrationInfo.numExtraCD").length == 0) {
			if(this.registrationInfo.getNumExtraCD() == null) {
				messages.addMessage(new MessageBuilder().error()
						.source("registrationInfo.numExtraCD").defaultText("Please type in number of extra CD you want")
						.build());
			}
		}
		
	}
	
	public void validateRegistrationConfirmed(ValidationContext context) {
		MessageContext messages = context.getMessageContext();
		if (this.registrationInfo.getPaymentMethod() == null) {
			messages.addMessage(new MessageBuilder().error()
					.source("registrationInfo.paymentMethod")
					.defaultText("Please select your paymnet method").build());
		}
	}
}
