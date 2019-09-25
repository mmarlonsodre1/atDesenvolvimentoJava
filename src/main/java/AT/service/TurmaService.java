package AT.service;

import AT.model.Turma;
import AT.repository.TurmaRepositorio;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class TurmaService {
    @Autowired
    private TurmaRepositorio repo;
    
    public List<Turma> listAll(){
        return repo.findAll();
    }
    
    public void save(Turma turma){
        repo.save(turma);
    }
    
    public Turma get(Long id){
        return repo.findById(id).get();
    }
        
    public void delete(Long id){
        repo.deleteById(id);  
    }
    
    public void alterar(String codigo, String sala,
            Long disciplina_id, Long professor_id, Long id){
        repo.alterar(codigo, sala, disciplina_id, professor_id, id);
    }
}
