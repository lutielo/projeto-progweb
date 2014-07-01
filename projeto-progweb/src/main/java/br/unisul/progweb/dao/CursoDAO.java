package br.unisul.progweb.dao;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import br.unisul.progweb.bean.Curso;
import br.unisul.progweb.persistence.PersistenceManager;

public class CursoDAO {

	private EntityManagerFactory emf = PersistenceManager.getInstance()
			.getEntityManagerFactory();

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
			return em.createQuery(query, Curso.class)
					.setParameter("cdcurso", cdcurso).getSingleResult();
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
				em.remove(em.getReference(Curso.class, curso.getCdcurso()));
				t.commit();
			} finally {
				if (t.isActive())
					t.rollback();
			}
		} finally {
			em.close();
		}
	}

	public List getListCursoDisponiveis(Date dtinicio) {
		EntityManager em = emf.createEntityManager();
		try {
			String sql = "from Curso where dtinicio > :dtinicio";
			return em.createQuery(sql, Curso.class)
					.setParameter("dtinicio", dtinicio).getResultList();
		} finally {
			em.close();
		}
	}

	public List getListCursoEmAndamento(Date dtinicio, Date dtfim) {
		EntityManager em = emf.createEntityManager();
		try {
			String sql = "from Curso where dtinicio <= :dtinicio and dtfim >= :dtfim";
			return em.createQuery(sql, Curso.class)
					.setParameter("dtinicio", dtinicio)
					.setParameter("dtfim", dtfim).getResultList();
		} finally {
			em.close();
		}
	}

	public List getListCursoEmAndamentoPorProfessor(Date dtinicio, Date dtfim,
			Integer cdusuarioprof) {
		EntityManager em = emf.createEntityManager();
		try {
			String sql = "from Curso where dtinicio <= :dtinicio and dtfim >= :dtfim and cdusuarioprof = :cdusuarioprof";
			return em.createQuery(sql, Curso.class)
					.setParameter("dtinicio", dtinicio)
					.setParameter("dtfim", dtfim)
					.setParameter("cdusuarioprof", cdusuarioprof)
					.getResultList();
		} finally {
			em.close();
		}
	}

	/*
	 * "SELECT u FROM Usuario u JOIN FETCH u.perfil p WHERE u.perfil.cdperfil = p.cdperfil ORDER BY u.nmusuario"
	 * , Usuario.class).getResultList();
	 */
	public List getListCursoEmAndamentoPorAluno(Date dtinicio, Date dtfim,
			Short cdusuario) {
		EntityManager em = emf.createEntityManager();
		try {
			String sql = "SELECT c from Curso c JOIN FETCH c.cursoalunos ca where c.dtinicio <= :dtinicio and c.dtfim >= :dtfim and ca.id.cdusuario = :cdusuario";
			return em.createQuery(sql, Curso.class)
					.setParameter("dtinicio", dtinicio)
					.setParameter("dtfim", dtfim)
					.setParameter("cdusuario", cdusuario).getResultList();
		} finally {
			em.close();
		}
	}

	public List getListPesquisaCurso(String decurso) {
		EntityManager em = emf.createEntityManager();
		try {
			String sql = "from Curso where upper(decurso) like :decurso";
			return em.createQuery(sql, Curso.class)
					.setParameter("decurso", "%" + decurso.toUpperCase() + "%")
					.getResultList();
		} finally {
			em.close();
		}
	}

	public List getListPesquisaCursoAvancada(String decurso, Date dtinicio,
			Date dtfim, Integer cdusuarioprof) {
		EntityManager em = emf.createEntityManager();
		try {
			String sql = "from Curso";
			String condicoes = " where ";
			String sqlfinal;

			if (decurso != null) {
				condicoes = condicoes + " upper(decurso) like :decurso ";
			}

			if (condicoes.equals(" where ") && (dtinicio != null)
					&& (dtfim != null)) {
				condicoes = condicoes
						+ " dtinicio between :dtinicio and :dtfim ";
			} else if ((dtinicio != null) && (dtfim != null)) {
				condicoes = condicoes
						+ "and dtinicio between :dtinicio and :dtfim ";
			}

			if (cdusuarioprof != null && condicoes.equals(" where ")) {
				condicoes = condicoes + " cdusuarioprof = :cdusuarioprof ";
			} else if (cdusuarioprof != null) {
				condicoes = condicoes + " and cdusuarioprof = :cdusuarioprof ";
			}
			System.out.println(sql + condicoes);
			
			if(condicoes.equals(" where ")){
				sqlfinal = sql;
			}else{	
				sqlfinal = sql + condicoes;
			}
			TypedQuery<Curso> query = em.createQuery(sqlfinal,
					Curso.class);

			if (decurso != null) {
				query.setParameter("decurso", "%" + decurso.toUpperCase() + "%");
			}
			if ((dtinicio != null) && (dtfim != null)) {
				query.setParameter("dtinicio", dtinicio);
				query.setParameter("dtfim", dtfim);
			}
			
			if (cdusuarioprof != null){
				query.setParameter("cdusuarioprof", cdusuarioprof);
			}
			

			return query.getResultList();
		} finally {
			em.close();
		}
	}
}
