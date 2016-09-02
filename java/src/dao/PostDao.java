package dao;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import entity.Post;
public interface PostDao {
	public boolean save(Connection conn ,Post post)throws SQLException;
	public boolean update(Connection conn , int id ,Post post)throws SQLException;
	public boolean delete(Connection conn , int id ,Post post)throws SQLException;
	public boolean postnameExist(Connection conn,String postname)throws SQLException;
	public ResultSet getPost(Connection conn,int id)throws SQLException;
}
