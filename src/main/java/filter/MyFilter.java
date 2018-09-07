package filter;

import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.operator;

public class MyFilter implements Filter {
	private Set<String> prefix = new HashSet<String>();

	public void destroy() {

	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) arg0;
		HttpServletResponse resp = (HttpServletResponse) arg1;
		if(canIgnore(req)) {
			chain.doFilter(req, resp);
			return;
		}
	
		if(req.getSession().getAttribute("user")==null) {
			resp.sendRedirect("login.jsp");
			return;
		}
		System.out.println(1);
		chain.doFilter(req, resp);
	}

	public void init(FilterConfig arg0) throws ServletException {
		String url = arg0.getInitParameter("login");
		String[] urls = url.split(",");
		for (String string : urls) {
			prefix.add(string);
			System.out.println(string);
		}
		

	}

	private boolean canIgnore(HttpServletRequest request) {
		String URL = request.getRequestURI();
		for (String ignore : prefix) {
			if (URL.endsWith(ignore)) {
				return true;
			}
		}
		return false;

	}
}