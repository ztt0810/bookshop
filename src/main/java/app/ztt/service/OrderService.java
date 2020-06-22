package app.ztt.service;

import app.ztt.dao.BookDao;
import app.ztt.dao.OrderDao;
import app.ztt.entity.Book;
import app.ztt.entity.Order;
import app.ztt.entity.OrderDetail;
import app.ztt.vo.CartVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderService {
    @Autowired
    OrderDao orderDao;

    @Autowired
    BookDao bookDao;

    public Integer createOrder(Order order, List<CartVo> cartVo){
        Integer res = orderDao.createOrder(order);
        for(CartVo c:cartVo){
            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setOrderId(order.getOrderId());
            orderDetail.setBookId(bookDao.findBookByName(c.getBookName()));
            orderDetail.setPrice(c.getPrice());
            orderDetail.setQuantity(c.getQuantity());
            orderDao.recordOrderDetail(orderDetail);
        }
        return res;
    }

    public List<Order> getOrderById(Integer userCode){
        return orderDao.getOrderById(userCode);
    }

    public Integer deleteOrder(Integer orderId){
        return orderDao.deleteOrder(orderId);
    }

    public Integer deleteOrderDetail(Integer orderId){
        return orderDao.deleteOrderDetail(orderId);
    }
}
