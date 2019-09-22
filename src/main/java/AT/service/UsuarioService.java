package AT.service;

import AT.model.Usuario;
import AT.repository.UsuarioRepositorio;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class UsuarioService {
    @Autowired
    private UsuarioRepositorio repoUsuario;
    
    public List<Usuario> listAll(){
        return repoUsuario.findAll();
    }
    
    public void save(Usuario usuario){
        repoUsuario.save(usuario);
    }
    
    public Usuario get(Long id){
        return repoUsuario.findById(id).get();
    }
        
    public void delete(Long id){
        repoUsuario.deleteById(id);  
    }
    
    public List<Usuario> login(String email, String senha){
        return repoUsuario.login(email, senha);
    }
    
    public void alterarUsuario(String nome, String email, Long id){
        repoUsuario.alterar(nome, email, id);
    }
}
