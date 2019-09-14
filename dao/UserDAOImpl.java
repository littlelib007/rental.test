package jp.ken.school.dao;

import java.util.List;

import jp.ken.school.entity.User;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class UserDAOImpl implements UserDAO<User> {

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<User> allList(){
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("FROM User");
		List<User> userList=query.list();
		session.close();
		return userList;
	}

	@Override
	@SuppressWarnings("unchecked")
	public User getById(int id){
		Session session = this.sessionFactory.openSession();
		Query query = session.createQuery("FROM User WHERE userId = :id");
		query.setParameter("id",id);
		User usr = (User)query.uniqueResult();
		session.close();
		return usr;
	}

	@Override
	@SuppressWarnings("unchecked")
	public User getByEmail(String email){
		Session session = this.sessionFactory.openSession();
		Query query = session.createQuery("FROM User WHERE email = :email");
		query.setParameter("email",email);
		User usr = (User)query.uniqueResult();
		session.close();
		return usr;
	}

	@Override
	@SuppressWarnings("unchecked")
	public boolean insertUserData(User usr){
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		try{
			session.saveOrUpdate(usr);
			tx.commit();
			return true;
		}catch (HibernateException e){
			tx.rollback();
			return false;
		}finally{
			session.close();
		}
	}

	@Override
	@SuppressWarnings("unchecked")
	public int updateUserData(User usr){
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		try{
			session.saveOrUpdate(usr);
			tx.commit();
			return 1;
		}catch(HibernateException e){
			e.printStackTrace();
			tx.rollback();
			return 0;
		}finally{
			session.close();
		}
	}

	@Override
	public List<User> getByName(String name) {
		Session session = this.sessionFactory.openSession();
		Query query = session.createQuery("FROM User WHERE userName LIKE :userName");
		query.setParameter("userName","%" + name + "%");
		List<User> userList= query.list();
		session.close();
		return userList;
	}




}
