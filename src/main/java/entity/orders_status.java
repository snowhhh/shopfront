package entity;

public class orders_status {
int id;
int orders_id;
String date;
int dest_status;
String info;
int num;
double amount;
String comments;
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
public String getDate() {
	return date;
}
public void setDate(String date) {
	this.date = date;
}
public int getDest_status() {
	return dest_status;
}
public void setDest_status(int dest_status) {
	this.dest_status = dest_status;
}
public String getInfo() {
	return info;
}
public void setInfo(String info) {
	this.info = info;
}
public int getNum() {
	return num;
}
public void setNum(int num) {
	this.num = num;
}
public double getAmount() {
	return amount;
}
public void setAmount(double amount) {
	this.amount = amount;
}
public String getComments() {
	return comments;
}
public void setComments(String comments) {
	this.comments = comments;
}

}
