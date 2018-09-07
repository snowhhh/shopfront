package entity;

public class orders_details {
int id;
int orders_id;
int user_id;
int product_id;
int count;
double price;
double nowprice;
String comments;
String ocode;
String pname;
String aname;

public String getAname() {
	return aname;
}
public void setAname(String aname) {
	this.aname = aname;
}
public String getPname() {
	return pname;
}
public void setPname(String pname) {
	this.pname = pname;
}
public String getOcode() {
	return ocode;
}
public void setOcode(String ocode) {
	this.ocode = ocode;
}
public int getUser_id() {
	return user_id;
}
public void setUser_id(int user_id) {
	this.user_id = user_id;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getOrders_id() {
	return orders_id;
}
public void setOrders_id(int orders_id) {
	this.orders_id = orders_id;
}
public int getProduct_id() {
	return product_id;
}
public void setProduct_id(int product_id) {
	this.product_id = product_id;
}
public int getCount() {
	return count;
}
public void setCount(int count) {
	this.count = count;
}
public double getPrice() {
	return price;
}
public void setPrice(double price) {
	this.price = price;
}
public double getNowprice() {
	return nowprice;
}
public void setNowprice(double nowprice) {
	this.nowprice = nowprice;
}
public String getComments() {
	return comments;
}
public void setComments(String comments) {
	this.comments = comments;
}

}
