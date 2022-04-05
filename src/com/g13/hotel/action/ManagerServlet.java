package com.g13.hotel.action;

import com.g13.hotel.Dao.ManagerDao;
import com.g13.hotel.bean.Manager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/man.let")
public class ManagerServlet extends HttpServlet {

    ManagerDao managerDao=new ManagerDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        HttpSession session = req.getSession();
        PrintWriter out = resp.getWriter();

        String method = req.getParameter("type");
        switch (method) {
            case "login" -> {
                String name = req.getParameter("name");
                String passw = req.getParameter("passw");

                Manager manager = managerDao.getman(name,passw);
                if (name == "" || passw == "") {
                    out.println("<script>alert('用户名或密码不存在');location.href = 'login.jsp';</script>");
                } else if(passw.equals(manager.getPassw())){
                    session.setAttribute("manager",manager);
                    out.println("<script>alert('登录成功');location.href = 'home.jsp';</script>");
                }
                else{
                    out.println("<script>alert('用户名或密码错误');location.href = 'login.jsp';</script>");
                }
            }
            case "change" -> {
                String newpwd = req.getParameter("newpwd");
                String name=((Manager)session.getAttribute("manager")).getName();
                int result;
                result = managerDao.Changepwd(name,newpwd);
                if(result>0){
                    out.println("<script>alert('密码修改成功');parent.window.location.href='login.jsp';</script>");
                }else{
                    out.println("<script>alert('修改失败');location.href='Manager_changepsw.jsp'</script>");
                }
            }
        }
    }
}
