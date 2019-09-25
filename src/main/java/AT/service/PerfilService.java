package AT.service;

import AT.model.Perfil;
import AT.repository.PerfilRepositorio;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class PerfilService {
    @Autowired
    private PerfilRepositorio repo;
    
    public List<Perfil> listAll(){
        return repo.findAll();
    }
    
    public void save(Perfil perfil){
        repo.save(perfil);
    }
    
    public Perfil get(Long id){
        return repo.findById(id).get();
    }
        
    public void delete(Long id){
        repo.deleteById(id);  
    }
}
