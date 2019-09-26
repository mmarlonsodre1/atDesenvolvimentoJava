package AT.control;
import AT.model.Aluno;
import AT.model.Curso;
import AT.model.Disciplina;
import AT.model.Nota;
import AT.model.Perfil;
import AT.model.Professor;
import AT.model.Turma;
import AT.model.Usuario;
import AT.service.AlunoService;
import AT.service.CursoService;
import AT.service.DisciplinaService;
import AT.service.NotaService;
import AT.service.PerfilService;
import AT.service.ProfessorService;
import AT.service.TurmaService;
import AT.service.UsuarioService;
import java.text.ParseException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
 
@RestController
public class AppController {
    @Autowired
    private UsuarioService serviceUsuario;
    @Autowired
    private PerfilService servicePerfil;
    @Autowired
    private CursoService serviceCurso;
    @Autowired
    private AlunoService serviceAluno;
    @Autowired
    private DisciplinaService serviceDisciplina;
    @Autowired
    private NotaService serviceNota;
    @Autowired
    private ProfessorService serviceProfessor;
    @Autowired
    private TurmaService serviceTurma;
     
    
    @RequestMapping("/")
    public ModelAndView viewUser(Model model){
        ModelAndView mav = new ModelAndView("index");
        Usuario usuario = new Usuario();
        mav.addObject("usuario", usuario);
        mav.addObject("listPerfil", servicePerfil.listAll());
        mav.addObject("listCursos", serviceCurso.listAll());
        return mav;
    }
      
    
    // TODO: API GET
    @RequestMapping(value = "/api/verUsuarios")
    public List<Usuario> verUsuarios() {
        return serviceUsuario.listAll();
    } 
    
    @RequestMapping(value = "/api/verCursos")
    public List<Curso> verCursos() {
        return serviceCurso.listAll();
    } 
    
        @RequestMapping("/api/verUsuariosApi")
    public ModelAndView verApiUsuarios(){
        ModelAndView mav = new ModelAndView("tabela_usuarios");
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<List<Usuario>> response = restTemplate.exchange(
          "http://localhost:8080/api/verUsuarios/",
          HttpMethod.GET,
          null,
          new ParameterizedTypeReference<List<Usuario>>(){});
        List<Usuario> usuarios = response.getBody();
        mav.addObject("listUsuarios", usuarios);
        return mav;
    }
    
    @RequestMapping("/api/verCursosApi")
    public ModelAndView verApiCursos(){
        ModelAndView mav = new ModelAndView("tabela_cursos");
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<List<Curso>> response = restTemplate.exchange(
          "http://localhost:8080/api/verCursos/",
          HttpMethod.GET,
          null,
          new ParameterizedTypeReference<List<Curso>>(){});
        List<Curso> cursos = response.getBody();
        mav.addObject("listCursos", cursos);
        return mav;
    }
    
    @RequestMapping(value = "disciplina", method = RequestMethod.GET)
    public ModelAndView disciplina(){
        ModelAndView mav = new ModelAndView("disciplina");
        mav.addObject("listCursos", serviceCurso.listAll());
        mav.addObject("disciplina", new Disciplina());
        return mav;
    }
    
    @RequestMapping(value = "api/novaDisciplinaApi", method = RequestMethod.POST)
    public ModelAndView novaDisciplinaApi(@ModelAttribute("disciplina") Disciplina disciplina){
        RestTemplate restTemplate = new RestTemplate();
        try {
            restTemplate.postForObject("http://localhost:8080/api/novaDisciplina", disciplina, ResponseEntity.class);
        } catch(Exception e){}
        return new ModelAndView("redirect:/home");
    }
    
    // TODO: API POST
    @RequestMapping(value = "/api/novaDisciplina", method = RequestMethod.POST)
    public Disciplina novaDisciplina(@RequestBody Disciplina disciplina) {
        try{
            serviceDisciplina.save(disciplina);
            return disciplina;
        } catch (Exception e){
            disciplina.setNome("ERROR");
            disciplina.setCodigo("ERROR");
            return disciplina;
        }
    }
    
    // TODO: EDITAR
    @RequestMapping(value="/editarUsuario/{id}", method = RequestMethod.GET)
    public ModelAndView verEdicaoUsuario(@PathVariable(name = "id") Long id, Model model) {
        ModelAndView mav = new ModelAndView("editar_usuario");
        model.addAttribute("usuario", serviceUsuario.get(id));
        return mav;
    }
    
    
    //TODO: SALVAR Edicao
    @RequestMapping(value = "/salvarEdicaoUsuario", method = RequestMethod.POST)
    public ModelAndView salvarEdicaoUsuario(@ModelAttribute("usuario") Usuario usuario) {
        ModelAndView mav = new ModelAndView("redirect:/api/verUsuariosApi");
        serviceUsuario.alterar(usuario.getNome(), usuario.getEmail(), usuario.getId());
        return mav;
    }
    
    
    // TODO: DELETAR
    @RequestMapping("/deletarCurso/{id}")
    public ModelAndView deletarCurso(@PathVariable(name = "id") Long id) {
        ModelAndView mav = new ModelAndView("redirect:/api/verCursosApi");
        try{
            serviceCurso.delete(id);
        } catch (Exception e){
            mav = new ModelAndView("error_deletar");
        }
        return mav;       
    }
    
    
    // TODO: LOGIN
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView login(@RequestParam(name = "email") String email, @RequestParam(name = "senha") String senha){
        List<Usuario> listUsuario = serviceUsuario.login(email, senha);
        return (listUsuario.size() > 0)? new ModelAndView("redirect:/home") : new ModelAndView("redirect:/");   
    }
    
    @RequestMapping("/home")
    public ModelAndView home(){
        return new ModelAndView("home");   
    }
    
     // TODO: CADASTRO
    @RequestMapping(value = "/cadastro", method = RequestMethod.POST)
    public ModelAndView salvarMorador(@ModelAttribute("usuario") Usuario usuario, @RequestParam(name="datanasc")String datanasc,
            @RequestParam("titulacao")String titulacao, @RequestParam String curso_id){
        serviceUsuario.save(usuario);
        ModelAndView mav = new ModelAndView("redirect:/homeCadastro/" + String.valueOf(usuario.getId()));
        if (!titulacao.isEmpty()) serviceProfessor.save(new Professor(titulacao, usuario.getId()));
        if (!datanasc.isEmpty()) serviceAluno.save(new Aluno(usuario.getId(), Long.parseLong(curso_id), datanasc));
        mav.addObject("dados", usuario);
        return mav;
    }
    
    @RequestMapping("/homeCadastro/{id}")
    public ModelAndView homeCadastro(@PathVariable(name = "id") Long id){
        ModelAndView mav = new ModelAndView("home_cadastro");
        Usuario usuario = serviceUsuario.get(id);
        mav.addObject(usuario);
        return mav;
    }

}
