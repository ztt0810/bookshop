package app.ztt.dao;

import app.ztt.entity.Order;
import app.ztt.entity.OrderDetail;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderDao {

    public Integer createOrder(Order order);

    public Integer recordOrderDetail(OrderDetail orderDetail);

    public List<Order> getOrderById(@Param("userCode") Integer userCode);

    public Integer deleteOrder(@Param("orderId") Integer orderId);

    public Integer deleteOrderDetail(@Param("orderId") Integer orderId);

}
