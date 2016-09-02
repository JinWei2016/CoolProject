package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.User;
import service.DoUserService;

public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DoUserService dus = new DoUserService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserServlet() {
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
		RequestDispatcher rd= null;
		String oldUsername = request.getParameter("oldUsername");
		String username=request.getParameter("username");
		String password=request.getParameter("passsword");
		String email = request.getParameter("email");
		String province = request.getParameter("province");
		int phone = Integer.parseInt(request.getParameter("phone"));
		int grade = Integer.parseInt(request.getParameter("grade"));
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		user.setProvince(province);
		user.setEmail(email);
		user.setPhone(phone);
		user.setGrade(grade);
		int id=dus.getIdByName(oldUsername);
		boolean result = dus.update(id, user);
		if(result){
			request.setAttribute("modify_msg", "succeeded");
			
		}else{
			request.setAttribute("modify_msg", "failed");
		}
		rd = request.getRequestDispatcher("personalPage.jsp");
		rd.forward(request, response);
	}

}
