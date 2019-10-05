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
 * @Date 2019/10/4
 * @Version 1.0
 **/
@WebServlet(urlPatterns = "/detail/*")
public class CharacterDetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取请求URI，并去除空格
        String requestPath = req.getRequestURI().trim();
        //获取最后一个"/"的位置
        int position = requestPath.lastIndexOf("/");
        //从该位置到最后取字串
        String id = requestPath.substring(position + 1);
        //从全局变量中取出图书列表
        ServletContext sc = this.getServletContext();
        List<Character> characterList = (List<Character>) sc.getAttribute("characterList");
        //遍历，查找指定id的图书
        for (Character character : characterList) {
            if (Integer.parseInt(id) == character.getId()) {
                //找到匹配的id，存入request，页面转发到图书详情页，地址不变
                req.setAttribute("character", character);
                resp.setContentType("text/plain;charset=utf-8");
                resp.getWriter().println(character);
                req.getRequestDispatcher("/character_detail.jsp").forward(req, resp);
            }
        }
    }
}
