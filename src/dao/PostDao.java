package dao;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

import entity.Post;
public interface PostDao {
	public boolean save(Connection conn ,Post post)throws SQLException;
	public boolean update(Connection conn , Post post)throws SQLException;
	public boolean delete(Connection conn , int id )throws SQLException;
	public boolean postnameExist(Connection conn,String postname)throws SQLException;
	public ResultSet getById(Connection conn,int id)throws SQLException;
	public ResultSet getMulti(Connection conn,int length,int num)throws SQLException;//获取前length个（num-1）*length+1到limit*length
	public boolean modifyLatest(Connection conn, Date date ,int id)throws SQLException;
	public ResultSet getFollowPost(Connection conn , int parentId)throws SQLException;
	public ResultSet getAll(Connection conn)throws SQLException;
	
}
