package com.spring.model;

public class Student {



    private int sid;
    private String nameinfull;
    private String preferredname;
    private  int age;
    private String address;
    private String contact;
    private int field;

    public Student() {
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public String getNameinfull() {
        return nameinfull;
    }

    public void setNameinfull(String nameinfull) {
        this.nameinfull = nameinfull;
    }

    public String getPreferredname() {
        return preferredname;
    }

    public void setPreferredname(String preferredname) {
        this.preferredname = preferredname;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public int getField() {
        return field;
    }

    public void setField(int field) {
        this.field = field;
    }
}