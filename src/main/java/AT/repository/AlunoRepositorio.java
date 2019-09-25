package AT.repository;

import AT.model.Aluno;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface AlunoRepositorio extends JpaRepository<Aluno, Long>{
    @Modifying 
    @Query(value="Update aluno SET usuario_id = :usuario_id, curso_id = :curso_id, datanasc= :datanasc where id = :id", nativeQuery = true)
    public void alterar(@Param("usuario_id") Long usuario_id, @Param("curso_id") Long curso_id,
            @Param("datanasc") String datanasc, @Param("id") Long id); 
}
