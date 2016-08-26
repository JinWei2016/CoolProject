package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.User;
import service.DoUserService;

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DoUserService cku = new DoUserService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		RequestDispatcher rd = null;
		if(username == null || password == null){
			request.setAttribute("msg", "username or password is empty.");
			rd = request.getRequestDispatcher("error.jsp");
			rd.forward(request, response);
		}else{
			boolean bool = cku.usernameExist(username);
			if(bool){
				request.setAttribute("msg", "username alreadyExist!");
				rd = request.getRequestDispatcher("error.jsp");
				rd.forward(request, response);
			}else{
				System.out.println("do resgister operation.....");
				User user = new User();
				user.setUsername(username);
				user.setPassword(password);
				user.setEmail(email);
				boolean resgisterResult = cku.register(user);
				if(resgisterResult){
					System.out.println("resgister succeeded");
					rd = request.getRequestDispatcher("login.jsp");
					rd.forward(request, response);
				}else{
					System.out.println("resgister failed");
					rd = request.getRequestDispatcher("register.jsp");
					rd.forward(request, response);
				}
			}
		}
	}

}
