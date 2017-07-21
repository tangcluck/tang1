package com.wsgw.base.web;

import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.wsgw.base.pojo.Comment;
import com.wsgw.base.pojo.Customer;
import com.wsgw.base.pojo.Orderitem;
import com.wsgw.base.pojo.Orders;
import com.wsgw.base.pojo.Productinfo;
import com.wsgw.base.pojo.Publicinfo;
import com.wsgw.base.pojo.vo.ProductinfoCustom;
import com.wsgw.base.process.context.Config;
import com.wsgw.base.process.result.ResultUtil;
import com.wsgw.base.process.result.SubmitResultInfo;
import com.wsgw.base.service.CustomerService;
import com.wsgw.base.utils.PageModel;
import com.wsgw.base.utils.SessionUtil;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	@Resource
	CustomerService customerService;

	@RequestMapping("/first.action")
	public String first(){
		return "/front/first";
	}
	
	@RequestMapping("/toregiste")
	public String toRegiste(){
		return "/front/customer_reg";
	}
	
	@RequestMapping("/registe.action")
	public @ResponseBody SubmitResultInfo registe(Customer customer) throws Exception{
		this.customerService.insert(customer);
		return ResultUtil.createSubmitResult(ResultUtil.createSuccess(Config.MESSAGE, 108, null));
	}
	
	@RequestMapping("/tologin")
	public String toLogin(){
		return "/front/customer_login";
	}
	@RequestMapping("/findNewProduct")
	public String findNew(){
		return "/front/product/product_list";
	}
	
	@RequestMapping("/findNewProduct.action")
	public String findNewProduct(Integer currentPage,Model model,HttpServletRequest request){
		PageModel pageModel = new PageModel();
		Integer count =this.customerService.countProduct();
		if(currentPage==null){
			pageModel.setCurrentPage(pageModel.getFirst());
		}else{
			pageModel.setCurrentPage(currentPage);
		}
		pageModel.setLast(count);
		pageModel.setPath(request.getServletPath());
		pageModel.setStartIndex(pageModel.getCurrentPage(), pageModel.getSize());
		List<ProductinfoCustom> lists = this.customerService.findByCreateTime(pageModel);
		String image = "01.gif";
		model.addAttribute(lists);
		model.addAttribute(image);
		model.addAttribute(pageModel);
		return "/front/product/product_list";
	}
	
	@RequestMapping("findSellProduct.action")
	public String findSellProduct(Integer currentPage,Model model,HttpServletRequest request){
		PageModel pageModel = new PageModel();
		Integer count =this.customerService.countProduct();
		if(currentPage==null){
			pageModel.setCurrentPage(pageModel.getFirst());
		}else{
			pageModel.setCurrentPage(currentPage);
		}
		pageModel.setLast(count);
		pageModel.setPath(request.getServletPath());
		pageModel.setStartIndex(pageModel.getCurrentPage(), pageModel.getSize());
		List<ProductinfoCustom> lists = this.customerService.findBySellCount(pageModel);
		String image = "03.gif";
		model.addAttribute(lists);
		model.addAttribute(image);
		model.addAttribute(pageModel);
		return "/front/product/product_list";
	}
	@RequestMapping("/findCommendProduct.action")
	public String findCommendProduct(Integer currentPage,Model model,HttpServletRequest request){
		PageModel pageModel = new PageModel();
		Integer count =this.customerService.countProduct();
		if(currentPage==null){
			pageModel.setCurrentPage(pageModel.getFirst());
		}else{
			pageModel.setCurrentPage(currentPage);
		}
		pageModel.setLast(count);
		pageModel.setPath(request.getServletPath());
		pageModel.setStartIndex(pageModel.getCurrentPage(), pageModel.getSize());
		List<ProductinfoCustom> lists = this.customerService.findByCommend(pageModel);
		String image = "06.gif";
		model.addAttribute(lists);
		model.addAttribute(image);
		model.addAttribute(pageModel);
		return "/front/product/product_list";
	}
	@RequestMapping("/findEnjoyProduct.action")
	public String findEnjoyProduct(Integer currentPage,Model model,HttpServletRequest request){
		PageModel pageModel = new PageModel();
		Integer count =this.customerService.countProduct();
		if(currentPage==null){
			pageModel.setCurrentPage(pageModel.getFirst());
		}else{
			pageModel.setCurrentPage(currentPage);
		}
		pageModel.setLast(count);
		pageModel.setPath(request.getServletPath());
		pageModel.setStartIndex(pageModel.getCurrentPage(), pageModel.getSize());
		List<ProductinfoCustom> lists = this.customerService.findEnjoyProduct(pageModel);
		String image = "07.gif";
		model.addAttribute(lists);
		model.addAttribute(pageModel);
		model.addAttribute(image);
		return "/front/product/product_list";
	}
	@RequestMapping("/findByClick.action")
	public String findByClick(Model model){
		PageModel pageModel = new PageModel();
		pageModel.setCurrentPage(pageModel.getFirst());
		pageModel.setSize(3);
		pageModel.setStartIndex(pageModel.getCurrentPage(), pageModel.getSize());
		List<ProductinfoCustom> lists = this.customerService.findEnjoyProduct(pageModel);
		model.addAttribute(lists);
		return "/front/product/product_click_list";
	}
	@RequestMapping("/findByCommend.action")
	public String findByCommend(Model model){
		PageModel pageModel = new PageModel();
		pageModel.setCurrentPage(pageModel.getFirst());
		pageModel.setSize(3);
		pageModel.setStartIndex(pageModel.getCurrentPage(), pageModel.getSize());
		List<ProductinfoCustom> lists = this.customerService.findByCommend(pageModel);
		model.addAttribute(lists);
		return "/front/product/product_find_list";
	}
	@RequestMapping("/findBySellCount.action")
	public String findBySellCount(Model model){
		PageModel pageModel = new PageModel();
		pageModel.setCurrentPage(pageModel.getFirst());
		pageModel.setSize(3);
		pageModel.setStartIndex(pageModel.getCurrentPage(), pageModel.getSize());
		List<ProductinfoCustom> lists = this.customerService.findBySellCount(pageModel);
		model.addAttribute(lists);
		return "/front/product/product_find_list";
	}
	@RequestMapping("/findByName.action")
	public String findByName(String name,Model model){
		List<ProductinfoCustom> lists = this.customerService.findByName(name);
		String image = "04.gif";
		model.addAttribute(lists);
		model.addAttribute(image);
		return "/front/product/product_list";
	}
	@RequestMapping("/login.action")
	public @ResponseBody SubmitResultInfo login (String userid,String pwd,HttpSession session) throws Exception{
		Customer customer = this.customerService.check(userid, pwd);
		session.setAttribute("customer", customer);
		return ResultUtil.createSubmitResult(ResultUtil.createSuccess(Config.MESSAGE, 109, new Object[]{customer.getUsername()}));
	}
	@RequestMapping("/logout.action")
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:/customer/first.action";
	}
	@RequestMapping("/cartlist.action")
	public String cartList(HttpSession session) throws Exception{
		Customer customer = (Customer) session.getAttribute("customer");
		if(customer==null){
			return "redirect:/customer/tologin.action";
		}
		return "/front/cart_list";
	}
	@RequestMapping("/orderlist.action")
	public String orderList(HttpSession session,Model model) throws Exception{
		Customer customer = (Customer) session.getAttribute("customer");
		if(customer==null){
			return "redirect:/customer/tologin.action";
		}
		String customerId = customer.getId();
		List<Orders> orders = this.customerService.findOrderByCustomer(customerId);
		model.addAttribute(orders);
		return "/front/order/order_list";
	}
	@RequestMapping("/selectproduct.action")
	public String selectProduct(Integer id,Model model){
		ProductinfoCustom productinfoCustom = this.customerService.findById(id);
		Productinfo productinfo = new Productinfo();
		BeanUtils.copyProperties(productinfoCustom, productinfo);
		productinfo.setClickcount(productinfoCustom.getClickcount()+1);
		this.customerService.updateproductinfo(productinfo);
		model.addAttribute(productinfoCustom);
		return "/front/product/product_select";
	}
	
	@RequestMapping("/addcart.action")
	public String addCart(Integer productId,HttpSession session){
		Customer customer = (Customer) session.getAttribute("customer");
		if(customer==null){
			return "redirect:/customer/tologin.action";
		}
		if(productId != null && productId > 0){
			Set<Orderitem> cart = SessionUtil.getCart(session);
			boolean flag = false;
			for(Orderitem item:cart){
				if(productId == item.getProductid()){
					item.setAmount(item.getAmount()+1);
					flag = true;
				}
			}
			if(!flag){
				Orderitem item = new Orderitem();
				Productinfo productinfo = this.customerService.findProById(productId);
				item.setProductname(productinfo.getName());
				item.setProductid(productinfo.getId());
				item.setProductprice(productinfo.getSellprice());
				item.setProductMarketprice(productinfo.getMarketprice());
				item.setAmount(1);
				cart.add(item);
			}
			session.setAttribute("cart", cart);
		}
		return "/front/cart_list";
	}
	@RequestMapping("/deleteCartOne.action")
	public String deleteCartOne(Integer productid,HttpSession session){
		Set<Orderitem> cart = (Set<Orderitem>) session.getAttribute("cart");
		for(Orderitem item:cart){
			if(productid == item.getProductid()){
				cart.remove(item);
			}
		}
		session.setAttribute("cart",cart);
		return "/front/cart_list";
	}
	@RequestMapping("/clearCart.action")
	public String clearCart(HttpSession session){
		session.removeAttribute("cart");
		return "/front/cart_list";
	}
	@RequestMapping("/addOrder.action")
	public String addOrder(HttpSession session,Model model){
		Customer customer = (Customer) session.getAttribute("customer");
		Orders orders = new Orders();
		orders.setAddress(customer.getAddr());
		orders.setMobile(customer.getPhone());
		orders.setName(customer.getUsername());
		model.addAttribute(orders);
		return "/front/order/order_add";
	}
	@RequestMapping("/orderConfirm.action")
	public String orderConfirm(Orders orders,Model model){
		model.addAttribute(orders);
		return "/front/order/order_confirm";
	}
	@RequestMapping("/saveOrder.action")
	public String saveOrder(Orders orders,HttpSession session){
		Set<Orderitem> cart = (Set<Orderitem>) session.getAttribute("cart");
		Customer customer = (Customer) session.getAttribute("customer");
		this.customerService.createOrder(orders, cart, customer);
		session.removeAttribute("cart");
		return "redirect:/customer/orderlist.action";
	}
	@RequestMapping("/orderItem.action")
	public String orderItem(String orderId,Model model){
		List<Orderitem> lists = this.customerService.findByOrderid(orderId);
		model.addAttribute(lists);
		return "/front/order/order_item";
	}
	@RequestMapping("/toComment.action")
	public String toComment(Integer productId,Model model){
		ProductinfoCustom productinfoCustom = this.customerService.findById(productId);
		model.addAttribute(productinfoCustom);
		return "/front/order/order_item_comment";
	}
	@RequestMapping("/comment.action")
	public @ResponseBody SubmitResultInfo comment(Comment comment,Model model,HttpSession session){
		Customer customer = (Customer) session.getAttribute("customer");
		comment.setCreatename(customer.getUsername());
		Comment comment2 = this.customerService.saveComment(comment);
		model.addAttribute(comment2);
		return ResultUtil.createSubmitResult(ResultUtil.createSuccess(Config.MESSAGE, 119, null));
	}
	@RequestMapping("/commentInfo.action")
	public String commentInfo(Integer productId,Model model){
		List<Comment> lists = this.customerService.findByProudctId(productId);
		model.addAttribute(lists);
		return "/front/comment/comment";
	}
	@RequestMapping("/customerinfo.action")
	public String customInfo(HttpSession session,Model model){
		Customer customer1 = (Customer) session.getAttribute("customer");
		String id = customer1.getId();
		Customer customer = this.customerService.findCustomerById(id);
		model.addAttribute(customer);
		return "/front/customer/customer_info";
	}
	@RequestMapping("/editCustomer.action")
	public String editCustomer(String id,Model model){
		Customer customer = this.customerService.findCustomerById(id);
		model.addAttribute(customer);
		return "/front/customer/customer_edit";
	}
	@RequestMapping("/saveCustomer.action")
	public @ResponseBody SubmitResultInfo saveCustomer(Customer customer) throws Exception{
		this.customerService.updateCustomer(customer);
		 return ResultUtil.createSubmitResult(ResultUtil.createSuccess(Config.MESSAGE, 906, null));
	}
	@RequestMapping("/noticelist.action")
	public String noticeList(Model model){
		List<Publicinfo> lists = this.customerService.findAllNotice();
		model.addAttribute(lists);
		return "/front/notice/notice_list";
	}
	@RequestMapping("/noticeItem.action")
	public String noticeItem(Integer id,Model model){
		Publicinfo publicinfo = this.customerService.findNoticeById(id);
		model.addAttribute(publicinfo);
		return "/front/notice/notice_item";
	}
	@RequestMapping("/updateStatus.action")
	public @ResponseBody SubmitResultInfo updateStutus(String orderid){
		this.customerService.updateOrder(orderid);
		return ResultUtil.createSubmitResult(ResultUtil.createSuccess(Config.MESSAGE, 906, null));
	}
}
