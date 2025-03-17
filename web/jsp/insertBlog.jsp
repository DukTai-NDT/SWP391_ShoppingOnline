<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Add New Blog</title>
    <style>
        .form-container { width: 50%; margin: 20px auto; padding: 20px; border: 1px solid #ccc; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; }
        input, textarea, select { width: 100%; padding: 8px; box-sizing: border-box; }
        .button { padding: 10px 20px; cursor: pointer; }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>Add New Blog</h1>
        <form action="BlogsURL?service=insertBlog" method="post">
            <input type="hidden" name="submit" value="true">
            <div class="form-group">
                <label for="postTime">Post Time:</label>
                <input type="date" name="postTime" id="postTime" value="<%=java.time.LocalDate.now()%>" required>
            </div>
            <div class="form-group">
                <label for="title">Title:</label>
                <input type="text" name="title" id="title" required>
            </div>
            <div class="form-group">
                <label for="content">Content:</label>
                <textarea name="content" id="content" required></textarea>
            </div>
            <div class="form-group">
                <label for="image">Image URL:</label>
                <input type="text" name="image" id="image" required>
            </div>
            <div class="form-group">
                <label for="status">Status:</label>
                <select name="status" id="status" required>
                    <option value="true">Active</option>
                    <option value="false">Inactive</option>
                </select>
            </div>
            <input type="submit" value="Submit" class="button">
            <a href="BlogsURL" class="button">Back to List</a>
        </form>
    </div>
</body>
</html>