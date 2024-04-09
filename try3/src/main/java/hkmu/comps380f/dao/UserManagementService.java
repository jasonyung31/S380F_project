package hkmu.comps380f.dao;

import hkmu.comps380f.model.TicketUser;
import jakarta.annotation.Resource;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserManagementService {
    //@Resource
    private final TicketUserRepository tuRepo;

    public UserManagementService(TicketUserRepository tuRepo) {
        this.tuRepo = tuRepo;
    }


    @Transactional
    public List<TicketUser> getTicketUsers() {
        return tuRepo.findAll();
    }

    private String thisUser;

    @Transactional
    public void delete(String username) {
        TicketUser ticketUser = tuRepo.findById(username).orElse(null);
        if (ticketUser == null) {
            throw new UsernameNotFoundException("User '" + username + "' not found.");
        }
        tuRepo.delete(ticketUser);
    }

    @Transactional
    public void createTicketUser(String username, String password, String fullname, String email, String delivery, String[] roles) {
        TicketUser user = new TicketUser(username, password, fullname, email, delivery, roles);
        tuRepo.save(user);
    }


    @Transactional
    public void updateTicketUser(String username, String password, String fullname, String email, String delivery) {
        TicketUser ticketUser = tuRepo.findById(username).orElse(null);
        if (ticketUser == null) {
            throw new UsernameNotFoundException("User '" + username + "' not found.");
        }
        ticketUser.setPassword(password);
        ticketUser.setFullname(fullname);
        ticketUser.setEmail(email);
        ticketUser.setDelivery(delivery);
    }


    @Transactional
    public void updateUser(String username, String password, String fullname, String email, String delivery) {
        TicketUser ticketUser = tuRepo.findById(username).orElse(null);
        if (ticketUser == null) {
            throw new UsernameNotFoundException("User '" + username + "' not found.");
        }
        ticketUser.setPassword(password);
        ticketUser.setFullname(fullname);
        ticketUser.setEmail(email);
        ticketUser.setDelivery(delivery);
    }

}
