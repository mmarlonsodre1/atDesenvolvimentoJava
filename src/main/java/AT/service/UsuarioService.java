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
    private UsuarioRepositorio repo;
    
    public List<Usuario> listAll(){
        return repo.findAll();
    }
    
    public void save(Usuario usuario){
        repo.save(usuario);
    }
    
    public Usuario get(Long id){
        return repo.findById(id).get();
    }
        
    public void delete(Long id){
        repo.deleteById(id);  
    }
    
    public List<Usuario> login(String email, String senha){
        return repo.login(email, senha);
    }
    
    public void alterar(String nome, String email, Long id){
        repo.alterar(nome, email, id);
    }
}
