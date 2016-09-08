package service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;


import dao.SaveDao;
import dao.implement.SaveDaoImpl;
import util.ConnectionFactory;

public class ManageSaveService {
	SaveDao dao = new SaveDaoImpl();
	public boolean savePost(int userid ,int postid){
		Connection conn = null;
		try{
			conn = ConnectionFactory.getInstance().makeConnection();
			conn.setAutoCommit(false);
			boolean result = dao.savePost(conn, userid, postid);
			conn.commit();
			return result;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO: handle exception
			try {
				conn.rollback();
				e.printStackTrace();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
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
	public boolean saveLike(int userid, int postid) {
		// TODO Auto-generated method stub
		Connection conn = null;
		try{
			conn = ConnectionFactory.getInstance().makeConnection();
			conn.setAutoCommit(false);
			boolean result = dao.likePost(conn, userid, postid);
			conn.commit();
			return result;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO: handle exception
			try {
				conn.rollback();
				e.printStackTrace();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
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
	public boolean ifPostSaved(int userid , int postid){
		Connection conn= null;
		try {
			conn = ConnectionFactory.getInstance().makeConnection();
			conn.setAutoCommit(false);
			ResultSet resultSet = dao.checkPostSaved(conn, userid, postid);
			while(resultSet.next()){
				return true;
			}
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
	public boolean ifPostLiked(int userid , int postid){
		Connection conn= null;
		try {
			conn = ConnectionFactory.getInstance().makeConnection();
			conn.setAutoCommit(false);
			ResultSet resultSet = dao.checkPostLiked(conn, userid, postid);
			while(resultSet.next()){
				return true;
			}
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
	public boolean deleteLike(int userid ,int postid){
		Connection conn = null;
		try{
			conn = ConnectionFactory.getInstance().makeConnection();
			conn.setAutoCommit(false);
			boolean result = dao.deleteLike(conn,userid,postid);
			conn.commit();
			return result;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO: handle exception
			try {
				conn.rollback();
				e.printStackTrace();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
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
	public boolean deleteSave(int userid ,int postid){
		Connection conn = null;
		try{
			conn = ConnectionFactory.getInstance().makeConnection();
			conn.setAutoCommit(false);
			boolean result = dao.deleteSave(conn,userid,postid);
			conn.commit();
			return result;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO: handle exception
			try {
				conn.rollback();
				e.printStackTrace();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
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
