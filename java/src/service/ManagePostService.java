package service;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import dao.PostDao;
import dao.implement.PostDaoImpl;
import entity.Post;
import util.ConnectionFactory;

public class ManagePostService {
	private PostDao dao = new PostDaoImpl();
	public boolean sendPost(Post post){
		Connection conn=null;
		try {
			conn = ConnectionFactory.getInstance().makeConnection();
			conn.setAutoCommit(false);
			boolean result = dao.save(conn, post);
			conn.commit();
			return result;
		} catch (Exception e) {
			// TODO: handle exception
			try {
				conn.rollback();
				e.printStackTrace();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
		}finally{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return false;
	}
}
