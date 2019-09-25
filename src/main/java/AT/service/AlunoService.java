package AT.service;

import AT.model.Aluno;
import AT.repository.AlunoRepositorio;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class AlunoService {
    @Autowired
    private AlunoRepositorio repo;
    
    public List<Aluno> listAll(){
        return repo.findAll();
    }
    
    public void save(Aluno aluno){
        repo.save(aluno);
    }
    
    public Aluno get(Long id){
        return repo.findById(id).get();
    }
        
    public void delete(Long id){
        repo.deleteById(id);  
    }
    
    public void alterar(Long usuario_id, Long curso_id, String datanasc, Long id){
        repo.alterar(usuario_id, curso_id, datanasc, id);
    }
}
