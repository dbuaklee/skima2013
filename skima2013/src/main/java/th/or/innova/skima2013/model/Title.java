package th.or.innova.skima2013.model;

public enum Title {
	MR, MRS, MISS;
	
	public String getDisplayValue() {
		if (this == Title.MR) 
			return "Mr.";
		else if(this == Title.MRS)
			return "Mrs.";
		else if(this == Title.MISS)
			return "Miss";
		return null;
	}
	
	public String getValue() {
		return this.toString();
	}
}
