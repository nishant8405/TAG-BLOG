
package com.tech.blog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class ProfileHelper {
    // method to delete a pic
    public static boolean deleteFile(String path){
        boolean temp = false;
        
        try{
            
            File file = new File(path);
            file.delete();
            
            temp = true;
        
        }catch(Exception e){
            e.printStackTrace();
        
        }
        
        
        
        return temp;
    }
    
    
    
    // method to save a user pic
    
    public static boolean saveFile(InputStream is, String path){
    
        boolean temp = false;
        
        try{
            byte []b = new byte[is.available()];
            
            is.read(b);
            
            FileOutputStream fos = new FileOutputStream(path);
            
            fos.write(b);
            
            fos.flush();
            fos.close();
            
            temp = true;
        
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return temp;
    
    
    
    }
}
