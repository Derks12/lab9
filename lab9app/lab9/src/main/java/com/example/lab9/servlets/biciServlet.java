package com.example.lab9.servlets;

import com.example.lab9.beans.trabajadores;
import com.example.lab9.daos.trabajadoresDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "biciServlet", value = "/biciServlet")
public class biciServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");

        trabajadoresDao trabajadoresDao = new trabajadoresDao();

        switch (action){
            case "lista":
                //saca del modelo
                ArrayList<trabajadores> list = trabajadoresDao.listar();

                //mandar la lista a la vista -> job/lista.jsp
                request.setAttribute("lista",list);
                RequestDispatcher rd = request.getRequestDispatcher("bicis/lista.jsp");
                rd.forward(request,response);
                break;
        }
    }

    /*@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }*/
}