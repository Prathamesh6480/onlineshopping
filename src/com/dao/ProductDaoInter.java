package com.dao;

import java.util.*;

import com.entities.AddProduct;
import com.entities.Supplier;

public interface ProductDaoInter {
	
	public boolean addProduct(AddProduct ap);
	
	public AddProduct getProductEditById(int id);
	public List<AddProduct> getAllProduct(String category);
	
	public boolean updateProduct(AddProduct ap);
	
	public boolean deleteProduct(int id);
	
	public List<AddProduct> getNewProduct();
	
	public List<AddProduct> getProductBySearch(String ch);
	
}
