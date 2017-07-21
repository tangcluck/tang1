package com.wsgw.base.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.wsgw.base.pojo.Customer;
import com.wsgw.base.pojo.Orders;
import com.wsgw.base.pojo.Productcategory;
import com.wsgw.base.pojo.Productinfo;
import com.wsgw.base.pojo.Publicinfo;
import com.wsgw.base.pojo.User;
import com.wsgw.base.pojo.vo.OrderQueryVO;
import com.wsgw.base.pojo.vo.ProductcategoryCustom;
import com.wsgw.base.pojo.vo.ProductinfoCustom;

public interface AdminService {
	public User checkLogin(String username,String password) throws Exception;
	public List<ProductcategoryCustom> findCategory(Integer pid);
	public void create(Productcategory productcategory);
	public Productcategory findById(Integer id);
	public void deleteProductcategory(Integer id) throws Exception;
	public List<ProductinfoCustom> allProduct();
	public List<ProductcategoryCustom> findAllCategory();
	public void saveProduct(ProductinfoCustom productinfoCustom,MultipartFile file,String path) throws Exception;
	public void productDel(Integer id);
	public ProductinfoCustom findProductCustomById(Integer id);
	public List<Orders> findAllOrders(OrderQueryVO orderQueryVO);
	public Orders findOrderById(String orderid);
	public void updateOrderState(Orders order);
	public List<Customer> findAllCustomer();
	public void CustomerDel(String id);
	public Customer findCustomerById(String id);
	public void updateCustomer(Customer customer) throws Exception;
	public void InsertNotice(Publicinfo publicinfo);
	public List<Publicinfo> findAllNotice();
	public void noticeDel(Integer id);
	public Publicinfo findNoticeById(Integer id);
}
