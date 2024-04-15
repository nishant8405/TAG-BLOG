
package com.tech.blog.entities;


public class Message {
     private String content;
     private String msgType;
     private String cssClass;
     
     // constructer
     public Message(String content, String msgType, String cssClass){
         this.content = content;
         this.msgType = msgType;
         this.cssClass= cssClass;
     }
     
     
     // default constructer
     
     
     
     
     // getters and setters
     
     public String getContent(){
         return content;
     }
     
     public  String getMsgType(){
         return msgType;
     }
    
      public String getCssClass(){
         return cssClass;
     }
      
      
      public void setContent(String content){
          this.content = content;
      }
      
      public void setMsgType(String msgType){
          this.msgType = msgType;
      }
      
      public void setCssClass(String cssClass){
          this.cssClass = cssClass;
      }
     
     
     
    
}
