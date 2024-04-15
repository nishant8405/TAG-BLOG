





<%@page import="com.tech.blog.entities.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionHelper"%>

<div class="row">
<%

   

    int cid = Integer.parseInt(request.getParameter("cid"));
     //getting user
    User u = (User) session.getAttribute("currentUser");
    //fetching post by category id 

    PostDao pdao = new PostDao(ConnectionHelper.getConnection());
    ArrayList<Post> p = null;
   
    if (cid == 0) {
        p = pdao.gatAllPostByUid(u.getId());
    } else {
        p = pdao.getAllPostByCatId(cid, u.getId());
    }

    if (p.size() == 0) {
        out.println("No Post in this category...");
        return;
    } else {

        for (Post po : p) {

%>
<div class="col-md-6">
    <div class="card">
        
            <img class="card-img-top" src="images/default.png" style="height:150px" alt="Card image cap">
            <div class="container text-center">



                <h5 class="card-title"><%=po.getpTitle()%></h5>
            </div>
            <div class="card-body">
                <p class="card-text"><% 
                                String upToNCharacters = po.getpDesc().substring(0, Math.min(po.getpDesc().length(), 40));
                            
                                %>
                            
                            <%= upToNCharacters %>
                            
                            ...</p>
                <a href="read_more.jsp?pid=<%=po.getpId()%>" class="btn btn-primary btn-sm" >Read More</a>
                <a href="#" class="btn btn-primary btn-sm" onclick="myfunc(<%=po.getpId()%>)"  id="delete-btn" >Delete</a>

               
                <a href="#" class="btn" <span><i class="fa fa-thumbs-o-up "></i></span> 6 </a>
                <a href="#" class="btn" <span><i class="fa fa-heart "></i></span> 15 </a>
            </div>

      
    </div>


</div>



<%                    }

    }

//    response.sendRedirect("profile_page.jsp");
%>

</div>






