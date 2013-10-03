package th.or.innova.skima2013.model;

public enum HotelReservationChoice {
	yes {
		public String toString() {
			return "Yes, Please forward my information to the Conference Hotel reservation";
		}
	}
	
	, no {
		public String toString() {
			return "No, I'll be making hotel reservation myself";
		}
	};
	
	public String getWebString() {
		return this.toString();
	}
	
	
	
}
