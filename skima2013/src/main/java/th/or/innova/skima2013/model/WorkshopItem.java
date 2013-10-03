package th.or.innova.skima2013.model;

import java.io.Serializable;

public enum WorkshopItem implements Serializable {
	notSelected {
		public String toString() {
			return "no Workshop selected";
		}
	},
	oneDay {
		public String toString() {
			return "1 Day ISO 29110 Foundation Course / FREE";
		}
	},
	
	threeDay {
		public String toString() {
			return "3 Day ISO 29110 Consultant Training / 500 USD";
		}
	};
	
	public String getWebString() {
		return this.toString();
	}
}
