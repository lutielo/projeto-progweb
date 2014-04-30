package br.unisul.progweb.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import br.unisul.progweb.modelo.UsuarioBean;
import br.unisul.progweb.util.HibernateUtil;

public class UsuarioDAO {

	private SessionFactory sessionFactory;

	public UsuarioDAO() {
		sessionFactory = HibernateUtil.getSessionFactory();
	}
	
	public void addUsuario(UsuarioBean usuarioBean) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.save(usuarioBean);
		session.getTransaction().commit();
		session.close();
	}

	public List<UsuarioBean> getList() {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		List<UsuarioBean> usuarios = session.createQuery("from usuario").list();
		session.getTransaction().commit();
		session.close();
		return usuarios;
	}	
}