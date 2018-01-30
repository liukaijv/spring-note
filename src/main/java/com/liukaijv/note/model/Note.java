package com.liukaijv.note.model;

import java.io.Serializable;

public class Note extends Model implements Serializable {

    private String title;

    private String slug;

    private String description;

    private String content;

    private int viewCount;

    private int voteCount;

    private int userId;

    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSlug() {
        return this.slug;
    }

    public void setSlug(String slug) {
        this.slug = slug;
    }

    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getContent() {
        return this.content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getViewCount() {
        return this.viewCount;
    }

    public void setViewCount(int count) {
        this.viewCount = count;
    }

    public int getVoteCount() {
        return this.voteCount;
    }

    public void setVoteCount(int count) {
        this.voteCount = count;
    }

    public int getUserId() {
        return this.userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

}
