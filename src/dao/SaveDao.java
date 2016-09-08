package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public interface SaveDao {
	public boolean deleteLike(Connection conn ,int userid , int postid)throws SQLException;
	public boolean deleteSave(Connection conn ,int userid , int postid)throws SQLException;
	public boolean savePost(Connection conn,int userid , int postid)throws SQLException;
	public boolean likePost(Connection conn ,int userid ,int postid)throws SQLException;
	public ResultSet checkPostSaved(Connection conn , int userid , int postid)throws SQLException;
	public ResultSet checkPostLiked(Connection conn , int userid , int postid)throws SQLException;
}
