package AT.repository;

import AT.model.Nota;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface NotaRepositorio extends JpaRepository<Nota, Long>{
    @Modifying 
    @Query(value="Update nota SET av1 = :av1, av2 = :av2, aluno_id= :aluno_id, turma_id= :turma_id where id = :id", nativeQuery = true)
    public void alterar(@Param("av1") Float nome, @Param("av2") Float av2,
            @Param("aluno_id") Long aluno_id, @Param("turma_id") Long turma_id, @Param("id") Long id); 
}
