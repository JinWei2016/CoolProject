package entity;


// create table table_user(
// userid int primary key not null auto_increment,
// username varchar(50) not null,
// password varchar(50) not null,
// email varchar(50) not null,
// province varchar(50),
// phone int,
// grade int
// );



public class User{
	private String username;
	private String password;
	private String email;
	private String province;
	private int grade;
	private int phone;
	
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}
