package entity;

public class orders {
int id;
String date;
String code;
double amount;
double nowamount;
int address_id;
int user_id;
int status;
int assessstatus;
String comments;
String uname;
String azone;

public  static String [] statuss={"未支付","已支付","已发货","已收货","已退货","已取消","用户已删除"};
public String getStatus_Name() {
	return statuss[status];
}
public  static String [] assessstatuss={"未评价","已评价"};
public String getAssessstatus_Name() {
	return assessstatuss[assessstatus];
}

public String getAzone() {
	return azone;
}

public void setAzone(String azone) {
	this.azone = azone;
}

public String getUname() {
	return uname;
}

public void setUname(String uname) {
	this.uname = uname;
}

public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getDate() {
	return date;
}
public void setDate(String date) {
	this.date = date;
}
public String getCode() {
	return code;
}
public void setCode(String code) {
	this.code = code;
}
public double getAmount() {
	return amount;
}
public void setAmount(double amount) {
	this.amount = amount;
}
public double getNowamount() {
	return nowamount;
}
public void setNowamount(double nowamount) {
	this.nowamount = nowamount;
}
public int getAddress_id() {
	return address_id;
}
public void setAddress_id(int address_id) {
	this.address_id = address_id;
}
public int getUser_id() {
	return user_id;
}
public void setUser_id(int user_id) {
	this.user_id = user_id;
}
public int getStatus() {
	return status;
}
public void setStatus(int status) {
	this.status = status;
}
public int getAssessstatus() {
	return assessstatus;
}
public void setAssessstatus(int assessstatus) {
	this.assessstatus = assessstatus;
}
public String getComments() {
	return comments;
}
public void setComments(String comments) {
	this.comments = comments;
}

}
