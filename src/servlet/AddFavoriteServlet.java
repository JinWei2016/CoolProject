package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.DoUserService;
import service.ManagePostService;
import service.ManageSaveService;


// ’≤ÿ±Ìsave

// create table table_savePost(
// userid int not null,
// postid int not null
// );



public class AddFavoriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    DoUserService dus = new DoUserService();
    ManagePostService mps = new ManagePostService();
    ManageSaveService mss = new ManageSaveService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddFavoriteServlet() {
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
		boolean result1 = mss.savePost(userid, postid);
		if(!result1){
			response.getWriter().write("failed");
		}else{
			boolean result2 = mps.addSaveNum(postid);
			if(!result2){
				response.getWriter().write("failed");
			}else{
				response.getWriter().write("succeeded");
			}
		}
	}

}
