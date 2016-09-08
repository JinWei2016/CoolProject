package servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Post;
import service.DoUserService;
import service.ManagePostService;

/**
 * Servlet implementation class ReplyServlet
 */
@WebServlet("/replyServlet")
public class ReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DoUserService dus = new DoUserService();
	ManagePostService mps = new ManagePostService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyServlet() {
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
		if(request.getParameter("author")!=null&&request.getParameter("content")!=null&&request.getParameter("parent")!=null){
			String authorIdStr = (String) request.getParameter("author");
			int authorId = Integer.parseInt(authorIdStr);
			String content = (String)request.getParameter("content");
			String parentIdStr = (String)request.getParameter("parent");
			int parentId = Integer.parseInt(parentIdStr);
			Post post = new Post();
			post.setParentId(parentId);
			post.setAuthorId(authorId);
			Date createDate = new Date(System.currentTimeMillis());
			post.setCreateDate(createDate);
			post.setLatestDate(createDate);
			int likeNumber=0,commentNumber=0;
			post.setLikeNumber(likeNumber);
			post.setCommentNumber(commentNumber);
			post.setContent(content);
			boolean result=mps.sendPost(post);
			if(result){
				response.getWriter().write("succeeded");
			}
		}else{
			response.getWriter().write("failed");
		}
	}

}
