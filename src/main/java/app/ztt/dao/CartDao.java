package app.ztt.dao;

import app.ztt.entity.Cart;
import app.ztt.vo.CartVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CartDao {
    public List<Cart> getUserCartByCode();

    public Integer addItemToCart(Cart cart);

    public List<CartVo> findUserCartById(@Param("userCode") Integer userCode);

    public Integer findBook(@Param("userCode") Integer userCode, @Param("bookId") Integer bookId);

    public Integer updateBookQuantity(@Param("bookId") Integer bookId);

    public Integer minusOneItem(@Param("bookId") Integer bookId);

    public Integer deleteOneItem(@Param("bookId") Integer bookId);

    public Integer clearUserCart(@Param("userCode") Integer userCode);

}
