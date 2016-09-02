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
	private long parentId;//long     0 for self-create other for following post
	private String postname;//varchar(50)
	private long authorId;//varchar(50)
	private Date createDate;//date
	private Date latestDate;//date
	private String [] tags;
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
	public String[] getTags() {
		return tags;
	}
	public void setTags(String[] tags) {
		this.tags = tags;
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
	public String tagString(){
		if(tags.length==0)
			return "";
		String result = tags[0];
		for(int i=1;i<tags.length;i++){
			result=result+","+tags[i];
		}
		return result;
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
	public long getParentId() {
		return parentId;
	}
	public void setParentId(long parentId) {
		this.parentId = parentId;
	}
	public int getSaveNumber() {
		return saveNumber;
	}
	public void setSaveNumber(int saveNumber) {
		this.saveNumber = saveNumber;
	}
	public long getAuthorId() {
		return authorId;
	}
	public void setAuthorId(long authorId) {
		this.authorId = authorId;
	}
}
