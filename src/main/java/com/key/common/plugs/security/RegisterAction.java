package com.key.common.plugs.security;

import com.key.common.base.action.CrudActionSupport;
import com.key.common.base.entity.User;
import com.key.common.utils.web.Struts2Utils;
import com.key.dwsurvey.service.UserManager;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.w3c.tidy.Out;

import javax.servlet.http.HttpServletRequest;

import static com.key.common.base.action.CrudActionSupport.RELOAD;

public class RegisterAction extends CrudActionSupport<User, String> {

    @Autowired
    private UserManager userManager;


    public String register() {

        System.out.println("ssssssssssssssssssssssssss");
        HttpServletRequest request= Struts2Utils.getRequest();
        System.out.println(entity);
        userManager.adminSave(entity,null);
        return RELOAD;

    }
}
