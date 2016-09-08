package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Post;
import service.DoUserService;
import service.ManagePostService;

public class GetPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    ManagePostService mps = new ManagePostService();
    DoUserService dus = new DoUserService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetPostServlet() {
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
//		String lengthStr = request.getParameter("length");
//		String numStr=request.getParameter("num");
//		int length = Integer.parseInt(lengthStr);
//		int num = Integer.parseInt(numStr);
			
			int length=15;
			if(request.getSession().getAttribute("num")==null){
				System.out.println("GetPageServlet+Pgae num null");
				request.getSession().setAttribute("num",1);
			}else{
				System.out.println("GetPageServlet+Page num not null");
				int num=(int)request.getSession().getAttribute("num");
				num++;
				request.getSession().setAttribute("num", num);
			}
			
			int num=(int)request.getSession().getAttribute("num");
			System.out.println("PageNum"+num);
			Post [] post = mps.getAll();
			if(post!=null){
				//response.getWriter().write("succeeded");
				String [] authors = new String [post.length];
				for(int i =0;i<post.length;i++){
					authors[i]=dus.getName(post[i].getAuthorId());
				}
				request.setAttribute("posts", post);
				request.getRequestDispatcher("bbs.jsp").forward(request, response);
			}else{
				
			}
	}
	
}
