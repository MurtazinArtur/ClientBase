package clientbase.service;

import clientbase.model.Client;
import clientbase.repository.ClientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClientService {

    private ClientRepository clientRepository;

    @Autowired
    public ClientService(ClientRepository clientRepository) {
        this.clientRepository = clientRepository;
    }

    public void save(Client client) {
        clientRepository.save(client);
    }

    public void delete(Client client) {
        clientRepository.delete(client);
    }

    public void deleteAll() {
        clientRepository.deleteAll();
    }

    public List<Client> findAll() {
        return (List<Client>) clientRepository.findAll();
    }

    public Client findById(Long clientId) {
        return clientRepository.findById(clientId).get();
    }

    public List<Client> findByFirstName(String clientFirstName) {
        return clientRepository.findByFirstName(clientFirstName);
    }

    public List<Client> findByLastName(String clientLastName) {
        return clientRepository.findByLastName(clientLastName);
    }

    public List<Client> findByAge(String clientAge) {
        return clientRepository.findByAge(clientAge);
    }

    public List<Client> findByPhone(String clientPhone) {
        return clientRepository.findByPhone(clientPhone);
    }
}