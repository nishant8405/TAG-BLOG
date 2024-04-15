
package com.tech.blog.entities;


public class Post {
    private int pId;
    private String pTitle;
    private String pDesc;
    private String pCode;
    private String pPic;
    private int catId;
    private int uId;

    public Post() {
    }

    public Post(int pId, String pTitle, String pDesc, String pCode, String pPic, int catId, int uId) {
        this.pId = pId;
        this.pTitle = pTitle;
        this.pDesc = pDesc;
        this.pCode = pCode;
        this.pPic = pPic;
        this.catId = catId;
        this.uId = uId;
    }

    public Post(String pTitle, String pDesc, String pCode, String pPic, int catId, int uId) {
        this.pTitle = pTitle;
        this.pDesc = pDesc;
        this.pCode = pCode;
        this.pPic = pPic;
        this.catId = catId;
        this.uId = uId;
    }

    public int getpId() {
        return pId;
    }

    public String getpTitle() {
        return pTitle;
    }

    public String getpDesc() {
        return pDesc;
    }

    public String getpCode() {
        return pCode;
    }

    public String getpPic() {
        return pPic;
    }

    public int getCatId() {
        return catId;
    }

    public int getuId() {
        return uId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public void setpTitle(String pTitle) {
        this.pTitle = pTitle;
    }

    public void setpDesc(String pDesc) {
        this.pDesc = pDesc;
    }

    public void setpCode(String pCode) {
        this.pCode = pCode;
    }

    public void setpPic(String pPic) {
        this.pPic = pPic;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }

    public void setuId(int uId) {
        this.uId = uId;
    }
    
    
    
}
