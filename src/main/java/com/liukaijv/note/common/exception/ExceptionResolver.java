package com.liukaijv.note.common.exception;

import com.liukaijv.note.common.base.Result;
import com.liukaijv.note.common.utils.HttpUtils;
import com.liukaijv.note.common.utils.JacksonObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.beans.BeanMap;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class ExceptionResolver implements HandlerExceptionResolver {

    @Autowired
    private JacksonObjectMapper jacksonObjectMapper;

    @Override
    @SuppressWarnings("unchecked")
    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {

        if (!(handler instanceof HandlerMethod)) {
            return new ModelAndView("error/500");
        }

        if (HttpUtils.isAjax(request)) {
            Result result = new Result();
            result.setSuccess(false);
            result.setMsg(ex.getMessage());
            MappingJackson2JsonView view = new MappingJackson2JsonView();
            view.setContentType("text/html;charset=UTF-8");
            view.setObjectMapper(jacksonObjectMapper);
            return new ModelAndView(view, BeanMap.create(result));
        }

        return new ModelAndView("error/500").addObject("error", ex.getMessage());

    }
}
