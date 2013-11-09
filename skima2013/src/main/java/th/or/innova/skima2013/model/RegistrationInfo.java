package th.or.innova.skima2013.model;

import java.io.Serializable;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.ibm.icu.text.NumberFormat;
import com.ibm.icu.text.RuleBasedNumberFormat;

@Entity
@Table(name="SKIMA2013_REGISTRATIONINFO")
@SequenceGenerator(name="REGISTRATIONINFO_SEQ", sequenceName="REGISTRATIONINFO_SEQ", allocationSize=1)
public class RegistrationInfo implements Serializable {

	/**
	 * 
	 */
	private static final SimpleDateFormat dfDate = new SimpleDateFormat("d MMM yyyy", Locale.US);
	private static final SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm", Locale.US);
	private static final DecimalFormat nf = new DecimalFormat("#,##0");
	private static final DecimalFormat nf2decimal = new DecimalFormat("#,##0.00");
	private static final Date nov15_2013;
	private static final Date sep1_2012;

	static {
		// initialize the date
		try {
			nov15_2013 = df.parse("2013-11-15 23:00");
			sep1_2012 = df.parse("2012-09-01 23:00");
		} catch (ParseException e) {
			throw new ExceptionInInitializerError(e);
		}
	}
	
	private static final long serialVersionUID = 1L;

	private static final Double processingFee = 0.0;
	
	public static final Double exchangeRate = 32.0;
	
	private static final Double extraBanquetRate = 80.0;
	
	private static final Double extraCDRate = 20.0;
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="REGISTRATIONINFO_SEQ")
	private Integer id;
	
	@Enumerated(EnumType.STRING)
	private HotelReservationChoice hotelReservation;
	
	@Enumerated(EnumType.STRING)
	private RegistrationItem registrationItem;
	
	private Integer numExtraBanquet = 0;
	
	private Integer numExtraCD = 0;
	
	@Enumerated(EnumType.STRING)
	private WorkshopItem workshopItem;
	
	@Basic
	private Boolean junkRegister;
	
	@Basic
	private Boolean receiptSent;
	
	private String refCode;
	
	@Enumerated(EnumType.STRING)
	private RegistrationStatus status;
	
	@Enumerated(EnumType.STRING)
	private creditCardPaymentStatus creditCardPaymentStatus;
	
	@Enumerated(EnumType.STRING)
	private PaymentMethod paymentMethod;
	
	@OneToOne (mappedBy="registrationInfo")
	private Person person;
	
	@Temporal(TemporalType.DATE)
	private Date registerDate;
	
	@Temporal(TemporalType.DATE)
	private Date receiptDate;
	
	private String receiptNo;
	
	private Double receiptExchangeRate;
	
	private Double receiptTotalThaiBaht;

	
	
	public Boolean getJunkRegister() {
		return junkRegister;
	}
	public void setJunkRegister(Boolean junkRegister) {
		this.junkRegister = junkRegister;
	}
	public Boolean getReceiptSent() {
		return receiptSent;
	}
	public void setReceiptSent(Boolean receiptSent) {
		this.receiptSent = receiptSent;
	}
	public Double getReceiptExchangeRate() {
		return receiptExchangeRate;
	}
	public void setReceiptExchangeRate(Double receiptExchangeRate) {
		this.receiptExchangeRate = receiptExchangeRate;
	}
	public Double getReceiptTotalThaiBaht() {
		return receiptTotalThaiBaht;
	}
	public void setReceiptTotalThaiBaht(Double receiptTotalThaiBaht) {
		this.receiptTotalThaiBaht = receiptTotalThaiBaht;
	}
	public Date getReceiptDate() {
		return receiptDate;
	}
	public String getFormatReceiptDate() {
		if(receiptDate == null) {
			return "";
		}
		return dfDate.format(receiptDate);
	}
	public void setReceiptDate(Date receiptDate) {
		this.receiptDate = receiptDate;
	}
	public String getReceiptNo() {
		return receiptNo;
	}
	public void setReceiptNo(String receiptNo) {
		this.receiptNo = receiptNo;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Person getPerson() {
		return person;
	}
	public void setPerson(Person person) {
		this.person = person;
	}
	public Date getRegisterDate() {
		return registerDate;
	}
	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}
	public String getRefCode() {
		return refCode;
	}
	public void setRefCode(String refCode) {
		this.refCode = refCode;
	}
	public RegistrationStatus getStatus() {
		return status;
	}
	public void setStatus(RegistrationStatus status) {
		this.status = status;
	}
	public HotelReservationChoice getHotelReservation() {
		return hotelReservation;
	}
	public void setHotelReservation(HotelReservationChoice hotelReservation) {
		this.hotelReservation = hotelReservation;
	}
	public RegistrationItem getRegistrationItem() {
		return registrationItem;
	}
	public void setRegistrationItem(RegistrationItem registrationItem) {
		this.registrationItem = registrationItem;
	}
	public WorkshopItem getWorkshopItem() {
		return workshopItem;
	}
	public void setWorkshopItem(WorkshopItem workshop) {
		this.workshopItem = workshop;
	}
	public PaymentMethod getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(PaymentMethod paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public Boolean isPayByMoneyTransfer() {
		return this.paymentMethod == PaymentMethod.moneyTransfer ? true : false;
	}
	public Boolean isPayByCreditCard() {
		return this.paymentMethod == PaymentMethod.creditCard ? true : false;
	}
	public creditCardPaymentStatus getCreditCardPaymentStatus() {
		return creditCardPaymentStatus;
	}
	public void setCreditCardPaymentStatus(
			creditCardPaymentStatus creditCardPaymentStatus) {
		this.creditCardPaymentStatus = creditCardPaymentStatus;
	}
	public String getPaymentMethodCreditCardWebString() {
		return PaymentMethod.creditCard.getWebString();
	}
	public String getPaymentMethodMoneyTransferWebString() {
		return PaymentMethod.moneyTransfer.getWebString();
	}
	public Integer getNumExtraBanquet() {
		return numExtraBanquet;
	}
	public void setNumExtraBanquet(Integer numExtraBanquet) {
		this.numExtraBanquet = numExtraBanquet;
	}
	public Integer getNumExtraCD() {
		return numExtraCD;
	}
	public void setNumExtraCD(Integer numExtraCD) {
		this.numExtraCD = numExtraCD;
	}
	public String getWorkshopItemNotSelectedWebString() {
		return WorkshopItem.notSelected.getWebString();
	}
	public String getWorkshopItemOnedayWebString() {
		return WorkshopItem.oneDay.getWebString();
	}
	public String getWorkshopItemThreedayWebString() {
		return WorkshopItem.threeDay.getWebString();
	}
	
	public String getHotelReservationYesWebString() {
		return HotelReservationChoice.yes.getWebString();
	}
	
	public String getHotelReservationNoWebString() {
		return HotelReservationChoice.no.getWebString();
	}
	
	public String getRegistrationItemFullString() {
		String s = RegistrationItem.full.toString();
		s += "/ ";
		s += nf.format(getRegistrationItemFullFee());
		s += " USD";
		s += " (" + getRateString() + ")";
		return s;
	}
	
	public String getRegistrationItemStudentString() {
		String s = RegistrationItem.student.toString();
		s += " / ";
		s += nf.format(getRegistrationItemStudentFee());
		s += " USD";
		s += " (" + getRateString() + ")";
		return s;
	}

	public String getRegistrationItemParticipantString() {
		String s = RegistrationItem.participant.toString();
		s += " / ";
		s += nf.format(getRegistrationItemParticipantFee());
		s += " Thai Baht";
		s += " (" + getRateString() + ")";
		return s;
	}
	
	public String getHotelReservationWebString() {
		return this.hotelReservation.getWebString();
	}
	
	public String getRegistrationItemStringNoFee() {
		if( this.registrationItem == null ) return null;
		String s = this.registrationItem.toString();
		if(registrationItem != RegistrationItem.participant) {
			s += " (" + getRateString() + ")";
		}
		return s;
	}
	
	public String getRegistrationItemWebString() {
		if( this.registrationItem == null ) return null;
		String s = this.registrationItem.toString();
		s += " / ";
		s += nf.format(getRegistrationItemFee());
		if(registrationItem != RegistrationItem.participant) {
			s += " USD";
		} else {
			s += " Thai Baht";
		}
		s += " (" + getRateString() + ")";
		
		return s;
	}
	public String getWorkshopItemWebString() {
		return this.workshopItem.getWebString();
	}
	public String getWorkshopItemDayString() {
		if(workshopItem == WorkshopItem.threeDay) {
			return "3 days";
		} else {
			return "1 days";
		}
	}
	
	public Double getRegistrationItemFullFee() {
		Double fee = 0.0;
		Date calculatedDate;
		if(registerDate == null) {
			calculatedDate = new Date();
		} else {
			calculatedDate = registerDate;
		}
		
		if(calculatedDate.compareTo(nov15_2013) <= 0)  {
				fee += 400;
			} else {
				fee += 450;
			}
		return fee;
	}
	
	public Double getRegistrationItemParticipantFee() {
		Double fee = 0.0;
		Date calculatedDate;
		if(registerDate == null) {
			calculatedDate = new Date();
		} else {
			calculatedDate = registerDate;
		}
		
		if(calculatedDate.compareTo(nov15_2013) <= 0)  {
				fee += 6000;
			} else {
				fee += 7500;
			}
		return fee;
	}
	
	public Double getRegistrationItemStudentFee() {
		Double fee = 0.0;
		Date calculatedDate;
		if(registerDate == null) {
			calculatedDate = new Date();
		} else {
			calculatedDate = registerDate;
		}
		
		if(calculatedDate.compareTo(nov15_2013) <= 0)  {
				fee += 280;
			} else {
				fee += 330;
			}
		return fee;
	}
	
	public String getRateString() {
		String s;
		Date calculatedDate;
		if(registerDate == null) {
			calculatedDate = new Date();
		} else {
			calculatedDate = registerDate;
		}
		
		if (calculatedDate.compareTo(nov15_2013) <= 0) {
			s = "Before 15 November 2013 Advance Rate";
		} else {
			s = "After 15 November 2013 and On-site rate";
		}
		return s;
	}
	
	public Double getRegistrationItemFee() {
		Double fee = 0.0;
		if(registrationItem == RegistrationItem.full) {
			fee = getRegistrationItemFullFee();
		} else if(registrationItem == RegistrationItem.student) {
			fee = getRegistrationItemStudentFee();
		} else if(registrationItem == RegistrationItem.participant) {
			fee = getRegistrationItemParticipantFee();
		}
		return fee;
	}
	public Double getWorkShopItemFee() {
		Double fee = 0.0;
		if(workshopItem == WorkshopItem.threeDay) {
			fee += 500;
		} else {
			fee += 0;
		}
		return fee;
	}
	public Double getTotalFeeCurrencyAware() {
		if(registrationItem != null 
				&& registrationItem.equals(RegistrationItem.participant)) {
			return getTotalFeeBaht();
		} else {
			return getTotalFee();
		}
	}
	
	public Double getTotalFee() {
		Double fee = 0.0;
		
		if(this.registrationItem.equals(RegistrationItem.participant)) {
			fee += (getRegistrationItemFee() / exchangeRate);
		} else {
			fee += getRegistrationItemFee();
		}
		 
		
		fee += getWorkShopItemFee();
		fee += (numExtraBanquet * extraBanquetRate);
		fee += (numExtraCD * extraCDRate);
		
		if(paymentMethod == PaymentMethod.moneyTransfer) {
			fee += processingFee;
		}
		
		return fee;
	}
	public String getTotalFeeText() {
		NumberFormat formatter = 
			    new RuleBasedNumberFormat(Locale.US, RuleBasedNumberFormat.CURRENCYSTYLE);
			String result = formatter.format(this.getTotalFee());
		return result;
	}
	public String getTotalThaiFeeText() {
		String result = "";
		if(getReceiptTotalThaiBaht() != null) {
			NumberFormat formatter = 
					new RuleBasedNumberFormat(Locale.US, RuleBasedNumberFormat.CURRENCYSTYLE);
				result = formatter.format(this.getReceiptTotalThaiBaht());
		} 
		return result;
	}
	public String getTotalFeeFormat() {
		return nf2decimal.format(getTotalFee());
	}
	public String getTotalThaiFeeFormat() {
		if(getReceiptTotalThaiBaht() != null) {
			return nf2decimal.format(getReceiptTotalThaiBaht());
		} else {
			return "";
		}
		
	}
	public Double getExtraCDFee() {
		if(registrationItem != null 
				&& registrationItem.equals(RegistrationItem.participant)) {
			return numExtraCD * extraCDRate * exchangeRate;
		} else {
			return numExtraCD * extraCDRate;
		}
	}
	
	public String getExtraCDFeeText() {
		if(registrationItem != null 
				&& registrationItem.equals(RegistrationItem.participant)) {
			return "(@" + (extraCDRate*exchangeRate) + " THB each)";
		} else {
			return "(@ " + extraCDRate + " USD each)";
		}
	}
	
	public Double getExtraBanquetFee() {
		if(registrationItem != null 
				&& registrationItem.equals(RegistrationItem.participant)) {
			return numExtraBanquet * exchangeRate * extraBanquetRate;
		} else {
			return numExtraBanquet * extraBanquetRate;
		}
	}
	public String getExtraBanquetFeeText() {
		if(registrationItem != null 
				&& registrationItem.equals(RegistrationItem.participant)) {
			return "(@" + (extraBanquetRate*exchangeRate) + " THB each)";
		} else {
			return "(@ " + extraBanquetRate + " USD each)";
		}
	}
	
	public Double getTotalFeeBaht() {
		return getTotalFee() * exchangeRate;
	}
	public Double getExchangeRate() {
		return RegistrationInfo.exchangeRate;
	}
	
	public String getCurrencyPayment() {
		if(registrationItem != null 
				&& registrationItem.equals(RegistrationItem.participant)) {
			return "THB";
		} else {
			return "USD";
		}
	}
	
	
	public static List<Map<String, Object>> getBlankLineItemReceipt() {
		Integer i = 0;
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("no", 1);
		map.put("line",  "      " +RegistrationItem.full.toString() + " / After 31 August 2012 On-site rate" );
		map.put("quantity", null);
		map.put("amount", "500.00");
		map.put("totalAmount", null);
		map.put("checkBox", true);
		
		l.add(map);
		
		map = new HashMap<String, Object>();
		map.put("no", null);
		map.put("line",  "      " +RegistrationItem.student.toString() + " / After 31 August 2012 On-site rate");
		map.put("quantity", null);
		map.put("amount", "300.00");
		map.put("totalAmount", null);
		map.put("checkBox", true);
		
		l.add(map);
		
		map = new HashMap<String, Object>();
		map.put("no", null);
		map.put("line",   "      " +RegistrationItem.participant.toString());
		map.put("quantity", null);
		map.put("amount", "200.00");
		map.put("totalAmount", null);
		map.put("checkBox", true);
		
		l.add(map);
		
	
	
		map = new HashMap<String, Object>();
		map.put("no", 2);
		map.put("line", "Extra Banquet");
		map.put("quantity", null);
		map.put("amount", "80.00");
		map.put("totalAmount", null);
		map.put("checkBox", false);
		
		l.add(map);
	
	
	
		map = new HashMap<String, Object>();
		map.put("no", 3);
		map.put("line", "Extra CD");
		map.put("quantity", null);
		map.put("amount", "50.00");
		map.put("totalAmount", null);
		map.put("checkBox", false);
		
		l.add(map);
		
		
		for(i=6;i<12;i++) {
			// just fill to 12 line
			map = new HashMap<String, Object>();
			map.put("no", null);
			map.put("line", null);
			map.put("amount", null);
			map.put("totalAmount", null);
			map.put("quantity", null);
			map.put("checkBox", false);
			
			l.add(map);
		}
		
		return l;
	}
	
	public List<Map<String, Object>> getLineItemReceipt() {
		Integer i = 1;
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		RegistrationInfo info = this;
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("no", 1);
		map.put("line",  "      " +RegistrationItem.full.toString() + " / " + this.getRateString()  );
		if(this.getRegistrationItem() == RegistrationItem.full) {
			map.put("quantity", 1);
			map.put("amount", nf2decimal.format(this.getRegistrationItemFee()));
			map.put("totalAmount", nf2decimal.format(this.getRegistrationItemFee()));
			map.put("checkBox", true);
			map.put("checkMark", true);
		} else {
			map.put("quantity", null);
			map.put("amount", null);
			map.put("totalAmount", null);
			map.put("checkBox", true);
			map.put("checkMark", false);
		}
		
		l.add(map);
		
		map = new HashMap<String, Object>();
		map.put("no", null);
		map.put("line",  "      " +RegistrationItem.student.toString() + " / " + this.getRateString());
		if(this.getRegistrationItem() == RegistrationItem.student) {
			map.put("quantity", 1);
			map.put("amount", nf2decimal.format(this.getRegistrationItemFee()));
			map.put("totalAmount", nf2decimal.format(this.getRegistrationItemFee()));
			map.put("checkBox", true);
			map.put("checkMark", true);
		} else {
			map.put("quantity", null);
			map.put("amount", null);
			map.put("totalAmount", null);
			map.put("checkBox", true);
			map.put("checkMark", false);
		}
		l.add(map);
		
		map = new HashMap<String, Object>();
		map.put("no", null);
		map.put("line",   "      " +RegistrationItem.participant.toString());
		if(this.getRegistrationItem() == RegistrationItem.participant) {
			map.put("quantity", 1);
			map.put("amount", nf2decimal.format(this.getRegistrationItemFee()));
			map.put("totalAmount", nf2decimal.format(this.getRegistrationItemFee()));
			map.put("checkBox", true);
			map.put("checkMark", true);
		} else {
			map.put("quantity", null);
			map.put("amount", null);
			map.put("totalAmount", null);
			map.put("checkBox", true);
			map.put("checkMark", false);
		}
		
		l.add(map);
		
		
			map = new HashMap<String, Object>();
			map.put("no", 2);
			map.put("line", "Extra Banquet");
			map.put("quantity", info.getNumExtraBanquet());
			map.put("amount", "80.00");
			map.put("totalAmount", nf2decimal.format(info.getExtraBanquetFee()));
			map.put("checkBox", false);
			map.put("checkMark", false);
			
			l.add(map);
		
		
		
			map = new HashMap<String, Object>();
			map.put("no", 3);
			map.put("line", "Extra CD");
			map.put("quantity", info.getNumExtraCD());
			map.put("amount", "50.00");
			map.put("totalAmount", nf2decimal.format(info.getExtraCDFee()));
			map.put("checkBox", false);
			map.put("checkMark", false);
			
			l.add(map);
		
		
		for(i=6;i<12;i++) {
			// just fill to 12 line
			map = new HashMap<String, Object>();
			map.put("no", null);
			map.put("line", null);
			map.put("amount", null);
			map.put("totalAmount", null);
			map.put("quantity", null);
			map.put("checkBox", false);
			map.put("checkMark", false);
			
			l.add(map);
		}
		
		return l;
	}
}
