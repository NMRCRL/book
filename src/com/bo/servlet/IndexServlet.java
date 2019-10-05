package com.bo.servlet;

import com.bo.entity.Character;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
/**
 * @author liu tianyuan
 * @ClassName
 * @Description
 * @Date 2019/10/5
 * @Version 1.0
 **/
@WebServlet(urlPatterns = "/index")
public class IndexServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取各个Servlet共享对象
        ServletContext sc = this.getServletContext();
        //获取全局应用对象中的变量
        List<Character> characterList = (List<Character>) sc.getAttribute("characterList");
        //存入request
        req.setAttribute("characterList", characterList);
        //纯文本输出，看测试结果
        resp.setContentType("text/plain;charset=utf-8");
        resp.getWriter().println(characterList);
        //通过服务器端转发，将数据带过去，并保持地址栏不变
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }
}