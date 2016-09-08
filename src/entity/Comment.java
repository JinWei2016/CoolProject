package entity;
import java.sql.Date;

//  create table table_comment(
//  commentid int primary key not null auto_increment,
//  parentId int not null,
//  authorId int not null,
//  content text not null,
//  createDate date not null,
//  isFollowPost boolean not null
//  );


public class Comment {
	private int commentid;
	private int parentId;//int
	private int authorId;//int
	private String content;//text
	private Date createDate;//datetime
	private boolean isFollowPost;//true for comments which follow a post, false for comments which follow a comment. 
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public int getAuthorId() {
		return authorId;
	}
	public void setAuthorId(int authorId) {
		this.authorId = authorId;
	}
	public int getParentId() {
		return parentId;
	}
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}
	public boolean isFollowPost() {
		return isFollowPost;
	}
	public void setFollowPost(boolean isFollowPost) {
		this.isFollowPost = isFollowPost;
	}
	public int getCommentid() {
		return commentid;
	}
	public void setCommentid(int commentid) {
		this.commentid = commentid;
	}
}
