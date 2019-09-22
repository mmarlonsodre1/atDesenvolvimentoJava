package AT.control;
import AT.model.Usuario;
import AT.service.UsuarioService;
import java.text.ParseException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
 
@RestController
public class AppController {
    @Autowired
    private UsuarioService serviceUsuario;
     
    
    @RequestMapping("/")
    public ModelAndView viewUser(Model model){
        ModelAndView mav = new ModelAndView("index");
        Usuario usuario = new Usuario();
        mav.addObject("usuario", usuario);
        return mav;
    }
    
    
    // TODO: CADASTRO
    @RequestMapping("/novoMorador")
    public ModelAndView verNovoMorador(Model model) {
        ModelAndView mav = new ModelAndView("moradores_cadastro");
        Usuario usuario = new Usuario();
        model.addAttribute("morador", usuario);
        return mav;
    } 
   
    
    // TODO: EDITAR
    @RequestMapping("/editarMorador/{id}")
    public ModelAndView verEdicaoMorador(@PathVariable(name = "id") Long id) {
        ModelAndView mav = new ModelAndView("moradores_editar");
        Morador morador = serviceUsuario.get(id);
        mav.addObject("morador", morador);
        return mav;
    }
    
    
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
    // TODO: DELETAR
    @RequestMapping("/deletarMorador/{id}")
    public ModelAndView deletarMorador(@PathVariable(name = "id") Long id) {
        ModelAndView mav = new ModelAndView("redirect:/moradores");
        serviceUsuario.delete(id);
        return mav;       
    }
    
    
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
    
    
    // TODO: LOGOUT
    @RequestMapping("/logout")
    public ModelAndView logout(Model model){
        ModelAndView mav = new ModelAndView("index");
        return mav;   
    }
    
    
    // TODO: LISTAR
    @RequestMapping("/moradores")
    public ModelAndView verMorador(Model model){
        ModelAndView mav = new ModelAndView("moradores");
       // model.addAttribute("listMorador", serviceUsuario.listAll());
        return mav;
    }
}
