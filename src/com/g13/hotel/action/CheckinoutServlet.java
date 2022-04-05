package com.g13.hotel.action;

import com.g13.hotel.Dao.ClientDao;
import com.g13.hotel.Dao.RoomDao;
import com.g13.hotel.bean.Client;
import com.g13.hotel.bean.Room;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import static java.lang.System.out;

@WebServlet("/check.let")
public class CheckinoutServlet extends HttpServlet {

    ClientDao clientDao = new ClientDao();
    RoomDao roomDao = new RoomDao();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    // /check.let?type=add
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");

        PrintWriter out = resp.getWriter();

        String method = req.getParameter("type");
        switch (method) {
            case "add" -> {
                String cid_s = req.getParameter("cid");
                String rid_s = req.getParameter("rid");
                String rtype = req.getParameter("rtype");
                String cname = req.getParameter("cname");
                String tel = req.getParameter("tel");
                if(cid_s==""||rid_s==""||rtype==""||cname==""||tel==""){
                    out.println("<script>alert('存在未填写选项');location.href = 'checkin.jsp';</script>");
                    return;
                }

                long cid=Long.parseLong(cid_s);
                long rid=Long.parseLong(rid_s);
                long rprice = switch (rtype) {
                    case "单人间" -> 100;
                    case "双人间" -> 160;
                    case "三人间" -> 200;
                    case "大床房" -> 125;
                    default -> 0;
                };

                Client client = new Client();
                client.setId(cid);
                client.setName(cname);
                client.setTel(tel);
                client.setRtype(rtype);
                client.setRid(rid);
                clientDao.insert(client);

                Room room = new Room();
                room.setId(rid);
                room.setType(rtype);
                room.setPrice(rprice);
                room.setState(0);
                roomDao.update(room);

                out.println("<script>alert('入住成功');location.href = 'checkin.jsp';</script>");

            }
            case "out" -> {
                String o_cid_s = req.getParameter("cid");
                if(o_cid_s==""){
                    out.println("<script>alert('请填写id');location.href = 'checkout.jsp';</script>");
                    return;
                }

                long o_cid = Long.parseLong(o_cid_s);

                Client client_o = clientDao.findById(o_cid);
                clientDao.del(client_o);

                Room room_o = roomDao.findByrid(client_o.getRid());
                room_o.setState(1);
                roomDao.update(room_o);

                out.println("<script>alert('退房成功');location.href = 'checkout.jsp';</script>");

            }
            default -> resp.sendError(404, "请求地址不存在");
        }
    }

    private void getclient(HttpServletRequest req, HttpServletResponse resp, PrintWriter out) throws ServletException, IOException {
        //1.获取图书的编号
        long rid = Long.parseLong(req.getParameter("id"));
        //2.根据编号获取图书对象
        Client client = clientDao.findById(rid);
        //3.将对象保存到req
        req.setAttribute("client", client);
        //4.转发到 jsp页面
        req.getRequestDispatcher("clientfind.jsp").forward(req, resp);
    }
}
