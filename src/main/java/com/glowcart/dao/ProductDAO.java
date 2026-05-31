package com.glowcart.dao;

import com.glowcart.model.Product;
import com.glowcart.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;
import java.util.List;

public class ProductDAO {

    // Get all products
    public List<Product> getAllProducts() {

        Session session = HibernateUtil.getSessionFactory().openSession();
    
        List<Product> products =
                session.createQuery("from Product", Product.class).list();
    
        session.close();
    
        return products;
    }

    // Get single product by ID
    public Product getProductById(int id) {

        Session session =
                HibernateUtil.getSessionFactory().openSession();
    
        Product product =
                session.get(Product.class, id);
    
        session.close();
    
        return product;
    }

    // Add new product (Admin)
    public void saveProduct(Product product) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.save(product);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
    }

    // Delete product (Admin)
    public void deleteProduct(int id) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            Product product = session.get(Product.class, id);
            if (product != null) {
                session.delete(product);
                System.out.println("Product deleted successfully!");
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
    }
}