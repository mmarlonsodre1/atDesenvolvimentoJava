package AT.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "turma")
public class Turma implements Serializable {
    private Long id;
    private String codigo;
    private String sala;
    private Long disciplina_id;
    private Long professor_id;

    public Turma() {
    }

    public Turma(Long id, String codigo, String sala, Long disciplina_id, Long professor_id) {
        this.id = id;
        this.codigo = codigo;
        this.sala = sala;
        this.disciplina_id = disciplina_id;
        this.professor_id = professor_id;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Column(nullable = true)
    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    @Column(nullable = true)
    public String getSala() {
        return sala;
    }

    public void setSala(String sala) {
        this.sala = sala;
    }

    @Column(nullable = true)
    public Long getDisciplina_id() {
        return disciplina_id;
    }

    public void setDisciplina_id(Long disciplina_id) {
        this.disciplina_id = disciplina_id;
    }

    @Column(nullable = true)
    public Long getProfessor_id() {
        return professor_id;
    }

    public void setProfessor_id(Long professor_id) {
        this.professor_id = professor_id;
    }
}
