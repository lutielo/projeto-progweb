package br.unisul.progweb.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;

import br.unisul.progweb.bean.Cursoarquivo;
import br.unisul.progweb.persistence.PersistenceManager;

public class CursoArquivoDAO {
	
	private EntityManagerFactory emf = PersistenceManager.getInstance().getEntityManagerFactory();

	public CursoArquivoDAO() {
	}

	public void insert(Cursoarquivo cursoarquivo) {
		EntityManager em = emf.createEntityManager();
		try {
			EntityTransaction t = em.getTransaction();
			try {
				t.begin();
				em.persist(cursoarquivo);
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
			return em.createQuery("from Cursoarquivo", Cursoarquivo.class).getResultList();
		} finally {
			em.close();
		}
	}
	
	public List getArquivosDoCurso(Integer cdcurso) {
		EntityManager em = emf.createEntityManager();
		try {
			//TODO TESTAR ESTE ORDER BY
			String query = "from Cursoarquivo where cdcurso = :cdcurso";
					   //+ "ORDER BY depatharquivo";
			return em.createQuery(query, Cursoarquivo.class).setParameter("cdcurso", cdcurso).getResultList();
		} finally {
			em.close();
		}
	}
 	
	public void update(Cursoarquivo cursoarquivo) {
		EntityManager em = emf.createEntityManager();
		try {
			EntityTransaction t = em.getTransaction();
			try {
				t.begin();
				em.merge(cursoarquivo);
				t.commit();
			} finally {
				if (t.isActive())
					t.rollback();
			}
		} finally {
			em.close();
		}
	}
 	
	public void delete(Cursoarquivo cursoarquivo) {
		EntityManager em = emf.createEntityManager();
		try {
			EntityTransaction t = em.getTransaction();
			try {
				t.begin();
				em.remove(cursoarquivo);
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