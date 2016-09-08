package dao.implement;

import java.sql.Connection;
import java.sql.Date;
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
		ps.setInt(1, post.getParentId());
		ps.setString(2, post.getPostname());
		ps.setInt(3, post.getAuthorId());
		ps.setDate(4, post.getCreateDate());
		ps.setDate(5, post.getLatestDate());
		ps.setString(6, post.getTags());
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
	public boolean update(Connection conn, Post post) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement ps = conn.prepareCall("UPDATE "+tableName+" SET parentId=?,postname=?,createDate=?,latestDate=?,tags=?,viewNumber=?,likeNumber=?,commentNumber=?,saveNumber=?,content=? WHERE postid =?");
		ps.setInt(1, post.getParentId());
		ps.setString(2, post.getPostname());
		ps.setDate(3, post.getCreateDate());
		ps.setDate(4, post.getLatestDate());
		ps.setString(5, post.getTags());
		ps.setInt(6, post.getViewNumber());
		ps.setInt(7, post.getLikeNumber());
		ps.setInt(8, post.getCommentNumber());
		ps.setInt(9, post.getSaveNumber());
		ps.setString(10, post.getContent());
		ps.setInt(11, post.getPostid());
		//System.out.println(ps.toString());
		if(ps.executeUpdate()==1){
			return true;
		}
		return false;
	}

	@Override
	public boolean delete(Connection conn, int id) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement ps = conn.prepareStatement("DELETE FROM "+tableName+" WHERE postid = ?");
		ps.setInt(1, id);
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
	public ResultSet getById(Connection conn, int id) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement ps = conn.prepareStatement("SELECT * FROM "+tableName+" WHERE postid = ?");
		ps.setInt(1, id);
		return ps.executeQuery();
	}

	@Override
	public ResultSet getMulti(Connection conn, int length ,int num) throws SQLException {
		// TODO Auto-generated method stub
		//select TOP 10 * from (select top 20 * from table order by XXX asc) order by XXX desc
		int num2 = length*(num-1);
		PreparedStatement ps = conn.prepareStatement("SELECT * FROM "+tableName+" WHERE postid LIMIT ?,?");
		ps.setInt(1,num2);
		ps.setInt(2, length);
		return ps.executeQuery();
	}

	@Override
	public boolean modifyLatest(Connection conn,Date date ,int id) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement ps = conn.prepareStatement("UPDATE "+tableName+" SET modifyLatest=? WHERE postid =?");
		ps.setDate(1, date);
		ps.setInt(2, id);
		if(ps.executeUpdate()==1){
			return true;
		}
		return false;
	}

	@Override
	public ResultSet getFollowPost(Connection conn, int parentId) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement ps = conn.prepareCall("SELECT * FROM "+tableName+" WHERE parentid = ?");
		ps.setInt(1, parentId);
		ResultSet result = ps.executeQuery();
		return result;
	}
	
	public ResultSet getAll(Connection conn)throws SQLException{
		PreparedStatement ps = conn.prepareCall("SELECT * FROM "+tableName);
		ResultSet result = ps.executeQuery();
		return result;
	}
	
}
