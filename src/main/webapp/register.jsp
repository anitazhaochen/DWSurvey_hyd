<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- saved from url=(0035)http://www.diaowen.net/getstart.jsp -->
<html xmlns:wb="http://open.weibo.com/wb"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>问卷网</title>

    <script type="text/javascript" src="${ctx }/js/plugs/jquery-ui-1.10.3.custom/js/jquery-1.10.1.js"></script>
    <script type="text/javascript" src="${ctx }/js/dw/responsive-width.js"></script>
    <script type="text/javascript" src="${ctx }/js/plugs/jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.js"></script>
    <link href="${ctx }/css/dw-user.css" rel="stylesheet" type="text/css" />

    <script src="${ctx}/js/plugs/jquery/jquery.cookie.js" type="text/javascript"></script>
    <link href="${ctx}/js/plugs/validate/jquery.validate.css" type="text/css" rel="stylesheet" />
    <script src="${ctx}/js/plugs/validate/jquery.validate.js" type="text/javascript"></script>
    <script src="${ctx}/js/plugs/validate/messages_cn.js" type="text/javascript"></script>
    <script src="${ctx }/js/plugs/validate/jquery.metadata.js" type="text/javascript"></script>
    <link rel="icon" href="/favicon.ico" type="image/x-icon" />
    <script type="text/javascript">
        function sub() {
            $.ajax({
                cache: true,
                type: "POST",
                url:"${ctx }/sy/user/nosm/user-admin!save.action",
                data:$('#inputForm').serialize(),// 你的formid
                async: false,
                error: function(request) {
                    alert("注册成功,确认跳转主页登录");
                    window.location.href="login.jsp";
                },
                success: function(data) {
                    alert("注册成功, 确认跳转主页登录");
                    window.location.href="login.jsp";
                }
            });
        }
    </script>
    <script type="text/javascript">
        $(document).ready(function(){

            //validate
            var registerFormValidate=$("#inputForm").validate({
                rules:{
                    loginName:{
                        required:true,
                        remote:{
                            url: "${ctx}/sy/user/user-admin!checkLoginNamelUn.action",     //后台处理程序
                            type: "post",  //数据发送方式
                            data: {   //要传递的数据
                                loginName: function() { return $("input[name='loginName']").val(); },
                                id:function(){ return $("input[name='id']").val(); }
                            }
                        }
                    },
                    email:{required:true,email:true,maxlength:60,remote:"${ctx}/sy/user/user-admin!checkEmailUn.action"},
                    pwd:{required:true,minlength:6,maxlength:40},
                    password1:{required:true,equalTo:"#pwd"}
                },
                messages: {
                    logName: {
                        minlength:"不能少于3个字符！",
                        maxlength:"不能超过60个字符！",
                        remote: "用户名已存在"
                    },
                    password1:{
                        equalTo: "前后密码不一致！"
                    },
                    email: {
                        email: "格式不正确！",
                        remote: "邮箱已存在"
                    }
                },
                errorPlacement: function(error, element) {
                    //error.appendTo(element.parent().parent());
                    element.parent().append(error);
                    //	$(element).css("borderColor","#C40000");
                }
            });
        });
    </script>
    <style type="text/css">
        label.error{
            display: block;
            margin-top: 3px;
        }
    </style>
</head>
<body style="background-color: rgb(83, 112, 136);">

<div id="wrap" class="wrapLogin">

    <input type="hidden" id="ctx" value="">



    <script>
        var _hmt = _hmt || [];
        (function() {
            var hm = document.createElement("script");
            hm.src = "https://hm.baidu.com/hm.js?dca3db1fcd7f962a4c8d93ac26ff28fb";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
    </script>


    <style>
        .gitItem{
            padding: 0px;
            margin: 0px;
            background: #24292C;
        }
        .gitItem a{
            margin: 0px;
            width: 95px;
            font-size: 14px;
            padding: 10px 40px;
        }
        .gitItem a:hover{
            background: black;
        }
    </style>
    <div id="header">
        <div id="headerCenter" class="bodyCenter" style="width: 1520px;">
            <div class="header_Item header_logo">


                <!-- <a href="http://www.diaowen.net/" hidefocus="true"><img alt="调问网" src="./调问网_files/20181214_logo.png" align="middle"><span class="titleTempSpan">体验</span></a> -->


            </div>

            <div class="header_Item header_menu">
                <ul>




                    <li><a href="http://help.diaowen.net/" class="dw-menu-a" id="helpMenu" hidefocus="true">  </a></li>
                </ul>
            </div>
            <div class="header_Item header_user" style="float: right;">
            </div>



        </div>
        <div style="clear: both;"></div>
    </div>
    <div style="clear: both;"></div>
    <div id="dwBody">
        <div id="dwBodyContent" class="bodyCenter" style="background: none; width: 1520px;">

            <div class="dw_login_logo">
                <h1 class="f1">问卷</h1>
            </div>


            <div id="dwLoginContent">
                <div class="dlcTitleBg" style="opacity: 0.6;"></div>
                <div class="dlcTitle">
                    <span class="dlcTitleTab">注 册 账 号</span>
                </div>

                <div class="loginFormContent">

                    <form id="inputForm" action="" method="post" onsubmit="return sub();">
                        <%--<input type="hidden"  name="name" value="eeeeeee">--%>
                        <div id="registerTabContent">
                            <div id="register-error" class="errorMsg" style="color: red;padding-left: 60px;">&nbsp;</div>
                            <div class="dlcLeft">
                                <div class="frmItem">
                                    <label for="" class="frm_label">账号名</label>
                                    <div class="frm_controls">
                                        <input  type="text" name="loginName" value="" class="frm-controlM" >
                                    </div>
                                </div>
                                <div class="frmItem">
                                    <label for="" class="frm_label">邮箱</label>
                                    <div class="frm_controls">
                                        <input id="email" type="text" class="frm-controlM" name="email" value="">
                                    </div>
                                </div>
                                <div class="frmItem">
                                    <label for="" class="frm_label">密码</label>
                                    <div class="frm_controls">
                                        <input type="password" name="pwd"  id="pwd" class="frm-controlM">
                                        <span class="frm_desc">字母、数字或者英文符号，最短6位，区分大小写</span>
                                    </div>
                                </div>
                                <div class="frmItem">
                                    <label for="" class="frm_label">确认密码</label>
                                    <div class="frm_controls">
                                        <input type="password" name="password1" class="frm-controlM">
                                        <span class="frm_desc">字母、数字或者英文符号，最短6位，区分大小写</span>
                                    </div>
                                </div>
                                <div class="frmItem" style="">
                                </div>
                                <div class="frmItem" style="padding: 3px 5px;padding-bottom: 7px;">
                                </div>
                                <div class="frmItem" style="padding: 6px 5px;">
                                    <label for="" class="frm_label">&nbsp;</label>
                                    <input type="button" value=" 注 册  账 号 " class="btnGreen" onclick="sub()" style="width: 330px;height: 45px;">
                                </div>
                            </div>
                            <div class="dlcRight">

                            </div>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>
<script type="text/javascript">
    resizeBodyWidth();
    $(".dlcTitleBg").animate({opacity:0.6},0);
    $("a").attr("hidefocus",true);
</script>

<script type="text/javascript">

</script>

</body></html>