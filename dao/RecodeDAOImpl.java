package jp.ken.school.dao;

import java.util.List;

import jp.ken.school.entity.Recode;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
public class RecodeDAOImpl implements RecodeDAO <Recode> {
	private SessionFactory sessionFactory ;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<Recode> allList(){
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("FROM Recode");
		List<Recode> recodeList=query.list();
		session.close();
		return recodeList;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Recode> userRecodeList(int id) {
		Session session = this.sessionFactory.openSession();
		Query query = session.createQuery("FROM Recode WHERE userId = ?");
		query.setParameter(0, id);
		List<Recode> userRecodeList = query.list();
		session.close();
		return  userRecodeList;
	}


	@Override
	public Recode getById(int id) {
		Session session = this.sessionFactory.openSession();
		Query query = session.createQuery("FROM Recode WHERE id = ?");
		query.setParameter(0, id);
		Recode emp = (Recode)query.uniqueResult();
		session.close();
		return emp;
	}

	@Override
	public boolean insertRecodeData(Recode recode) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.saveOrUpdate(recode);
			tx.commit();
			return true;
		} catch (HibernateException e) {
			tx.rollback();
			return false;
		} finally {
			session.close();
		}
	}

	@Override
	public int updateRecodeData(Recode recode) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.saveOrUpdate(recode);
			tx.commit();
			return 1;
		} catch (HibernateException e) {
			e.printStackTrace();
			tx.rollback();
			return 0;
		} finally {
			session.close();
		}
	}

	@Override
	public int deleteRecodeData(int id) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		try {
			Query query = session.createQuery("FROM Recode WHERE id = ?");
			query.setParameter(0, id);
			Recode emp = (Recode)query.uniqueResult();
			session.delete(emp);
			tx.commit();
			return 1;
		} catch (HibernateException e) {
			e.printStackTrace();
			tx.rollback();
			return 0;
		} finally {
			session.close();
		}
	}



}
