package com.glowcart.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.glowcart.model.Cart;
import com.glowcart.util.HibernateUtil;

import java.util.List;

public class CartDAO {

    // Add item to cart
    public void addToCart(Cart cartItem) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.save(cartItem);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
    }

    // Get all cart items for a specific user
    public List<Cart> getCartByUserId(int userId) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("FROM Cart WHERE userId = :userId", Cart.class)
                    .setParameter("userId", userId)
                    .list();
        }
    }

    // Delete a single item from cart
    public void deleteCartItem(int cartId) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            Cart cartItem = session.get(Cart.class, cartId);
            if (cartItem != null) {
                session.delete(cartItem);
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
    }

    // Clear cart after checkout
    public void clearCart(int userId) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.createQuery("DELETE FROM Cart WHERE userId = :userId")
                   .setParameter("userId", userId)
                   .executeUpdate();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
    }
}