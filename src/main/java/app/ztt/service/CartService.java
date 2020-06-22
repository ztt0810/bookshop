package app.ztt.service;

import app.ztt.dao.CartDao;
import app.ztt.entity.Cart;
import app.ztt.vo.CartVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartService {

    private Logger logger = LoggerFactory.getLogger(CartService.class);

    @Autowired
    CartDao cartDao;


    @Autowired
    BookService bookService;

    public int addItemToCart(Cart cart){
        Integer res = findBook(cart.getUserCode(), cart.getBookId());
        if(res == null){
            return cartDao.addItemToCart(cart);
        }else{
            return cartDao.updateBookQuantity(cart.getBookId());
        }

    }

    public List<CartVo> findUserCartById(Integer userCode){
        return cartDao.findUserCartById(userCode);
    }

    public Integer findBook(Integer userCode, Integer bookId){
        logger.debug("Start to find");
        Integer res = cartDao.findBook(userCode, bookId);
        logger.debug("return value is: "+ String.valueOf(res));
        return res;
    }

    public Integer minusOneItem(String bookName){
        Integer bookId = bookService.findBookByName(bookName);
        return cartDao.minusOneItem(bookId);
    }

    public Integer addOneItem(String bookName){
        Integer bookId = bookService.findBookByName(bookName);
        return cartDao.updateBookQuantity(bookId);
    }

    public Integer deleteOneItem(String bookName){
        Integer bookId = bookService.findBookByName(bookName);
        return cartDao.deleteOneItem(bookId);
    }

    public Integer clearUserCart(Integer userCode){
        return cartDao.clearUserCart(userCode);
    }
}
