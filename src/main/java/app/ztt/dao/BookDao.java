package app.ztt.dao;

import app.ztt.entity.Book;
import app.ztt.po.BookPo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookDao {
    public List<String> getCarouselPictureUrl();

    public List<Book> getAllBooks();

    public Book findBookById(@Param("bookId") Integer bookId);

    public Integer findBookByName(@Param("bookName") String bookName);

    public Integer updateBookStock(BookPo bookPo);
}
