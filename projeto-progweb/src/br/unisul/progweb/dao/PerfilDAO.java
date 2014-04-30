package br.unisul.progweb.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import br.unisul.progweb.modelo.Perfil;
import br.unisul.progweb.util.HibernateUtil;

public class PerfilDAO {

	private SessionFactory sessionFactory;

	public PerfilDAO() {
		sessionFactory = HibernateUtil.getSessionFactory();
	}
	
	public void addUsuario(Perfil perfilBean) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.save(perfilBean);
		session.getTransaction().commit();
		session.close();
	}

	public List<?> getList() {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		List<?> usuarios = session.createQuery("from tipoUsuario").list();
		session.getTransaction().commit();
		session.close();
		return usuarios;
	}	
}