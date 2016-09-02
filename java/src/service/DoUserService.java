package service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import dao.UserDao;
import dao.implement.UserDaoImpl;
import entity.User;
import util.ConnectionFactory;

public class DoUserService {
	private UserDao userDao = new UserDaoImpl();
	public boolean check (User user){
		Connection conn= null;
		try {
			conn = ConnectionFactory.getInstance().makeConnection();
			conn.setAutoCommit(false);
			ResultSet resultSet = userDao.get(conn, user);
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
	public boolean usernameExist(String username){
		Connection conn= null;
		conn = ConnectionFactory.getInstance().makeConnection();
		try {
			boolean result = userDao.usernameExist(conn, username);
			return result;
		} catch (SQLException e) {
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
	public boolean register(User user){
		Connection conn= null;
		conn = ConnectionFactory.getInstance().makeConnection();
		try {
			conn.setAutoCommit(false);
			boolean result = userDao.save(conn, user);
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
	public User getUserInformation(String username){
		User user= new User();
		Connection conn= null;
		conn = ConnectionFactory.getInstance().makeConnection();
		try {
			ResultSet result = userDao.getUserByName(conn, username);
			if(result.next()){
				//get the String value of label"password"
				user.setPassword(result.getString("password"));
				//get the String value of label"email"
				user.setPassword(result.getString("email"));
			}
			else{
				user=null;
			}
		} catch (SQLException e) {
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
		return user;
	}
	public int getIdByName(String username){
		int id = 0;
		Connection conn= null;
		conn = ConnectionFactory.getInstance().makeConnection();
		try {
			ResultSet result = userDao.getIdByName(conn, username);
			if(result.next()){
				//get the String value of the first row--id
				id=result.getInt(1);
			}
		} catch (SQLException e) {
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
		return id;
	}
	public boolean update(int id,User user){
		Connection conn= null;
		conn = ConnectionFactory.getInstance().makeConnection();
		try {
			conn.setAutoCommit(false);
			boolean result = userDao.update(conn, id, user);
			conn.commit();
			return result;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO: handle exception
			try {
				conn.rollback();
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
