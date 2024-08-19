<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dictionary App</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f8f9fa;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
            }
            .container {
                text-align: center;
                background-color: #fff;
                padding: 40px;
                border-radius: 8px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            }
            h1 {
                margin-bottom: 30px;
            }
            .btn {
                margin: 10px 0;
                width: 100%;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Web Dictionary</h1>
            <a href="/Word/AddWord"><button class="btn btn-primary">Add a Word</button></a><br>
            <a href="/List"><button class="btn btn-success">Show List</button></a><br>
            <a href="/Test"><button class="btn btn-warning">Take a Test</button></a><br>
        </div>
    </body>
</html>
