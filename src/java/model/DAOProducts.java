/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.Blogs;
import entity.Brand;
import entity.Products;
import entity.Role;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author quang
 */
public class DAOProducts extends DBConnection {

    public int addProduct(Products product) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Products]\n"
                + "           ([ProductName]\n"
                + "           ,[Price]\n"
                + "           ,[Description]\n"
                + "           ,[UnitPrice]\n"
                + "           ,[CategoryID]\n"
                + "           ,[BrandID]\n"
                + "           ,[isPrescriptionDrug]\n"
                + "           ,[Quantity]\n"
                + "           ,[Image]\n"
                + "           ,[isAvailable])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?,?,?)";

        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, product.getProductName());
            pre.setFloat(2, product.getPrice());
            pre.setString(3, product.getDescription());
            pre.setString(4, product.getUnitPrice());
            pre.setInt(5, product.getCategoryID());
            pre.setInt(6, product.getBrandID());
            pre.setInt(7, (product.isIsPrescriptionDrug() == true ? 1 : 0));
            pre.setInt(8, product.getQuantity());
            pre.setString(9, product.getImage());
            pre.setInt(10, (product.isIsAvailable() == true ? 1 : 0));
            n = pre.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(DAOProducts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int deleteProduct(int pid) {
        int n = 0;
//        cach xu ly khi khong xoa duoc do khoa ngoai
//                case1: Xoa tai foreignt key truoc roi moi xoa o primarykey;
//                case2: select foreign key --> IsExist ---> disable primary key
        String sqlCheck = "Select * from [OrderDetails] where ProductID =" + pid;
        ResultSet rs = getData(sqlCheck);
        try {
            if (rs.next()) {//co khoa ngoai--> khong xoa, Doi Status (discontined)
                changeDiscontinued(pid, 0);
                return 0;
            }
            String sql = "delete from Products where ProductID =" + pid;

            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOProducts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public void changeDiscontinued(int pid, int newValue) {
        String sql = "  update Products set isAvailable = " + newValue + " where ProductID = " + pid;
        try {
            Statement state = conn.createStatement();
            state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOProducts.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int updateProduct(Products product) {
        int n = 0;
        String sql = "UPDATE [dbo].[Products]\n"
                + "   SET [ProductName] = ?\n"
                + "      ,[Price] = ?\n"
                + "      ,[Description] = ?\n"
                + "      ,[UnitPrice] = ?\n"
                + "      ,[CategoryID] = ?\n"
                + "      ,[BrandID] = ?\n"
                + "      ,[isPrescriptionDrug] = ?\n"
                + "      ,[Quantity] = ?\n"
                + "      ,[Image] = ?\n"
                + "      ,[isAvailable] = ?\n"
                + " WHERE ProductID = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, product.getProductName());
            pre.setFloat(2, product.getPrice());
            pre.setString(3, product.getDescription());
            pre.setString(4, product.getUnitPrice());
            pre.setInt(5, product.getCategoryID());
            pre.setInt(6, product.getBrandID());
            pre.setInt(7, (product.isIsPrescriptionDrug() == true ? 1 : 0));
            pre.setInt(8, product.getQuantity());
            pre.setString(9, product.getImage());
            pre.setInt(10, (product.isIsAvailable() == true ? 1 : 0));
            pre.setInt(11, product.getProductID());
            n = pre.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(DAOProducts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Vector<Products> getProducts(String sql) {
        Vector<Products> vector = new Vector<Products>();
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int ProductID = rs.getInt("ProductID");
                String ProductName = rs.getString("ProductName");
                float Price = rs.getFloat("Price");
                String Description = rs.getString("Description");
                String UnitPrice = rs.getString("UnitPrice");
                int CategoryID = rs.getInt("CategoryID");
                int BrandID = rs.getInt("BrandID");
                boolean isPrescriptionDrug = (rs.getInt("isPrescriptionDrug") == 1 ? true : false);
                int Quantity = rs.getInt("Quantity");
                String Image = rs.getString("Image");
                boolean isAvailable = (rs.getInt("isAvailable") == 1 ? true : false);
                Products pro = new Products(ProductID, ProductName, Price, Description, UnitPrice, CategoryID, BrandID, isPrescriptionDrug, Quantity, Image, isAvailable);
                vector.add(pro);

            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProducts.class.getName()).log(Level.SEVERE, null, ex);
        }

        return vector;
    }

    public Products getProductByID(int productID) {
        Products product = null;
        String sql = "SELECT * FROM dbo.Products WHERE ProductID = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, productID);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                product = new Products(
                        rs.getInt("ProductID"),
                        rs.getString("ProductName"),
                        rs.getFloat("Price"),
                        rs.getString("Description"),
                        rs.getString("UnitPrice"),
                        rs.getInt("CategoryID"),
                        rs.getInt("BrandID"),
                        rs.getBoolean("IsPrescriptionDrug"),
                        rs.getInt("Quantity"),
                        rs.getString("Image"),
                        rs.getBoolean("IsPrescriptionDrug")
                );
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProducts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return product;
    }

    public List<Products> getProductByCategory(String cid) {
        List<Products> list = new ArrayList<>();
        String sql = "select * from Products\n"
                + "where CategoryID=? ";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, cid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Products(rs.getInt(1), rs.getString(2), rs.getFloat(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getBoolean(8), rs.getInt(9), rs.getString(10), rs.getBoolean(11)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProducts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int countProducts() {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM dbo.Products";
        try {
            Statement state = conn.createStatement();
            ResultSet rs = state.executeQuery(sql);
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProducts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public String getProductImg(int id) {
        String img = null;
        String sql = "SELECT * FROM dbo.Products WHERE ProductID = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {

                img = rs.getString("Image");
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProducts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return img;
    }

    public Vector<Products> searchProduct(String keyword) {
        Vector<Products> vector = new Vector<>();
        try {
            String sql = "SELECT p.* FROM dbo.Products p "
                    + "JOIN dbo.Categories c ON p.CategoryID = c.CategoryID "
                    + "JOIN dbo.Brand b ON p.BrandID = b.BrandID "
                    + "WHERE p.ProductName LIKE ? OR c.CategoryName LIKE ? OR b.BrandName LIKE ?";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, "%" + keyword + "%");
            ps.setString(3, "%" + keyword + "%");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int ProductID = rs.getInt("ProductID");
                String ProductName = rs.getString("ProductName");
                float Price = rs.getFloat("Price");
                String Description = rs.getString("Description");
                String UnitPrice = rs.getString("UnitPrice");
                int CategoryID = rs.getInt("CategoryID");
                int BrandID = rs.getInt("BrandID");
                boolean isPrescriptionDrug = rs.getInt("isPrescriptionDrug") == 1;
                int Quantity = rs.getInt("Quantity");
                String Image = rs.getString("Image");
                boolean isAvailable = rs.getInt("isAvailable") == 1;

                Products pro = new Products(ProductID, ProductName, Price, Description, UnitPrice, CategoryID, BrandID, isPrescriptionDrug, Quantity, Image, isAvailable);
                vector.add(pro);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProducts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public Vector<Products> getProductsByPage(int page, int pageSize) {
        Vector<Products> vector = new Vector<>();
        String sql = "SELECT * FROM dbo.Products ORDER BY ProductID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, (page - 1) * pageSize);
            ps.setInt(2, pageSize);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Products pro = new Products(
                        rs.getInt("ProductID"),
                        rs.getString("ProductName"),
                        rs.getFloat("Price"),
                        rs.getString("Description"),
                        rs.getString("UnitPrice"),
                        rs.getInt("CategoryID"),
                        rs.getInt("BrandID"),
                        rs.getBoolean("isPrescriptionDrug"),
                        rs.getInt("Quantity"),
                        rs.getString("Image"),
                        rs.getBoolean("isAvailable")
                );
                vector.add(pro);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProducts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public int getTotalProducts() {
        String sql = "SELECT COUNT(*) FROM dbo.Products";
        try (Statement st = conn.createStatement(); ResultSet rs = st.executeQuery(sql)) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProducts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int getTotalSearchProducts(String keyword) {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM dbo.Products p "
                + "JOIN dbo.Categories c ON p.CategoryID = c.CategoryID "
                + "JOIN dbo.Brand b ON p.BrandID = b.BrandID "
                + "WHERE p.ProductName LIKE ? OR c.CategoryName LIKE ? OR b.BrandName LIKE ?";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, "%" + keyword + "%");
            ps.setString(3, "%" + keyword + "%");

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProducts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public Vector<Products> searchProductByPage(String keyword, int page, int productsPerPage) {
        Vector<Products> vector = new Vector<>();
        String sql = "SELECT p.* FROM dbo.Products p "
                + "JOIN dbo.Categories c ON p.CategoryID = c.CategoryID "
                + "JOIN dbo.Brand b ON p.BrandID = b.BrandID "
                + "WHERE p.ProductName LIKE ? OR c.CategoryName LIKE ? OR b.BrandName LIKE ? "
                + "ORDER BY p.ProductID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, "%" + keyword + "%");
            ps.setString(3, "%" + keyword + "%");
            ps.setInt(4, (page - 1) * productsPerPage);
            ps.setInt(5, productsPerPage);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Products pro = new Products(
                        rs.getInt("ProductID"),
                        rs.getString("ProductName"),
                        rs.getFloat("Price"),
                        rs.getString("Description"),
                        rs.getString("UnitPrice"),
                        rs.getInt("CategoryID"),
                        rs.getInt("BrandID"),
                        rs.getBoolean("isPrescriptionDrug"),
                        rs.getInt("Quantity"),
                        rs.getString("Image"),
                        rs.getBoolean("isAvailable")
                );
                vector.add(pro);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProducts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public List<Products> getProductsByName(String txtSearch) {
        List<Products> list = new ArrayList<>();
        String query = "select * from Products where ProductName like ?";
        try {
            PreparedStatement preState = conn.prepareStatement(query);
            preState.setString(1, "%" + txtSearch + "%");
            ResultSet rs = preState.executeQuery();
            while (rs.next()) {
                list.add(new Products(rs.getInt(1), rs.getString(2), rs.getFloat(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getBoolean(8), rs.getInt(9), rs.getString(10), rs.getBoolean(11)));
            }

        } catch (SQLException e) {
            Logger.getLogger(DAOBlogs.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public static void main(String[] args) {
        DAOProducts dao = new DAOProducts();

        Vector<Products> vector = dao.getProducts("select * from Products");
        for (Products products : vector) {
            System.out.println(products);
        }
        int n = dao.addProduct(new Products("product1", 10000, "ok", "Hop", 5, 3, true, 5, "abc.img", true));
        System.out.println(n);
    }

}
