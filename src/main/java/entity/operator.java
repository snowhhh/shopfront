package entity;

import utils.MD5;

public class operator {
int id;
String nike;
String password;
String name;
int sex;
String tel;
int power;
int status;

String comments;
public  static String [] sexs={"女","男"};
public  static String [] powers={"超级管理员","普通管理员"};
public  static String [] statuss={"正常","离职"};
public String getSex_Name() {
	return sexs[sex];
}
public String getPower_Name() {
	return powers[power];
}
public String getStatus_Name() {
	return statuss[status];
}




public int getStatus() {
	return status;
}
public void setStatus(int status) {
	this.status = status;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getNike() {
	return nike;
}
public void setNike(String nike) {
	this.nike = nike;
}
public String getPassword() {
	return password;
}
public String getMd5() {
	return MD5.MD5(password);
}
public void setPassword(String password) {
	this.password = password;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public int getSex() {
	return sex;
}
public void setSex(int sex) {
	this.sex = sex;
}
public String getTel() {
	return tel;
}
public void setTel(String tel) {
	this.tel = tel;
}
public int getPower() {
	return power;
}
public void setPower(int power) {
	this.power = power;
}
public String getComments() {
	return comments;
}
public void setComments(String comments) {
	this.comments = comments;
}

}
