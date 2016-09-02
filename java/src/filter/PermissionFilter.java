package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class PermissionFilter implements Filter {

    /**
     * Default constructor. 
     */
    public PermissionFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse resp = (HttpServletResponse) response;
		
//		request.setCharacterEncoding("UTF-8");
//        response.setCharacterEncoding("UTF-8");
        
		String servletPath = req.getServletPath();
		
		HttpSession session = req.getSession();
		String flag = (String)session.getAttribute("login_flag");
		if(servletPath.contains("js")&&!(servletPath.contains("jsp"))){
			chain.doFilter(request, response);
		}
		else if(servletPath.contains("css")){
			chain.doFilter(request, response);
		}
		else if(servletPath.contains(".PNG")||servletPath.contains(".ico")||servletPath.contains(".gif")||servletPath.contains(".css")|| servletPath.contains(".png")|| servletPath.contains(".jpg")|| servletPath.contains("glyphicons")){
			chain.doFilter(request, response);
		}
		else if(servletPath.contains("navigator")||servletPath.contains("image/")){
			chain.doFilter(request, response);
		}
		else if(servletPath.equals("/map.jsp")||servletPath.equals("/bbs.jsp")||servletPath.equals("/recommend.jsp")){
			chain.doFilter(request, response);
		}
		else if(servletPath!=null&&(servletPath.equals("/login.jsp")||servletPath.equals("/index.jsp")||servletPath.equals("/checkUserServlet")||servletPath.equals("/404.jsp")||servletPath.equals("/register.jsp")||servletPath.equals("/registerServlet")||servletPath.equals("/showdata.jsp"))){
			// pass the request along the filter chain
			chain.doFilter(request, response);
		}else{
			if(flag!=null &&flag.equals("login_success")){
				chain.doFilter(request, response);
			}else if(flag!=null&&flag.equals("login_error")){
				req.setAttribute("msg", "Login fail,please login again.");
				req.setAttribute("returnUrl", servletPath);
				RequestDispatcher rd = req.getRequestDispatcher("/login.jsp");
				rd.forward(req, resp);
			}else{
				System.out.println(servletPath+" turn to login");
				req.setAttribute("msg", "Not logined yet.");
				req.setAttribute("returnUrl", servletPath);
				RequestDispatcher rd = req.getRequestDispatcher("/login.jsp");
				rd.forward(req, resp);
			}
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
