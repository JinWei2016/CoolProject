package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import entity.Comment;

public interface CommentDao {
	public boolean save(Connection conn ,Comment comment)throws SQLException;
	public boolean update(Connection conn , int id ,Comment comment)throws SQLException;
	public boolean delete(Connection conn , int id ,Comment comment)throws SQLException;
}
