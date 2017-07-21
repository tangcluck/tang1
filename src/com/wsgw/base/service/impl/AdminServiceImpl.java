package com.wsgw.base.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.web.multipart.MultipartFile;

import com.wsgw.base.dao.mapper.CustomerMapper;
import com.wsgw.base.dao.mapper.CustomerMapperCustom;
import com.wsgw.base.dao.mapper.OrdersMapper;
import com.wsgw.base.dao.mapper.OrdersMapperCustom;
import com.wsgw.base.dao.mapper.ProductcategoryMapper;
import com.wsgw.base.dao.mapper.ProductcategoryMapperCustom;
import com.wsgw.base.dao.mapper.ProductinfoMapper;
import com.wsgw.base.dao.mapper.ProductinfoMapperCustom;
import com.wsgw.base.dao.mapper.PublicinfoMapper;
import com.wsgw.base.dao.mapper.PublicinfoMapperCustom;
import com.wsgw.base.dao.mapper.UploadfileMapper;
import com.wsgw.base.dao.mapper.UserMapper;
import com.wsgw.base.pojo.Customer;
import com.wsgw.base.pojo.CustomerExample;
import com.wsgw.base.pojo.Orders;
import com.wsgw.base.pojo.Productcategory;
import com.wsgw.base.pojo.Productinfo;
import com.wsgw.base.pojo.ProductinfoExample;
import com.wsgw.base.pojo.Publicinfo;
import com.wsgw.base.pojo.Uploadfile;
import com.wsgw.base.pojo.User;
import com.wsgw.base.pojo.UserExample;
import com.wsgw.base.pojo.vo.OrderQueryVO;
import com.wsgw.base.pojo.vo.ProductcategoryCustom;
import com.wsgw.base.pojo.vo.ProductinfoCustom;
import com.wsgw.base.process.context.Config;
import com.wsgw.base.process.result.ExceptionResultInfo;
import com.wsgw.base.process.result.ResultUtil;
import com.wsgw.base.service.AdminService;
import com.wsgw.base.utils.StringUitl;

public class AdminServiceImpl implements AdminService{
	@Resource
	private UserMapper userMapper;
	@Resource
	private ProductcategoryMapperCustom productcategoryMapperCustom;
	@Resource
	private ProductcategoryMapper productcategoryMapper;
	@Resource
	private ProductinfoMapperCustom productinfoMapperCustom;
	@Resource
	private UploadfileMapper uploadfileMapper;
	@Resource
	private ProductinfoMapper productinfoMapper;
	@Resource
	private OrdersMapperCustom ordersMapperCustom;
	@Resource
	private OrdersMapper ordersMapper;
	@Resource
	private CustomerMapperCustom customerMapperCustom;
	@Resource
	private CustomerMapper customerMapper;
	@Resource
	private PublicinfoMapper publicinfoMapper;
	@Resource
	private PublicinfoMapperCustom publicinfoMapperCustom;
	//根据用户名查找用户
	public User findByName(String username){
		UserExample example = new UserExample();
		UserExample.Criteria criteria = example.createCriteria();
		criteria.andUsernameEqualTo(username);
		List<User> list =  this.userMapper.selectByExample(example);
		if(list!=null && list.size()>0){
			return list.get(0);
		}
		return null;
	}
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
	//根据类别id查找商品
	public Productinfo findProByCategoryId(int id){
		ProductinfoExample example = new ProductinfoExample();
		ProductinfoExample.Criteria criteria = example.createCriteria();
		criteria.andCategoryidEqualTo(id);
		List<Productinfo> list = this.productinfoMapper.selectByExample(example);
		if(list!=null && list.size()>0){
			return list.get(0);
		}
		return null;
	}
	public User checkLogin(String username,String password) throws Exception{
		if(username==null || username==""){
			ResultUtil.throwExcepion(ResultUtil.createFail(Config.MESSAGE, 110, null));
		}
		if(password==null || password==""){
			ResultUtil.throwExcepion(ResultUtil.createFail(Config.MESSAGE, 111, null));
		}
		User user = this.findByName(username);
		if(user==null){
			ResultUtil.throwExcepion(ResultUtil.createFail(Config.MESSAGE, 101, null));
		}
		String pwd = user.getPassword();
		if(!pwd.equals(password)){
			ResultUtil.throwExcepion(ResultUtil.createFail(Config.MESSAGE, 114, null));
		}
		return user;
	}
	
	public List<ProductcategoryCustom> findCategory(Integer pid){
		return this.productcategoryMapperCustom.findCategory(pid);
	}
	
	public Integer findMaxId(){
		return this.productcategoryMapperCustom.maxId();
	}
	public void create(Productcategory productcategory){
		Integer id =productcategory.getId();
		Integer pid = productcategory.getPid();
		Integer level = productcategory.getLevel();
		Integer max = this.productcategoryMapperCustom.maxId();
		if(id==null){
			if(pid==null){
				productcategory.setId(max+1);
				productcategory.setLevel(1);
				this.productcategoryMapper.insert(productcategory);
				return ;
			}
			productcategory.setId(max+1);
			productcategory.setLevel(productcategory.getLevel()+1);
			this.productcategoryMapper.insert(productcategory);
			return ;
		}
		if(level==1){
			productcategory.setPid(null);
		}
		this.productcategoryMapper.updateByPrimaryKey(productcategory);
	}
	public Productcategory findById(Integer id){
		return this.productcategoryMapper.selectByPrimaryKey(id);
	}
	public void deleteProductcategory(Integer id) throws Exception{
		Productcategory productcategory = this.findById(id);
		int cid = productcategory.getId();
		Productinfo productinfo = this.findProByCategoryId(cid);
		if(productinfo!=null){
			ResultUtil.throwExcepion(ResultUtil.createFail(Config.MESSAGE, 125, null));
		}else{
			productcategory.setPid(null);
			this.productcategoryMapper.updateByPrimaryKey(productcategory);
			this.productcategoryMapper.deleteByPrimaryKey(id);
		}
		
	}
	public List<ProductinfoCustom> allProduct(){
		return this.productinfoMapperCustom.productList();
	}
	public List<ProductcategoryCustom> findAllCategory(){
		return this.productcategoryMapperCustom.findAllCategory();
	}
	public void saveProduct(ProductinfoCustom productinfoCustom,MultipartFile file,String path) throws Exception{
		Integer id =productinfoCustom.getId();
		Productinfo product = new Productinfo();
		if(id!=null){
			if(file==null){
				productinfoCustom.setCreatetime(StringUitl.getStringTime());
				BeanUtils.copyProperties(productinfoCustom, product);
				this.productinfoMapper.updateByPrimaryKeyWithBLOBs(product);
				return;
			}else{
				String filename = StringUitl.getTimeString()+".jpg";
				File targetFile = new File(path, filename);
				if(!targetFile.exists()){
					targetFile.mkdir();
				}
				try {
					file.transferTo(targetFile);
				}  catch (IOException e) {
					e.printStackTrace();
				}
				Uploadfile uploadfile = new Uploadfile();
				uploadfile.setPath(filename);
				uploadfile.setId(productinfoCustom.getUploadfile());
				this.uploadfileMapper.updateByPrimaryKey(uploadfile);
				productinfoCustom.setCreatetime(StringUitl.getStringTime());
				BeanUtils.copyProperties(productinfoCustom, product);
				this.productinfoMapper.updateByPrimaryKeyWithBLOBs(product);
				return;
			}
		}else{
			if(file!=null){
				String filename = StringUitl.getTimeString()+".jpg";
				File targetFile = new File(path, filename);
				if(!targetFile.exists()){
					targetFile.mkdir();
				}
				try {
					file.transferTo(targetFile);
				}  catch (IOException e) {
					e.printStackTrace();
				}
				Uploadfile uploadfile = new Uploadfile();
				uploadfile.setPath(filename);
				int max = this.uploadfileMapper.max();
				uploadfile.setId(max+1);
				this.uploadfileMapper.insert(uploadfile);
				productinfoCustom.setUploadfile(uploadfile.getId());
				productinfoCustom.setId(this.productinfoMapperCustom.max()+1);
				productinfoCustom.setClickcount(0);
				productinfoCustom.setCreatetime(StringUitl.getStringTime());
				productinfoCustom.setSellcount(0);
				
				BeanUtils.copyProperties(productinfoCustom, product);
				this.productinfoMapper.insert(product);
			}else{
				ResultUtil.throwExcepion(ResultUtil.createFail(Config.MESSAGE, 116, null));
			}
		}
	}
	public void productDel(Integer id){
		Productinfo productinfo = this.productinfoMapper.selectByPrimaryKey(id);
		Integer uploadFile = productinfo.getUploadfile();
		productinfo.setUploadfile(null);
		productinfo.setCategoryid(null);
		this.productinfoMapper.updateByPrimaryKey(productinfo);
		this.uploadfileMapper.deleteByPrimaryKey(uploadFile);
		this.productinfoMapper.deleteByPrimaryKey(id);
	}
	public ProductinfoCustom findProductCustomById(Integer id){
		return this.productinfoMapperCustom.findById(id);
	}
	public List<Orders> findAllOrders(OrderQueryVO orderQueryVO){
		return this.ordersMapperCustom.findAllOrders(orderQueryVO);
	}
	public Orders findOrderById(String orderid){
		return this.ordersMapper.selectByPrimaryKey(orderid);
	}
	public void updateOrderState(Orders order){
		Orders orders = this.ordersMapper.selectByPrimaryKey(order.getOrderid());
		orders.setOrderstate(order.getOrderstate());
		this.ordersMapper.updateByPrimaryKey(orders);
	}
	public List<Customer> findAllCustomer(){
		return this.customerMapperCustom.allCustomer();
	}
	
	public void CustomerDel(String id){
		this.customerMapper.deleteByPrimaryKey(id);
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
	public void InsertNotice(Publicinfo publicinfo){
		publicinfo.setId(this.publicinfoMapperCustom.findNoticeId()+1);
		publicinfo.setTime(StringUitl.getStringTime());
		this.publicinfoMapper.insert(publicinfo);
	}
	public List<Publicinfo> findAllNotice(){
		return this.publicinfoMapperCustom.findAllNotice();
	}
	public void noticeDel(Integer id){
		this.publicinfoMapper.deleteByPrimaryKey(id);
	}
	public Publicinfo findNoticeById(Integer id){
		return this.publicinfoMapper.selectByPrimaryKey(id);
	}
}
