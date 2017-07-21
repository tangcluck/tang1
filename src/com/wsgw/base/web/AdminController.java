package com.wsgw.base.web;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sun.java.swing.plaf.windows.resources.windows;
import com.sun.org.apache.xpath.internal.operations.Mod;
import com.wsgw.base.pojo.Customer;
import com.wsgw.base.pojo.Orders;
import com.wsgw.base.pojo.Productcategory;
import com.wsgw.base.pojo.Productinfo;
import com.wsgw.base.pojo.Publicinfo;
import com.wsgw.base.pojo.User;
import com.wsgw.base.pojo.vo.OrderQueryVO;
import com.wsgw.base.pojo.vo.ProductcategoryCustom;
import com.wsgw.base.pojo.vo.ProductinfoCustom;
import com.wsgw.base.process.context.Config;
import com.wsgw.base.process.result.ExceptionResultInfo;
import com.wsgw.base.process.result.ResultUtil;
import com.wsgw.base.process.result.SubmitResultInfo;
import com.wsgw.base.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Resource
	private AdminService adminService;
	
	@RequestMapping("/tologin.action")
	public String tologin(HttpSession session){
		session.invalidate();
		return "/admin/user/user_login";
	}
	@RequestMapping("/error.action")
	public String error(){
		return "/error";
	}
	@RequestMapping("/login.action")
	public @ResponseBody SubmitResultInfo login(String username,String password,HttpSession session) throws Exception{
		User user = this.adminService.checkLogin(username, password);
		session.setAttribute("user", user);
		return ResultUtil.createSubmitResult(ResultUtil.createSuccess(Config.MESSAGE, 107, new Object[]{user.getUsername()}));
	}
	@RequestMapping("/tomain.action")
	public String main(){
		return "/admin/main";
	}
	@RequestMapping("/categoryAdd.action")
	public String categoryAdd(Integer pid,Integer id,Model model){
		Productcategory productcategory = null;
		if(pid==null && id!=null){
			productcategory = this.adminService.findById(id);
			model.addAttribute(productcategory);
		}if(pid!=null&& id==null){
			productcategory = this.adminService.findById(pid);
			model.addAttribute(productcategory);
		}
		return "/admin/product/category_add";
	}
	@RequestMapping("/categoryList.action")
	public String categoryList(Integer pid,Model model){
		List<ProductcategoryCustom> lists = this.adminService.findCategory(pid);
		model.addAttribute(lists);
		return "/admin/product/category_list";
	}
	@RequestMapping("/categorySave.action")
	public @ResponseBody SubmitResultInfo categorySave(Productcategory productcategory) throws Exception{
		if(productcategory.getName().equals("")){
			ResultUtil.throwExcepion(ResultUtil.createWarning(Config.MESSAGE, 901, null));
		}
		this.adminService.create(productcategory);
		return ResultUtil.createSubmitResult(ResultUtil.createSuccess(Config.MESSAGE, 906, null));
	}
	@RequestMapping("/categoryEdit.action")
	public String categoryEdit(Integer id,Model model){
		Productcategory productcategory = this.adminService.findById(id);
		model.addAttribute(productcategory);
		return "/admin/product/category_edit";
	}
	@RequestMapping("/categoryDel.action")
	public @ResponseBody SubmitResultInfo categoryDel(Integer id) throws Exception{
		this.adminService.deleteProductcategory(id);
		return ResultUtil.createSubmitResult(ResultUtil.createSuccess(Config.MESSAGE, 906, null));
	}
	@RequestMapping("/productAdd.action")
	public String productAdd(Model model){
		List<ProductcategoryCustom> list = this.adminService.findAllCategory();
		model.addAttribute(list);
		return "/admin/product/product_add";
	}
	@RequestMapping("/productList.action")
	public String productList(Model model){
		List<ProductinfoCustom> lists = this.adminService.allProduct();
		model.addAttribute(lists);
		return "/admin/product/product_list";
	}
	@RequestMapping("/productEdit.action")
	public String productEdit(Integer id,Model model){
		ProductinfoCustom productinfo = this.adminService.findProductCustomById(id);
		List<ProductcategoryCustom> list = this.adminService.findAllCategory();
		model.addAttribute(productinfo);
		model.addAttribute(list);
		return "/admin/product/product_edit";
	}
	@RequestMapping("/productDel.action")
	public String productDel(@RequestParam("id") Integer id){
		this.adminService.productDel(id);
		return "redirect:productList.action";
	}
	@RequestMapping("/productSave.action")
	public @ResponseBody SubmitResultInfo productSave(ProductinfoCustom productinfoCustom,@RequestParam(required=false)MultipartFile file,HttpServletRequest request) throws Exception{
		String path = request.getSession().getServletContext().getRealPath("/upload/");
		this.adminService.saveProduct(productinfoCustom, file, path);
		return ResultUtil.createSubmitResult(ResultUtil.createSuccess(Config.MESSAGE, 906, null));
	}
	@RequestMapping("/orderList.action")
	public String orderList( OrderQueryVO orderQueryVO,Model model){
		List<Orders> lists = this.adminService.findAllOrders(orderQueryVO);
		model.addAttribute(lists);
		return "/admin/order/order_list";
	}
	@RequestMapping("/orderSelect.action")
	public String orderSelect(String orderid,Model model){
		Orders order = this.adminService.findOrderById(orderid);
		model.addAttribute(order);
		return "/admin/order/order_select";
	}
	@RequestMapping("/updateState.action")
	public String updateState(Orders order,HttpServletResponse response) throws Exception{
		this.adminService.updateOrderState(order);
		return "/admin/order/order_update_success";
	}

	@RequestMapping("/orderQuery.action")
	public String orderQuery(){
		return "/admin/order/order_query";
	}
	@RequestMapping("/customerList.action")
	public String customerList(Model model){
		List<Customer> customers = this.adminService.findAllCustomer();
		model.addAttribute(customers);
		return "/admin/customer/customer_list";
	}
	@RequestMapping("/customerDel.action")
	public String customerDel(String id){
		this.adminService.CustomerDel(id);
		return "redirect:customerList.action";
	}
	@RequestMapping("/customerEdit.action")
	public String customerEdit(String id,Model model){
		Customer customer = this.adminService.findCustomerById(id);
		model.addAttribute(customer);
		return "/admin/customer/customer_edit";
	}
	@RequestMapping("/saveCustomer.action")
	public  @ResponseBody SubmitResultInfo saveCustomer(Customer customer) throws Exception{
		this.adminService.updateCustomer(customer);
		 return ResultUtil.createSubmitResult(ResultUtil.createSuccess(Config.MESSAGE, 906, null));
	}
	@RequestMapping("/tonotice.action")
	public String toNotice(){
		return "/admin/notice/notice_add";
	}
	@RequestMapping("/addnotice.action")
	public @ResponseBody SubmitResultInfo addNotice(Publicinfo publicinfo){
		this.adminService.InsertNotice(publicinfo);
		return ResultUtil.createSubmitResult(ResultUtil.createSuccess(Config.MESSAGE, 906, null));
	}
	@RequestMapping("/noticelist.action")
	public String noticeList(Model model){
		List<Publicinfo> lists = this.adminService.findAllNotice();
		model.addAttribute(lists);
		return "/admin/notice/notice_list";
	}
	@RequestMapping("/noticeDel.action")
	public String noticeDel(Integer id){
		this.adminService.noticeDel(id);
		return "redirect:noticelist.action";
	}
	@RequestMapping("/noticeItem.action")
	public String noticeItem(Integer id,Model model){
		Publicinfo publicinfo = this.adminService.findNoticeById(id);
		model.addAttribute(publicinfo);
		return "/admin/notice/notice_item";
	}
}
