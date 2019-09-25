package AT.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "nota")
public class Nota implements Serializable {
    private Long id;
    private Float av1;
    private Float av2;
    private Long aluno_id;
    private Long turma_id;

    public Nota() {
    }

    public Nota(Long id, Float av1, Float av2, Long aluno_id, Long turma_id) {
        this.id = id;
        this.av1 = av1;
        this.av2 = av2;
        this.aluno_id = aluno_id;
        this.turma_id = turma_id;
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
    public Float getAv1() {
        return av1;
    }

    public void setAv1(Float av1) {
        this.av1 = av1;
    }

    @Column(nullable = true)
    public Float getAv2() {
        return av2;
    }

    public void setAv2(Float av2) {
        this.av2 = av2;
    }

    @Column(nullable = true)
    public Long getAluno_id() {
        return aluno_id;
    }

    public void setAluno_id(Long aluno_id) {
        this.aluno_id = aluno_id;
    }

    @Column(nullable = true)
    public Long getTurma_id() {
        return turma_id;
    }

    public void setTurma_id(Long turma_id) {
        this.turma_id = turma_id;
    }
}
