package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.DoUserService;
import service.ManagePostService;
import service.ManageSaveService;

/**
 * Servlet implementation class DeleteLikeServlet
 */
@WebServlet("/deleteLikeServlet")
public class DeleteLikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ManagePostService mps = new ManagePostService();
    DoUserService dus = new DoUserService();
    ManageSaveService mss = new ManageSaveService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteLikeServlet() {
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
		String username = (String) request.getSession().getAttribute("username");
		int userid = dus.getIdByName(username);
		String postidStr = request.getParameter("postid");
		int postid = Integer.parseInt(postidStr);
		boolean result1 = mss.deleteLike(userid, postid);
		if(!result1){
			response.getWriter().write("failed");
		}else{
			boolean result2 = mps.deleteLikeNum(postid);
			if(!result2){
				response.getWriter().write("failed");
			}else{
				response.getWriter().write("succeeded");
			}
		}
	}

}
