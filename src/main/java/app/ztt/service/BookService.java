package app.ztt.service;

import app.ztt.dao.BookDao;
import app.ztt.entity.Book;
import app.ztt.po.BookPo;
import app.ztt.vo.CartVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookService {

    @Autowired
    private BookDao bookDao;

    public List<String> getCarouselPictureUrl(){
        return bookDao.getCarouselPictureUrl();
    }

    public List<Book> getAllBooks(){
        return bookDao.getAllBooks();
    }

    public Book findBookById(Integer bookId){
        return bookDao.findBookById(bookId);
    }

    public Integer findBookByName(String bookName){
        return bookDao.findBookByName(bookName);
    }

    public Integer updateBookStock(List<CartVo> cartVos){
        int res = 1;
        for(CartVo c:cartVos){
            BookPo bookPo = new BookPo();
            bookPo.setBookName(c.getBookName());
            bookPo.setQuantity(c.getQuantity());
            if(bookDao.updateBookStock(bookPo) == null){
                res = 0;
            }
        }
        return res;

    }
}
