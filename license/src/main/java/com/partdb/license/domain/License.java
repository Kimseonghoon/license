package com.partdb.license.domain;

public class License {
	private String lic_id;
	private String lic_type;	
	private String lic_name;
	private String lic_count;
	private String lic_dup;
	
	public String getLic_id() {
		return lic_id;
	}
	public void setLic_id(String lic_id) {
		this.lic_id = lic_id;
	}
	public String getLic_type() {
		return lic_type;
	}
	public void setLic_type(String lic_type) {
		this.lic_type = lic_type;
	}
	public String getLic_name() {
		return lic_name;
	}
	public void setLic_name(String lic_name) {
		this.lic_name = lic_name;
	}
	public String getLic_count() {
		return lic_count;
	}
	public void setLic_count(String lic_count) {
		this.lic_count = lic_count;
	}
	public String getLic_dup() {
		return lic_dup;
	}
	public void setLic_dup(String lic_dup) {
		this.lic_dup = lic_dup;
	}
}
