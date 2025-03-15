<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector, entity.Blogs,etity.Customers, jakarta.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blog Management</title>
        <style>
            table {
                border-collapse: collapse;
                width: 80%;
                margin: 20px auto;
            }
            th, td {
                border: 1px solid black;
                padding: 8px;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
            .container {
                text-align: center;
            }
            .button {
                padding: 5px 10px;
                margin: 5px;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>All Blogs</h1>
            <form action="BlogsURL?service=searchBlogs" method="post">
                <input type="text" name="title" placeholder="Search by title" required>
                <input type="submit" value="Search" class="button">
            </form>
            <a href="BlogsURL?service=insertBlog" class="button">Add New Blog</a>
            <table>
                <tr>
                    <th>Blog ID</th>
                    <th>Customer ID</th>
                    <th>Post Time</th>
                    <th>Title</th>
                    <th>Content</th>
                    <th>Image</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                <%
                Customers customer = (Customers)  session.getAttribute("dataCustomer");
            int  customerId = customer.getCustomerID();
                    
                    Vector<Blogs> blogs = (Vector<Blogs>) session.getAttribute("dataBlogs");
                    if (blogs != null && customerId != 0) {
                        for (Blogs blog : blogs) {
                %>
                <tr>
                    <td><%=blog.getBlogID()%></td>
                    <td><%=blog.getCustomerID()%></td>
                    <td><%=blog.getPostTime()%></td>
                    <td><%=blog.getTitle()%></td>
                    <td><%=blog.getContent().length() > 50 ? blog.getContent().substring(0, 50) + "..." : blog.getContent()%></td>
                    <td><img src="<%=blog.getImage() != null ? blog.getImage() : ""%>" alt="Blog Image" width="100"></td>
                    <td><%=blog.isStatus() ? "Active" : "Inactive"%></td>
                    <td>
                        <% if (blog.getCustomerID() == customerId) { %>
                        <a href="BlogsURL?service=updateBlog&blogId=<%=blog.getBlogID()%>" class="button">Update</a>
                        <a href="BlogsURL?service=deleteBlog&blogId=<%=blog.getBlogID()%>" class="button" onclick="return confirm('Are you sure?')">Delete</a>
                        <% } %>
                    </td>
                </tr>
                <% } } else if (customerId == 0) { %>
                <p class="error">Please log in to view blogs.</p>
                <% } %>
            </table>
        </div>
    </body>
</html>