package dao;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import entity.Tag;
public interface TagDao {
	public boolean save(Connection conn ,Tag tag)throws SQLException;//创建tag
	public boolean TagExist(Connection conn , String tagName) throws SQLException;//tag是否存在
	public boolean delete(Connection conn ,String tagName )throws SQLException;//删除标签
	public ResultSet getUsers(Connection conn , String tagName)throws SQLException;//得到所有不重复的使用过tag的用户
	public ResultSet getTags(Connection conn,int userid)throws SQLException;//得到所有不重复的tag
	public ResultSet getUserCount(Connection conn,String tagName)throws SQLException;//得到tag被多少人用过
	public ResultSet getTagsCount(Connection conn , String tagName)throws SQLException;//得到tag被用的次数
}
