import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class PessoaController {

    private PessoaDao dao = new PessoaDao();

    @GetMapping("/pessoas")
    public ArrayList<Pessoa> listarPessoas() {
        ArrayList<Pessoa> pessoas = PessoaDao.listar();
        return pessoas;
    }

    @PostMapping("/pessoas")
    public boolean inserirPessoa(@RequestBody Pessoa pessoa) {
        boolean result = PessoaDao.inserir(pessoa);
        return result;
    }
}
