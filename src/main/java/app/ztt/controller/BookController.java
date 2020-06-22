package app.ztt.controller;


import app.ztt.entity.Book;
import app.ztt.service.BookService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BookController {

    private Logger logger = LoggerFactory.getLogger(BookController.class);

    @Autowired
    BookService bookService;

    @RequestMapping("/detail/{bookId}")
    public String getBookDetailById(@PathVariable("bookId") Integer bookId, Model map){
        System.out.println("bookid is:" + bookId);
        Book book = bookService.findBookById(bookId);
        logger.debug(book.getBookName());
        map.addAttribute("bookDetail", book);
        return "bookInfo";
    }
}
