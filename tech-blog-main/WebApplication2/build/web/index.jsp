<%-- 
    Document   : index
    Created on : Dec 26, 2022, 12:08:51 PM
    Author     : harsh
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!--including java.sql package with the help of page directives-->
<%@page import ="java.sql.*" %>




<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

       <!--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">-->
        <!--bootstrp css-->
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
    </head>



    <body>

        <!--       navbar jsp page-->

        <%@include file= "navbar_page.jsp" %>

        <!--banner-->

        <div class="container-fluid p-0 m-0 primary-background banner-background " >
            <div class="jumbotron primary-background text-white">
                <div class="container ml-5">
                    <h3 class="display-3">Welcome to Tech Blog</h3>
                    <p>Many technological advancements have led to societal changes. The earliest known technology is the stone tool, used in the prehistoric era,followed by fire use, which contributed to the growth of the human brain and the development of language in the Ice Age. The invention of the wheel in the Bronze Age enabled wider travel and the creation of more complex machines.</p>
                    <p>Technology is the application of knowledge to reach practical goals in a specifiable and reproducible way. The word technology may also mean the product of such an endeavor. The use of technology is widely prevalent in medicine, science, industry, communication, transportation, and daily life. Technologies include physical objects like utensils or machines and intangible tools such as software.</p>


                    <button class="btn btn-outline-light btn-primary"><span class="fa fa-user-plus"></span> Start! Its Free</button>
                    <a href="login_page.jsp" class="btn btn-outline-light btn-primary"> <span class="fa fa-user-circle fa-spin"></span> Login</a>
                </div>

            </div>
        </div>


        <!--cards-->

        <div class="container">
             <div class="row mb-2">
            <%
                
                PostDao pd = new PostDao(ConnectionHelper.getConnection());
                ArrayList<Post> list = pd.getAllPost();
                
                for(Post p: list){
                
                %>
                
                
                <div class="col-md-4">
                    <div class="card" style="width: 18rem;">
                        <img class="card-img-top" src="images/default.png" style="height:150px" alt="Card image cap">

                        
                        <div class="card-body">
                            <h5 class="card-title"> <%=p.getpTitle()  %> </h5>
                            <p class="card-text te"><% 
                                String upToNCharacters = p.getpDesc().substring(0, Math.min(p.getpDesc().length(), 40));
                            
                                %>
                            
                            <%= upToNCharacters %>
                            
                            ...</p>
                            <a href="read_more.jsp?pid=<%=p.getpId()%>" class="btn btn-primary btn-sm" >Read More</a>
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








        <!--bootstrap javascript-->
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>



    </body>
</html>
