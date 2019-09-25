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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
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
        return mav;
    }
    
    
    // TODO: API GET
    @RequestMapping(value = "/api/verUsuarios")
    public List<Usuario> verUsuarios() {
        return serviceUsuario.listAll();
    } 
    
    @RequestMapping(value = "/api/verAlunos")
    public List<Aluno> verAlunos() {
        return serviceAluno.listAll();
    } 
    
    @RequestMapping(value = "/api/verCursos")
    public List<Curso> verCursos() {
        return serviceCurso.listAll();
    } 
    
    @RequestMapping(value = "/api/verDisciplinas")
    public List<Disciplina> verDisciplinas() {
        return serviceDisciplina.listAll();
    } 
    
    @RequestMapping(value = "/api/verNotas")
    public List<Nota> verNotas() {
        return serviceNota.listAll();
    } 
    
    @RequestMapping(value = "/api/verPerfis")
    public List<Perfil> verPerfis() {
        return servicePerfil.listAll();
    } 
    
    @RequestMapping(value = "/api/verProfessores")
    public List<Professor> verProfessores() {
        return serviceProfessor.listAll();
    } 
    
    @RequestMapping(value = "/api/verTurmas")
    public List<Turma> verTurmas() {
        return serviceTurma.listAll();
    } 
    
    
    // TODO: API POST
    @RequestMapping(value = "/api/novoCurso", method = RequestMethod.POST)
    public String novoCurso(@RequestBody Curso curso) {
        try{
            serviceCurso.save(curso);
            return "Curso Salvo";
        } catch (Exception e){
            return "Erro ao salvar Curso";
        }
    } 
   
//    
//    // TODO: EDITAR
//    @RequestMapping("/editarMorador/{id}")
//    public ModelAndView verEdicaoMorador(@PathVariable(name = "id") Long id) {
//        ModelAndView mav = new ModelAndView("moradores_editar");
//       // Morador morador = serviceUsuario.get(id);
//        //mav.addObject("morador", morador);
//        return mav;
//    }
    
    
        // TODO: SALVAR Edicao
//    @RequestMapping(value = "/salvarEdicaoMorador", method = RequestMethod.POST)
//    public ModelAndView salvarEdicaoMorador(@ModelAttribute("morador") Usuario morador) {
//        ModelAndView mav = new ModelAndView("redirect:/moradores");
//        serviceUsuario.alterarMorador(morador.getNome(), morador.getCpf(), morador.getRg(), 
//                morador.getDt_nascimento(), morador.getEmail(), morador.getTelefone(), 
//                morador.getId_unidade(), morador.getId());
//        return mav;
//    }
//    
//    // TODO: DELETAR
//    @RequestMapping("/deletarMorador/{id}")
//    public ModelAndView deletarMorador(@PathVariable(name = "id") Long id) {
//        ModelAndView mav = new ModelAndView("redirect:/moradores");
//        serviceUsuario.delete(id);
//        return mav;       
//    }
    
    
    // TODO: LOGIN
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView login(@RequestParam(name = "email") String email, @RequestParam(name = "senha") String senha){
        List<Usuario> listUsuario = serviceUsuario.login(email, senha);
        return (listUsuario.size() > 0)? new ModelAndView("redirect:/moradores") : new ModelAndView("redirect:/");   
    }
    
     // TODO: CADASTRO
    @RequestMapping(value = "/cadastro", method = RequestMethod.POST)
    public ModelAndView salvarMorador(@ModelAttribute("usuario") Usuario usuario) throws ParseException {
        ModelAndView mav = new ModelAndView("redirect:/");
        serviceUsuario.save(usuario);
        return mav;
    }
    
    
//    // TODO: LOGOUT
//    @RequestMapping("/logout")
//    public ModelAndView logout(Model model){
//        ModelAndView mav = new ModelAndView("index");
//        return mav;   
//    }
//    
//    
//    // TODO: LISTAR
//    @RequestMapping("/moradores")
//    public ModelAndView verMorador(Model model){
//        ModelAndView mav = new ModelAndView("moradores");
//       // model.addAttribute("listMorador", serviceUsuario.listAll());
//        return mav;
//    }
}
