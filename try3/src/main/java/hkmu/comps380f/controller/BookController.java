package hkmu.comps380f.controller;

import hkmu.comps380f.model.Book;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import static org.springframework.data.jpa.domain.AbstractPersistable_.id;

@Controller
@RequestMapping("/book")
public class BookController {
    private final List<Book> books = new ArrayList<>();
    private int nextId = 0; // Initialize the next available ID

    @PostMapping("/addbook")
    public String addBookSubmit(@ModelAttribute Book book,
                                @RequestParam("comment") String comment,
                                @RequestParam("cover") MultipartFile coverPhoto) {
        book.setId(nextId);
        book.setComments(new ArrayList<>()); // Initialize comments list
        book.getComments().add(comment); // Add the comment to the comments list
        books.add(book);
        nextId++;

        // Handle file upload
        if (!coverPhoto.isEmpty()) {
            try {
                byte[] photoBytes = coverPhoto.getBytes();
                book.setPhoto(photoBytes);
                book.setPhotoFileName(coverPhoto.getOriginalFilename());
            } catch (IOException e) {
                e.printStackTrace();
                // Handle error
            }
        }
        return "redirect:/index";
    }

    @GetMapping("/index")
    public String index(Model model) {
        model.addAttribute("books", books);
        return "index";
    }

    @GetMapping("/addbook")
    public String addBookForm(Model model) {
        model.addAttribute("book", new Book());
        return "addbook";
    }

    @GetMapping("/book/{id}")
    public String viewBook(@PathVariable int id, Model model) {
        Book book = findBookById(id);
        if (book != null) {
            model.addAttribute("book", book);
            return "viewbook";
        } else {
            return "redirect:/index";
        }
    }

    @GetMapping("/book/photo/{id}")
    @ResponseBody
    public ResponseEntity<byte[]> getBookPhoto(@PathVariable int id) {
        Book book = findBookById(id);
        if (book != null && book.getPhoto() != null) {
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.IMAGE_JPEG); // Adjust content type if needed
            return new ResponseEntity<>(book.getPhoto(), headers, HttpStatus.OK);
        } else {
            // Return a default image or handle error appropriately
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    // Utility method to find a book by its ID
    private Book findBookById(int id) {
        for (Book book : books) {
            if ((book.getId() != 0) && (book.getId() == id)) {
                return book;
            }
        }
        return null;
    }
    @GetMapping("/removebook")
    public String removeBookForm(Model model) {
        model.addAttribute("books", books);
        return "removebook";
    }

    @PostMapping("/remove")
    public String removeBooks(@RequestParam(value = "bookIds", required = false) int[] bookIds) {
        if (bookIds != null) {
            for (int id : bookIds) {
                Book bookToRemove = findBookById(id);
                if (bookToRemove != null) {
                    books.remove(bookToRemove);
                }
            }
        }
        return "redirect:/index";
    }
    @GetMapping("/editbook/{id}")
    public String editBookForm(@PathVariable int id, Model model) {
        Book book = findBookById(id);
        if (book != null) {
            model.addAttribute("book", book);
            return "editbook";
        } else {
            return "redirect:/index";
        }
    }

    @PostMapping("/editbook/{id}")
    public String editBookSubmit(@PathVariable int id, @ModelAttribute Book editedBook,
                                 @RequestParam("comment") String comment,
                                 @RequestParam("cover") MultipartFile coverPhoto) {
        Book book = findBookById(id);
        if (book != null) {
            book.setName(editedBook.getName());
            book.setAuthor(editedBook.getAuthor());
            book.setPrice(editedBook.getPrice());
            book.setDescription(editedBook.getDescription());
            book.setAvailability(editedBook.getAvailability());

            // Update comment
            List<String> comments = book.getComments();
            if (comments != null && !comments.isEmpty()) {
                comments.set(0, comment);
            } else {
                comments = new ArrayList<>();
                comments.add(comment);
                book.setComments(comments);
            }

            // Handle file upload
            if (!coverPhoto.isEmpty()) {
                try {
                    byte[] photoBytes = coverPhoto.getBytes();
                    book.setPhoto(photoBytes);
                    book.setPhotoFileName(coverPhoto.getOriginalFilename());
                } catch (IOException e) {
                    e.printStackTrace();
                    // Handle error
                }
            }
        }
        return "redirect:/index";
    }
    @PostMapping("/addcomment/{id}")
    public String addComment(@PathVariable int id, @RequestParam("newComment") String newComment) {
        Book book = findBookById(id);
        if (book != null) {
            List<String> comments = book.getComments();
            if (comments == null) {
                comments = new ArrayList<>();
                book.setComments(comments);
            }
            comments.add(newComment);
        }
        return "redirect:/book/{id}";
    }
    @GetMapping("/editcomment/{id}/{commentIndex}")
    public String editCommentForm(@PathVariable int id, @PathVariable int commentIndex, Model model) {
        Book book = findBookById(id);
        if (book != null && book.getComments() != null && commentIndex >= 0 && commentIndex < book.getComments().size()) {
            model.addAttribute("book", book);
            model.addAttribute("commentIndex", commentIndex);
            model.addAttribute("comment", book.getComments().get(commentIndex));
            return "editcomment";
        } else {
            return "redirect:/index";
        }
    }

    @PostMapping("/editcomment/{id}/{commentIndex}")
    public String editCommentSubmit(@PathVariable int id, @PathVariable int commentIndex, @RequestParam("editedComment") String editedComment) {
        Book book = findBookById(id);
        if (book != null && book.getComments() != null && commentIndex >= 0 && commentIndex < book.getComments().size()) {
            book.getComments().set(commentIndex, editedComment);
        }
        return "redirect:/book/{id}";
    }

    @GetMapping("/deletecomment/{id}/{commentIndex}")
    public String deleteComment(@PathVariable int id, @PathVariable int commentIndex) {
        Book book = findBookById(id);
        if (book != null && book.getComments() != null && commentIndex >= 0 && commentIndex < book.getComments().size()) {
            book.getComments().remove(commentIndex);
        }
        return "redirect:/book/{id}";
    }
    private final List<Book> shoppingCart = new ArrayList<>(); // Shopping cart list

    @GetMapping("/addtocart/{id}")
    public String addToCart(@PathVariable int id) {
        Book bookToAdd = findBookById(id);
        if (bookToAdd != null) {
            // Check if a book with the same ID already exists in the shopping cart
            boolean bookExists = false;
            for (Book cartBook : shoppingCart) {
                if (cartBook.getId() == (bookToAdd.getId())) {
                    // Update the quantity
                    cartBook.setQuantity(cartBook.getQuantity() + 1);
                    bookExists = true;
                    break;
                }
            }
            if (!bookExists) {
                // If the book doesn't exist in the cart, add it with quantity 1
                bookToAdd.setQuantity(1);
                shoppingCart.add(bookToAdd);
            }
        }
        return "redirect:/index";
    }

    @GetMapping("/shoppingcart")
    public String shoppingCart(Model model) {
        model.addAttribute("cart", shoppingCart);
        return "shoppingcart";
    }
    @GetMapping("/removefromcart/{id}")
    public String removeFromCart(@PathVariable int id) {
        Book bookToRemove = findBookById(id);
        if (bookToRemove != null) {
            shoppingCart.remove(bookToRemove);
        }
        return "redirect:/shoppingcart"; // Redirect to the shopping cart page
    }
    @GetMapping("/pay")
    public String pay() {
        return "pay"; // Return the name of the pay.jsp file
    }

}
