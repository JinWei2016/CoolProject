package servlet;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Post;
import service.ManagePostService;

/**
 * Servlet implementation class SendFollowPostServlet
 */
@WebServlet("/sendFollowPostServlet")
public class SendFollowPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    ManagePostService mps = new ManagePostService();
    		
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendFollowPostServlet() {
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
		String postid = request.getParameter("postid");
		int parentId = Integer.parseInt(postid);
		Post [] followPosts = mps.getFollowPost(parentId);
		request.setAttribute("followPost", followPosts);
		request.getRequestDispatcher("post.jsp").forward(request, response);
	}

}
