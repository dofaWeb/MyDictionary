
<%@page import="java.util.ArrayList"%>
<%@page import="model.Dictionary"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dictionary List</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.datatables.net/2.0.7/css/jquery.dataTables.min.css" />
        <link rel="stylesheet" href="https://cdn.datatables.net/2.0.7/css/dataTables.bootstrap5.min.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdn.datatables.net/2.0.7/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/2.0.7/js/dataTables.bootstrap5.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#table1').DataTable();
            });
        </script>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f8f9fa;
                padding: 20px;
            }
            h1 {
                margin-bottom: 20px;
            }
            .table-responsive {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            }
            table thead {
                background-color: #343a40;
                color: #fff;
            }
            .btn {
                margin-top: 20px;
            }
            a {
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1 class="text-center">Dictionary List</h1>
            <div class="table-responsive">
                <table id="table1" class="table table-striped table-bordered">
                    <thead class="table-dark">
                        <tr>
                            <th>No.</th>
                            <th>English</th>
                            <th>Vietnamese</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            ArrayList<Dictionary> dict = new ArrayList<>();
                            dict = (ArrayList<Dictionary>) request.getAttribute("dictList");
                            for (int i = 1; i <= dict.size(); i++) {
                        %>
                        <tr>
                            <td><%= i%></td>
                            <td><%= dict.get(i - 1).getEng()%></td>
                            <td><%= dict.get(i - 1).getVn()%></td>
                            <td>
                                <a href="/Word/Edit/<%= dict.get(i - 1).getId()%>" class="btn btn-sm btn-primary">Edit</a>
                                <a onclick="return confirm('Are you sure?')" href="/Word/Delete/<%= dict.get(i - 1).getId()%>" class="btn btn-sm btn-danger">Delete</a>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <a class="btn btn-secondary" href="/Dictionary">Back to Home</a>
        </div>
    </body>
</html>
