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
            case "new":
                request.getRequestDispatcher("bicis/form_new.jsp").forward(request,response);
                break;
            case "edit":
                String dni = request.getParameter("dni");
                trabajadores trabajadores = trabajadoresDao.buscarPorDni(dni);

                if(trabajadores != null){
                    request.setAttribute("bicis", trabajadores);
                    request.getRequestDispatcher("bicis/form_edit.jsp").forward(request,response);
                }else{
                    response.sendRedirect(request.getContextPath()+ "/biciServlet");
                }
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        trabajadoresDao trabajadoresDao = new trabajadoresDao();

        String action = request.getParameter("action") == null ? "crear" : request.getParameter("action");

        switch (action){
            case "crear":
                String nombres = request.getParameter("nombres");
                String apellidos = request.getParameter("apellidos");
                String correo = request.getParameter("correo");
                String dni = request.getParameter("DNI");
                int idsede = Integer.parseInt(request.getParameter("idsede"));

                trabajadores trabajadores = trabajadoresDao.buscarPorDni(dni);

                if(trabajadores == null){
                    trabajadoresDao.crear(nombres,apellidos,correo,dni,idsede);
                    response.sendRedirect(request.getContextPath() + "/biciServlet");
                }else{
                    request.getRequestDispatcher("bicis/form_new.jsp").forward(request,response);
                }
            break;
        }
    }
}
