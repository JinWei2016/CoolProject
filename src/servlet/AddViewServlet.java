package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Post;
import service.ManagePostService;

/**
 * Servlet implementation class AddViewServlet
 */
@WebServlet("/addViewServlet")
public class AddViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    ManagePostService mps = new ManagePostService();
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddViewServlet() {
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
		if(request.getAttribute("content")!=null&&request.getAttribute("author")!=null){
			//System.out.println("addViewSrevletExecute.");
			Post post = (Post)request.getAttribute("content");
			String author = (String)request.getAttribute("author").toString();
			boolean saved = (boolean)request.getAttribute("saved");
			boolean liked = (boolean)request.getAttribute("liked");
			Post [] follows = null ;
			if(request.getAttribute("follows")!=null)
				follows= (Post [])request.getAttribute("follows");
			int id = post.getPostid();
			//System.out.println("id"+id);
			mps.addViewNum(id);
			RequestDispatcher rd = null;
			post=mps.getById(id);
			request.setAttribute("saved",saved);
			request.setAttribute("liked", liked);
			request.setAttribute("conetnt", post);
			request.setAttribute("author", author);
			request.setAttribute("follows", follows);
			rd = request.getRequestDispatcher("post.jsp");
			rd.forward(request, response);
		}else{
			System.out.println("AddView - content -null");
		}
	}

}
