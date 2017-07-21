package com.wsgw.base.service.impl;

import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import com.wsgw.base.dao.mapper.CommentMapper;
import com.wsgw.base.dao.mapper.CommentMapperCustom;
import com.wsgw.base.dao.mapper.CustomerMapper;
import com.wsgw.base.dao.mapper.OrderitemMapper;
import com.wsgw.base.dao.mapper.OrderitemMapperCustom;
import com.wsgw.base.dao.mapper.OrdersMapper;
import com.wsgw.base.dao.mapper.OrdersMapperCustom;
import com.wsgw.base.dao.mapper.ProductinfoMapper;
import com.wsgw.base.dao.mapper.ProductinfoMapperCustom;
import com.wsgw.base.dao.mapper.PublicinfoMapper;
import com.wsgw.base.dao.mapper.PublicinfoMapperCustom;
import com.wsgw.base.pojo.Comment;
import com.wsgw.base.pojo.CommentExample;
import com.wsgw.base.pojo.Customer;
import com.wsgw.base.pojo.CustomerExample;
import com.wsgw.base.pojo.Orderitem;
import com.wsgw.base.pojo.OrderitemExample;
import com.wsgw.base.pojo.Orders;
import com.wsgw.base.pojo.Productinfo;
import com.wsgw.base.pojo.Publicinfo;
import com.wsgw.base.pojo.vo.ProductinfoCustom;
import com.wsgw.base.process.context.Config;
import com.wsgw.base.process.result.ResultUtil;
import com.wsgw.base.service.CustomerService;
import com.wsgw.base.utils.OrderState;
import com.wsgw.base.utils.PageModel;
import com.wsgw.base.utils.StringUitl;
import com.wsgw.base.utils.UUIDBuild;

public class CustomerServiceImpl implements CustomerService {
	@Resource
	private CustomerMapper customerMapper;
	@Resource
	private ProductinfoMapper productinfoMapper;
	@Resource
	private ProductinfoMapperCustom productinfoMapperCustom;
	@Resource
	private OrdersMapperCustom ordersMapperCustom;
	@Resource
	private OrdersMapper ordersMapper;
	@Resource
	private OrderitemMapper orderitemMapper;
	@Resource
	private OrderitemMapperCustom orderitemMapperCustom;
	@Resource
	private CommentMapper commentMapper;
	@Resource
	private CommentMapperCustom commentMapperCustom;
	@Resource
	private PublicinfoMapper publicinfoMapper;
	@Resource
	private PublicinfoMapperCustom publicinfoMapperCustom;
	//根据账号查找用户
	public Customer findCusByUserid(String userid){
		CustomerExample example = new CustomerExample();
		CustomerExample.Criteria criteria = example.createCriteria();
		criteria.andUseridEqualTo(userid);
		List<Customer> list = this.customerMapper.selectByExample(example);
		if(list!=null && list.size()==1){
			return list.get(0);
		}
		return null;
		
	}
	public void insert(Customer customer) throws Exception{
		String userid = customer.getUserid();
		String pwd = customer.getPwd();
		String name = customer.getUsername();
		if(userid==null || userid==""){
			ResultUtil.throwExcepion(ResultUtil.createWarning(Config.MESSAGE, 110, null));
		}
		
		if(name==null || name==""){
			ResultUtil.throwExcepion(ResultUtil.createWarning(Config.MESSAGE, 117, null));
		}
		if(pwd==null || pwd==""){
			ResultUtil.throwExcepion(ResultUtil.createWarning(Config.MESSAGE, 111, null));
		}
		Customer customer1 = this.findCusByUserid(userid);
		if(customer1!=null){
			ResultUtil.throwExcepion(ResultUtil.createWarning(Config.MESSAGE, 213, null));
		}
		customer.setId(UUIDBuild.getUUID());
		this.customerMapper.insert(customer);
	}
	
	public List<ProductinfoCustom> findByCreateTime(PageModel pageModel){
		List<ProductinfoCustom> lists = this.productinfoMapperCustom.findByCreateTime(pageModel);
		return lists;
	}
	
	public List<ProductinfoCustom> findBySellCount(PageModel pageModel){
		List<ProductinfoCustom> lists = this.productinfoMapperCustom.findBySellCount(pageModel);
		return lists;
	}
	public List<ProductinfoCustom> findByCommend(PageModel pageModel){
		List<ProductinfoCustom> lists = this.productinfoMapperCustom.findCommend(pageModel);
		return lists;
	}
	public List<ProductinfoCustom> findEnjoyProduct(PageModel pageModel){
		List<ProductinfoCustom> lists = this.productinfoMapperCustom.findEnjoyProduct(pageModel);
		return lists;
	}
	public List<ProductinfoCustom> findByName(String name){
		List<ProductinfoCustom> lists = this.productinfoMapperCustom.findByName(name);
		return lists;
	}
	
	public Customer check(String userid,String pwd) throws Exception{
		if(userid==null || userid == ""){
			ResultUtil.throwExcepion(ResultUtil.createFail(Config.MESSAGE, 110, null));
		}
		if(pwd==null || pwd==""){
			ResultUtil.throwExcepion(ResultUtil.createFail(Config.MESSAGE, 111, null));
		}
		Customer customer = this.findCusByUserid(userid);
		if(customer==null){
			ResultUtil.throwExcepion(ResultUtil.createFail(Config.MESSAGE, 101, null));
		}
		String pwd_db = customer.getPwd();
		if(!pwd_db.equals(pwd)){
			ResultUtil.throwExcepion(ResultUtil.createFail(Config.MESSAGE, 114, null));
		}
		return customer;
	}
	
	public ProductinfoCustom findById(Integer id){
		ProductinfoCustom productinfoCustom = this.productinfoMapperCustom.findById(id);
		return productinfoCustom;
	}
	public void updateproductinfo(Productinfo productinfo){
		this.productinfoMapper.updateByPrimaryKey(productinfo);
	}
	public Productinfo findProById(Integer id){
		return this.productinfoMapper.selectByPrimaryKey(id);
	}
	public List<Orders> findOrderByCustomer(String customerId){
		return this.ordersMapperCustom.findOrderByCustomer(customerId);
	}
	
	public void createOrder(Orders orders,Set<Orderitem> cart,Customer customer){
		orders.setOrderid(StringUitl.createOrderId());
		orders.setCustomerid(customer.getId());
		Float sum = 0f;
		for(Orderitem item:cart){
			Integer productid  = item.getProductid();
			Productinfo productinfo = this.productinfoMapper.selectByPrimaryKey(productid);
			productinfo.setSellcount(productinfo.getSellcount()+1);
			this.updateproductinfo(productinfo);
			sum= sum +item.getProductprice()*item.getAmount();
			item.setOrderid(orders.getOrderid());
			
		}
		orders.setOrderstate(OrderState.UNDELIVERD.getName());
		orders.setTotalprice(sum);
		orders.setCreatetime(StringUitl.getStringTime());
		this.ordersMapper.insert(orders);
		for(Orderitem item:cart){
			item.setId(this.orderitemMapperCustom.OrderItemMax()+1);
			this.orderitemMapper.insert(item);
		}
	}
	public Customer findCustomerById(String id){
		return this.customerMapper.selectByPrimaryKey(id);
	}
	public void updateCustomer(Customer customer) throws Exception{
		String userid = customer.getUserid();
		String pwd = customer.getPwd();
		String name = customer.getUsername();
		if(userid==null || userid==""){
			ResultUtil.throwExcepion(ResultUtil.createWarning(Config.MESSAGE, 110, null));
		}
		
		if(name==null || name==""){
			ResultUtil.throwExcepion(ResultUtil.createWarning(Config.MESSAGE, 117, null));
		}
		if(pwd==null || pwd==""){
			ResultUtil.throwExcepion(ResultUtil.createWarning(Config.MESSAGE, 111, null));
		}
		Customer customer1 = this.findCusByUserid(userid);
		if(customer1!=null){
			if(!customer.getId().equals(customer1.getId())){
				ResultUtil.throwExcepion(ResultUtil.createWarning(Config.MESSAGE, 213, null));
			}
			
		}
		this.customerMapper.updateByPrimaryKey(customer);
	}
	public Integer countProduct(){
		return this.productinfoMapperCustom.count();
	}
	public List<Orderitem> findByOrderid(String orderId){
		OrderitemExample example = new OrderitemExample();
		 OrderitemExample.Criteria criteria = example.createCriteria();
		 criteria.andOrderidEqualTo(orderId);
		return this.orderitemMapper.selectByExample(example);
	}
	public Comment saveComment(Comment comment){
		comment.setCreatetime(StringUitl.getStringTime());
		comment.setId(this.commentMapperCustom.findCommentId()+1);
		this.commentMapper.insert(comment);
		return comment;
	}
	public List<Comment> findByProudctId(Integer productId){
		CommentExample example = new CommentExample();
		CommentExample.Criteria criteria = example.createCriteria();
		criteria.andProductidEqualTo(productId);
		return this.commentMapper.selectByExample(example);
	}
	public List<Publicinfo> findAllNotice(){
		return this.publicinfoMapperCustom.findAllNotice();
	}
	public Publicinfo findNoticeById(Integer id){
		return this.publicinfoMapper.selectByPrimaryKey(id);
	}
	public void updateOrder(String orderid){
		Orders orders = this.ordersMapper.selectByPrimaryKey(orderid);
		orders.setOrderstate(OrderState.FINISH.getName());
		this.ordersMapper.updateByPrimaryKey(orders);
	}
}
