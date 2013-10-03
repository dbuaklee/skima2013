package th.or.innova.skima2013.model;

public enum PaymentMethod {
	creditCard {
		public String toString() {
			return "I'll pay registration fee by credit card";
		}
	},
	moneyTransfer {
		public String toString() {
			return "I'll pay registration fee by check/money transfer";
		}
	};
	

	public String getWebString() {
		return this.toString();
	}
	
	public String getShortWebString() {
		switch (this) {
		case creditCard:
			return "Credit Card";
		case moneyTransfer:
			return "Money Transfer";
		default:
			return null;
		}
	}
}
