package AT.repository;

import AT.model.Disciplina;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface DisciplinaRepositorio extends JpaRepository<Disciplina, Long>{
    @Modifying 
    @Query(value="Update disciplina SET nome = :nome, codigo = :codigo, curso_id= :curso_id where id = :id", nativeQuery = true)
    public void alterar(@Param("nome") String nome, @Param("codigo") String codigo,
            @Param("curso_id") Long curso_id, @Param("id") Long id); 
}
