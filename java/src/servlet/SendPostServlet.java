package servlet;

import java.io.IOException;
import java.sql.Date;

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
		System.out.println("save post...");
		long parentId = 0;
		String postname = request.getParameter("postname");
		String author = request.getParameter("author");
		long authorId = dus.getIdByName(author);
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
		String [] tags = tagString.split(",");
		int num = tags.length;
		for(int i =0;i<tags.length;i++){
			if(tags[i]=="")
				num--;
		}
		String[] tag = new String [num];
		for(int i=0,j=0;i<tag.length;){
			if(tags[j]=="")
				continue;
			tag[i]=tags[j];
			i++;
		}
		post.setTags(tag);
		post.setViewNumber(viewNumber);
		post.setLikeNumber(likeNumber);
		post.setCommentNumber(commentNumber);
		post.setSaveNumber(saveNumber);
		post.setContent(content);
		boolean result=mps.sendPost(post);
		if(result){
			response.getWriter().write("succeeded");
		}else{
			response.getWriter().write("failed");
		}
	}

}
