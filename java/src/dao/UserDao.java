package dao;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import entity.User;
public interface UserDao {
	public ResultSet getIdByName(Connection conn,String username) throws SQLException;
	public boolean save(Connection conn ,User user)throws SQLException;
	public boolean update(Connection conn , int id ,User user)throws SQLException;
	public boolean delete(Connection conn , int id ,User user)throws SQLException;
	public ResultSet get(Connection conn ,User user)throws SQLException;
	public boolean usernameExist(Connection conn,String username)throws SQLException;
	public ResultSet getUserByName(Connection conn,String username) throws SQLException;
}
