package com.example.uploadimage;

import java.io.*;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "UploadImage", value = "/UploadImage")
public class UploadServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action!=null && action.equals("upload")){
            //  lấy ra đương dẫn muốn upload đến ;
            String uploadPath = getServletContext().getRealPath("/uploads");// lấy ra đối tương Servletcontext
            File file = new File(uploadPath);
            if(!file.exists()){
                file.mkdirs(); // tạo thư mục
            }

            List<String> filenames = new ArrayList<>();
            // lấy ra danh sách file upload
            Collection<Part> listFile = req.getParts();
            for (Part p: listFile) {
                if(p.getName().equals("image")){
                    // upload image
                    String nameFile = p.getSubmittedFileName();
                    p.write(uploadPath+File.separator+nameFile);
                    filenames.add(nameFile);
                }else if (p.getName().equals("avatar")){
                    //upload avatar
                    String nameFile = p.getSubmittedFileName();
                    p.write(uploadPath+File.separator+nameFile);
                    filenames.add(nameFile);
                }
            }
            // gửi link ảnh sang
            req.setAttribute("images",filenames);
            req.getRequestDispatcher("/WEB-INF/view-image.jsp").forward(req,resp);
        }
    }
}