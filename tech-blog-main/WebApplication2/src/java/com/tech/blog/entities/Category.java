
package com.tech.blog.entities;


public class Category {
    private int catId;
    private String catTitle;
    private String catDesc;

    public Category() {
    }

    public Category(int catId, String catTitle, String catDesc) {
        this.catId = catId;
        this.catTitle = catTitle;
        this.catDesc = catDesc;
    }

    public Category(String catTitle, String catDesc) {
        this.catTitle = catTitle;
        this.catDesc = catDesc;
    }

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }

    public String getCatTitle() {
        return catTitle;
    }

    public void setCatTitle(String catTitle) {
        this.catTitle = catTitle;
    }

    public String getCatDesc() {
        return catDesc;
    }

    public void setCatDesc(String catDesc) {
        this.catDesc = catDesc;
    }
    
    
    
}
