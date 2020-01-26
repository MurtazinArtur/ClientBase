package clientbase.repository;

import clientbase.model.Client;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

@Component
public class ClientImpl implements ApplicationRunner {

    private ClientRepository repository;

    @Autowired
    public ClientImpl(ClientRepository repository) {
        this.repository = repository;
    }


    @Override
    public void run(ApplicationArguments args) throws Exception {
        long count = repository.count();

        if (count == 0) {
            Client p1 = new Client();

            p1.setFirstName("John");
            p1.setLastName("Smith");
            p1.setAge("28");
            p1.setPhone("225588");

            Client p2 = new Client();

            p2.setFirstName("Anna");
            p2.setLastName("Smith");
            p2.setAge("38");
            p2.setPhone("885513");

            repository.save(p1);
            repository.save(p2);
        }
    }
}
