package entity;
import java.sql.Date;

//  create table table_comment(
//  commentid int primary key not null auto_increment,
//  parentId int not null,
//  authorId int not null,
//  content text not null,
//  createDate date not null,
//  isFollowPost boolean not null,
//  likeNumber int not null default 0
//  );


public class Comment {
	private String content;//text
	private Date createDate;//datetime
	private long authorId;//long
	private long parentId;//long
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
	public long getAuthorId() {
		return authorId;
	}
	public void setAuthorId(long authorId) {
		this.authorId = authorId;
	}
	public long getParentId() {
		return parentId;
	}
	public void setParentId(long parentId) {
		this.parentId = parentId;
	}
	public boolean isFollowPost() {
		return isFollowPost;
	}
	public void setFollowPost(boolean isFollowPost) {
		this.isFollowPost = isFollowPost;
	}
}
