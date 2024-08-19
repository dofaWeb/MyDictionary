<%-- 
    Document   : Testing
    Created on : Aug 17, 2024, 9:41:51 PM
    Author     : NHAT
--%>

<%@page import="dao.DictionaryDAO"%>
<%@page import="model.Dictionary"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

        <script type="text/javascript">
            // Đặt focus vào trường input Vietnamese khi trang load
            document.addEventListener("DOMContentLoaded", function () {
                document.getElementById("vnInput").focus();
            });
        </script>
    </head>
    <body>
        <div class="container mt-4">
            <a href="/Test" class="btn btn-secondary mb-3">Back</a>
            <h1 class="mb-4">Test!</h1>

            <%
                DictionaryDAO dictDAO = new DictionaryDAO();
                dictDAO.trigger();
                List<Integer> index = new ArrayList<>();
                ArrayList<Dictionary> dictList = (ArrayList<Dictionary>) session.getAttribute("dictList");
                if (session.getAttribute("index") != null) {
                    index = (List<Integer>) session.getAttribute("index");
                }
                int i = (int) request.getAttribute("i");
                Dictionary dict = dictList.get(index.get(i) - 1);
            %>

            <form action="Test" method="post">
                <div class="text-right text-danger">
                    Your Point: ${sessionScope.Point}<br>
                </div>
                
                <div class="form-group">
                    <label for="engInput">English:</label>
                    <input type="text" class="form-control" id="engInput" value="<%= dict.getEng()%>" name="Eng" readonly/>
                </div>
                <div class="form-group">
                    <label for="vnInput">Vietnamese:</label>
                    <input type="text" class="form-control" id="vnInput" name="Vn"/>
                </div>

                <input type="hidden" value="<%=i%>" name="i"/>
                <input type="hidden" value="<%=dict.getVn()%>" name="VnAnswer"/>

                

                <input type="hidden" value="Testing" name="key"/>
                <button type="submit" class="btn btn-primary" name="Check">Submit</button>
                <h3 style="color:red">${requestScope.error}</h3>
            </form>
        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
