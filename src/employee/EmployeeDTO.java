package employee;

import java.io.Serializable;

public class EmployeeDTO implements Serializable {
	private int empNo; // 사원번호
	private String empName; // 사원명
	private String empTel; // 전화번호
	private String empAddr; // 주소
	private String empSecurity; // 주민번호
	private int empRank; // 직급
	private String empPw; // 비밀번호
	private int deptNo; // 부서번호

	public EmployeeDTO() {
		super();
	}

	public EmployeeDTO(int empNo, String empName, String empTel, String empAddr, String empSecurity, int empRank,
			String empPw, int deptNo) {
		super();
		this.empNo = empNo;
		this.empName = empName;
		this.empTel = empTel;
		this.empAddr = empAddr;
		this.empSecurity = empSecurity;
		this.empRank = empRank;
		this.empPw = empPw;
		this.deptNo = deptNo;
	}

	public int getEmpNo() {
		return empNo;
	}

	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getEmpTel() {
		return empTel;
	}

	public void setEmpTel(String empTel) {
		this.empTel = empTel;
	}

	public String getEmpAddr() {
		return empAddr;
	}

	public void setEmpAddr(String empAddr) {
		this.empAddr = empAddr;
	}

	public String getEmpSecurity() {
		return empSecurity;
	}

	public void setEmpSecurity(String empSecurity) {
		this.empSecurity = empSecurity;
	}

	public int getEmpRank() {
		return empRank;
	}

	public void setEmpRank(int empRank) {
		this.empRank = empRank;
	}

	public String getEmpPw() {
		return empPw;
	}

	public void setEmpPw(String empPw) {
		this.empPw = empPw;
	}

	public int getDeptNo() {
		return deptNo;
	}

	public void setDeptNo(int deptNo) {
		this.deptNo = deptNo;
	}

	@Override
	public String toString() {
		return "EmployeeDTO [empNo=" + empNo + ", empName=" + empName + ", empTel=" + empTel + ", empAddr=" + empAddr
				+ ", empSecurity=" + empSecurity + ", empRank=" + empRank + ", empPw=" + empPw + ", deptNo=" + deptNo
				+ "]";
	}

}
