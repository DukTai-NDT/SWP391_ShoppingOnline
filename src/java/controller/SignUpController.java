<<<<<<< HEAD
///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
// */
//package controller;
//
//import entity.Account;
//import entity.GoogleAccount;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//import java.util.Random;
//import java.util.Vector;
//import model.DAOAccount;
//import model.DAOGoogleLogin;
//
//
///**
// *
// * @author Admin
// */
//@WebServlet(name = "SignUpController", urlPatterns = {"/SignUpURL"})
//public class SignUpController extends HttpServlet {
//
//    /**
//     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
//     * methods.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        DAOAccount dao = new DAOAccount();
//        DAOPatient daoPatient = new DAOPatient();
//        HttpSession session = request.getSession();
//        try (PrintWriter out = response.getWriter()) {
//            String service = request.getParameter("service");
//            String code = request.getParameter("code");
//            if (service == null) {
//                service = "signupGoogle";
//            }
//            if ("signupGoogle".equals(service) && code != null) {
//                DAOGoogleLogin daoGoogle = new DAOGoogleLogin();
//
//                String accessToken = daoGoogle.getTokenSignUp(code);
//                GoogleAccount acc = daoGoogle.getUserInfo(accessToken);
//                Vector<Account> vectorAcc = dao.getAccount("Select * from Account");
//
//                boolean userExists = false;
//                for (Account account : vectorAcc) {
//                    if (acc.getEmail().equals(account.getEmail())) {
//
//                        userExists = true;
//                        break; // Exit loop early if user exists
//                    }
//                }
//
//                if (userExists) {
//                    request.setAttribute("message", "account already exists. Please login");
//                    request.getRequestDispatcher("jsp/login.jsp").forward(request, response);
//                } else {
//                    int n = dao.addAccount(new Account(acc.getName(), 1002, getRandom(6), acc.getEmail()));
//                    Patient patient = new Patient(acc.getFirst_name(), acc.getFamily_name(), null, acc.getEmail(), 0, null, 0, 0, dao.getLastAccountID());
//
//                    request.setAttribute("message", "Sign up successfully. Please login");
//                    request.getRequestDispatcher("jsp/login.jsp").forward(request, response);
//                }
//            }
//
//            if (service.equals("signup")) {
//                String FirstName = request.getParameter("FirstName");
//                String LastName = request.getParameter("LastName");
//                String UserName = request.getParameter("UserName");
//                String Email = request.getParameter("Email");
//                String Password = request.getParameter("Password");
//
//                Vector<Patient> vector = new Vector<>();
//
//                for (Patient patient : vector) {
//                    if (patient.getEmail().equals(Email)) {
//                        request.setAttribute("accountExist", "Account already exist!!!");
//                        request.getRequestDispatcher("jsp/signup.jsp").forward(request, response);
//                        return;
//                    }
//                }
//
//                int n = dao.addAccount(new Account(UserName, 1002, Password, Email));
//                if (n == 0) {
//                    //request.setAttribute("accountFail", "Can not to signup !!!");
//                    request.getRequestDispatcher("jsp/signup.jsp").forward(request, response);
//                } else {
//                    Patient patient = new Patient(FirstName, LastName, null, Email, 0, null, 0, 0, dao.getLastAccountID());
//                    int x = daoPatient.addPatient(patient);
//                    response.sendRedirect("LoginURL?service=login");
//                }
//
//            }
//        }
//    }
//
//    public static String getRandom(int length) {
//        String alpha = "";
//        String number = "0123456789";
//        String alphaNumeric = "";
//        char c = 'A';
//        while (c <= 'Z') {
//            alpha += c;
//            c++;
//        }
//        alphaNumeric = alpha + alpha.toLowerCase() + number;
//        String captchaGen = "";
//
//        for (int i = 0; i < length; i++) {
//            captchaGen += alphaNumeric.charAt(new Random().nextInt(alphaNumeric.length()));
//        }
//        return captchaGen;
//
//    }
//
//    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
//    /**
//     * Handles the HTTP <code>GET</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Handles the HTTP <code>POST</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Returns a short description of the servlet.
//     *
//     * @return a String containing servlet description
//     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
//}
=======
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Account;
import entity.Customers;
import entity.GoogleAccount;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Random;
import java.util.Vector;
import model.DAOAccount;
import model.DAOCustomer;
import model.DAOGoogleLogin;


/**
 *
 * @author Admin
 */
@WebServlet(name = "SignUpController", urlPatterns = {"/SignUpURL"})
public class SignUpController extends HttpServlet {

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
        DAOAccount dao = new DAOAccount();
        DAOCustomer daoCustomer = new DAOCustomer();
        HttpSession session = request.getSession();
        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");
            String code = request.getParameter("code");
            if (service == null) {
                service = "signupGoogle";
            }
            if ("signupGoogle".equals(service) && code != null) {
                DAOGoogleLogin daoGoogle = new DAOGoogleLogin();

                String accessToken = daoGoogle.getTokenSignUp(code);
                GoogleAccount acc = daoGoogle.getUserInfo(accessToken);
                Vector<Account> vectorAcc = dao.getAccount("Select * from Account");

                boolean userExists = false;
                for (Account account : vectorAcc) {
                    if (acc.getEmail().equals(account.getEmail())) {

                        userExists = true;
                        break; // Exit loop early if user exists
                    }
                }

                if (userExists) {
                    request.setAttribute("message", "account already exists. Please login");
                    request.getRequestDispatcher("jsp/login.jsp").forward(request, response);
                } else {
                    int n = dao.addAccount(new Account(acc.getName(), 1002, getRandom(6), acc.getEmail()));
                    Customers customer = new Customers(acc.getFirst_name(), acc.getFamily_name(),
                             acc.getEmail(), null, null, null, dao.getLastAccountID());

                    request.setAttribute("message", "Sign up successfully. Please login");
                    request.getRequestDispatcher("jsp/login.jsp").forward(request, response);
                }
            }

            if (service.equals("signup")) {
                String FirstName = request.getParameter("FirstName");
                String LastName = request.getParameter("LastName");
                String UserName = request.getParameter("UserName");
                String Email = request.getParameter("Email");
                String Password = request.getParameter("Password");

                Vector<Customers> vector = new Vector<>();

                for (Customers customer : vector) {
                    if (customer.getEmail().equals(Email)) {
                        request.setAttribute("accountExist", "Account already exist!!!");
                        request.getRequestDispatcher("jsp/signup.jsp").forward(request, response);
                        return;
                    }
                }

                int n = dao.addAccount(new Account(UserName, 1002, Password, Email));
                if (n == 0) {
                    //request.setAttribute("accountFail", "Can not to signup !!!");
                    request.getRequestDispatcher("jsp/signup.jsp").forward(request, response);
                } else {
                    Customers customer = new Customers(FirstName, LastName,Email, null, null, null, dao.getLastAccountID());
                    int x = daoCustomer.addCustomer(customer);
                    response.sendRedirect("LoginURL?service=login");
                }

            }
        }
    }

    public static String getRandom(int length) {
        String alpha = "";
        String number = "0123456789";
        String alphaNumeric = "";
        char c = 'A';
        while (c <= 'Z') {
            alpha += c;
            c++;
        }
        alphaNumeric = alpha + alpha.toLowerCase() + number;
        String captchaGen = "";

        for (int i = 0; i < length; i++) {
            captchaGen += alphaNumeric.charAt(new Random().nextInt(alphaNumeric.length()));
        }
        return captchaGen;

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
>>>>>>> dd89797db69cc0db5c49a43d266b198ee9a3ef17
