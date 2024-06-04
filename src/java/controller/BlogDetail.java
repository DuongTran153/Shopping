/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.BlogDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Blog;
import model.Category;
import model.Product;

/**
 *
 * @author ngock
 */
@WebServlet(name="BlogDetail", urlPatterns={"/blogdetail"})
public class BlogDetail extends HttpServlet {
   
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BlogDetail</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BlogDetail at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         BlogDAO d = new BlogDAO();
        if (request.getParameter("mode") != null && request.getParameter("mode").equals("1")) {
            String blogID = request.getParameter("id");

            List<Blog> featureBlogs = d.getFeaturedBlogs();
            Product p = d.getProductByID();
            Blog b = d.getBlogByID(Integer.parseInt(blogID));
            Product pro = d.getRelatedProducts(Integer.parseInt(blogID));
            List<Category> listCate = d.getAllRootCategories();
            request.setAttribute("featureBlogs", featureBlogs);
            request.setAttribute("blogdetail", b);
            request.setAttribute("listCate", listCate);
            request.setAttribute("pro", pro);
            request.getRequestDispatcher("/view/customer/BlogDetail.jsp").forward(request, response);
        }
        
         request.getRequestDispatcher("/view/customer/BlogDetail.jsp").forward(request, response);
    }
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         BlogDAO d = new BlogDAO();
        List<Category> categories = d.getAllRootCategories();
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("/view/customer/Blog.jsp").forward(request, response);
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}