package br.unisul.progweb.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;

import br.unisul.progweb.bean.Cursoaluno;
import br.unisul.progweb.bean.Usuario;
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
			String query = "SELECT u "
					+ " FROM Usuario u "
					+ " JOIN FETCH u.cursoalunos as ca"
					+ "	JOIN FETCH u.perfil "
					+ "	WHERE ca.curso.cdcurso = :cdcurso";

			return em.createQuery(query, Usuario.class)
					.setParameter("cdcurso", cdcurso).getResultList();
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