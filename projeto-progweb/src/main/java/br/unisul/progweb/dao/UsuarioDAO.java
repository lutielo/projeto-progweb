package br.unisul.progweb.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import br.unisul.progweb.bean.Usuario;
import br.unisul.progweb.persistence.PersistenceManager;

public class UsuarioDAO {

	private EntityManagerFactory emf = PersistenceManager.getInstance()
			.getEntityManagerFactory();

	public UsuarioDAO() {

	}

	public void inserir(Usuario usuario) {
		EntityManager em = emf.createEntityManager();
		try {
			EntityTransaction t = em.getTransaction();
			try {
				t.begin();
				em.persist(usuario);
				t.commit();
			} finally {
				if (t.isActive())
					t.rollback();
			}
		} finally {
			em.close();
		}
	}

	public Usuario getUsuario(String login) {
		EntityManager em = emf.createEntityManager();
		try {
			String query = "from Usuario where delogin = :login";
			return em.createQuery(query, Usuario.class).setParameter("login", login).getSingleResult();
		} finally {
			em.close();
		}
	}

	public List getList() {
		EntityManager em = emf.createEntityManager();
		try {
			return em.createQuery("from Usuario", Usuario.class)
					.getResultList();
		} finally {
			em.close();
		}
	}
}
