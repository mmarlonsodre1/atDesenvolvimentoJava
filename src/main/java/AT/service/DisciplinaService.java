package AT.service;

import AT.model.Disciplina;
import AT.repository.DisciplinaRepositorio;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class DisciplinaService {
    @Autowired
    private DisciplinaRepositorio repo;
    
    public List<Disciplina> listAll(){
        return repo.findAll();
    }
    
    public void save(Disciplina disciplina){
        repo.save(disciplina);
    }
    
    public Disciplina get(Long id){
        return repo.findById(id).get();
    }
        
    public void delete(Long id){
        repo.deleteById(id);  
    }
    
    public void alterar(String nome, String codigo, Long curso_id, Long id){
        repo.alterar(nome, codigo, curso_id, id);
    }
}
