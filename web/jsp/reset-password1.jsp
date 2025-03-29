

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Reset Password</title>
        <style>
            body {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background-color: #f4f7fc;
                font-family: Arial, sans-serif;
                margin: 0;
            }
            .container {
                background: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 350px;
                text-align: center;
                display: flex;
                flex-direction: column;
                align-items: center;
            }
            h2 {
                margin-bottom: 15px;
            }
            form {
                width: 100%;
                display: flex;
                flex-direction: column;
                align-items: center;
            }
            input {
                width: 90%;
                padding: 10px;
                margin: 10px 0;
                border: 1px solid #ccc;
                border-radius: 5px;
                text-align: center;
            }
            button {
                width: 95%;
                padding: 10px;
                background: #007bff;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
                text-align: center;
            }
            button:hover {
                background: #0056b3;
            }
        </style>
    </head>
    <%
    String email = (String)request.getAttribute("email");
    String token = (String)session.getAttribute("token");
    %>
    <body>
        <div class="container">
            <h2>Reset Password</h2>
            <form>
                <input type="email" value="${email}" placeholder="Enter your email" required>
                <input type="password" placeholder="New Password" required>
                <input type="password" placeholder="Confirm Password" required>
                <button type="submit">Reset Password</button>
            </form>
        </div>
    </body>
</html>
