package com.semi.admin.store.vo;

public class Store {

	private int StoreId;
	private String category;
	private String detailCategory;
	private String storeName;
	private String phone;
	private String storePost;
	private String storeAddr;
	private String storeDetailAddr;
	private String storeExtraAddr;
	private String storeContent;
	private String homepage;
	private String mainImg;
	private String postImg;
	private String detailImg;
	private int partnerNum;
	private String joinStatus;
	
	public Store() {
		// TODO Auto-generated constructor stub
	}

	public Store(int storeId, String category, String detailCategory, String storeName, String phone, String storePost,
			String storeAddr, String storeDetailAddr, String storeExtraAddr, String storeContent, String homepage,
			String mainImg, String postImg, String detailImg, int partnerNum, String joinStatus) {
		super();
		StoreId = storeId;
		this.category = category;
		this.detailCategory = detailCategory;
		this.storeName = storeName;
		this.phone = phone;
		this.storePost = storePost;
		this.storeAddr = storeAddr;
		this.storeDetailAddr = storeDetailAddr;
		this.storeExtraAddr = storeExtraAddr;
		this.storeContent = storeContent;
		this.homepage = homepage;
		this.mainImg = mainImg;
		this.postImg = postImg;
		this.detailImg = detailImg;
		this.partnerNum = partnerNum;
		this.joinStatus = joinStatus;
	}

	public int getStoreId() {
		return StoreId;
	}

	public void setStoreId(int storeId) {
		StoreId = storeId;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getDetailCategory() {
		return detailCategory;
	}

	public void setDetailCategory(String detailCategory) {
		this.detailCategory = detailCategory;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getStorePost() {
		return storePost;
	}

	public void setStorePost(String storePost) {
		this.storePost = storePost;
	}

	public String getStoreAddr() {
		return storeAddr;
	}

	public void setStoreAddr(String storeAddr) {
		this.storeAddr = storeAddr;
	}

	public String getStoreDetailAddr() {
		return storeDetailAddr;
	}

	public void setStoreDetailAddr(String storeDetailAddr) {
		this.storeDetailAddr = storeDetailAddr;
	}

	public String getStoreExtraAddr() {
		return storeExtraAddr;
	}

	public void setStoreExtraAddr(String storeExtraAddr) {
		this.storeExtraAddr = storeExtraAddr;
	}

	public String getStoreContent() {
		return storeContent;
	}

	public void setStoreContent(String storeContent) {
		this.storeContent = storeContent;
	}

	public String getHomepage() {
		return homepage;
	}

	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}

	public String getMainImg() {
		return mainImg;
	}

	public void setMainImg(String mainImg) {
		this.mainImg = mainImg;
	}

	public String getPostImg() {
		return postImg;
	}

	public void setPostImg(String postImg) {
		this.postImg = postImg;
	}

	public String getDetailImg() {
		return detailImg;
	}

	public void setDetailImg(String detailImg) {
		this.detailImg = detailImg;
	}

	public int getPartnerNum() {
		return partnerNum;
	}

	public void setPartnerNum(int partnerNum) {
		this.partnerNum = partnerNum;
	}

	public String getJoinStatus() {
		return joinStatus;
	}

	public void setJoinStatus(String joinStatus) {
		this.joinStatus = joinStatus;
	}

	@Override
	public String toString() {
		return "Store [StoreId=" + StoreId + ", category=" + category + ", detailCategory=" + detailCategory
				+ ", storeName=" + storeName + ", phone=" + phone + ", storePost=" + storePost + ", storeAddr="
				+ storeAddr + ", storeDetailAddr=" + storeDetailAddr + ", storeExtraAddr=" + storeExtraAddr
				+ ", storeContent=" + storeContent + ", homepage=" + homepage + ", mainImg=" + mainImg + ", postImg="
				+ postImg + ", detailImg=" + detailImg + ", partnerNum=" + partnerNum + ", joinStatus=" + joinStatus
				+ "]";
	}
	
}
