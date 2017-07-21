package com.wsgw.base.dao.mapper;

import java.util.List;
import com.wsgw.base.pojo.Orders;
import com.wsgw.base.pojo.vo.OrderQueryVO;

public interface OrdersMapperCustom {
	public List<Orders> findOrderByCustomer(String customerId);
	public List<Orders> findAllOrders(OrderQueryVO orderQueryVO);
}