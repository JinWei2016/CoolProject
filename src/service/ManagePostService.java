package service;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.PostDao;
import dao.implement.PostDaoImpl;
import entity.Post;
import util.ConnectionFactory;

public class ManagePostService {
	private PostDao dao = new PostDaoImpl();
	public boolean sendPost(Post post){
		Connection conn=null;
		try {
			conn = ConnectionFactory.getInstance().makeConnection();
			conn.setAutoCommit(false);
			boolean result = dao.save(conn, post);
			conn.commit();
			return result;
		} catch (Exception e) {
			// TODO: handle exception
			try {
				conn.rollback();
				e.printStackTrace();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
		}finally{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return false;
	}
	public boolean delete(int postid){
		Connection conn=null;
		try {
			conn = ConnectionFactory.getInstance().makeConnection();
			conn.setAutoCommit(false);
			boolean result = dao.delete(conn, postid);
			conn.commit();
			return result;
		} catch (Exception e) {
			// TODO: handle exception
			try {
				conn.rollback();
				e.printStackTrace();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return false;
	}
	public Post [] getMulti(int length,int num){
		Connection conn= null;
		try{
			conn = ConnectionFactory.getInstance().makeConnection();
			ResultSet rs = dao.getMulti(conn, length, num);
			ArrayList<Post> al = new ArrayList<Post>();
			Post temp = new Post();
			while(rs.next()){
				temp= new Post();
				int postid = rs.getInt(1);
				int parentid = rs.getInt(2);
				String postname = rs.getString(3);
				int authorid = rs.getInt(4);
				Date createDate = rs.getDate(5);
				Date latestDate  = rs.getDate(6);
				String tags = rs.getString(7);
				int viewNumber = rs.getInt(8);
				int likeNumber = rs.getInt(9);
				int commentNumber = rs.getInt(10);
				int saveNumber = rs.getInt(11);
				String content = rs.getString(12);
				temp.setPostid(postid);
				temp.setParentId(parentid);
				temp.setPostname(postname);
				temp.setAuthorId(authorid);
				temp.setCreateDate(createDate);
				temp.setLatestDate(latestDate);
				temp.setTags(tags);
				temp.setViewNumber(viewNumber);
				temp.setLikeNumber(likeNumber);
				temp.setCommentNumber(commentNumber);
				temp.setSaveNumber(saveNumber);
				temp.setContent(content);
				al.add(temp);
			}
			Post [] post= new Post[al.size()];
			post=al.toArray(post);
			return post;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}
	public boolean modifyLatest(Date date,int postid){
		Connection conn=null;
		try {
			conn = ConnectionFactory.getInstance().makeConnection();
			conn.setAutoCommit(false);
			boolean result = dao.modifyLatest(conn, date, postid);
			conn.commit();
			return result;
		} catch (Exception e) {
			// TODO: handle exception
			try {
				conn.rollback();
				e.printStackTrace();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return false;
	}
	public boolean update(int postid ,Post post){
		System.out.println("update executed");
		Connection conn=null;
		try {
			conn = ConnectionFactory.getInstance().makeConnection();
			conn.setAutoCommit(false);
			boolean result = dao.update(conn, post);
			conn.commit();
			//System.out.println("update "+result);
			return result;
		} catch (Exception e) {
			// TODO: handle exception
			try {
				conn.rollback();
				e.printStackTrace();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return false;
	}
	public Post getById(int postid){
		Connection conn = null;
		try{
			conn = ConnectionFactory.getInstance().makeConnection();
			ResultSet rs = dao.getById(conn, postid);
			Post temp = new Post();
			if(rs.next()){
				int parentid = rs.getInt(2);
				String postname = rs.getString(3);
				int authorid = rs.getInt(4);
				Date createDate = rs.getDate(5);
				Date latestDate  = rs.getDate(6);
				String tags = rs.getString(7);
				int viewNumber = rs.getInt(8);
				int likeNumber = rs.getInt(9);
				int commentNumber = rs.getInt(10);
				int saveNumber = rs.getInt(11);
				String content = rs.getString(12);
				temp.setPostid(postid);
				temp.setParentId(parentid);
				temp.setPostname(postname);
				temp.setAuthorId(authorid);
				temp.setCreateDate(createDate);
				temp.setLatestDate(latestDate);
				temp.setTags(tags);
				temp.setViewNumber(viewNumber);
				temp.setLikeNumber(likeNumber);
				temp.setCommentNumber(commentNumber);
				temp.setSaveNumber(saveNumber);
				temp.setContent(content);
			}
			return temp;
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}
	synchronized public boolean addLikeNum(int id){
		Post post = getById(id);
		post.setLikeNumber(post.getLikeNumber()+1);
		return update(id,post);
	}
	synchronized public boolean addSaveNum(int id){
		Post post = getById(id);
		post.setSaveNumber(post.getSaveNumber()+1);
		return update(id,post);
	}
	synchronized public boolean addViewNum(int id){
		Post post = getById(id);
		System.out.println(post.getPostname());
		post.setViewNumber(post.getViewNumber()+1);
		return update(id,post);
	}
	synchronized public boolean addCommentNum(int id){
		Post post = getById(id);
		post.setCommentNumber(post.getCommentNumber()+1);
		return update(id,post);
	}
	synchronized public boolean deleteLikeNum(int id){
		Post post = getById(id);
		post.setLikeNumber(post.getLikeNumber()-1);
		return update(id,post);
	}
	synchronized public boolean deleteSaveNum(int id){
		Post post = getById(id);
		post.setSaveNumber(post.getSaveNumber()-1);
		return update(id,post);
	}
	synchronized public boolean deleteCommentNum(int id){
		Post post = getById(id);
		post.setCommentNumber(post.getCommentNumber()-1);
		return update(id,post);
	}
	public Post [] getFollowPost(int parentId){
		Connection conn = null;
		try{
			conn = ConnectionFactory.getInstance().makeConnection();
			ResultSet rs = dao.getFollowPost(conn, parentId);
			ArrayList<Post> al = new ArrayList<Post>();
			Post temp = new Post();
			while(rs.next()){
				temp= new Post();
				int postid = rs.getInt(1);
				int parentid = rs.getInt(2);
				String postname = rs.getString(3);
				int authorid = rs.getInt(4);
				Date createDate = rs.getDate(5);
				Date latestDate  = rs.getDate(6);
				String tags = rs.getString(7);
				int viewNumber = rs.getInt(8);
				int likeNumber = rs.getInt(9);
				int commentNumber = rs.getInt(10);
				int saveNumber = rs.getInt(11);
				String content = rs.getString(12);
				temp.setPostid(postid);
				temp.setParentId(parentid);
				temp.setPostname(postname);
				temp.setAuthorId(authorid);
				temp.setCreateDate(createDate);
				temp.setLatestDate(latestDate);
				temp.setTags(tags);
				temp.setViewNumber(viewNumber);
				temp.setLikeNumber(likeNumber);
				temp.setCommentNumber(commentNumber);
				temp.setSaveNumber(saveNumber);
				temp.setContent(content);
				al.add(temp);
			}
			Post [] post= new Post[al.size()];
			post=al.toArray(post);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}
	
	public Post [] getAll(){
		Connection conn = null;
		try{
			conn = ConnectionFactory.getInstance().makeConnection();
			ResultSet rs = dao.getAll(conn);
			ArrayList<Post> al = new ArrayList<Post>();
			Post temp = new Post();
			while(rs.next()){
				temp = new Post();
				int postid = rs.getInt(1);
				int parentid = rs.getInt(2);
				String postname = rs.getString(3);
				int authorid = rs.getInt(4);
				Date createDate = rs.getDate(5);
				Date latestDate  = rs.getDate(6);
				String tags = rs.getString(7);
				int viewNumber = rs.getInt(8);
				int likeNumber = rs.getInt(9);
				int commentNumber = rs.getInt(10);
				int saveNumber = rs.getInt(11);
				String content = rs.getString(12);
				temp.setPostid(postid);
				temp.setParentId(parentid);
				temp.setPostname(postname);
				temp.setAuthorId(authorid);
				temp.setCreateDate(createDate);
				temp.setLatestDate(latestDate);
				temp.setTags(tags);
				temp.setViewNumber(viewNumber);
				temp.setLikeNumber(likeNumber);
				temp.setCommentNumber(commentNumber);
				temp.setSaveNumber(saveNumber);
				temp.setContent(content);
				al.add(temp);
			}
			Post [] post= new Post[al.size()];
			post=al.toArray(post);
			return post;
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}
	
}
