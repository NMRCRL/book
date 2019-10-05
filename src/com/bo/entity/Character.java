package com.bo.entity;

/**
 * @author liu tianyuan
 * @ClassName
 * @Description
 * @Date 2019/10/4
 * @Version 1.0
 **/
public class Character {
    private Integer id;
    //肖像
    private String portrait;
    //姓名
    private String name;
    //国籍
    private String nationality;
    //影响
    private String influences;

    public Character(Integer id, String portrait, String name, String nationality, String influences) {
        this.id = id;
        this.portrait = portrait;
        this.name = name;
        this.nationality = nationality;
        this.influences = influences;
    }

    public Character() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPortrait() {
        return portrait;
    }

    public void setPortrait(String portrait) {
        this.portrait = portrait;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public String getInfluences() {
        return influences;
    }

    public void setInfluences(String influences) {
        this.influences = influences;
    }

    @Override
    public String toString() {
        return "Character{" +
                "id=" + id +
                ", portrait='" + portrait + '\'' +
                ", name='" + name + '\'' +
                ", nationality='" + nationality + '\'' +
                ", influences='" + influences + '\'' +
                '}';
    }
}
