package br.unisul.progweb.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;

import br.unisul.progweb.bean.Curso;
import br.unisul.progweb.persistence.PersistenceManager;

public class CursoDAO {
	
	private EntityManagerFactory emf = PersistenceManager.getInstance().getEntityManagerFactory();
	
	public CursoDAO() {
	}

	public void insert(Curso curso) {
		EntityManager em = emf.createEntityManager();
		try {
			EntityTransaction t = em.getTransaction();
			try {
				t.begin();
				em.persist(curso);
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
			return em.createQuery("from Curso", Curso.class).getResultList();
		} finally {
			em.close();
		}
	}
	
 	public Curso getSingleCurso(Integer cdcurso) {
		EntityManager em = emf.createEntityManager();
		try {
			String query = "from Curso where cdcurso = :cdcurso";
			return em.createQuery(query, Curso.class).setParameter("cdcurso", cdcurso).getSingleResult();
		} finally {
			em.close();
		}
	}
	
	public void update(Curso curso) {
		EntityManager em = emf.createEntityManager();
		try {
			EntityTransaction t = em.getTransaction();
			try {
				t.begin();
				em.merge(curso);
				t.commit();
			} finally {
				if (t.isActive())
					t.rollback();
			}
		} finally {
			em.close();
		}
	}
 	
	public void delete(Curso curso) {
		EntityManager em = emf.createEntityManager();
		try {
			EntityTransaction t = em.getTransaction();
			try {
				t.begin();
				em.remove(curso);
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
