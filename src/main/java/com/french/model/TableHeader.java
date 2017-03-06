package com.french.model;

public class TableHeader {
	private String headerTypeCode;
	private String headerText;
	private String headerCode;
	private Boolean isDefault;
	private Integer sequence;

	public TableHeader(String headerTypeCode, String headerText, String headerCode, Boolean isDefault,
			Integer sequence) {
		super();
		this.headerTypeCode = headerTypeCode;
		this.headerText = headerText;
		this.headerCode = headerCode;
		this.isDefault = isDefault;
		this.sequence = sequence;
	}
	
	public TableHeader() {
		// TODO Auto-generated constructor stub
	}

	public String getHeaderTypeCode() {
		return headerTypeCode;
	}
	public void setHeaderTypeCode(String headerTypeCode) {
		this.headerTypeCode = headerTypeCode;
	}
	public String getHeaderText() {
		return headerText;
	}
	public void setHeaderText(String headerText) {
		this.headerText = headerText;
	}
	public String getHeaderCode() {
		return headerCode;
	}
	public void setHeaderCode(String headerCode) {
		this.headerCode = headerCode;
	}
	public Boolean getIsDefault() {
		return isDefault;
	}
	public void setIsDefault(Boolean isDefault) {
		this.isDefault = isDefault;
	}
	public Integer getSequence() {
		return sequence;
	}
	public void setSequence(Integer sequence) {
		this.sequence = sequence;
	}
}
