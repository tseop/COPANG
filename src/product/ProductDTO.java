package product;


public class ProductDTO {
	private int proNo;
	private String proName;
	private String proCost;		//원가
	private String proPrice;	//소비자판매가
	private String proFirstNal;		//첫입고일
	private String proLastNal;	//마지막입고일
	private String proStoring;		//입고수
	private String proStock;		//재고
	private int cusNo;		//거래처번호
	private String cusName;
	
	public ProductDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getProNo() {
		return proNo;
	}



	public void setProNo(int proNo) {
		this.proNo = proNo;
	}



	public String getProName() {
		return proName;
	}



	public void setProName(String proName) {
		this.proName = proName;
	}



	public String getProCost() {
		return proCost;
	}



	public void setProCost(String proCost) {
		this.proCost = proCost;
	}



	public String getProPrice() {
		return proPrice;
	}



	public void setProPrice(String proPrice) {
		this.proPrice = proPrice;
	}



	public String getProFirstNal() {
		return proFirstNal;
	}



	public void setProFirstNal(String proFirstNal) {
		this.proFirstNal = proFirstNal;
	}



	public String getProLastNal(){
		return proLastNal;
	}



	public void setProLastNal(String proLastNal) {
		this.proLastNal = proLastNal;
	}



	public String getProStoring() {
		return proStoring;
	}



	public void setProStoring(String proStoring) {
		this.proStoring = proStoring;
	}



	public String getProStock() {
		return proStock;
	}



	public void setProStock(String proStock) {
		this.proStock = proStock;
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


	@Override
	public String toString() {
		return "ProductDTO [proNo=" + proNo + ", proName=" + proName + ", proCost=" + proCost + ", proPrice=" + proPrice
				+ ", proFirstNal=" + proFirstNal + ", proLastNal=" + proLastNal + ", proStoring=" + proStoring
				+ ", proStock=" + proStock + ", cusNo=" + cusNo + "]";
	}
	
}
