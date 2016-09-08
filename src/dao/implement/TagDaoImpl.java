package dao.implement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dao.TagDao;
import entity.Tag;

public class TagDaoImpl implements TagDao{
	private String tableName = "table_tag";
	
	@Override
	public boolean save(Connection conn, Tag tag) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement ps = conn.prepareCall("INSERT INTO "+tableName+" (tagid,tagName,userid) VALUES (?,?,?)");
		ps.setInt( 1 , tag.getTagid() );
		ps.setString(2, tag.getTagName());
		ps.setInt(3, tag.getUserid());
		if(ps.executeUpdate()==1){
			return true;
		}
		return false;
	}

	@Override
	public boolean TagExist(Connection conn, String tagName) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement ps = conn.prepareCall("SELECT * FROM "+tableName+" WHERE tagName=?");
		ps.setString(1, tagName);
		ResultSet resultSet = ps.executeQuery();
		boolean result = resultSet.next();
		return result;
	}

	@Override
	public boolean delete(Connection conn, String tagName) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement ps = conn.prepareCall("DELETE FROM "+tableName+" WHERE tagName=?");
		ps.setString(1, tagName);
		if(ps.executeUpdate()==1){
			return true;
		}
		return false;
	}

	@Override
	public ResultSet getUsers(Connection conn, String tagName) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement ps = conn.prepareCall("SELECT distinct userid FROM "+tableName+" WHERE tagName=?");
		ps.setString(1, tagName);
		ResultSet resultSet = ps.executeQuery();
		return resultSet;
	}

	@Override
	public ResultSet getTags(Connection conn, int userid) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement ps = conn.prepareCall("SELECT DISTINCT tagid FROM "+tableName);
		ResultSet resultSet = ps.executeQuery();
		return resultSet;
	}

	@Override
	public ResultSet getTagsCount(Connection conn, String tagName) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement ps = conn.prepareCall("SELECT COUNT (userid) FROM "+tableName+" WHERE tagName=?" );
		ps.setString(1, tagName);
		ResultSet resultSet = ps.executeQuery();
		return resultSet;
	}

	@Override
	public ResultSet getUserCount(Connection conn, String tagName) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement ps = conn.prepareCall("SELECT COUNT (DISTINCT userid) FROM "+tableName+" WHERE tagName=?" );
		ps.setString(1, tagName);
		ResultSet resultSet = ps.executeQuery();
		return resultSet;
	}
	
}
