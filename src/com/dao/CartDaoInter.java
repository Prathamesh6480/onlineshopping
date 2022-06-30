package com.dao;


import java.util.List;

import com.entities.Cart;

public interface CartDaoInter {
	public boolean addCart(Cart cart);
	public List<Cart> getProductByUser(int userId);
	

}
