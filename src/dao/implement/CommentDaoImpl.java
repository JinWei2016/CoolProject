package dao.implement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dao.CommentDao;
import entity.Comment;

public class CommentDaoImpl implements CommentDao{
	private String tableName = "table_comment";
	@Override
	public boolean save(Connection conn, Comment comment) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement ps = conn.prepareCall("INSERT INTO "+tableName+" (parentId,authorId,content,createDate,isFollowPost) VALUES (?,?,?,?,?)");
		ps.setInt(1, comment.getParentId());
		ps.setInt(2, comment.getAuthorId());
		ps.setString(3, comment.getContent());
		ps.setDate(4, comment.getCreateDate());
		ps.setBoolean(5, comment.isFollowPost());;
		if(ps.executeUpdate()==1){
			return true;
		}
		return false;
	}

	@Override
	public boolean update(Connection conn, int id, Comment comment) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement ps = conn.prepareCall("UPDATE "+tableName+" parentId=?,authorId=?,content=?,createDate=?,isFollowPost=?) WHERE commentid =?");
		ps.setInt(1, comment.getParentId());
		ps.setInt(2, comment.getAuthorId());
		ps.setString(3, comment.getContent());
		ps.setDate(4, comment.getCreateDate());
		ps.setBoolean(5, comment.isFollowPost());
		ps.setInt(6, id);
		if(ps.executeUpdate()==1){
			return true;
		}
		return false;
	}

	@Override
	public boolean delete(Connection conn, int id) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement ps = conn.prepareCall("DELETE FROM "+tableName+" WHERE commentid = ?");
		ps.setLong(1, id);
		if(ps.executeUpdate()==1){
			return true;
		}
		return false;
	}


	@Override
	public ResultSet getById(Connection conn, int commentid) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement ps = conn.prepareCall("SELECT * FROM "+tableName+" WHERE commentid = ?");
		ps.setInt(1, commentid);
		return ps.executeQuery();
	}

	@Override
	public ResultSet getAll(Connection conn, int parentid) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement ps = conn.prepareCall("SELECT * FROM "+tableName+" WHERE parentid= ?");
		ps.setInt(1, parentid);
		return ps.executeQuery();
	}

	@Override
	public ResultSet checkFollowPost(Connection conn, int commentid) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement ps = conn.prepareCall("SELECT isFollowPost FROM "+tableName+" WHERE commentid = ?");
		ps.setInt(1, commentid);
		return ps.executeQuery();
	}
	
	
}
