package clientbase.repository;

import clientbase.model.Client;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ClientRepository extends CrudRepository<Client, Long> {
    List<Client> findByFirstName(String firstName);

    List<Client> findByLastName(String LastName);

    List<Client> findByAge(String age);

    List<Client> findByPhone(String phone);
}
