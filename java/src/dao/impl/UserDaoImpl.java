package dao.implement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dao.UserDao;
import entity.User;

public class UserDaoImpl implements UserDao{
	private String tableName = "table_user";
	@Override
	public boolean save(Connection conn , User user) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement ps = conn.prepareCall("INSERT INTO "+tableName+" (username,password,email) VALUES (?,?,?)");
		ps.setString(1, user.getUsername());
		ps.setString(2, user.getPassword());
		ps.setString(3, user.getEmail());
		if(ps.executeUpdate()==1){
			return true;
		}
		return false;
	}

	@Override
	public boolean update(Connection conn, long id , User user) throws SQLException {
		// TODO Auto-generated method stub
		String updateSql="UPDATE "+tableName+" SET username=?,password=?,email=? WHERE id = ?";
		PreparedStatement ps = conn.prepareStatement(updateSql);
		ps.setString(1, user.getUsername());
		ps.setString(2, user.getPassword());
		ps.setString(3, user.getEmail());
		ps.setLong(4, id);
		if(ps.executeUpdate()==1){
			return true;
		}
		return false;
	}

	@Override
	public boolean delete(Connection conn , long id , User user) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement ps = conn.prepareStatement("DELETE FROM "+tableName+" WHERE id = ?");
		ps.setLong(1, id);
		if(ps.executeUpdate()==1){
			return true;
		}
		return false;
	}

	@Override
	public ResultSet get(Connection conn, User user) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement ps = conn.prepareStatement("SELECT * FROM "+tableName+" WHERE username = ? AND password = ? ");
		ps.setString(1, user.getUsername());
		ps.setString(2, user.getPassword());
		return ps.executeQuery();
	}

	@Override
	public boolean usernameExist(Connection conn, String username) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement ps = conn.prepareStatement("SELECT * FROM "+tableName+" WHERE username = ?");
		ps.setString(1, username);
		ResultSet resultSet=ps.executeQuery();
		boolean result = resultSet.next();
		System.out.println(ps.toString());
		return result;
	}
	
}
