package br.unisul.progweb.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;

import br.unisul.progweb.bean.Event;
import br.unisul.progweb.bean.Perfil;
import br.unisul.progweb.persistence.PersistenceManager;

public class PerfilDAO {

	private EntityManagerFactory emf = PersistenceManager.getInstance()
			.getEntityManagerFactory();

	public PerfilDAO() {

	}

	public void inserir(Perfil perfil) {
		EntityManager em = emf.createEntityManager();
		try {
			EntityTransaction t = em.getTransaction();
			try {
				t.begin();
				em.persist(perfil);
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
			return em.createQuery("from Perfil", Perfil.class).getResultList();
		} finally {
			em.close();
		}
	}
	
	
 	public Perfil getPerfilEspecifico(Integer cdperfil) {
		EntityManager em = emf.createEntityManager();
		try {
			return em.createQuery("from Perfil where cdperfil = " + cdperfil, Perfil.class).getSingleResult();
		} finally {
			em.close();
		}
	}
}
