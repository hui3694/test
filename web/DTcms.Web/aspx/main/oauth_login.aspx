﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="DTcms.Web.UI.Page.oauth_login" ValidateRequest="false" %>
<%@ Import namespace="System.Collections.Generic" %>
<%@ Import namespace="System.Text" %>
<%@ Import namespace="System.Data" %>
<%@ Import namespace="DTcms.Common" %>
<script runat="server">
private const int site_id = 4;
override protected void OnInit(EventArgs e)
{
	base.OnInit(e);
	StringBuilder templateBuilder = new StringBuilder(220000);
	
	templateBuilder.Append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n<title>合作网站登录 - ");
	templateBuilder.Append(Utils.ObjectToStr(site.name));
	templateBuilder.Append("</title>\r\n<meta name=\"keywords\" content=\"");
	templateBuilder.Append(Utils.ObjectToStr(site.seo_keyword));
	templateBuilder.Append("\" />\r\n<meta name=\"description\" content=\"");
	templateBuilder.Append(Utils.ObjectToStr(site.seo_description));
	templateBuilder.Append("\" />\r\n<link href=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/artdialog/ui-dialog.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n<link href=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("css/validate.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n<link href=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/css/style.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/jquery/jquery-1.11.2.min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/jquery/jquery.form.min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/jquery/Validform_v5.3.2_min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/artdialog/dialog-plus-min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/js/common.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\">\r\n$(function(){\r\ntabs('#oauthTabs','click');\r\n//初始化表单1\r\nAjaxInitForm('#bindForm', '#btnSubmit1', 0, '#turl');\r\n//初始化表单2\r\nAjaxInitForm('#oauthForm', '#btnSubmit2', 0, '#turl');\r\n});\r\n</");
	templateBuilder.Append("script>\r\n</head>\r\n<body>\r\n<!--Header-->\r\n");

	templateBuilder.Append("<div class=\"header\">\r\n<div class=\"header-wrap\">\r\n<div class=\"section\">\r\n<div class=\"left-box\">\r\n<a class=\"logo\" href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\">");
	templateBuilder.Append(Utils.ObjectToStr(site.name));
	templateBuilder.Append("</a>\r\n<p class=\"nav\">\r\n<a href=\"");
	templateBuilder.Append(linkurl("news"));

	templateBuilder.Append("\">资讯</a>\r\n<a href=\"");
	templateBuilder.Append(linkurl("goods"));

	templateBuilder.Append("\">商城</a>\r\n<a href=\"");
	templateBuilder.Append(linkurl("video"));

	templateBuilder.Append("\">视频</a>\r\n<a href=\"");
	templateBuilder.Append(linkurl("photo"));

	templateBuilder.Append("\">图片</a>\r\n<a href=\"");
	templateBuilder.Append(linkurl("down"));

	templateBuilder.Append("\">下载</a>\r\n<a href=\"");
	templateBuilder.Append(linkurl("forum_index","index"));

	templateBuilder.Append("\">论坛</a>\r\n</p>\r\n</div>\r\n<div class=\"search\">\r\n<input id=\"keywords\" name=\"keywords\" class=\"input\" type=\"text\" onkeydown=\"if(event.keyCode==13){SiteSearch('");
	templateBuilder.Append(linkurl("search"));

	templateBuilder.Append("', '#keywords');return false};\" placeholder=\"输入回车搜索\" x-webkit-speech=\"\" />\r\n<input class=\"submit\" type=\"submit\" onclick=\"SiteSearch('");
	templateBuilder.Append(linkurl("search"));

	templateBuilder.Append("', '#keywords');\" value=\"搜索\" />\r\n</div>\r\n<div class=\"right-box\">\r\n<script type=\"text/javascript\">\r\n$.ajax({\r\ntype: \"POST\",\r\nurl: \"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=user_check_login\",\r\ndataType: \"json\",\r\ntimeout: 20000,\r\nsuccess: function (data, textStatus) {\r\nif (data.status == 1) {\r\n$(\"#menu\").prepend('<li class=\"line\"><a href=\"");
	templateBuilder.Append(linkurl("usercenter","exit"));

	templateBuilder.Append("\">退出</a></li>');\r\n$(\"#menu\").prepend('<li class=\"login\"><em></em><a href=\"");
	templateBuilder.Append(linkurl("usercenter","index"));

	templateBuilder.Append("\">会员中心</a></li>');\r\n} else {\r\n$(\"#menu\").prepend('<li class=\"line\"><a href=\"");
	templateBuilder.Append(linkurl("register"));

	templateBuilder.Append("\">注册</a></li>');\r\n$(\"#menu\").prepend('<li class=\"login\"><em></em><a href=\"");
	templateBuilder.Append(linkurl("login"));

	templateBuilder.Append("\">登录</a></li>');\r\n}\r\n}\r\n});\r\n</");
	templateBuilder.Append("script>\r\n<ul id=\"menu\">\r\n<li>\r\n<a href=\"");
	templateBuilder.Append(linkurl("cart"));

	templateBuilder.Append("\">购物车<span id=\"shoppingCartCount\"><script type=\"text/javascript\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=view_cart_count\"></");
	templateBuilder.Append("script></span>件</a>\r\n</li>\r\n<li><a href=\"");
	templateBuilder.Append(linkurl("content","contact"));

	templateBuilder.Append("\">联系我们</a></li>\r\n</ul>\r\n</div>\r\n</div>\r\n</div>\r\n</div>");


	templateBuilder.Append("\r\n<!--/Header-->\r\n<div class=\"main-box\">\r\n<div class=\"section clearfix\">\r\n<div class=\"main-tit\">\r\n<h2>合作网站登录</h2>\r\n</div>\r\n<div id=\"oauthTabs\" class=\"inner-box\">\r\n<!--选项卡-->\r\n<div id=\"tabHead\" class=\"tab-head\">\r\n<ul>\r\n<li>\r\n<a class=\"selected\" href=\"javascript:;\">绑定已有的账号</a>\r\n</li>\r\n<li>\r\n<a href=\"javascript:;\">创建新的账号</a>\r\n</li>\r\n</ul>\r\n</div>\r\n<!--/选项卡-->\r\n<!--选项内容-->\r\n<form name=\"bindForm\" id=\"bindForm\" url=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=user_oauth_bind\">\r\n<div class=\"dl-list tab-content\" style=\"display:block;\">\r\n<dl>\r\n<dt>用户名：</dt>\r\n<dd><input name=\"txtUserName\" type=\"text\" class=\"input txt\" datatype=\"*\" nullmsg=\"请输入用户名\" sucmsg=\" \" /></dd>\r\n</dl>\r\n<dl>\r\n<dt>密　码：</dt>\r\n<dd><input name=\"txtPassword\" type=\"password\" class=\"input txt\" datatype=\"*6-20\" nullmsg=\"请输入密码\" sucmsg=\" \" /></dd>\r\n</dl>\r\n<dl>\r\n<dt></dt>\r\n<dd><input id=\"btnSubmit1\" name=\"btnSubmit1\" type=\"submit\" class=\"btn\" value=\"立即绑定\" /></dd>\r\n</dl>\r\n</div>\r\n</form>\r\n<form name=\"oauthForm\" id=\"oauthForm\" url=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=user_oauth_register\">\r\n<div class=\"dl-list tab-content\">\r\n<dl>\r\n<dt>电子邮箱：</dt>\r\n<dd><input name=\"txtEmail\" type=\"text\" class=\"input txt\" datatype=\"e\" nullmsg=\"请输入邮箱地址\" sucmsg=\" \" /></dd>\r\n</dl>\r\n<dl>\r\n<dt>手机号码：</dt>\r\n<dd><input name=\"txtMobile\" type=\"text\" class=\"input txt\" datatype=\"m\" nullmsg=\"请输入手机号码\" sucmsg=\" \" /></dd>\r\n</dl>\r\n<dl>\r\n<dt>登录密码：</dt>\r\n<dd><input name=\"txtPassword\" type=\"password\" class=\"input txt\" datatype=\"*6-20\" nullmsg=\"请设置密码\" sucmsg=\" \" /></dd>\r\n</dl>\r\n<dl>\r\n<dt></dt>\r\n<dd><input id=\"btnSubmit2\" name=\"btnSubmit1\" type=\"submit\" class=\"btn\" value=\"创建新账户\" /></dd>\r\n</dl>\r\n</div>\r\n</form>\r\n<!--/选项内容-->\r\n<input id=\"turl\" name=\"turl\" type=\"hidden\" value=\"");
	templateBuilder.Append(Utils.ObjectToStr(turl));
	templateBuilder.Append("\" />\r\n</div>\r\n</div>\r\n</div>\r\n<!--Footer-->\r\n");

	templateBuilder.Append("<div class=\"footer clearfix\">\r\n<div class=\"foot-nav\">\r\n");
	DataTable footMenu = get_plugin_method("DTcms.Web.Plugin.Menu", "menu", "get_menu_list", 3, 0);

	foreach(DataRow dr in footMenu.Rows)
	{

	templateBuilder.Append("\r\n<a href=\"" + Utils.ObjectToStr(dr["link_url"]) + "\" target=\"" + Utils.ObjectToStr(dr["target"]) + "\" title=\"" + Utils.ObjectToStr(dr["title"]) + "\">" + Utils.ObjectToStr(dr["title"]) + "</a>\r\n");
	}	//end for if

	templateBuilder.Append("\r\n</div>\r\n<div class=\"copyright\">\r\n<p>版权所有 ");
	templateBuilder.Append(site.company.ToString());

	templateBuilder.Append(" <a href=\"http://www.miibeian.gov.cn/\" target=\"_blank\" rel=\"nofollow\">");
	templateBuilder.Append(Utils.ObjectToStr(site.crod));
	templateBuilder.Append("</a> DTcms版本号：");
	templateBuilder.Append(Utils.GetVersion().ToString());

	templateBuilder.Append("</p>\r\n<p>");
	templateBuilder.Append(site.copyright.ToString());

	templateBuilder.Append("</p>\r\n<p><script src=\"http://s24.cnzz.com/stat.php?id=1996164&web_id=1996164&show=pic\" language=\"javascript\"></");
	templateBuilder.Append("script></p>\r\n</div>\r\n</div>\r\n<script src=\"/plugins/qqonline/skin/js/qqonline.js\" language=\"javascript\"></");
	templateBuilder.Append("script>");


	templateBuilder.Append("\r\n<!--/Footer-->\r\n</body>\r\n</html>");
	Response.Write(templateBuilder.ToString());
}
</script>