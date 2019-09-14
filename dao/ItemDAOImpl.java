package jp.ken.school.dao;

import java.util.List;

import jp.ken.school.entity.Item;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class ItemDAOImpl implements ItemDAO<Item> {
	private SessionFactory sessionFactory ;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Item> allList() {
		Session session = this.sessionFactory.openSession();
		Query query = session.createQuery("FROM Item");
		List<Item> allList = query.list();
		session.close();
		return  allList;
	}

	@Override
	public boolean DeleteOrUpdateUser(Item item) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		try{
			session.saveOrUpdate(item);
			System.out.println(item);
			tx.commit();
			return true;
		}catch(HibernateException e){
			tx.rollback();
			return false;
		}finally{
			session.close();
		}
	}

	@Override
	public boolean InsertItem(Item item) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		try{
			session.saveOrUpdate(item);
			tx.commit();
			return true;
		}catch(HibernateException e){
			tx.rollback();
			return false;
		}finally{
			session.close();
		}
	}

	@Override
	public int updateItem(Item item) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		try{
			session.saveOrUpdate(item);
			System.out.println("a");
			tx.commit();
			return 1;
		}catch(HibernateException e){
			tx.rollback();
			return 0;
		}finally{
			session.close();
		}
	}

	@Override
	public boolean deleteItem(int id){
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		try{
			Query query = session.createQuery("FROM Item WHERE itemCode = ?");
			query.setParameter(0,id);
			Item item = (Item)query.uniqueResult();
			session.delete(item);
			tx.commit();
			return true;
		}catch(HibernateException e){
			e.printStackTrace();tx.rollback();
			return false;
		}	finally{
			session.close();
	}
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<Item> getByName(String name){
		Session session = this.sessionFactory.openSession();
		Query query = session.createQuery("FROM Item WHERE itemName LIKE ?");
		query.setParameter(0, "%" + name + "%");
		List <Item> list = query.list();
		session.close();
		return list;
	}

	@Override
	public Item getById(int id){
		Session session = this.sessionFactory.openSession();
		Query query = session.createQuery("FROM Item WHERE itemCode = ?");
		query.setParameter(0, id);
		Item item = (Item)query.uniqueResult();
		session.close();
		return item;
	}
}
