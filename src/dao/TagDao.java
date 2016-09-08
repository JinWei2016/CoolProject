package dao;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import entity.Tag;
public interface TagDao {
	public boolean save(Connection conn ,Tag tag)throws SQLException;//����tag
	public boolean TagExist(Connection conn , String tagName) throws SQLException;//tag�Ƿ����
	public boolean delete(Connection conn ,String tagName )throws SQLException;//ɾ����ǩ
	public ResultSet getUsers(Connection conn , String tagName)throws SQLException;//�õ����в��ظ���ʹ�ù�tag���û�
	public ResultSet getTags(Connection conn,int userid)throws SQLException;//�õ����в��ظ���tag
	public ResultSet getUserCount(Connection conn,String tagName)throws SQLException;//�õ�tag���������ù�
	public ResultSet getTagsCount(Connection conn , String tagName)throws SQLException;//�õ�tag���õĴ���
}
