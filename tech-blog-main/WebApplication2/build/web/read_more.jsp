

<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionHelper"%>
<%

    int pid = Integer.parseInt(request.getParameter("pid"));

    PostDao pdao = new PostDao(ConnectionHelper.getConnection());
    UserDao udao = new UserDao(ConnectionHelper.getConnection());

    Post p = pdao.fetchPostByPostId(pid);

    User u = udao.fetchUserByUserId(p.getuId());
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=p.getpTitle()%></title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/mystyle.css">

        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 77%, 74% 87%, 43% 84%, 0 90%, 0 0);
            }
            /*            .te{
                            height: 50px;
                        }*/
        </style>
        <!--facebook comment plugin-->

    </head>
<!--    <div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v15.0" nonce="aaQNUdFQ"></script>-->

    <body>



        <%
            User user = (User) session.getAttribute("currentUser");
            if (user == null) {

        %>
        <!--including navbar-->
        <%@include file = "navbar_page.jsp" %>
        <%            } else {

        %>
        <!--another navbar-->
        <!--navbar start-->

        <nav class="navbar navbar-expand-lg navbar-dark primary-background text-white">
            <a class="navbar-brand" href="index.jsp"> <span class="fa fa-certificate" ></span> TechBlog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#"> <span class="fa fa-university"></span> Home <span class="sr-only">(current)</span></a>
                    </li>
                    <!--                    <li class="nav-item">
                                            <a class="nav-link" href="#">Link</a>
                                        </li>-->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-sort"></span> Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Programming Language</a>
                            <a class="dropdown-item" href="#">Project Implementation</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="LogoutServlet"> <span class="fa fa-user-circle"></span> Logout</a>
                    </li>

                    <ul class="navbar-nav mr-right">
                        <li class="nav-item">
                            <a class="nav-link " data-toggle="modal" data-target="#profile-modal" href="#"> <span class="fa fa-user-circle"></span> <%= user.getName()%></a>
                        </li>
                    </ul>


                    <li class="nav-item">
                        <a class="nav-link" data-toggle="modal" data-target="#post-modal-form" href="#" > <span class="fa fa-star"></span>Do Post</a>
                    </li>
                    <!--                    <li class="nav-item">
                                            <a  href="register_page.jsp" class="nav-link " href="#"> <span class="fa fa-user-plus"></span> Sign up</a>
                                        </li>-->
                </ul>
                <!--                <ul class="form-inline  my-lg-0">
                                    <li class="nav-item">
                                        <a class="nav-link " href="#"> <span class="fa fa-user-circle"></span> Profile</a>
                                    </li>
                                </ul>-->

                <!--                <ul class="form-inline my-lg-0 my-2">
                                    <div class="text-white nav-item">
                                    <a href="#" class=" nav-link"><span class="fa fa-user-circle"> </span> Profile</a>
                                    </div>
                                    
                                </ul>-->
            </div>
        </nav>

        <!--navbar end-->
        
          <!-- Modal -->
        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <diV class="container" id="profile-sec">
                            <!--showing profile pic-->
                            <div class="container text-center">
                                <img style="width:50%" style="height:50%" src="images/default.png" class="img-fluid" style="border-radius:50%"/>
                            </div>
                            <br/>

                            <!--showing profile data-->
                            <table class="table">
                                <!--                            <thead>
                                                                <tr>
                                                                    <th scope="col">#</th>
                                                                    <th scope="col">First</th>
                                                                    <th scope="col">Last</th>
                                                                    <th scope="col">Handle</th>
                                                                </tr>
                                                            </thead>-->
                                <tbody>
                                    <tr>
                                        <th scope="row">Id</th>
                                        <td> <%= user.getId()%> </td>
                                        <!--                                    <td>Otto</td>
                                                                            <td>@mdo</td>-->
                                    </tr>
                                    <tr>
                                        <th scope="row">User Name</th>
                                        <td><%=user.getName()%></td>
                                        <!--                                    <td>Thornton</td>
                                                                            <td>@fat</td>-->
                                    </tr>
                                    <tr>
                                        <th scope="row">Email</th>
                                        <td><%= user.getEmail()%></td>
                                        <!--                                    <td>the Bird</td>
                                                                            <td>@twitter</td>-->
                                    </tr>
                                    <tr>
                                        <th scope="row">Gender</th>
                                        <td><%= user.getGender()%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Status</th>
                                        <td><%= user.getAbout()%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Registerd Date</th>
                                        <td><%= user.getTimeStamp().toString()%></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <!--profile edit section start-->

                        <div class="container " id="edit-sec" style="display:none">
                            <form  id="update-form" action="EditServlet" method="POST" enctype="multipart/form-data">
                                <table class="table">
                                    <tbody>
                                    <div class="form-group">
                                        <tr>
                                            <th>Id:</th>
                                            <td><%=user.getId()%></td>
                                        </tr>
                                    </div>
                                    <div class="form-group">
                                        <tr>
                                            <th >User Name:</th>
                                            <td><input class="form-control" name="userName"value="<%= user.getName()%>" type="text"> </td>
                                        </tr>
                                    </div>
                                    <div class="form-group">
                                        <tr>
                                            <th >User Email:</th>
                                            <td><input class="form-control" name="userEmail"value="<%= user.getEmail()%>" type="email"> </td>
                                        </tr>
                                    </div>
                                    <!--                                         <div class="form-group">
                                                                            <tr>
                                                                                <th >User Email:</th>
                                                                                <td><input class="form-control" name="userEmail"value="<%= user.getEmail()%>" type="email"> </td>
                                                                            </tr>
                                                                        </div>-->
                                    <div class="form-group">
                                        <tr>
                                            <th >Password:</th>
                                            <td><input class="form-control" name="userPassword" value="<%= user.getPassword()%>" type="password"> </td>
                                        </tr>
                                    </div>
                                    <div class="form-group">
                                        <tr>
                                            <th >Status:</th>
                                            <td><textarea class="form-control" name="userAbout" value="<%= user.getAbout()%>" type="text"> </textarea> </td>
                                        </tr>
                                    </div>
                                    <div class="form-group">
                                        <tr>
                                            <th >Registered Date:</th>
                                            <td><%= user.getTimeStamp().toString()%> </td>
                                        </tr>
                                    </div>
                                    <div class="form-group">
                                        <tr>
                                            <th >Profile Pic:</th>
                                            <td><input value="<%= user.getUserProfile()%>" class="form-control" name="userProfile"type="file"> </td>
                                        </tr>
                                    </div>


                                    </tbody>
                                </table>
                                <div class="container text-center">
                                    <button type="submit" id="profile-save-btn" class="btn btn-outline-success">Save</button>
                                </div>
                            </form>

                        </div>

                        <!--profile edit section end-->

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" id="profile-edit-btn" class="btn btn-primary">Edit Profile</button>

                    </div>
                </div>
            </div>
        </div>

        <!--modal end for profile-->
        
         <!-- Modal -->
        <div class="modal fade" id="post-modal-form" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" >TechBlog</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="PostServlet" id="save-post-form" method="POST" enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="exampleFormControlSelect1">Example select</label>
                                <select class="form-control" name="catId" id="exampleFormControlSelect1">
                                    <% PostDao pd = new PostDao(ConnectionHelper.getConnection());
                                        ArrayList<Category> list = pd.getAllCategories();
                                        for (Category c : list) {

                                    %> 
                                    <option  value="<%=c.getCatId()%>" ><%=c.getCatTitle()%></option>

                                    <%

                                        }

                                    %>



                                </select>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Post Title</label>
                                <input required name="pTitle" type="text" class="form-control"  placeholder="Enter Post title">

                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Description</label>
                                <textarea required type="text" name="pDesc" rows="6" class="form-control"  placeholder="description..."></textarea>
                            </div>
                            <div class="form-group">
                                <label>Code </label>
                                <textarea type="text" name="pCode" rows="6" class="form-control"  placeholder="code (if any)..."></textarea>
                            </div>
                            <div class="form-group">
                                <label >Select your pic</label>
                                <input type="file" name="pPic" class="form-control-file" >
                            </div>

                            <button type="submit"  class="btn btn-primary">Save Post</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <!--<button type="button"  class="btn btn-primary">Save changes</button>-->
                    </div>
                </div>
            </div>
        </div>
        <%

            }
        %>
        
        
      





        <!--showing post code-->

        <div class="container">
            <div class="row mt-4">
                <div class="col-md-8 offset-md-2">
                    <div class="card-header primary-background text-white">
                        <h3 class="card-title"> <%=p.getpTitle()%> </h3>
                    </div>
                    <div class="card-body">
                        <img src="images/default.png" class="img-fluid" alt="alt"/>

                        <div class="row">
                            <div class="col-md-8">
                                <p>Posted By <%= u.getName()%> </p>
                            </div>
                            <div class="col-md-4">
                                <p>on</p>
                            </div>
                        </div>

                        <div>
                            <p class="post-content mt-2">
                                <%= p.getpDesc()%>
                            </p>
                        </div>
                        <div>
                            <pre class="post-code mt-2">
                                <%= p.getpCode()%>
                            </pre>
                        </div>


                    </div>

                    <div class="card-footer primary-background text-white">
                        <div class="container text-center">
                            <a href="#" class="btn" <span><i class="fa fa-thumbs-o-up "></i></span> 6 </a>
                            <a href="#" class="btn" <span><i class="fa fa-heart "></i></span> 15 </a>
                        </div>

                    </div>

<!--                    <div class="card-footer primary-background text-white" >
                        <div class="fb-comments" data-href="http://localhost:8080/WebApplication2/read_more.jsp?pid=<%= p.getpId()%>" data-width="" data-numposts="5"></div>
                    </div>-->


                </div>

            </div>

        </div>



        <hr ></hr>
        <div class="container">

            <!--cards-->

            <div class="container">
                <h5>More related posts...</h5>
                <div class="row mb-2">

                    <%

                        PostDao pd = new PostDao(ConnectionHelper.getConnection());
                        ArrayList<Post> list = pd.getAllPost();

                        for (Post po : list) {

                    %>


                    <div class="col-md-4">
                        <div class="card p-2" style="width: 18rem;">
                            <img class="card-img-top" src="images/default.png" style="height:150px" alt="Card image cap">


                            <div class="card-body">
                                <h5 class="card-title"> <%=po.getpTitle()%> </h5>
                                <p class="card-text te"><%
                                    String upToNCharacters = po.getpDesc().substring(0, Math.min(po.getpDesc().length(), 40));

                                    %>

                                    <%= upToNCharacters%>

                                    ...</p>
                                <a href="read_more.jsp?pid=<%=po.getpId()%>" class="btn btn-primary btn-sm" >Read More</a>
                                <a href="#" class="btn" <span><i class="fa fa-thumbs-o-up "></i></span> 6 </a>
                                <a href="#" class="btn" <span><i class="fa fa-heart "></i></span> 15 </a>

                            </div>
                        </div>
                    </div>



                    <%

                        }
                    %>
                </div>





            </div>

        </div>


        <!--bootstrap javascript-->
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
         <!--sweet alert cdn-->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>


                                $('document').ready(function () {
                                    let temp = false;
                                    $('#profile-edit-btn').click(function () {
                                        if (temp === false) {
                                            $('#profile-sec').hide();

                                            $('#edit-sec').show();
                                            $(this).text("Back");
                                            temp = true;
                                        } else {
                                            $('#profile-sec').show();

                                            $('#edit-sec').hide();
                                            $(this).text("Edit Profile");
                                            temp = false;
                                        }

                                    });
                                }
                                );



        </script>
        <!--profile edit section-->
        <script>
            $(document).ready(function () {


                $('#update-form').on('submit', function (event) {

                    event.preventDefault();
                    let form = new FormData(this);
//                    $('#reg-btn').hide();
//                    $('#loader').show();
                    // send register servlet

                    $.ajax({
                        url: "EditServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
//                            agar success milta hai to loader ko hide karna hai aur register btn ko show karna hai
//                                    $('#reg-btn').show();
//                            $('#loader').hide();
                            if (data.trim() === 'success') {
                                swal("Good job!", "Profile Updated successfully...!", "success")
                                        .then((value) => {
                                            window.location = "profile_page.jsp";
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
        <script>
            $(document).ready(function () {


                $('#save-post-form').on('submit', function (event) {

                    event.preventDefault();
                    let form = new FormData(this);
//                    $('#reg-btn').hide();
//                    $('#loader').show();
                    // send register servlet

                    $.ajax({
                        url: "PostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
//                            agar success milta hai to loader ko hide karna hai aur register btn ko show karna hai
//                                    $('#reg-btn').show();
//                            $('#loader').hide();
                            if (data.trim() === 'success') {
                                swal("Good job!", "Post successful...!", "success")
                                        .then((value) => {
                                            window.location = "profile_page.jsp";
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
