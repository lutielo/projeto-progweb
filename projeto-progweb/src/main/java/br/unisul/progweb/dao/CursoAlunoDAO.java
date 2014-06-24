package br.unisul.progweb.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;

import br.unisul.progweb.bean.Curso;
import br.unisul.progweb.bean.Cursoaluno;
import br.unisul.progweb.bean.Perfilacesso;
import br.unisul.progweb.persistence.PersistenceManager;

public class CursoAlunoDAO {
	
	private EntityManagerFactory emf = PersistenceManager.getInstance().getEntityManagerFactory();

	public CursoAlunoDAO() {
	}

	public void insert(Cursoaluno cursoaluno) {
		EntityManager em = emf.createEntityManager();
		try {
			EntityTransaction t = em.getTransaction();
			try {
				t.begin();
				em.persist(cursoaluno);
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
			return em.createQuery("from Cursoaluno", Cursoaluno.class).getResultList();
		} finally {
			em.close();
		}
	}
	
	public List getAlunosDoCurso(Integer cdcurso) {
		EntityManager em = emf.createEntityManager();
		try {
			String query = "from Cursoaluno where cdcurso = :cdcurso";
			return em.createQuery(query, Cursoaluno.class).setParameter("cdcurso", cdcurso).getResultList();
		} finally {
			em.close();
		}
	}
 	
	public void update(Cursoaluno cursoaluno) {
		EntityManager em = emf.createEntityManager();
		try {
			EntityTransaction t = em.getTransaction();
			try {
				t.begin();
				em.merge(cursoaluno);
				t.commit();
			} finally {
				if (t.isActive())
					t.rollback();
			}
		} finally {
			em.close();
		}
	}
 	
	public void delete(Cursoaluno cursoaluno) {
		EntityManager em = emf.createEntityManager();
		try {
			EntityTransaction t = em.getTransaction();
			try {
				t.begin();
				em.remove(cursoaluno);
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