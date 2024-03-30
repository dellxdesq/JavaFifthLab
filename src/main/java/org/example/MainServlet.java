package org.example;


import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import service.FileManager;
import java.io.*;
import java.util.Date;

@WebServlet(urlPatterns = {"/Manager"})
public class MainServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        FileManager fileManager = new FileManager();
        File[] folders = fileManager.allFolders(request.getParameter("path"));
        if (folders == null) {
            folders = new File[0];
        }

        File[] files = fileManager.allFiles(request.getParameter("path"));
        if (files == null) {
            files = new File[0];
        }

        Date currentTime = new Date();
        request.setAttribute("currentTime", currentTime);

        request.setAttribute("folders", folders);
        request.setAttribute("files", files);
        request.getRequestDispatcher("Manager.jsp").forward(request, response);

    }
}
