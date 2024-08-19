<%@page import="dao.DictionaryDAO"%>
<%@page import="model.Dictionary"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Word</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
        }
        h1 {
            font-size: 24px;
            margin-bottom: 20px;
            text-align: center;
            color: #333;
        }
        label {
            display: block;
            margin-bottom: 8px;
            color: #555;
        }
        input[type="text"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 16px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #007BFF;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Edit Word</h1>
        <form action='Word' method='post'>
            <%
                String Id = "";
                Dictionary dict = new Dictionary();
                if (request.getAttribute("EditWord") != null) {
                    Id = (String) request.getAttribute("EditWord");

                    DictionaryDAO dictDAO = new DictionaryDAO();
                    dict = dictDAO.getDictionaryByID(Id);
                }
            %>
            <label for="engTxt">English:</label>
            <input type='text' id="engTxt" value='<%= dict.getEng() %>' name='engTxt' required/>

            <label for="vnTxt">Vietnamese:</label>
            <input type='text' id="vnTxt" value='<%= dict.getVn() %>' name='vnTxt' required/>

            <input type='hidden' value="<%= dict.getId() %>" name='idTxt'/>
            <input type='submit' name='editBtn' value='Edit'/>
        </form>
        <a href="/List">Back to List</a>
    </div>
</body>
</html>
