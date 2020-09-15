package com.semi.store.model.vo;

import java.sql.Date;

public class Store {
	
	private int storeNumber;
	private int storeId;
	private String storeCategory;
	public Store(int storeNumber, int storeId, String storeCategory, String storeDtlCtgry, String storeName,
			String storePhone, String storePost, String storeAddress, String storeDtlAddr, String storeExtraAddr,
			String storePage, String storeContent, String storeProfit, String storeTarget, String storeMainImg,
			String storePostImg, String storeDtlImg, int ptnNum, String storeStatus, Date requestDate) {
		super();
		this.storeNumber = storeNumber;
		this.storeId = storeId;
		this.storeCategory = storeCategory;
		this.storeDtlCtgry = storeDtlCtgry;
		this.storeName = storeName;
		this.storePhone = storePhone;
		this.storePost = storePost;
		this.storeAddress = storeAddress;
		this.storeDtlAddr = storeDtlAddr;
		this.storeExtraAddr = storeExtraAddr;
		this.storePage = storePage;
		this.storeContent = storeContent;
		this.storeProfit = storeProfit;
		this.storeTarget = storeTarget;
		this.storeMainImg = storeMainImg;
		this.storePostImg = storePostImg;
		this.storeDtlImg = storeDtlImg;
		this.ptnNum = ptnNum;
		this.storeStatus = storeStatus;
		this.requestDate = requestDate;
	}

	public int getStoreNumber() {
		return storeNumber;
	}

	public void setStoreNumber(int storeNumber) {
		this.storeNumber = storeNumber;
	}

	private String storeDtlCtgry;
	private String storeName;
	private String storePhone;	
	private String storePost;
	private String storeAddress;
	private String storeDtlAddr;
	private String storeExtraAddr;
	private String storePage;
	private String storeContent;
	private String storeProfit;
	private String storeTarget;
	private String storeMainImg;
	private String storePostImg;
	private String storeDtlImg;
	private int ptnNum;
	private String storeStatus;
	private Date requestDate;
	
	public Store() {
		super();
		// TODO Auto-generated constructor stub
	}



	@Override
	public String toString() {
		return "Store [storeNumber=" + storeNumber + ", storeId=" + storeId + ", storeCategory=" + storeCategory
				+ ", storeDtlCtgry=" + storeDtlCtgry + ", storeName=" + storeName + ", storePhone=" + storePhone
				+ ", storePost=" + storePost + ", storeAddress=" + storeAddress + ", storeDtlAddr=" + storeDtlAddr
				+ ", storeExtraAddr=" + storeExtraAddr + ", storePage=" + storePage + ", storeContent=" + storeContent
				+ ", storeProfit=" + storeProfit + ", storeTarget=" + storeTarget + ", storeMainImg=" + storeMainImg
				+ ", storePostImg=" + storePostImg + ", storeDtlImg=" + storeDtlImg + ", ptnNum=" + ptnNum
				+ ", storeStatus=" + storeStatus + ", requestDate=" + requestDate + "]";
	}

	public int getStoreId() {
		return storeId;
	}

	public void setStoreId(int storeId) {
		this.storeId = storeId;
	}

	public String getStoreCategory() {
		return storeCategory;
	}

	public void setStoreCategory(String storeCategory) {
		this.storeCategory = storeCategory;
	}

	public String getStoreDtlCtgry() {
		return storeDtlCtgry;
	}

	public void setStoreDtlCtgry(String storeDtlCtgry) {
		this.storeDtlCtgry = storeDtlCtgry;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getStorePhone() {
		return storePhone;
	}

	public void setStorePhone(String storePhone) {
		this.storePhone = storePhone;
	}

	public String getStorePost() {
		return storePost;
	}

	public void setStorePost(String storePost) {
		this.storePost = storePost;
	}

	public String getStoreAddress() {
		return storeAddress;
	}

	public void setStoreAddress(String storeAddress) {
		this.storeAddress = storeAddress;
	}

	public String getStoreDtlAddr() {
		return storeDtlAddr;
	}

	public void setStoreDtlAddr(String storeDtlAddr) {
		this.storeDtlAddr = storeDtlAddr;
	}

	public String getStoreExtraAddr() {
		return storeExtraAddr;
	}

	public void setStoreExtraAddr(String storeExtraAddr) {
		this.storeExtraAddr = storeExtraAddr;
	}

	public String getStorePage() {
		return storePage;
	}

	public void setStorePage(String storePage) {
		this.storePage = storePage;
	}

	public String getStoreContent() {
		return storeContent;
	}

	public void setStoreContent(String storeContent) {
		this.storeContent = storeContent;
	}

	public String getStoreProfit() {
		return storeProfit;
	}

	public void setStoreProfit(String storeProfit) {
		this.storeProfit = storeProfit;
	}

	public String getStoreTarget() {
		return storeTarget;
	}

	public void setStoreTarget(String storeTarget) {
		this.storeTarget = storeTarget;
	}

	public String getStoreMainImg() {
		return storeMainImg;
	}

	public void setStoreMainImg(String storeMainImg) {
		this.storeMainImg = storeMainImg;
	}

	public String getStorePostImg() {
		return storePostImg;
	}

	public void setStorePostImg(String storePostImg) {
		this.storePostImg = storePostImg;
	}

	public String getStoreDtlImg() {
		return storeDtlImg;
	}

	public void setStoreDtlImg(String storeDtlImg) {
		this.storeDtlImg = storeDtlImg;
	}

	public int getPtnNum() {
		return ptnNum;
	}

	public void setPtnNum(int ptnNum) {
		this.ptnNum = ptnNum;
	}

	public String getStoreStatus() {
		return storeStatus;
	}

	public void setStoreStatus(String storeStatus) {
		this.storeStatus = storeStatus;
	}

	public Date getRequestDate() {
		return requestDate;
	}

	public void setRequestDate(Date requestDate) {
		this.requestDate = requestDate;
	}
	
	
	

}

