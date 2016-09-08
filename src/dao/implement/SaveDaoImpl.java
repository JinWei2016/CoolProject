package dao.implement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dao.SaveDao;

public class SaveDaoImpl implements SaveDao {
	private String savePostTable = "table_savePost";
	private String likePostTable = "table_likePost";
	//private String savePicTable = "table_savePic";
	
	@Override
	public boolean savePost(Connection conn, int userid, int postid) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement ps = conn.prepareCall("INSERT INTO "+savePostTable+" (userid , postid) VALUES (?,?)");
		ps.setInt(1, userid);
		ps.setInt(2, postid);
		System.out.println(ps.toString());
		if(ps.executeUpdate()==1){
			return true;
		}
		return false;
	}

	@Override
	public boolean likePost(Connection conn, int userid, int postid) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement ps = conn.prepareCall("INSERT INTO "+likePostTable+" (userid , postid) VALUES (?,?)");
		ps.setInt(1, userid);
		ps.setInt(2, postid);
		System.out.println(ps.toString());
		if(ps.executeUpdate()==1){
			return true;
		}
		return false;
	}

	@Override
	public ResultSet checkPostSaved(Connection conn, int userid, int postid) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement ps = conn.prepareCall("SELECT * FROM "+savePostTable+" WHERE userid =? AND postid = ?");
		ps.setInt(1, userid);
		ps.setInt(2, postid);
		ResultSet result = ps.executeQuery();
		return result;
	}

	@Override
	public ResultSet checkPostLiked(Connection conn, int userid, int postid) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement ps = conn.prepareCall("SELECT * FROM "+likePostTable+" WHERE userid =? AND postid = ?");
		ps.setInt(1, userid);
		ps.setInt(2, postid);
		ResultSet result = ps.executeQuery();
		return result;
	}

	@Override
	public boolean deleteLike(Connection conn,int userid, int postid) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement ps = conn.prepareCall("DELETE FROM "+likePostTable+" WHERE userid = ? AND postid = ?");
		ps.setInt(1, userid);
		ps.setInt(2, postid);
		if(ps.executeUpdate()==1){
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteSave(Connection conn, int userid, int postid) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement ps = conn.prepareCall("DELETE FROM "+savePostTable+" WHERE userid = ? AND postid = ?");
		ps.setInt(1, userid);
		ps.setInt(2, postid);
		if(ps.executeUpdate()==1){
			return true;
		}
		return false;
	}
}
