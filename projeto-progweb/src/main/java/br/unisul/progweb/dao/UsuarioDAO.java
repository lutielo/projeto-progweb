package br.unisul.progweb.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;

import br.unisul.progweb.bean.Curso;
import br.unisul.progweb.bean.Event;
import br.unisul.progweb.bean.Usuario;
import br.unisul.progweb.persistence.PersistenceManager;

public class UsuarioDAO {
	
	private EntityManagerFactory emf = PersistenceManager.getInstance().getEntityManagerFactory();
	
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

	public List getList() {
		EntityManager em = emf.createEntityManager();
		try {
			return em.createQuery("from Usuario", Usuario.class).getResultList();
		} finally {
			em.close();
		}
	}
}
