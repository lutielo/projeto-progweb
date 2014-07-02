package br.unisul.progweb.bean;


import javax.persistence.Column;
import javax.persistence.Embeddable;


@Embeddable
public class CursoarquivoId implements java.io.Serializable {

	private Short cdcurso;
	private String depatharquivo;

	public CursoarquivoId() {
	}

	public CursoarquivoId(String depatharquivo) {
		this.depatharquivo = depatharquivo;
	}

	public CursoarquivoId(Short cdcurso, String depatharquivo) {
		this.cdcurso = cdcurso;
		this.depatharquivo = depatharquivo;
	}

	@Column(name = "cdcurso")
	public Short getCdcurso() {
		return this.cdcurso;
	}

	public void setCdcurso(Short cdcurso) {
		this.cdcurso = cdcurso;
	}

	@Column(name = "depatharquivo", nullable = false)
	public String getDepatharquivo() {
		return this.depatharquivo;
	}

	public void setDepatharquivo(String depatharquivo) {
		this.depatharquivo = depatharquivo;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof CursoarquivoId))
			return false;
		CursoarquivoId castOther = (CursoarquivoId) other;

		return ((this.getCdcurso() == castOther.getCdcurso()) || (this
				.getCdcurso() != null && castOther.getCdcurso() != null && this
				.getCdcurso().equals(castOther.getCdcurso())))
				&& ((this.getDepatharquivo() == castOther.getDepatharquivo()) || (this
						.getDepatharquivo() != null
						&& castOther.getDepatharquivo() != null && this
						.getDepatharquivo()
						.equals(castOther.getDepatharquivo())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getCdcurso() == null ? 0 : this.getCdcurso().hashCode());
		result = 37
				* result
				+ (getDepatharquivo() == null ? 0 : this.getDepatharquivo()
						.hashCode());
		return result;
	}

}
