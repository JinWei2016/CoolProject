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
		PreparedStatement ps = conn.prepareCall("INSERT INTO "+tableName+" (parentId,content,createDate,isFollowPost) VALUES (?,?,?,?)");
		ps.setLong(1, comment.getParentId());
		ps.setString(2, comment.getContent());
		ps.setDate(3, comment.getCreateDate());
		ps.setBoolean(4, comment.isFollowPost());;
		if(ps.executeUpdate()==1){
			return true;
		}
		return false;
	}

	@Override
	public boolean update(Connection conn, int id, Comment comment) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement ps = conn.prepareCall("UPDATE "+tableName+" parentId=?,content=?,createDate=?,isFollowPost=?) WHERE id =?");
		ps.setLong(1, comment.getParentId());
		ps.setString(2, comment.getContent());
		ps.setDate(3, comment.getCreateDate());
		ps.setBoolean(4, comment.isFollowPost());
		ps.setLong(5, id);
		if(ps.executeUpdate()==1){
			return true;
		}
		return false;
	}

	@Override
	public boolean delete(Connection conn, int id, Comment comment) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement ps = conn.prepareStatement("DELETE FROM "+tableName+" WHERE id = ?");
		ps.setLong(1, id);
		if(ps.executeUpdate()==1){
			return true;
		}
		return false;
	}
	
}
