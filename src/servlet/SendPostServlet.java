package servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Post;
import service.DoUserService;
import service.ManagePostService;


public class SendPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	DoUserService dus = new DoUserService();
	ManagePostService mps = new ManagePostService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendPostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int parentId = 0;
		String postname = request.getParameter("postname");
		String author = request.getParameter("author");
		int authorId = dus.getIdByName(author);
		Date createDate = new Date(System.currentTimeMillis());
		Date latestDate = createDate;
		String tagString = request.getParameter("tagString");
		int viewNumber = 0,likeNumber=0,commentNumber=0,saveNumber=0;
		String content = request.getParameter("content");
		Post post = new Post();
		post.setParentId(parentId);
		post.setPostname(postname);
		post.setAuthorId(authorId);
		post.setCreateDate(createDate);
		post.setLatestDate(latestDate);
		post.setTags(tagString);
		post.setViewNumber(viewNumber);
		post.setLikeNumber(likeNumber);
		post.setCommentNumber(commentNumber);
		post.setSaveNumber(saveNumber);
		post.setContent(content);
		boolean result=mps.sendPost(post);
		if(result){
			request.setAttribute("tag", tagString);
			request.setAttribute("author", authorId);
			RequestDispatcher rd = request.getRequestDispatcher("addTagServlet");
			rd.forward(request, response);
			//response.getWriter().write("succeeded");
		}else{
			response.getWriter().write("failed");
		}
	}

}
