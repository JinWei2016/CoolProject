package service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.TagDao;
import dao.implement.TagDaoImpl;
import entity.Post;
import entity.Tag;
import util.ConnectionFactory;

public class ManageTagService {
	private TagDao dao = new TagDaoImpl();
	public boolean createTag(Tag tag){
		Connection conn=null;
		try{
			conn = ConnectionFactory.getInstance().makeConnection();
			conn.setAutoCommit(false);
			boolean result = dao.save(conn, tag);
			conn.commit();
			return result;
		}catch (Exception e) {
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
	public boolean delete(String tagName){
		Connection conn=null;
		try {
			conn = ConnectionFactory.getInstance().makeConnection();
			conn.setAutoCommit(false);
			boolean result = dao.delete(conn, tagName);
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
	public boolean tagExist(String tagName){
		Connection conn= null;
		conn = ConnectionFactory.getInstance().makeConnection();
		try {
			boolean result = dao.TagExist(conn, tagName);
			return result;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return false;
	}
	public int [] getUsers(String tagName){
		Connection conn= null;
		try{
			conn = ConnectionFactory.getInstance().makeConnection();
			ResultSet rs = dao.getUsers(conn, tagName);
			ArrayList<Integer> al = new ArrayList<Integer>();
			int temp = 0;
			while(rs.next()){
				temp=rs.getInt(1);
				al.add(temp);
			}
			int [] result= new int[al.size()];
			for(int i=0;i<al.size();i++){
				result[i]=al.get(i);
			}
			return result;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}
	public String [] getTags(int userid){
		Connection conn= null;
		try{
			conn = ConnectionFactory.getInstance().makeConnection();
			ResultSet rs = dao.getTags(conn, userid);
			ArrayList<String> al = new ArrayList<String>();
			String temp=null;
			while(rs.next()){
				temp=rs.getString(1);
				al.add(temp);
			}
			String [] result= new String[al.size()];
			for(int i=0;i<al.size();i++){
				result[i]=al.get(i);
			}
			return result;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}
	public int getUserCount(String tagName){
		Connection conn = null;
		try{
			conn = ConnectionFactory.getInstance().makeConnection();
			ResultSet rs = dao.getUserCount(conn, tagName);
			if(rs.next()){
				int result = rs.getInt(1);
				return result;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return 0;
		
	}
	public int getTagsCount(String tagName){
		Connection conn = null;
		try{
			conn = ConnectionFactory.getInstance().makeConnection();
			ResultSet rs = dao.getTagsCount(conn, tagName);
			if(rs.next()){
				int result = rs.getInt(1);
				return result;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return 0;
	}
}
