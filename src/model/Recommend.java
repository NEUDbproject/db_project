package model;

public class Recommend {
	
	private String Value;
	private String Meta;
	
	public String getValue() {
		return Value;
	}
	public void setValue(String value) {
		Value = value;
	}
	public String getMeta() {
		return Meta;
	}
	public void setMeta(String meta) {
		Meta = meta;
	}
	/**
	 * @param value
	 * @param meta
	 */
	public Recommend(String value, String meta) {
		super();
		Value = value;
		Meta = meta;
	}
	
	public Recommend() {
		super();
	
	}
	
}
