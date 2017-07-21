package com.wsgw.base.utils;

import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpSession;

import com.wsgw.base.pojo.Orderitem;

public class SessionUtil {

	@SuppressWarnings("unchecked")
	public static Set<Orderitem> getCart(HttpSession session){
		Object obj = session.getAttribute("cart");
		if(obj==null){
			return new HashSet<Orderitem>();
		}else{
			return (Set<Orderitem>) obj;
		}
	}
}
