package AT.repository;

import AT.model.Professor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ProfessorRepositorio extends JpaRepository<Professor, Long>{
    @Modifying 
    @Query(value="Update professor SET titulacao = :titulacao, usuario_id = :usuario_id where id = :id", nativeQuery = true)
    public void alterar(@Param("titulacao") String titulacao, @Param("usuario_id") Long usuario_id, @Param("id") Long id); 
}
