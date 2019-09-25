package AT.service;

import AT.model.Nota;
import AT.repository.NotaRepositorio;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class NotaService {
    @Autowired
    private NotaRepositorio repo;
    
    public List<Nota> listAll(){
        return repo.findAll();
    }
    
    public void save(Nota nota){
        repo.save(nota);
    }
    
    public Nota get(Long id){
        return repo.findById(id).get();
    }
        
    public void delete(Long id){
        repo.deleteById(id);  
    }
    
    public void alterar(Float av1, Float av2, Long aluno_id, Long turma_id, Long id){
        repo.alterar(av1, av2, aluno_id, turma_id, id);
    }
}
