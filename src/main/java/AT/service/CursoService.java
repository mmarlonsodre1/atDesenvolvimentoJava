package AT.service;

import AT.model.Curso;
import AT.model.Perfil;
import AT.repository.CursoRepositorio;
import AT.repository.PerfilRepositorio;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class CursoService {
    @Autowired
    private CursoRepositorio repo;
    
    public List<Curso> listAll(){
        return repo.findAll();
    }
    
    public void save(Curso curso){
        repo.save(curso);
    }
    
    public Curso get(Long id){
        return repo.findById(id).get();
    }
        
    public void delete(Long id){
        repo.deleteById(id);  
    }
}
