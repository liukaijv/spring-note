package com.liukaijv.note.model;

import java.io.Serializable;

public class TagNote implements Serializable {

    private int id;

    private int tagId;

    private int noteId;

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTagId() {
        return this.tagId;
    }

    public void setTagId(int tagId) {
        this.tagId = tagId;
    }

    public int getNoteId() {
        return this.noteId;
    }

    public void setNoteId(int noteId) {
        this.noteId = noteId;
    }

}
