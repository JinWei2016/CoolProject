package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import entity.Comment;

public interface CommentDao {
	public boolean save(Connection conn ,Comment comment)throws SQLException;
	public boolean update(Connection conn , int id ,Comment comment)throws SQLException;
	public boolean delete(Connection conn , int id)throws SQLException;
	public ResultSet getAll(Connection conn,int parentid)throws SQLException;
	public ResultSet getById(Connection conn,int commentid)throws SQLException;
	public ResultSet checkFollowPost(Connection conn , int commentid)throws SQLException;
}
