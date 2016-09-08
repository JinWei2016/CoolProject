package entity;

import java.sql.Date;

//  create table table_post (
//  postid int primary key not null auto_increment,
//  parentId int not null,
//  postname text not null,
//  authorId int not null,
//  createDate date not null,
//  latestDate date not null,
//  tags text,
//  viewNumber int not null default 0,
//  likeNumber int not null default 0,
//  commentNumber int not null default 0,
//  saveNumber int not null default 0,
//  content text not null
//  );

public class Post {
	private int postid;
	private int parentId;//int     0 for self-create other for following post
	private String postname;//varchar(50)
	private int authorId;//int
	private Date createDate;//date
	private Date latestDate;//date
	private String tags;
	private int viewNumber;//int
	private int likeNumber;//int
	private int commentNumber;//int
	private int saveNumber;//int    be saved 
	private String content;//text

	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getLatestDate() {
		return latestDate;
	}
	public void setLatestDate(Date latestDate) {
		this.latestDate = latestDate;
	}

	public int getViewNumber() {
		return viewNumber;
	}
	public void setViewNumber(int viewNumber) {
		this.viewNumber = viewNumber;
	}
	public int getLikeNumber() {
		return likeNumber;
	}
	public void setLikeNumber(int likeNumber) {
		this.likeNumber = likeNumber;
	}
	public String getPostname() {
		return postname;
	}
	public void setPostname(String postname) {
		this.postname = postname;
	}
	public int getCommentNumber() {
		return commentNumber;
	}
	public void setCommentNumber(int commentNumber) {
		this.commentNumber = commentNumber;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getParentId() {
		return parentId;
	}
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}
	public int getSaveNumber() {
		return saveNumber;
	}
	public void setSaveNumber(int saveNumber) {
		this.saveNumber = saveNumber;
	}
	public int getAuthorId() {
		return authorId;
	}
	public void setAuthorId(int authorId) {
		this.authorId = authorId;
	}
	public int getPostid() {
		return postid;
	}
	public void setPostid(int postid) {
		this.postid = postid;
	}
	public String getTags() {
		return tags;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}
}
