package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Post;
import service.DoUserService;
import service.ManageCommentService;
import service.ManagePostService;
import service.ManageSaveService;

/**
 * Servlet implementation class GetDetailServlet
 */
@WebServlet("/getDetailServlet")
public class GetDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ManagePostService mps = new ManagePostService();
	DoUserService dus = new DoUserService();
	ManageSaveService mss = new ManageSaveService();
	ManageCommentService mcs = new ManageCommentService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetDetailServlet() {
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
		boolean viewed = false;
		
		String idStr = request.getParameter("id");
		int id = Integer.parseInt(idStr);
		Cookie [] cookies = request.getCookies();
		for(int i=0;i<cookies.length;i++){
			if(cookies[i].getName().equals("post"+idStr+"Viewed")&&cookies[i].getValue().equals("1")){
				viewed=true;
				break;
			}
		}
		int userid=0;
		if(request.getSession().getAttribute("username")!=null){
			userid = dus.getIdByName((String)request.getSession().getAttribute("username"));
		}
		Post post = mps.getById(id);
		String author = dus.getName(post.getAuthorId());
		boolean saved = mss.ifPostSaved(userid , post.getPostid());
		boolean liked = mss.ifPostLiked(userid, post.getPostid());
		Post [] follows = mps.getFollowPost(post.getPostid());
		if(viewed){//cookie有效期内已经有该帖子的访问记录，直接前往帖子页面
			request.setAttribute("content", post);
			request.setAttribute("author", author);
			request.setAttribute("saved",saved);
			request.setAttribute("liked", liked);
			request.setAttribute("follows", follows);
			request.getRequestDispatcher("post.jsp").forward(request, response);
		}else{//有效期内无访问记录 ， 需要先增加访问次数并设置cookie
			Cookie cookie = new Cookie("post"+idStr+"Viewed", "1");
			cookie.setMaxAge(1*60*60);//一小时的有效期
			response.addCookie(cookie);
			//System.out.println("id1-"+id);--right
			//System.out.println("id11-"+post.getPostid());
			request.setAttribute("content", post);
			request.setAttribute("author", author);
			request.setAttribute("saved",saved);
			request.setAttribute("liked", liked);
			request.setAttribute("follows", follows);
			request.getRequestDispatcher("addViewServlet").forward(request, response);
		}
		
	}

}
