package br.unisul.progweb.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;

import org.hibernate.Hibernate;

import br.unisul.progweb.bean.Usuario;
import br.unisul.progweb.persistence.PersistenceManager;

public class UsuarioDAO {

	private EntityManagerFactory emf = PersistenceManager.getInstance()
			.getEntityManagerFactory();

	public UsuarioDAO() {
	}

	public void insert(Usuario usuario) {
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

	public List getList() {
		EntityManager em = emf.createEntityManager();
		try {
			return em
					.createQuery(
							"SELECT u FROM Usuario u JOIN FETCH u.perfil p WHERE u.perfil.cdperfil = p.cdperfil ORDER BY u.nmusuario",
							Usuario.class).getResultList();
		} finally {
			em.close();
		}
	}

	public Usuario getSingleUsuarioByLogin(String login) {
		EntityManager em = emf.createEntityManager();
		try {

			String query = "FROM Usuario u "
						 + " JOIN FETCH u.perfil "
						 + " JOIN FETCH u.cursoalunos"
						 + " WHERE UPPER(delogin) = :login";
			Usuario resultado = null;
			try {
				resultado = em.createQuery(query, Usuario.class)
					.setParameter("login", login.toUpperCase())
					.getSingleResult();
			} catch (Exception e) {

			}
			return resultado;
		} finally {
			em.close();
		}
	}

	public Usuario getSingleUsuarioById(Integer cdusuario) {
		EntityManager em = emf.createEntityManager();
		try {
			String query = "from Usuario where cdusuario = :cdusuario";
			Usuario resultado = null;
			try {
				resultado = em.createQuery(query, Usuario.class)
						.setParameter("cdusuario", cdusuario).getSingleResult();
			} catch (Exception e) {

			}
			return resultado;
		} finally {
			em.close();
		}
	}

	public void update(Usuario usuario) {
		EntityManager em = emf.createEntityManager();
		try {
			EntityTransaction t = em.getTransaction();
			try {
				t.begin();
				em.merge(usuario);
				t.commit();
			} finally {
				if (t.isActive())
					t.rollback();
			}
		} finally {
			em.close();
		}
	}

	public void delete(Usuario usuario) {
		EntityManager em = emf.createEntityManager();
		try {
			EntityTransaction t = em.getTransaction();
			try {
				t.begin();
				em.remove(em.getReference(Usuario.class, usuario.getCdusuario()));
				t.commit();
			} finally {
				if (t.isActive())
					t.rollback();
			}
		} finally {
			em.close();
		}
	}

	public void alter(Usuario usuario) {
		EntityManager em = emf.createEntityManager();
		try {
			EntityTransaction t = em.getTransaction();
			try {
				t.begin();
				em.merge(em.getReference(Usuario.class, usuario.getCdusuario()));
				t.commit();
			} finally {
				if (t.isActive())
					t.rollback();
			}
		} finally {
			em.close();
		}
	}

	public List getProfessores() {
		EntityManager em = emf.createEntityManager();
		try {
			return em
					.createQuery(
							"SELECT u FROM Usuario u "
									+ " JOIN FETCH u.perfil p WHERE u.perfil.cdperfil = 3 "
									+ " ORDER BY u.nmusuario ", Usuario.class)
					.getResultList();
		} finally {
			em.close();
		}
	}
}