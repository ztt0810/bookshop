package app.ztt.entity;


public class Cart {

    private Integer bookId;
    private Integer userCode;
    private Integer quantity;

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Integer getUserCode() {
        return userCode;
    }

    public void setUserCode(Integer userCode) {
        this.userCode = userCode;
    }

    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }


}
