package hkmu.comps380f.controller;

import hkmu.comps380f.dao.UserManagementService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.boot.*;

import java.io.IOException;
import java.security.Principal;

@Controller
@RequestMapping("/user")
public class UserManagementController {

    private String updateUserName;
    //@Resource
    UserManagementService umService;

    public UserManagementController(UserManagementService umService) {
        this.umService = umService;
    }

    @GetMapping({"", "/", "/listSelf"})
    public String listSelf(ModelMap model) {
        model.addAttribute("ticketUsers", umService.getTicketUsers());
        return "listThisUser";
    }

    @GetMapping({"", "/", "/list"})
    public String list(ModelMap model) {
        model.addAttribute("ticketUsers", umService.getTicketUsers());
        return "listUser";
    }

    public static class Form {
        private String username;
        private String password;
        private String fullname;
        private String email;
        private String delivery;
        private String[] roles;


        // getters and setters for all properties
        public String getUsername() {
            return username;
        }
        public void setUsername(String username) {
            this.username = username;
        }

        public String getPassword() {
            return password;
        }
        public void setPassword(String password) {
            this.password = password;
        }

        public String getFullname() {
            return fullname;
        }
        public void setFullname(String fullname) {
            this.fullname = fullname;
        }

        public String getEmail() {
            return email;
        }
        public void setEmail(String email) {
            this.email = email;
        }

        public String getDelivery() {
            return delivery;
        }
        public void setDelivery(String delivery) {
            this.delivery = delivery;
        }

        public String[] getRoles() {
            return roles;
        }
        public void setRoles(String[] roles) {
            this.roles = roles;
        }
    }

    @GetMapping("/create")
    public ModelAndView create() {
        return new ModelAndView("addUser", "ticketUser", new Form());
    }

    @PostMapping("/create")
    public String create(Form form) throws IOException {
        umService.createTicketUser(form.getUsername(), form.getFullname(),
                form.getPassword(), form.getEmail(), form.getDelivery(), form.getRoles());
        return "redirect:/user/list";
    }

    @GetMapping("/registrate")
    public ModelAndView registrate() {
        return new ModelAndView("registration", "ticketUser", new Form());
    }

    @PostMapping("/registrate")
    public String registrate(Form form) throws IOException {
        umService.createTicketUser(form.getUsername(), form.getPassword(),
                form.getFullname(), form.getEmail(), form.getDelivery(), new String[]{"ROLE_USER"});
        return "redirect:/user/list";
    }


    @GetMapping("/update")
    public ModelAndView update() {
        return new ModelAndView("updateUser", "ticketUser", new Form());
    }

    @PostMapping("/update")
    public String update(Form form, Principal principal) throws IOException {
        umService.updateTicketUser(principal.getName(), form.getPassword(),
                form.getFullname(), form.getEmail(), form.getDelivery());
        return "redirect:/user/list";
    }


    @GetMapping("/updateUser/{username}")
    public String updateUser(@PathVariable("username") String username) {
        this.updateUserName = username;
        return "redirect:/user/updateUser2";
    }



    @GetMapping("/updateUser2")
    public ModelAndView updateUser2() {
        return new ModelAndView("updateUserAll", "ticketUser", new Form());
    }

    @PostMapping("/updateUser2")
    public String updateUser2(Form form) throws IOException {
        umService.updateUser(this.updateUserName, form.getPassword(),
            form.getFullname(), form.getEmail(), form.getDelivery());
        return "redirect:/user/list";
    }


    @GetMapping("/delete/{username}")
    public String deleteTicket(@PathVariable("username") String username) {
        umService.delete(username);
        return "redirect:/user/list";
    }
}
