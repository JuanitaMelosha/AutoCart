/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package automobile;

import static automobile.AutomobilePriceAnalysis.indexCar;
import static automobile.AutomobilePriceAnalysis.search;
import static automobile.autocar.isValidURL;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

/**
 *
 * @author Hp-admin
 */
public class search extends HttpServlet {

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
  HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String price = request.getParameter("price");
        SpellChecker spellChecker = new SpellChecker("C:\\AutomobilepriceAnaysis\\wordFrequency.txt");
        if (name.equalsIgnoreCase("") && price.equalsIgnoreCase("")) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Give price or name');");
            out.println("location='index.jsp';");
            out.println("</script>");
        } else {
            String query="";
            if (!name.equalsIgnoreCase("")) {
                String userInput = name;
                int maxDistance = 2;

                List<String> suggestions = spellChecker.suggestCorrections(userInput.toLowerCase(), maxDistance);

                if (suggestions.isEmpty()) {
                     query=userInput;
                    session.setAttribute("carresult", query);
                    out.println("<script type=\"text/javascript\">");
            out.println("alert('No Suggestion Check your spelling');");
            out.println("location='compare.jsp';");
            out.println("</script>");
                } else {
                    System.out.println("Suggestions:");
                     query=suggestions.get(0);
                   
session.setAttribute("carresult", query);
                   out.println("<script type=\"text/javascript\">");
                out.println("alert('Welcome');");
                out.println("location='compare.jsp';");
                out.println("</script>");
                }
            
           

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
