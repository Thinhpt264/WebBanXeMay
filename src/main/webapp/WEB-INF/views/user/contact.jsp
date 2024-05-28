<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.ResourceBundle"%>
 <%
 	HttpSession httpSession = request.getSession();
	String lang = "vi";
	if(httpSession.getAttribute("language") != null){
		lang = httpSession.getAttribute("language").toString();
	}
	ResourceBundle messages = ResourceBundle.getBundle("messages", new Locale(lang));
 
 %>
    <!-- Contact Start -->
    <div class="container-fluid py-1">
        <div class="container pt-5 pb-3">
            <h1 class="display-4 text-uppercase text-center mb-5"><%= messages.getString("lien_he_voi_chung_toi") %></h1>
            <div class="row">
                <div class="col-lg-7 mb-2">
                    <div class="contact-form bg-light mb-4" id="before" style="padding: 30px;">
                        <form id="formContact" onsubmit="return false;" method="get">
                            <div class="d-flex justify-content-center"><h3><%= messages.getString("thong_tin") %></h3></div>
                            <div class="row">
                                <div class="col-6 form-group">
                                    <input type="text" id="name" name="name" class="form-control p-4" placeholder="<%= messages.getString("ten_cua_ban") %>" required="required">
                                </div>
                                <div class="col-6 form-group">
                                    <input type="email" id="email" name="email" class="form-control p-4" placeholder="Email" required="required">
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="text" id="phone" name="phone"class="form-control p-4" placeholder="<%= messages.getString("so_dien_thoai") %>" required="required">
                            </div>
                            <div class="form-group">
                                <textarea class="form-control py-3 px-4" id="content" name="content" rows="5" placeholder="<%= messages.getString("yeu_cau_tu_van") %>" required="required"></textarea>
                            </div>
                            <div>
                                <button class="btn btn-primary py-3 px-5" id="button" type="submit"><%= messages.getString("gui_yeu_cau") %></button>
                            </div>
                        </form>
                    </div>
                    <script type="text/javascript">
                    	$(document).ready(function() {
                    		$('#button').click(function() {
                    			var name1 =  document.getElementById("name").value;
                    			var email = document.getElementById("email").value;
                    			var phone =   document.getElementById("phone").value;
                    			var content =  document.getElementById("content").value;
console.log(name);
                    			console.log(email);
                    			console.log(phone);
                    			console.log(content);
                    			$.ajax({
                    				method: 'GET',
                    				url: '${pageContext.request.contextPath}/contact',
                    				dataType: 'json',
                    				contentType: 'application/json; charset=utf-8',
                    				data: {
                    					action: 'addNewContact',
                    					name: name1,
                    					email: email,
                    					phone: phone,
                    					content: content
                    				},
        							success: function(contact) {
        								document.getElementById("before").style.display = "none";
        								document.getElementById("after").style.display = "block";
										var name = contact.name;
										var email = contact.email;
										var phone = contact.phone;
										var content = contact.content;
										$('#nameContact').html(name);
										$('#emailContact').html(email);
										$('#phoneContact').html(phone);
										$('#contentContact').html(content);

										
									}
                    			})
                    		})
                    	})
                    </script>
                    <div class="contact-form bg-light mb-4" id="after" style="padding: 30px; display: none">
                       <div class="d-flex justify-content-center"><h3><%= messages.getString("cam_on") %> </h3></div>
                       <div class="row">
                                <div class="col-6 form-group">
                                   <%= messages.getString("ten_cua_ban") %>: <span id="nameContact"> </span>
                                </div>
                                <div class="col-6 form-group">
                                   Email: <span id="emailContact"> </span>
                                </div>
                                <div class="col-6 form-group">
									<%= messages.getString("so_dien_thoai") %>: <span id="phoneContact"></span>
                            	</div>
	                            <div class="col-6 form-group">
	                               <%= messages.getString("yeu_cau_tu_van") %>: <span id="contentContact"></span>
	                            </div>
	                           <button onclick="toggleDivs()" class="btn btn-primary py-3 px-5" id="button2">OK</button>
	                           
                            </div>
                    </div>
                    <script>
							    function toggleDivs() {
							      var div1 = document.getElementById("before");
							      var div2 = document.getElementById("after");
							
							      if (div1.style.display === "none") {
							        div1.style.display = "block";
							        div2.style.display = "none";
							    }
							    }
					</script>
                </div>
<div class="col-lg-5 mb-2">
                    <div class="bg-secondary d-flex flex-column justify-content-center px-5 mb-4" style="height: 435px;">
                        <div class="d-flex mb-3">
                            <i class="fa fa-2x fa-map-marker-alt text-primary flex-shrink-0 mr-3"></i>
                            <div class="mt-n1">
                                <h5 class="text-light"><%= messages.getString("dia_chi") %></h5>
                                <p><%= messages.getString("content_diachi") %></p>
                            </div>
                        </div>
                        
                        <div class="d-flex mb-3">
                            <i class="fa fa-2x fa-envelope-open text-primary flex-shrink-0 mr-3"></i>
                            <div class="mt-n1">
                                <h5 class="text-light"><%= messages.getString("ho_tro") %></h5>
                                <p>tmotoshop.service@gmail.com</p>
                            </div>
                        </div>
                        <div class="d-flex">
                            <i class="fa fa-2x fa-phone text-primary flex-shrink-0 mr-3"></i>

                            <div class="mt-n1">
                                <h5 class="text-light"></h5>
                                <p class="m-0">0326767031</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Contact End -->
    <div class="container-fluid py-1">
        <div class="container pt-3 pb-3">
            <h1 class="display-1 text-primary text-center">06</h1>
            <h1 class="display-4 text-uppercase text-center mb-5">h<%= messages.getString("han_hanh") %></h1>
            <div class="row">
                <div class="col-lg-4 ">
                    <div class=" d-flex flex-column justify-content-center mb-4"
                         style="height: 435px;">
                        <div class="d-flex mb-6">
                            <i class="fa fa-2x fa-map-marker-alt text-primary flex-shrink-0 mr-3"></i>
                            <div class="mt-n1">
                                <h5 class="text-black"><%= messages.getString("phu_tung_honda") %></h5>
                                <p>
                                    <%= messages.getString("content_diachi") %>
                                </p>
                            </div>
                        </div>
                        <div class="d-flex ">
                            <iframe
                                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d62690.63974697007!2d106.52971386909486!3d10.875053153202757!2m3...!1svi!2s"
width="370" height="280" style="border:0;" allowfullscreen="" loading="lazy"
                                    referrerpolicy="no-referrer-when-downgrade"></iframe>
                        </div>
                    </div>
                </div>
              
                   
                   
             
               
            </div>
        </div>
    </div>

    <!-- Vendor Start -->
 <div class="container-fluid py-5">
                <div class="container py-5">
                    <div class="owl-carousel vendor-carousel">
                        <div class="bg-light p-4">
                            <img src="${pageContext.request.contextPath}/assets/user/Image/Honda/logo-vinfast.png" alt="">
                        </div>
                        <div class="bg-light p-4">
                            <img src="${pageContext.request.contextPath}/assets/user/Image/Honda/suzuki.png" alt="">
                        </div>
                        <div class="bg-light p-4">
                            <img src="${pageContext.request.contextPath}/assets/user/Image/Honda/logo_ducati.png" alt="">
                        </div>
                        <div class="bg-light p-4">
                            <img src="${pageContext.request.contextPath}/assets/user/Image/Honda/yamaha.png" alt="">
                        </div>
                        <div class="bg-light p-4">
                            <img src="${pageContext.request.contextPath}/assets/user/Image/Honda/piago.png" alt="">
                        </div>
                        <div class="bg-light p-4">
                            <img style="width:114px;height:114px" src="${pageContext.request.contextPath}/assets/user/Image/Honda/logohonda2.png" alt="">
                        </div>
                        <div class="bg-light p-4">
                             <img src="${pageContext.request.contextPath}/assets/user/img/vendor-7.png" alt="">
                        </div>
                    </div>
                </div>
            </div> 
    <!-- Vendor End -->