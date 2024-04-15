
package com.tech.blog.dao;
import com.tech.blog.entities.User;
import java.sql.*;
public class UserDao {
    private Connection con;
    
    public UserDao(Connection con){
        this.con = con;
    }
    
    public boolean saveUser(User user){
        boolean temp = false;
        try{
            String query = "insert into users (username,useremail,userpass,usergender,userabout) values(?,?,?,?,?)";
            
            PreparedStatement pstmt = this.con.prepareStatement(query);
            
            pstmt.setString(1,user.getName());
            pstmt.setString(2,user.getEmail());
            pstmt.setString(3,user.getPassword());
            pstmt.setString(4,user.getGender());
            pstmt.setString(5,user.getAbout());
            
            pstmt.executeUpdate();
            temp= true;
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return temp;
    }
    
    
    // fetching user from db with the help of email and password
    
    public User fetchUserByEmailAndPassword(String email , String password){
        User user = null;
        try{
            
            String query = "select * from users where useremail=? and userpass = ?";
            
            PreparedStatement pstmt = con.prepareStatement(query);
            
            pstmt.setString(1,email);
            pstmt.setString(2,password);
            
            ResultSet set = pstmt.executeQuery();
            
            if(set.next()){
                user = new User();
                user.setUserId(set.getInt("id"));
                user.setUserName(set.getString("username"));
                user.setUserEmail(set.getString("useremail"));
                user.setUserAbout(set.getString("userabout"));
                user.setUserGender(set.getString("usergender"));
                user.setUserPassword(set.getString("userpass"));
                user.setUserRegisteredDate(set.getString("timestamp"));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return user;
    }
    
    
    
    //update user
    
    public boolean updateUser(String userName, String userEmail, String userAbout, String userProfile, String userPassword,int userId){
         
        boolean temp = false;
        
        try{
        
            String query1 = "update users set username =? , useremail = ? , userabout=?, userpic=? , userpass=? where id=?";
            
            PreparedStatement  pstmt = con.prepareStatement(query1);
            pstmt.setString(1,userName);
            pstmt.setString(2,userEmail);
            pstmt.setString(3,userAbout);
            pstmt.setString(4,userProfile);
            pstmt.setString(5,userPassword);
            pstmt.setInt(6,userId);
            pstmt.executeUpdate();
            
            temp = true;
            
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        
        
        
        return temp;
        
        
    }
    
    
    
    
    
    public String fetchPassById(int id){
        String pass = null;
        
        try{
            
            String q ="select userpass from users where id = ?";
            
            PreparedStatement pstmt = con.prepareStatement(q);
            
            pstmt.setInt(1, id);
            
            ResultSet set = pstmt.executeQuery();
            
            if(set.next()){
                pass = set.getString("userpass");
            }
        
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        return pass;
    }
    
    
      
     // fetiching user by user id
    
    public User fetchUserByUserId(int uid){
        User u = null;
        
            try{
                
                String q = "select * from users where id = ?";
                
                PreparedStatement pstmt = con.prepareStatement(q);
                
                pstmt.setInt(1,uid);
                
                ResultSet set = pstmt.executeQuery();
                
                if(set.next()){
                    
                        u = new User();
                        
                       u.setUserId(set.getInt("id"));
                       u.setUserName(set.getString("username"));
                       u.setUserEmail(set.getString("useremail"));
                       u.setUserPassword(set.getString("userpass"));
                       u.setUserGender(set.getString("usergender"));
                       u.setUserAbout(set.getString("userabout"));
                       u.setUserProfile(set.getString("userpic"));
                       u.setUserRegisteredDate(set.getString("timestamp"));
                        
                        
                    
                
                }
                
                
            }catch(Exception e){
                e.printStackTrace();
            }
        
        
        return u;
    }
       
}
