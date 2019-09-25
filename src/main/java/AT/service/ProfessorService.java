package AT.service;

import AT.model.Professor;
import AT.repository.ProfessorRepositorio;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class ProfessorService {
    @Autowired
    private ProfessorRepositorio repo;
    
    public List<Professor> listAll(){
        return repo.findAll();
    }
    
    public void save(Professor professor){
        repo.save(professor);
    }
    
    public Professor get(Long id){
        return repo.findById(id).get();
    }
        
    public void delete(Long id){
        repo.deleteById(id);  
    }
    
    public void alterar(String titulacao, Long usuario_id, Long id){
        repo.alterar(titulacao, usuario_id, id);
    }
}
