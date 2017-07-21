package com.wsgw.base.service;

import java.util.List;
import java.util.Set;

import com.wsgw.base.pojo.Comment;
import com.wsgw.base.pojo.Customer;
import com.wsgw.base.pojo.Orderitem;
import com.wsgw.base.pojo.Orders;
import com.wsgw.base.pojo.Productinfo;
import com.wsgw.base.pojo.Publicinfo;
import com.wsgw.base.pojo.vo.ProductinfoCustom;
import com.wsgw.base.utils.PageModel;

public interface CustomerService {
	public void insert(Customer customer) throws Exception;
	public List<ProductinfoCustom> findByCreateTime(PageModel pageModel);
	public List<ProductinfoCustom> findBySellCount(PageModel pageModel);
	public List<ProductinfoCustom> findByCommend(PageModel pageModel);
	public List<ProductinfoCustom> findEnjoyProduct(PageModel pageModel);
	public List<ProductinfoCustom> findByName(String name);
	public Customer check(String userid,String pwd) throws Exception;
	public ProductinfoCustom findById(Integer id);
	public void updateproductinfo(Productinfo productinfo);
	public Productinfo findProById(Integer id);
	public List<Orders> findOrderByCustomer(String customerId);
	public void createOrder(Orders orders,Set<Orderitem> cart,Customer customer);
	public Customer findCustomerById(String id);
	public void updateCustomer (Customer customer)throws Exception;
	public Integer countProduct();
	public List<Orderitem> findByOrderid(String orderId);
	public Comment saveComment(Comment comment);
	public List<Comment> findByProudctId(Integer productId);
	public List<Publicinfo> findAllNotice();
	public Publicinfo findNoticeById(Integer id);
	public void updateOrder(String orderid);
}
