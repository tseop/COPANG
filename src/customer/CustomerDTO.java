package customer;

import java.io.Serializable;

public class CustomerDTO implements Serializable{

	private int cusNo;
	private String cusName;
	private String cusManager;
	private String cusTel;
	private String businessNo;
	 
	public CustomerDTO() {
		super();
	}
	public CustomerDTO(int cusNo, String cusName, String cusManager, String cusTel, String businessNo) {
		super();
		this.cusNo = cusNo;
		this.cusName = cusName;
		this.cusManager = cusManager;
		this.cusTel = cusTel;
		this.businessNo = businessNo;
	}
	
	@Override
	public String toString() {
		return "CustomerDTO [cusNo=" + cusNo + ", cusName=" + cusName + ", cusManager=" + cusManager + ", cusTel="
				+ cusTel + ", businessNo=" + businessNo + "]";
	}
	
	public int getCusNo() {
		return cusNo;
	}
	
	public void setCusNo(int cusNo) {
		this.cusNo = cusNo;
	}
	
	public String getCusName() {
		return cusName;
	}
	
	public void setCusName(String cusName) {
		this.cusName = cusName;
	}
	
	public String getCusManager() {
		return cusManager;
	}
	
	public void setCusManager(String cusManager) {
		this.cusManager = cusManager;
	}
	
	public String getCusTel() {
		return cusTel;
	}
	
	public void setCusTel(String cusTel) {
		this.cusTel = cusTel;
	}
	
	public String getBusinessNo() {
		return businessNo;
	}
	
	public void setBusinessNo(String businessNo) {
		this.businessNo = businessNo;
	}

}
