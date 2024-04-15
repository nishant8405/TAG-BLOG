

<%@page import="com.tech.blog.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>

        <!--bootstrp css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="css/mystyle.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>
    <body>

        <!--including navbar-->

        <%@include file = "navbar_page.jsp" %>

        <!--desining login section-->

        <main>
            <div class="container ">
                <div class="row ">
                    <div class="col-md-4 offset-md-4 mt-5">
                        <div class="card ">
                            <div class="card-header primary-background text-white">
                                Login Here
                            </div>
                            <div class="card-body">
                                <form  id="login-form" action="LoginServlet" method="POST">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input required type="email" name="userEmail" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input required type="password" name="userPassword" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                    </div>
<!--                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">Check me out</label>
                                    </div>-->


                                    <!--showing error msg if wrong email or password-->

                                    <%
                                        Message msg = (Message) session.getAttribute("msg");
                                        if (msg != null) {
                                    %>
                                    <div  class="alert <%= msg.getCssClass() %>" role="alert">
                                        <%= msg.getContent() %>
                                    </div>
                                    <%
                                        session.removeAttribute("msg");
                                        }
                                    %>
                                    <!--alert-->


                                    <button type="submit" class="btn btn-primary">Submit</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <!--bootstrap javascript-->
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>



        <!--our script-->
        <!--        <script>
        
                    $('document').ready(function () {
                        console.log("loaded");
        
                        $('#login-form').on('submit', function (event) {
                            event.preventDefault();
        
                            let form = new FormData(this);
        
                            $.ajax({
                                url: "LoginServlet",
                                type: "POST",
                                data: form,
        
                                success: function (data, textstatus, jqXHR) {
                                    if (data.trim() === 'error') {
                                        $('#alert').show();
        //                                console.log("Wrong credentails");
                                    } else {
                                        window.location="profile_page.jsp";
                                        
        //                                console.log("success");
                                    }
                                },
        //                        
        //                        error: function (jqXHR, textStatus, errorThrown) {
        //                            console.log(jqXHR);
        //                        },
                                processData: false,
                                contentType: false
        
                            }
        
        
                            );
        
                        });
                    });
        
        
                </script>-->
    </body>
</html>
