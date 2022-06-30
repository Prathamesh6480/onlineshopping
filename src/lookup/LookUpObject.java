package lookup;

public class LookUpObject {
	String descr;
	String code;
	String val;
	
	public LookUpObject() {

	}

	public String toString() {
		return "LookUpObject [descr=" + descr + ", code=" + code + ", val=" + val + "]";
	}

	public String getCode() {
		return code;
	}

	
	public String getDescr() {
		return descr;
	}


	public void setDescr(String descr) {
		this.descr = descr;
	}


	public void setCode(String code) {
		this.code = code;
	}

	
	public String getVal() {
		return val;
	}


	public void setVal(String val) {
		this.val = val;
	}


}
