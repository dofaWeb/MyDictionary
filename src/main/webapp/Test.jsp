<%-- 
    Document   : Test
    Created on : Aug 17, 2024, 8:27:35 PM
    Author     : NHAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <script type="text/javascript">
            function toggleRangeInputs() {
                var specificRange = document.getElementById("specificRange");
                var rangeInputs = document.getElementById("rangeInputs");
                if (specificRange.checked) {
                    rangeInputs.style.display = "block";
                } else {
                    rangeInputs.style.display = "none";
                }
            }

            function toggleRandomInputs() {
                var Random = document.getElementById("Random");
                var randomType = document.getElementById("randomType");
                if (Random.checked) {
                    randomType.style.display = "block";
                } else {
                    randomType.style.display = "none";
                }
            }

            // Gọi hàm toggleInputs() khi trang được tải
            window.onload = function () {
                toggleRangeInputs();
                toggleRandomInputs();
            };
        </script>
    </head>
    <body>
        <%
            int n = (int) request.getAttribute("size");  // Assuming "size" is passed as a request attribute
            int defaultRange = 30;  // The range to display
            int fromFirst = 1;  // Default start value for the first option
            int toFirst = defaultRange;  // Default end value for the first option

            int fromLast = n - defaultRange + 1;  // Calculate start for the last option
            int toLast = n;  // End value for the last option

            if (fromLast < 1) {  // Adjust if fromLast is less than 1
                fromLast = 1;
            }
            if (toFirst > n) {  // Adjust if the range is greater than the available size
                toFirst = n;
            }
        %>
        <div class="container mt-4">
            <a href="/Dictionary" class="btn btn-secondary mb-3">Back</a>
            <h1 class="mb-4">TEST</h1>
            <h2 class="text-danger">${requestScope.error}</h2>
            <form action="Test" method="post">
                <h4 class="mt-4">Type of Test:</h4>
                <div class="form-check">
                    <input id="Random" type="radio" class="form-check-input" value="Random" name="typeTest" checked="checked" onclick="toggleRandomInputs()"/>
                    <label class="form-check-label">Random</label>
                </div>
                <div id="randomType" class="mt-3" style="display:none; margin-left: 20px;">
                    <input type="radio" name="Duplicate" value="Duplicate" checked="checked"/> 1. Duplicates <br><!-- comment -->
                    <input type="radio" name="Duplicate" value="noDuplicate"/> 2. No Duplicates <br>
                </div>
                <div class="form-check">
                    <input type="radio" class="form-check-input" value="Linear" name="typeTest" onclick="toggleRandomInputs()"/>
                    <label class="form-check-label">Linear</label>
                </div>

                <h4 class="mt-4">Question Range:</h4>
                <div class="form-check">
                    <input type="radio" class="form-check-input" value="All" name="typeRange" onclick="toggleRangeInputs()"/>
                    <label class="form-check-label">All</label>
                </div>
                <div class="form-check">
                    <input type="radio" class="form-check-input" value="Specific" name="typeRange" id="specificRange" onclick="toggleRangeInputs()" checked="checked"/>
                    <label class="form-check-label">Specific</label>
                </div>

                <!-- Range inputs, hidden by default -->
                <div id="rangeInputs" class="mt-3" style="display:none; margin-left: 20px;">
                    <div class="form-check">
                        <input type="radio" class="form-check-input" name="rangeOption" value="1">
                        <label class="form-check-label">1. From 
                            <input type="number" class="form-control d-inline-block" name="from1" value="<%=fromFirst%>" min="1" max="<%=n%>" style="width: 80px;"/>
                            To 
                            <input type="number" class="form-control d-inline-block" name="to1" value="<%=toFirst%>" min="1" max="<%=n%>" style="width: 80px;"/>
                        </label>
                    </div>

                    <div class="form-check">
                        <input type="radio" class="form-check-input" name="rangeOption" value="2" checked>
                        <label class="form-check-label">2. From 
                            <input type="number" class="form-control d-inline-block" name="from2" value="<%=fromLast%>" min="1" max="<%=n%>" style="width: 80px;"/>
                            To 
                            <input type="number" class="form-control d-inline-block" name="to2" value="<%=toLast%>" min="1" max="<%=n%>" style="width: 80px;"/>
                        </label>
                    </div>
                </div>

                <input type="hidden" value="<%=n%>" name="size"/>
                <input type="hidden" value="Test" name="key"/>
                <button type="submit" class="btn btn-primary mt-3" name="submit">Submit</button>
            </form>
        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    </body>
</html>
