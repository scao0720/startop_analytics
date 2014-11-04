package scao.startstop;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "BulletServlet", urlPatterns = {"/bullets"})
public class BulletServlet extends HttpServlet {

    @EJB
    private BulletFacade bulletFacade;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         String path = request.getServletPath();

        // if udpate action is requested
        if (path.equals("/bullets")) {
            Integer sessionId = Integer.parseInt(request.getParameter("session_id"));
            Bullet bullet = new Bullet(null, sessionId, request.getParameter("body"), new Date());
            bulletFacade.create(bullet);
            response.sendRedirect(request.getContextPath() + "/show?id=" + sessionId);
        
    }
 }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
