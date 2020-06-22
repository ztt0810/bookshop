package app.ztt.controller;

import app.ztt.entity.Cart;
import app.ztt.service.CartService;
import app.ztt.service.UserService;
import app.ztt.vo.CartVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CartController {

    private Logger logger = LoggerFactory.getLogger(CartController.class);
    @Autowired
    UserService userService;

    @Autowired
    CartService cartService;

    @RequestMapping("/cart")
    public String getCartPage(HttpSession session, Model cartVoMap, Model totalPriceMap){
        String loginUserName = (String)session.getAttribute("loginUser");
        int userCode = userService.findUserIdByName(loginUserName);
        List<CartVo> cartVo = cartService.findUserCartById(userCode);
        cartVoMap.addAttribute("userCart", cartVo);
        double totalPrice = 0.0;
        int totolNum = 0;
        for(CartVo c: cartVo){
            if(c.getQuantity() == 0){
                cartService.deleteOneItem(c.getBookName());
            }
            totolNum += c.getQuantity();
            totalPrice += (c.getQuantity()*c.getPrice());
        }
        Map<String, Object> numAndPrice = new HashMap<String, Object>();
        numAndPrice.put("totalPrice", totalPrice);
        numAndPrice.put("totalNum", totolNum);
        totalPriceMap.addAttribute("totalPriceAndNum", numAndPrice);
//        logger.debug(String.valueOf(cartVo.getPrice()));
        return "cart";
    }

    @RequestMapping("/addToCart/{bookId}")
    public String addBookToCart(@PathVariable("bookId") Integer bookId, HttpSession session){
        String loginUserName = (String)session.getAttribute("loginUser");
        logger.debug(loginUserName);
        int userCode = userService.findUserIdByName(loginUserName);
        Cart cart = new Cart();
        cart.setUserCode(userCode);
        cart.setBookId(bookId);
        cart.setQuantity(1);
        logger.debug("cart:userid"+String.valueOf(cart.getUserCode()));
        int res = cartService.addItemToCart(cart);
        return "redirect:/cart";
    }

    @RequestMapping(value = "/cart/minus/{bookName}", method = RequestMethod.POST)
    public String minusOneItem(@PathVariable("bookName") String bookName){
        Integer res = cartService.minusOneItem(bookName);
        logger.debug(String.valueOf(res));
        return "redirect:/cart";
    }

    @RequestMapping(value = "/cart/add/{bookName}", method = RequestMethod.POST)
    public String addOneItem(@PathVariable("bookName") String bookName){
        Integer res = cartService.addOneItem(bookName);
        return "redirect:/cart";
    }

    @RequestMapping(value = "/cart/delete/{bookName}", method = RequestMethod.POST)
    public String deleteOneItem(@PathVariable("bookName") String bookName){
        cartService.deleteOneItem(bookName);
        return "redirect:/cart";
    }
}
