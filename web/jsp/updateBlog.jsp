<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector, entity.Blogs, jakarta.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update Blog</title>
    <style>
        .form-container { width: 50%; margin: 20px auto; padding: 20px; border: 1px solid #ccc; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; }
        input, textarea, select { width: 100%; padding: 8px; box-sizing: border-box; }
        .button { padding: 10px 20px; cursor: pointer; }
        .error { color: red; margin-top: 10px; }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>Update Blog</h1>
        <%
            HttpSession session = request.getSession();
            Integer customerId = (Integer) session.getAttribute("customerId");
            
            Vector<Blogs> vector = (Vector<Blogs>) request.getAttribute("vector");
            if (vector == null || vector.isEmpty()) {
        %>
            <p class="error">Blog not found or you are not authorized to update this blog!</p>
            <a href="BlogsURL" class="button">Back to List</a>
        <%
                return;
            }
            
            Blogs blog = vector.get(0);
            
            if (customerId == null || blog.getCustomerID() != customerId) {
        %>
            <p class="error">You are not authorized to update this blog!</p>
            <a href="BlogsURL" class="button">Back to List</a>
        <%
                return;
            }
        %>
        <form action="BlogsURL?service=updateBlog" method="post">
            <input type="hidden" name="submit" value="true">
            <input type="hidden" name="blogId" value="<%=blog.getBlogID()%>">
            <div class="form-group">
                <label for="postTime">Post Time:</label>
                <input type="date" name="postTime" id="postTime" value="<%=blog.getPostTime()%>" required>
            </div>
            <div class="form-group">
                <label for="title">Title:</label>
                <input type="text" name="title" id="title" value="<%=blog.getTitle()%>" required>
            </div>
            <div class="form-group">
                <label for="content">Content:</label>
                <textarea name="content" id="content" required><%=blog.getContent()%></textarea>
            </div>
            <div class="form-group">
                <label for="image">Image URL:</label>
                <input type="text" name="image" id="image" value="<%=blog.getImage() != null ? blog.getImage() : ""%>" required>
            </div>
            <div class="form-group">
                <label for="status">Status:</label>
                <select name="status" id="status" required>
                    <option value="true" <%=blog.isStatus() ? "selected" : ""%>>Active</option>
                    <option value="false" <%=!blog.isStatus() ? "selected" : ""%>>Inactive</option>
                </select>
            </div>
            <input type="submit" value="Update" class="button">
            <a href="BlogsURL" class="button">Back to List</a>
        </form>
    </div>
</body>
</html>