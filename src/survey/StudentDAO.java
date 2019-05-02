//Author: Rashika Koul
//SWE 642 : Homework 4
//StudentDAO class that encapsulates code to store and retrieve the Survey data
//into/from a database. It provides two methods: one to save the Student Survey Form data
//to a database table and another to retrieve the survey information from the database.
package survey;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class StudentDAO {

	public boolean save(StudentBean sb) throws SQLException {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			session.saveOrUpdate(sb);
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			System.err.println("Failed to insert into table 'Student'.");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return true;
	}

	public StudentBean getByID(String studentID) {
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		StudentBean student = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from StudentBean where studentId = :studentId");
			query.setParameter("studentId", studentID);
			student = (StudentBean) query.uniqueResult();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			System.err.println("Failed to retrieve from table 'Student'.");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return student;
	}

	public List<String> getIDList() {
		List<String> list = new ArrayList<String>();
        Session session = HibernateUtil.openSession();
        Transaction tx = null;       
        try {
            tx = session.getTransaction();
            tx.begin();
            list = session.createQuery("Select studentID from StudentBean").list();                       
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            System.err.println("Failed to retrieve list of students.");
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
	}
}
