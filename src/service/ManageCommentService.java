package service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.CommentDao;
import dao.implement.CommentDaoImpl;
import entity.Comment;
import util.ConnectionFactory;

public class ManageCommentService {
	CommentDao dao = new CommentDaoImpl();
	public boolean sendComment(Comment comment){
		Connection conn=null;
		try {
			conn = ConnectionFactory.getInstance().makeConnection();
			conn.setAutoCommit(false);
			boolean result = dao.save(conn, comment);
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
	public boolean deleteComment(int id){
		Connection conn=null;
		try {
			conn = ConnectionFactory.getInstance().makeConnection();
			conn.setAutoCommit(false);
			boolean result = dao.delete(conn, id);
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
	public Comment [] getAll(int parentid){
		Connection conn = null;
		try{
			ResultSet rs = dao.getAll(conn, parentid);
			ArrayList<Comment> al = new ArrayList<Comment>();
			Comment temp = new Comment();
			while(rs.next()){
				temp = new Comment();
				int commentid = rs.getInt(1);
				int parentId = rs.getInt(2);
				int authorId = rs.getInt(3);
				String content = rs.getString(4);
				Date createDate = rs.getDate(5);
				boolean isFollowPost = rs.getBoolean(6);
				temp.setCommentid(commentid);
				temp.setParentId(parentId);
				temp.setAuthorId(authorId);
				temp.setContent(content);
				temp.setCreateDate(createDate);
				temp.setFollowPost(isFollowPost);
				al.add(temp);
			}
			Comment [] comments = new Comment[al.size()];
			comments = al.toArray(comments);
			return comments;
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}
	public boolean checkFollowPost(int commentid){
		Connection conn = null;
		try{
			conn = ConnectionFactory.getInstance().makeConnection();
			ResultSet rs = dao.checkFollowPost(conn, commentid);
			if(rs.next()){
				if(rs.getBoolean(1))
					return true;
			}
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return false;
	}
}
