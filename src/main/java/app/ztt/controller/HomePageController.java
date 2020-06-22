package app.ztt.controller;

import app.ztt.entity.Book;
import app.ztt.entity.User;
import app.ztt.service.BookService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class HomePageController {

    private final Logger logger = LoggerFactory.getLogger(HomePageController.class);

    @Autowired
    private BookService bookService;

    @RequestMapping("/homePage")
    public String getHomePage(Model map){
        List<Book> allBooks = bookService.getAllBooks();
        map.addAttribute("bookInfo", allBooks);
        return "homePage";
    }

    @RequestMapping("/homePage/{category}")
    public String getBooks(@PathVariable("category") String category){
        logger.debug(category);
        return "homePage";
    }

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String getBookDetail(@RequestParam("bookName") String bookName, Model model){

        String url = "https://img9.doubanio.com/view/subject/l/public/s25648004.jpg";
        String url2 = "https://img9.doubanio.com/view/subject/l/public/s29518349.jpg";
        model.addAttribute("imgUrl", url2);
        return "bookInfo";
    }

}
