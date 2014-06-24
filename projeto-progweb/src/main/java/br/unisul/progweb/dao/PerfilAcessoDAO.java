package br.unisul.progweb.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;

import br.unisul.progweb.bean.Perfilacesso;
import br.unisul.progweb.persistence.PersistenceManager;

public class PerfilAcessoDAO {

	private EntityManagerFactory emf = PersistenceManager.getInstance().getEntityManagerFactory();

	public PerfilAcessoDAO() {
	}

	public void insert(Perfilacesso perfilacesso) {
		EntityManager em = emf.createEntityManager();
		try {
			EntityTransaction t = em.getTransaction();
			try {
				t.begin();
				em.persist(perfilacesso);
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
			return em.createQuery("from Perfilacesso", Perfilacesso.class).getResultList();
		} finally {
			em.close();
		}
	}
	
	public List getPaginaAcessiveisPerfil(Integer cdperfil) {
		EntityManager em = emf.createEntityManager();
		try {
			String query = "from Perfilacesso where cdperfil = :cdperfil";
			return em.createQuery(query, Perfilacesso.class).setParameter("cdperfil", cdperfil).getResultList();
		} finally {
			em.close();
		}
	}
 	
	public void update(Perfilacesso perfilacesso) {
		EntityManager em = emf.createEntityManager();
		try {
			EntityTransaction t = em.getTransaction();
			try {
				t.begin();
				em.merge(perfilacesso);
				t.commit();
			} finally {
				if (t.isActive())
					t.rollback();
			}
		} finally {
			em.close();
		}
	}
 	
	public void delete(Perfilacesso perfilacesso) {
		EntityManager em = emf.createEntityManager();
		try {
			EntityTransaction t = em.getTransaction();
			try {
				t.begin();
				em.remove(perfilacesso);
				t.commit();
			} finally {
				if (t.isActive())
					t.rollback();
			}
		} finally {
			em.close();
		}
	}
}