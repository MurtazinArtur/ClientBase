package clientbase.web;

import clientbase.model.Client;
import clientbase.service.ClientService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.util.Collection;
import java.util.Map;

@Controller
public class ClientController {

    private ClientService clientService;
    private ObjectMapper mapper = new ObjectMapper();
    // inject via application.properties
    @Value("${welcome.message:test}")
    private String message = "Hello World";

    @Autowired
    public ClientController(ClientService clientService) {
        this.clientService = clientService;
    }

    @RequestMapping("/")
    public String welcome(Map<String, Object> model) {
        model.put("message", this.message);
        return "index";
    }

    @GetMapping(value = "/add_new_client")
    public String addNewClientPage() {
        return "/add_new_client";
    }

    @GetMapping("/client_list")
    public String findAll(Model model) {
        Collection<Client> allClients = clientService.findAll();

        model.addAttribute("clients", allClients);

        return "client_list";

    }

    @PostMapping(value = "/save", consumes = MediaType.APPLICATION_JSON_VALUE)
    public ModelAndView save(@RequestBody String jsonCurrencyDtoModel) {
        Client saveClient = new Client();

        try {
            saveClient = mapper.readValue(jsonCurrencyDtoModel, Client.class);
        } catch (IOException e) {
            e.printStackTrace();
        }
        clientService.save(saveClient);

        return new ModelAndView("redirect:/client_list");
    }

    @GetMapping(value = "/delete/{id}")
    public String delete(@PathVariable(value = "id", required = true) Long clientId) {
        Client removeClient = clientService.findById(clientId);

        clientService.delete(removeClient);

        return "redirect:/client_list";
    }
}