package AT.repository;

import AT.model.Usuario;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface UsuarioRepositorio extends JpaRepository<Usuario, Long>{
   @Query(value="SELECT * FROM usuario where email= :email AND senha= :senha", nativeQuery = true)
    public List<Usuario> login(@Param("email") String email, @Param("senha") String senha); 

    @Modifying 
    @Query(value="Update usuario SET nome = :nome, email = :email where id = :id", nativeQuery = true)
    public void alterar(@Param("nome") String nome, @Param("email") String email, @Param("id") Long id); 
}
