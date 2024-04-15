/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionHelper;
import com.tech.blog.helper.ProfileHelper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author harsh
 */
@MultipartConfig
public class EditServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
         
       
            String userName = request.getParameter("userName");
            String userEmail = request.getParameter("userEmail");
            String userAbout = request.getParameter("userAbout");
            String userPassword = request.getParameter("userPassword");
            Part part = request.getPart("userProfile");
            String userProfile = part.getSubmittedFileName();
//            out.println(userPassword);
            
            HttpSession s = request.getSession();
            
            User u = (User) s.getAttribute("currentUser");
            String oldPic = u.getUserProfile();
            
            u.setUserName(userName);
            u.setUserEmail(userEmail);
            u.setUserAbout(userAbout);
            u.setUserProfile(userProfile);
            
            u.setUserPassword(userPassword);
            
            
            
//            out.println(u);
            
            int userId = u.getId();
//            out.println(u.getName());
            
//            out.println("1222");
            
            UserDao ud = new UserDao(ConnectionHelper.getConnection());
//            
//            String pass = ud.fetchPassById(userId);
//            out.println(userPassword);
//            out.println(pass);
//            if(userPassword==null){
//                u.setUserPassword(pass);
//            
//            }else{
//                 u.setUserPassword(userPassword);
//            }
            
//            out.println(u.getPassword());
//            out.println(u.getUserProfile());
//            out.println("1222");
            
            boolean ans = ud.updateUser(userName,userEmail,userAbout,userProfile,userPassword ,userId);
//            out.println("1222");
//            out.println(ans);
//            out.println("1222");
            
            if(ans){
                out.println("success");
                String path = request.getRealPath("/")+"images"+File.separator+u.getUserProfile();
                String oldPath = request.getRealPath("/")+"images"+File.separator+oldPic;
                
               // ProfileHelper.deleteFile(path);
//                if(ProfileHelper.saveFile(part.getInputStream(), path)){
//                    out.println("done");
//                }else{
//                    out.println("error");
//                
//                }
                
            }else{
                out.println("error");
            }
            
            
           
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
