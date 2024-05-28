package com.demo.servlets.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.entities.ProductColor;
import com.demo.models.ColorModel;
@WebServlet("/admin/warehouse")
/**
 * Servlet implementation class WareHouseServlet
 */
public class WareHouseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WareHouseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
				String action = request.getParameter("action");
				if(action == null) {
					doGet_Index(request, response);
				}
	}

	private void doGet_Index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ColorModel colorModel = new ColorModel();
		List<ProductColor> productColors = colorModel.findAll();
		request.setAttribute("productColors", productColors);
		request.setAttribute("admin", "../admin/ListWareHouse.jsp");
		request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
