<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<style>
.mptitle h1 {
	font-family: 'S-CoreDream-8Heavy', sans-serif;
	text-align: center;
	margin: 50px;
}
</style>
<div class=submenu>
      <ul>
          <li><a class="subhome" href="main.html">HOME</a></li>
          <li><a class="subhome" href="location.html">LOCATION</a></li>
          <li><a class="subhome" href="customer_service.html">CUSTOMER SERVICE</a></li>
          
        </ul>
    </div>

    <div class="mptitle"><h1>C A R T</h1></div>
 
  
  <!--Main layout-->
  <main>
    <div class="container">

      <!--Section: Block Content-->
      <section class="mt-5 mb-4">

        <!--Grid row-->
        <div class="row">

          <!--Grid column-->
          <div class="col-lg-8">

            <!-- Card -->
            <div class="card wish-list mb-4">
              <div class="card-body">

                <h5 class="mb-4">CART (<span>2</span>  TICKET)</h5>
                <span class="cartCheckbox">
                  <input type="checkbox" name="cartSelectReleaseAll"
                      id="cartSelectReleaseAll" value="" onclick="cartSelRelAll()">
                </span>
                
                <div class="row mb-4">
                  <div class="col-md-5 col-lg-3 col-xl-3">
                    <div class="view zoom overlay z-depth-1 rounded mb-3 mb-md-0">
                      <img class="img-fluid w-100"
                        src="salmon.jpg" alt="Sample">
                      <a href="#!">
                        <div class="mask waves-effect waves-light">
                        
                          <div class="mask rgba-black-slight waves-effect waves-light"></div>
                        </div>
                      </a>
                    </div>
                  </div>
                  <div class="col-md-7 col-lg-9 col-xl-9">
                    <div>
                      <div class="d-flex justify-content-between">
                        <div>
                          <h5>한남동 레스토랑</h5>               
                      <p class="mb-3 text-muted text-uppercase small">Food - 런치 SET</p>
                      <p class="mb-2 text-muted text-uppercase small">Time: AM 11:00 </p>
                      <p class="mb-3 text-muted text-uppercase small">Person: 1</p>
                        </div>
                        <div>
                          <div class="def-number-input number-input safari_only mb-0 w-100">
                            
                            <input class="quantity" min="0" name="quantity" value="1" type="number">
                            
                          </div>
                          <small id="passwordHelpBlock" class="form-text text-muted text-center">
                            (Note, 1 piece)
                          </small>
                        </div>
                      </div>                    
                      <div class="d-flex justify-content-between align-items-center">
                        <div>
                          <a href="#!" type="button" class="card-link-secondary small text-uppercase mr-3"><i
                              class="fas fa-trash-alt mr-1"></i> Remove item </a>
                          
                        </div>
                        <p class="mb-0"><span><strong>₩15,000</strong></span></p>
                      </div>
                    </div>
                  </div>
                </div>


                
                
               
                
              </div>
              
            </div>
<div>
                <button type="button" class="btn-white-small"
                                    onclick="cartSelectAll();">전체 선택</button>
                                <button type="button" class="btn-white-small"
                                    onclick="cartReleaseAll();">선택 해제</button>
                                <button type="button" class="btn-white-small" 
                                    onclick="cartSelectDelete()">삭제</button>
                                   
                      </div>    
          
          
          </div>


          <!--Grid column-->
          <div class="col-lg-4">

            <!-- Card -->
            <div class="card mb-4">
              <div class="card-body">

                <h5 class="mb-3">결제 금액</h5>

                <ul class="list-group list-group-flush">
                  <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">
                    총 금액
                    <span>₩32,000</span>
                  </li>
                  <li class="list-group-item d-flex justify-content-between align-items-center px-0">
                   배송비
                    <span>무료</span>
                  </li>
                  <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
                    <div>
                      <strong>총 결제예정금액 </strong>
                      <strong>
                        <p class="mb-0">(VAT 포함)</p>
                      </strong>
                    </div>
                    <span><strong>₩32,000</strong></span>
                  </li>
                </ul>

                <button type="button" class="btn btn-primary btn-block waves-effect waves-light" onclick="location.href='orderpay(주문창).html'">go to
                  checkout</button>
 
              </div>
            </div>
            <!-- Card -->

                <div class="collapse" id="collapseExample">
                  <div class="mt-3">
                    <div class="md-form md-outline mb-0">
                      <input type="text" id="discount-code" class="form-control font-weight-light"
                        placeholder="Enter discount code">
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- Card -->

          </div>
          <!--Grid column-->

        </div>
        <!--Grid row-->

      </section>
<%@ include file="/views/common/footer.jsp"%>