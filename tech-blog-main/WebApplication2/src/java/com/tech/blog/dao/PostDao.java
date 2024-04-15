
package com.tech.blog.dao;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


public class PostDao {
    private Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
    
    public ArrayList<Category> getAllCategories(){
        
        ArrayList<Category> list = new ArrayList<>();
        
        try{
            
            String q = "select * from category";
            
            Statement st = con.createStatement();
            
            ResultSet set = st.executeQuery(q);
            
            while(set.next()){
                Category c = new Category();
                c.setCatId(set.getInt("catId"));
                c.setCatTitle(set.getString("catTitle"));
                c.setCatDesc(set.getString("catDesc"));
                list.add(c);
            }
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return list;
        
    }
    
    
    public boolean savePost(Post p){
        boolean t = false;
        
        try{
            String q1= "insert into posts (pTitle,pDesc,pCode,pPic,catId,uId) values(?,?,?,?,?,?)";
            
            PreparedStatement pstmt = con.prepareStatement(q1);
            
            pstmt.setString(1,p.getpTitle());
            pstmt.setString(2,p.getpDesc());
            pstmt.setString(3,p.getpCode());
            pstmt.setString(4,p.getpPic());
            pstmt.setInt(5,p.getCatId());
            pstmt.setInt(6,p.getuId());
            
            pstmt.executeUpdate();
            
            t = true;
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return t;
    }
    
    
    
    // to fetch all the post
    
    public ArrayList<Post> getAllPost(){
        
        ArrayList<Post>l = new ArrayList<>();
        
        try{
            
            String q2="select * from posts";
            
            Statement st = con.createStatement();
            
            ResultSet set = st.executeQuery(q2);
            
            while(set.next()){
                Post p = new Post();
                p.setpId(set.getInt("pId"));
                p.setpTitle(set.getString("pTitle"));
                p.setpDesc(set.getString("pDesc"));
                p.setpCode(set.getString("pCode"));
                p.setpPic(set.getString("pPic"));
                p.setCatId(set.getInt("catId"));
                p.setuId(set.getInt("uId"));
                
                l.add(p);
            }
            
            
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        
        
        
        return l;
    }
    
    
    
    
    
//    show all post bu user id
    
    public ArrayList<Post> gatAllPostByUid(int Uid ){
        
        ArrayList<Post> list = new ArrayList<>();
        
        try{
            String q ="select * from posts where uId = ?";
            
            PreparedStatement pstmt = con.prepareStatement(q);
            
            pstmt.setInt(1,Uid);
            
            ResultSet set = pstmt.executeQuery();
            
            while(set.next()){
                Post p = new Post();
                p.setCatId(set.getInt("catId"));
                p.setpId(set.getInt("pId"));
                p.setpTitle(set.getString("pTitle"));
                p.setpCode(set.getString("pCOde"));
                p.setpDesc(set.getString("pDesc"));
                p.setpPic(set.getString("pPic"));
                p.setuId(set.getInt("uId"));
                
                list.add(p);
                
                
                
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        return list;
    }
    
    
    // show all post by category id
    
    public ArrayList<Post> getAllPostByCatId(int catId, int uId){
        
        ArrayList<Post> list = new ArrayList<>();
        
        try{
            String q="select * from posts where catId = ? and uId = ?";
            
            PreparedStatement pstmt = con.prepareStatement(q);
            
            pstmt.setInt(1, catId);
            pstmt.setInt(2, uId);
            
            ResultSet set = pstmt.executeQuery();
            
            while(set.next()){
                Post p = new Post();
                p.setCatId(set.getInt("catId"));
                p.setpId(set.getInt("pId"));
                p.setpTitle(set.getString("pTitle"));
                p.setpDesc(set.getString("pDesc"));
                p.setpCode(set.getString("pCode"));
                p.setpPic(set.getString("pPic"));
                p.setuId(set.getInt("uId"));
                
                list.add(p);
                
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return list;
    }
    
    
    //for deleting post it will return post id
    
    public boolean deletePostByPid(int pId){
        boolean temp = false;
        
            try{
                String q = "delete from posts where pId = ?";
                
                PreparedStatement pstmt = con.prepareStatement(q);
                
                pstmt.setInt(1, pId);
                
                pstmt.executeUpdate();
                
                temp = true;
            }catch(Exception e){
                e.printStackTrace();
            }
        
        return temp;
    }
    
    
    
    // fetiching post by post is
    
    public Post fetchPostByPostId(int pid){
        Post p = null;
        
            try{
                
                String q = "select * from posts where pId = ?";
                
                PreparedStatement pstmt = con.prepareStatement(q);
                
                pstmt.setInt(1,pid);
                
                ResultSet set = pstmt.executeQuery();
                
                if(set.next()){
                    
                        p = new Post();
                        
                        p.setpId(set.getInt("pId"));
                        p.setpTitle(set.getString("pTitle"));
                        p.setpDesc(set.getString("pDesc"));
                        p.setpCode(set.getString("pCode"));
                        p.setCatId(set.getInt("catId"));
                        p.setuId(set.getInt("uId"));
                        p.setpPic(set.getString("pPic"));
                        
                        
                    
                
                }
                
                
            }catch(Exception e){
                e.printStackTrace();
            }
        
        
        return p;
    }
}
