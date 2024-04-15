

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>

        <!--bootstrp css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="css/mystyle.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


    </head>
    <body>

        <!--including navbar-->

        <%@include file = "navbar_page.jsp" %>

        <div class="container mt-1  ">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card ">
                        <div class="card-header text-white primary-background">
                            Register Here
                        </div>
                        <div class="card-body">
                            <form id="reg-form" action="RegisterServlet" method="POST">
                                <div class="form-group">
                                    <label for="exampleInputUserName">User Name</label>
                                    <input required name="userName" type="text" class="form-control" id="exampleInputUserName" placeholder="Enter Your Name">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input required name="userEmail" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input required  name="userPassword" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputGender">Select gender</label>
                                    <br>
                                    <input  name="userGender" type="radio"    value="male" >Male
                                    <input  name="userGender" type="radio"   value="female" >Female
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputAbout">About</label>
                                    <textarea name="userAbout" class="form-control " name="about" rows="2" placeholder="Tell us something about yourself..."></textarea>
                                </div>
                                <div class="form-check">
                                    <input name="box" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label  class="form-check-label" for="exampleCheck1">Agree terms and condition</label>
                                </div>
                                <br/>
                                <div class="container text-center" id="loader" style="display:none">
                                    <span class="fa fa-refresh fa-4x fa-spin"></span>
                                    <h4>Loading...</h4>
                                </div>
                                <div class="container text-center">
                                    <button id="reg-btn" type="submit" class="btn btn-primary ">Register</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <!--our ajax based script-->


        <!--        <script>
                    
                    $(document).ready(functon(){
                        alert("loaded...");
                        console.log("loaded...");
                    });
                    
                </script>-->

        <!--sweet alert cdn-->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>
            $(document).ready(function () {

               
                $('#reg-form').on('submit', function (event) {

                    event.preventDefault();
                    let form = new FormData(this);
                    $('#reg-btn').hide();
                    $('#loader').show();
                    // send register servlet

                    $.ajax({
                        url: "RegisterServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                           console.log(data);
//                            agar success milta hai to loader ko hide karna hai aur register btn ko show karna hai
                                    $('#reg-btn').show();
                            $('#loader').hide();
                            if (data.trim() === 'done') {
                                swal("Registered Successfully...You are redirecting to the login page.")
                                        .then((value) => {
                                            window.location = "login_page.jsp";
                                        });
                            } else if (data.trim() === 'error') {
                                swal("Something went wrong ... Try again");
                            } else {
                                swal("Please agree terms and conditions");
                            }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(jqXHR);
                        },
                        processData: false,
                        contentType: false


                    });
                });
            });

        </script>

    </body>
</html>
