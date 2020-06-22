package app.ztt.controller;


import app.ztt.dao.AdminDao;
import app.ztt.entity.Order;
import app.ztt.entity.User;
import app.ztt.service.BookService;
import app.ztt.service.CartService;
import app.ztt.service.OrderService;
import app.ztt.service.UserService;
import app.ztt.vo.CartVo;
import com.sun.org.apache.xpath.internal.operations.Mod;
import com.sun.org.apache.xpath.internal.operations.Or;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

@Controller
public class OrderController {

    private Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    private UserService userService;

    @Autowired
    private CartService cartService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private BookService bookService;

    @RequestMapping("/order")
    public String getOrderInfo(HttpSession session, Model orderMap){
        String loginUserName = (String)session.getAttribute("loginUser");
        int userCode = userService.findUserIdByName(loginUserName);
        List<Order> order = orderService.getOrderById(userCode);
        orderMap.addAttribute("userOrder", order);
        return "order";
    }

    @RequestMapping("/orderDetail")
    public String getOrderDetail(HttpSession session,
                                 Model orderDetailMap,
                                 Model totalPriceMap,
                                 Model userMap){
        String loginUserName = (String)session.getAttribute("loginUser");
        int userCode = userService.findUserIdByName(loginUserName);
        List<CartVo> cartVo = cartService.findUserCartById(userCode);
        orderDetailMap.addAttribute("orderDetail", cartVo);
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
        User user = userService.getUserInfoByName(loginUserName);
        userMap.addAttribute("userInfo", user);
        return "orderDetail";
    }

    @RequestMapping("/pay")
    public String payOrder(HttpSession session){
        String loginUserName = (String)session.getAttribute("loginUser");
        int userCode = userService.findUserIdByName(loginUserName);
        List<CartVo> cartVo = cartService.findUserCartById(userCode);
        double totalPrice = 0.0;
        int totolNum = 0;
        for(CartVo c: cartVo){
            if(c.getQuantity() == 0){
                cartService.deleteOneItem(c.getBookName());
            }
            totolNum += c.getQuantity();
            totalPrice += (c.getQuantity()*c.getPrice());
        }
        Order order = new Order();
        Random random = new Random();
        order.setOrderId(random.nextInt(1000000));
        order.setUserCode(userCode);
        order.setTotalPrice(totalPrice);
        order.setTotalQuantity(totolNum);
        order.setOrderTime(new Date(System.currentTimeMillis()));
        if(orderService.createOrder(order, cartVo) != null){
            cartService.clearUserCart(userCode);
            bookService.updateBookStock(cartVo);
        }
        return "redirect:/homePage";
    }

    @RequestMapping("/deleteOrder/{orderId}")
    public String deleteOrder(@PathVariable("orderId") Integer orderId){
        orderService.deleteOrderDetail(orderId);
        orderService.deleteOrder(orderId);
        return "redirect:/order";
    }
}
