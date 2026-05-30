package com.example.Inkapark.config;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class AdminAccessInterceptor implements HandlerInterceptor {

    private static final String ADMIN_ID_SESSION_ATTRIBUTE = "ADMIN_ID";

    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response,
                             Object handler) throws Exception {

        HttpSession session = request.getSession(false);

        boolean adminAutenticado = session != null
                && session.getAttribute(ADMIN_ID_SESSION_ATTRIBUTE) != null;

        if (adminAutenticado) {
            return true;
        }

        response.sendRedirect(request.getContextPath() + "/admin/login");
        return false;
    }
}