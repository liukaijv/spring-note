package com.liukaijv.note.model;

import java.io.Serializable;

public class Vote extends Model implements Serializable {

    private int userId;

    private int noteId;

    public int getUserId() {
        return this.userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getNoteId() {
        return this.noteId;
    }

    public void setNoteId(int noteId) {
        this.noteId = noteId;
    }
}
