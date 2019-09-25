package AT.repository;

import AT.model.Turma;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface TurmaRepositorio extends JpaRepository<Turma, Long>{
    @Modifying 
    @Query(value="Update turma SET codigo = :codigo, sala = :sala, disciplina_id= :disciplina_id, professor_id= :professor_id where id = :id", nativeQuery = true)
    public void alterar(@Param("codigo") String codigo, @Param("sala") String sala, 
            @Param("disciplina_id") Long disciplina_id, @Param("professor_id") Long professor_id, @Param("id") Long id); 
}
