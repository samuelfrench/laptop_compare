package model;

public class Laptop {
	private long id;
	private String model, brand;
	public Laptop(long id, String model, String brand) {
		super();
		this.id = id;
		this.model = model;
		this.brand = brand;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
}
