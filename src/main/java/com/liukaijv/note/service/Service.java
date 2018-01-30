package com.liukaijv.note.service;

import java.io.Serializable;
import java.util.List;

public interface Service<T> {

    public List<T> all();

    public boolean create(T entity);

    public boolean update(T entity);

    public boolean delete(Serializable id);

    public T find(Serializable id);

    public List<T> paginate();

}
