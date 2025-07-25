/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.AccountDAO;
import dao.RoleDAO;
import dao.StatusAccountDAO;
import dao.UserProfileDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Account;
import model.Role;
import model.StatusAccount;
import util.ToastUtil;

/**
 *
 * @author VAN NGUYEN
 */
@WebServlet(name="StaffServlet", urlPatterns={"/admin/quan-li-nhan-vien"})
public class StaffServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          String accountId = request.getParameter("aId");
        String statusId = request.getParameter("sId");
        String roleId = request.getParameter("rId");
        
        AccountDAO aDao = new AccountDAO();
        UserProfileDAO uDao = new UserProfileDAO();
        
        
        boolean a = aDao.changeStatus(accountId, statusId);
        if(a){
            ToastUtil.setSuccessToast(request, "Đổi trạng thái thành công!");
        }
        boolean b = uDao.changeRole(accountId, roleId);
         if(b){
            ToastUtil.setSuccessToast(request, "Đổi vai trò thành công!");
        }
        
        
          doGet(request, response); 
    }
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int roleId = 2;
       StatusAccountDAO sDao = new StatusAccountDAO();
       AccountDAO aDao = new AccountDAO();
        RoleDAO rDao = new RoleDAO();
        List<StatusAccount> listS = sDao.getStatusAccount();
        List<Account> listA = aDao.getAccountByRoleId(roleId);
        List<Role> listR = rDao.getAllRoles();
        
        request.setAttribute("listRole", listR);
        request.setAttribute("listUser", listA);
        request.setAttribute("listStatus", listS);
        request.getRequestDispatcher("/admin/manage-staff.jsp").forward(request, response);


    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
