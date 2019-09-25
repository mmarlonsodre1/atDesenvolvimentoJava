/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AT.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "usuario")
public class Usuario implements Serializable {
    private Long id;
    private Long perfil_id;
    private int matricula;
    private String senha;
    private String nome;
    private String email;

    public Usuario() {
    }

    public Usuario(Long id, Long perfil_id, int matricula, String senha, String nome, String email) {
        this.id = id;
        this.perfil_id = perfil_id;
        this.matricula = matricula;
        this.senha = senha;
        this.nome = nome;
        this.email = email;
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
    public Long getPerfil_id() {
        return perfil_id;
    }

    public void setPerfil_id(Long perfil_id) {
        this.perfil_id = perfil_id;
    }

    @Column(nullable = true)
    public int getMatricula() {
        return matricula;
    }

    public void setMatricula(int matricula) {
        this.matricula = matricula;
    }

    @Column(nullable = true)
    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    @Column(nullable = true)
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    @Column(nullable = true)
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }  
}
