package com.semi.store.model.vo;

import java.sql.Connection;

public class StoreMenu {
	
	private int storeId;
	private String menuName;
	private int menuPrice;
	private int menuAmount;
	private String menuDetail;
	private String menuImg;
	private int ptnId;
	
	public StoreMenu() {
		
	}
	
	
	




	public int getPtnId() {
		return ptnId;
	}







	public void setPtnId(int ptnId) {
		this.ptnId = ptnId;
	}







	@Override
	public String toString() {
		return "StoreMenu [storeId=" + storeId + ", menuName=" + menuName + ", menuPrice=" + menuPrice + ", menuAmount="
				+ menuAmount + ", menuDetail=" + menuDetail + ", menuImg=" + menuImg + ", ptnId=" + ptnId
				+ ", getMenuImg()=" + getMenuImg() + ", getStoreId()=" + getStoreId() + ", getMenuName()="
				+ getMenuName() + ", getMenuPrice()=" + getMenuPrice() + ", getMenuAmount()=" + getMenuAmount()
				+ ", getMenuDetail()=" + getMenuDetail() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}







	public StoreMenu(int storeId, String menuName, int menuPrice, int menuAmount, String menuDetail, String menuImg,
			int ptnId) {
		super();
		this.storeId = storeId;
		this.menuName = menuName;
		this.menuPrice = menuPrice;
		this.menuAmount = menuAmount;
		this.menuDetail = menuDetail;
		this.menuImg = menuImg;
		this.ptnId = ptnId;
	}







	public String getMenuImg() {
		return menuImg;
	}



	public void setMenuImg(String menuImg) {
		this.menuImg = menuImg;
	}



	public int getStoreId() {
		return storeId;
	}

	public void setStoreId(int storeId) {
		this.storeId = storeId;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public int getMenuPrice() {
		return menuPrice;
	}

	public void setMenuPrice(int menuPrice) {
		this.menuPrice = menuPrice;
	}

	public int getMenuAmount() {
		return menuAmount;
	}

	public void setMenuAmount(int menuAmount) {
		this.menuAmount = menuAmount;
	}

	public String getMenuDetail() {
		return menuDetail;
	}

	public void setMenuDetail(String menuDetail) {
		this.menuDetail = menuDetail;
	}



	
	
	
	
	

}
