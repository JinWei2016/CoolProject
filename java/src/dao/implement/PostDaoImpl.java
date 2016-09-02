package dao.implement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dao.PostDao;
import entity.Post;

public class PostDaoImpl implements PostDao{
	private String tableName = "table_post";
	@Override
	public boolean save(Connection conn, Post post) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement ps = conn.prepareCall("INSERT INTO "+tableName+" (parentId,postname,authorId,createDate,latestDate,tags,viewNumber,likeNumber,commentNumber,saveNumber,content) VALUES (?,?,?,?,?,?,?,?,?,?,?)");
		ps.setLong(1, post.getParentId());
		ps.setString(2, post.getPostname());
		ps.setLong(3, post.getAuthorId());
		ps.setDate(4, post.getCreateDate());
		ps.setDate(5, post.getLatestDate());
		ps.setString(6, post.tagString());
		ps.setInt(7, post.getViewNumber());
		ps.setInt(8, post.getLikeNumber());
		ps.setInt(9, post.getCommentNumber());
		ps.setInt(10, post.getSaveNumber());
		ps.setString(11, post.getContent());
		if(ps.executeUpdate()==1){
			return true;
		}
		return false;
	}

	@Override
	public boolean update(Connection conn, int id, Post post) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement ps = conn.prepareCall("UPDATE "+tableName+" SET parentId=?,postname=?,createDate=?,latestDate=?,tags=?,viewNumber=?,likeNumber=?,commentNumber=?,saveNumber=?,content=? WHERE id =?");
		ps.setLong(1, post.getParentId());
		ps.setString(2, post.getPostname());
		ps.setDate(3, post.getCreateDate());
		ps.setDate(4, post.getLatestDate());
		ps.setString(5, post.tagString());
		ps.setInt(6, post.getViewNumber());
		ps.setInt(7, post.getLikeNumber());
		ps.setInt(8, post.getCommentNumber());
		ps.setInt(9, post.getSaveNumber());
		ps.setString(10, post.getContent());
		ps.setLong(11, id);
		if(ps.executeUpdate()==1){
			return true;
		}
		return false;
	}

	@Override
	public boolean delete(Connection conn, int id, Post post) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement ps = conn.prepareStatement("DELETE FROM "+tableName+" WHERE id = ?");
		ps.setLong(1, id);
		if(ps.executeUpdate()==1){
			return true;
		}
		return false;
	}

	@Override
	public boolean postnameExist(Connection conn, String postname) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public ResultSet getPost(Connection conn, int id) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement ps = conn.prepareStatement("SELECT * FROM "+tableName+" WHERE postid = ?");
		ps.setInt(0, id);
		return ps.executeQuery();
	}
	
}
