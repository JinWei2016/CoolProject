package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Tag;
import service.ManageTagService;

/**
 * Servlet implementation class AddTagServlet
 */
@WebServlet("/addTagServlet")
public class AddTagServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    ManageTagService mts = new ManageTagService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddTagServlet() {
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
		if(request.getAttribute("tag")!=null&&request.getAttribute("author")!=null){
			String tagString = request.getAttribute("tag").toString();
			int authorId = (Integer)request.getAttribute("author");
			String [] tags = tagString.split(",");
			boolean result= true;
			for(int i=0;i<tags.length;i++){
				Tag tag = new Tag();
				tag.setTagName(tags[i]);
				tag.setUserid(authorId);
				if(!mts.createTag(tag)){
					result = false;
				}
			}
			if(result){
				response.getWriter().write("succeeded");
			}else{
				response.getWriter().write("failed");
			}
		}else{
			response.getWriter().write("failed");
		}
		
	}

}
