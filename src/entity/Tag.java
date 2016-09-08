package entity;

//create table table_tag(
//	tagid int primary key not null auto_increment,
//	tagName varchar(50) not null,
//	userid int not null default 0,
//	occurCount int not null default 1
//);

public class Tag {
	private int tagid;
	private String tagName;//tag名
	private int userid;//使用者id
	public int getTagid() {
		return tagid;
	}
	public void setTagid(int tagid) {
		this.tagid = tagid;
	}
	public String getTagName() {
		return tagName;
	}
	public void setTagName(String tagName) {
		this.tagName = tagName;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
}
