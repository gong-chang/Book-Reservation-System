package enums;

public enum AppointStateEnum {
	SUCCESS(1, "Reservation Completed"), NO_STOCK(0, "Out of Stock"), REPEAT_APPOINT(-1, "No Repeat Reservation!"), INNER_ERROR(-2, "System Error");

	private int state;

	private String stateInfo;

	private AppointStateEnum(int state, String stateInfo) {
		this.state = state;
		this.stateInfo = stateInfo;
	}

	public int getState() {
		return state;
	}

	public String getStateInfo() {
		return stateInfo;
	}

	public static AppointStateEnum getStateByCode(int index) {
		for (AppointStateEnum state : values()) {
			if (state.getState() == index) {
				return state;
			}
		}
		return null;
	}
}
