package com.liukaijv.note.model;

import java.io.Serializable;

public class CategoryNote implements Serializable {

    private int id;

    private int categoryId;

    private int noteId;

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCategoryId() {
        return this.categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public int getNoteId() {
        return this.noteId;
    }

    public void setNoteId(int noteId) {
        this.noteId = noteId;
    }
}
