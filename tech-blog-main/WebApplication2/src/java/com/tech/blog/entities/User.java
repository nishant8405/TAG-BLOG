
package com.tech.blog.entities;


public class User {
    private int id;
    private String userName;
    private String userEmail;
    private String userPassword;
    private String userGender;
    private String userAbout;
    private String userTimeStamp;
    private String userProfile;
    
    public User(String userName, String userEmail, String userPassword, String userGender
    , String userAbout){
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
        this.userGender = userGender;
        
        this.userAbout = userAbout;
    }
    
    public User(){
        
    }
    
    
//    now we have to make getters and setters
     
    //getters
    
    public int getId(){
        return id;
    }
    
    public String getName(){
        return userName;
    }
    
    public String getEmail(){
        return userEmail;
    }
    
    public String getPassword(){
        return userPassword;
    }
    
    public String getAbout(){
        return userAbout;
    }
    
    public String getGender(){
        return userGender;
    }
    
    public String getTimeStamp(){
        return userTimeStamp;
    }
    
     public String getUserProfile(){
        return userProfile;
    }
    
    
    // setters
    public void setUserId(int id){
        this.id = id;
    }
    
    public void setUserName(String userName){
        this.userName = userName;
    }
    
    public void setUserEmail(String userEmail){
        this.userEmail = userEmail;
    }
    
    public void setUserPassword(String userPassword){
        this.userPassword = userPassword;
    }
    
    public void setUserGender(String userGender){
        this.userGender = userGender;
    }
    
    public void setUserAbout(String userAbout){
        this.userAbout = userAbout;
    }
    
    public void setUserRegisteredDate(String userTimeStamp){
        this.userTimeStamp = userTimeStamp;
    }
    
    public void setUserProfile(String userProfile){
        this.userProfile = userProfile;
    }
    
    
    
    
}
