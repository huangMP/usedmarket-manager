<%--
  Created by IntelliJ IDEA.
  User: huangMP
  Date: 2016/10/23
  Time: 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
<div>
    <div>
        <span>-----------捐赠动态-----------------------------------</span>
        <h4>跳转到新增动态页面 (web使用的)</h4>
        <form action="WebDynamics/toInsertDonation" method="post">
            <input type="submit" value="点击按钮跳转">
        </form>

        <span>-----------捐赠动态-----------------------------------</span>
        <h4>通过 dynamicsId 展示某条动态</h4>
        <form action="WebDynamics/displayDonation" method="post">
            <table>
                <tr>
                    <td>动态Id</td>
                    <td><input name="dynamicsId"/></td>
                </tr>
            </table>
            <input type="submit" value="提交">
        </form>

        <span>-----------捐赠动态-----------------------------------</span>
        <h4>通过 dynamicsId 修改某条动态 (web使用的) </h4>
        <form action="WebDynamics/toEditDonation" method="post">
            <table>
                <tr>
                    <td>动态Id</td>
                    <td><input name="dynamicsId"/></td>
                </tr>
            </table>
            <input type="submit" value="提交">
        </form>

        <span>-----------校园动态-----------------------------------</span>
        <h4>跳转到新增动态页面 (web使用的)</h4>
        <form action="WebDynamics/toInsertSchool" method="post">
            <input type="submit" value="点击按钮跳转">
        </form>

        <span>-----------校园动态-----------------------------------</span>
        <h4>通过 dynamicsId 展示某条动态</h4>
        <form action="WebDynamics/displaySchool" method="post">
            <table>
                <tr>
                    <td>动态Id</td>
                    <td><input name="dynamicsId"/></td>
                </tr>
            </table>
            <input type="submit" value="提交">
        </form>


        <span>-----------校园动态-----------------------------------</span>
        <h4>通过 dynamicsId 修改某条动态 (web使用的) </h4>
        <form action="WebDynamics/toEditSchool" method="post">
            <table>
                <tr>
                    <td>动态Id</td>
                    <td><input name="dynamicsId"/></td>
                </tr>
            </table>
            <input type="submit" value="提交">
        </form>


        <span>-----------校园动态---捐赠动态----条件查找-----------------------</span>
        <h4>条件查找 </h4>
        <h4>找得到返回 Dynamics的list集合 </h4>
        <form action="WebDynamics/findDynamicsByQueryCondition" method="post">
            <table>
                <tr>
                    <td>类型</td>
                    <td>
                        <select name="type">
                            <option value="type">type</option>
                            <option value="all">不指定列 : all</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>查询值</td>
                    <td>
                        <select name="queryValue">
                            <option value="1">校园动态</option>
                            <option value="2">捐赠动态</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>类型</td>
                    <td>
                        <select name="secondType">
                            <option value="dynamics_id">动态Id:dynamics_id</option>
                            <option value="add_user">发布用户Id:add_user</option>
                            <option value="title">动态标题:title</option>
                            <option value="origin">来源:origin</option>
                            <option value="all">不指定列 : all</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>查询值</td>
                    <td><input name="secondQueryValue"/></td>
                </tr>
                <tr>
                    <td>排序方式</td>
                    <td>
                        <select name="order">
                            <option value="ASC">升序:ASC</option>
                            <option value="DESC">降序:DESC</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>排序依据</td>
                    <td>
                        <select name="orderBy">
                            <option value="add_date">发布动态的时间:add_date</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>模糊查询字段</td>
                    <td><input name="indistinctField"/></td>
                </tr>
                <tr>
                    <td>查询位置</td>
                    <td><input name="index"  value="0"/></td>
                </tr>
                <tr>
                    <td>查询条数</td>
                    <td><input name="size"  value="10"/></td>
                </tr>
            </table>
            <input type="submit" value="提交">
        </form>


        <span>-----------二手分类-二手专题----------------------------------</span>
        <h4>添加分类 </h4>
        <h4>sort用于 取出的时候进行排序 sort越大，排越前 </h4>
        <form action="WebCommodityCategory/insert" method="post" enctype="multipart/form-data">
            <table>
                <td>类型</td>
                <td>
                    <select name="type">
                        <option value="1">1：二手分类；</option>
                        <option value="2">2：二手专题；</option>
                    </select>
                </td>
                <tr>
                    <td>分类名称</td>
                    <td><input name="title"/></td>
                </tr>
                <tr>
                    <td>排在第几</td>
                    <td><input name="sort" type="number" /></td>
                </tr>
                <tr>
                    <td>图片</td>
                    <td><input name="picture" type="file" /></td>
                </tr>
            </table>
            <input type="submit" value="提交">
        </form>

        <span>---------二手分类-二手专题-----------------------------------</span>
        <h4>根据id删除分类 </h4>
        <form action="WebCommodityCategory/delete" method="post">
            <table>
                <tr>
                    <td>二手分类id</td>
                    <td><input name="commodityCategoryId"/></td>
                </tr>
            </table>
            <input type="submit" value="提交">
        </form>

        <span>----------二手分类-二手专题--------------------------------</span>
        <h4>修改分类 </h4>
        <form action="WebCommodityCategory/update" method="post" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>分类id</td>
                    <td><input name="commodityCategoryId"/></td>
                </tr>
                <tr>
                    <td>分类名称</td>
                    <td><input name="title"/></td>
                </tr>
                <tr>
                    <td>排在第几</td>
                    <td><input name="sort" type="number" /></td>
                </tr>
                <tr>
                    <td>图片</td>
                    <td><input name="picture" type="file" /></td>
                </tr>
            </table>
            <input type="submit" value="提交">
        </form>

        <span>----------二手分类-二手专题-----------------------------------</span>
        <h4>条件查找 </h4>
        <form action="WebCommodityCategory/findByQueryCondition" method="post">
            <table>
                <tr>
                    <td>类型</td>
                    <td>
                        <select name="type">
                            <option value="type">type</option>
                            <option value="all">all</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>查询值</td>
                    <td>
                        <select name="queryValue">
                            <option value="1">1：二手分类；</option>
                            <option value="2">2：二手专题；</option>
                        </select></td>
                </tr>
                <tr>
                    <td>二级查询类型</td>
                    <td>
                        <select name="secondType">
                            <option value="commodity_category_id">id:commodity_category_id</option>
                            <option value="attachment_id">图片id:attachment_id</option>
                            <option value="title">标题:title</option>
                            <option value="add_user_id">发布用户:add_user_id</option>
                            <option value="all">all</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>二级查询值</td>
                    <td><input name="secondQueryValue"/></td>
                </tr>
                <tr>
                    <td>排序方式</td>
                    <td>
                        <select name="order">
                            <option value="DESC">降序:DESC</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>排序依据</td>
                    <td>
                        <select name="orderBy">
                            <option value="sort">用于排序的sort</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>模糊查询字段</td>
                    <td><input name="indistinctField"/></td>
                </tr>
                <tr>
                    <td>查询位置</td>
                    <td><input name="index"  value="0"/></td>
                </tr>
                <tr>
                    <td>查询条数</td>
                    <td><input name="size"  value="10"/></td>
                </tr>
            </table>
            <input type="submit" value="提交">
        </form>

        <span>-----------------众筹-------------------------</span>
        <h4>添加众筹</h4>
        <form action="WebCrowdfunding/insert" method="post" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>类型</td>
                    <td>
                        <select name="crowdfundingType">
                            <option value="1">创意众筹：1</option>
                            <option value="2">爱心众筹：2</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>标题</td>
                    <td><input name="title"/></td>
                </tr>
                <tr>
                    <td>描述</td>
                    <td><input name="description"/></td>
                </tr>
                <tr>
                    <td>来源</td>
                    <td><input name="origin"/></td>
                </tr>
                <tr>
                    <td>目标金额</td>
                    <td><input name="target_amount" type="number"/></td>
                </tr>
                <tr>
                    <td>图片1</td>
                    <td><input type="file" name="images"></td>
                </tr>
                <tr>
                    <td>图片2</td>
                    <td><input type="file" name="images"></td>
                </tr>
            </table>
            <input type="submit" value="提交">
        </form>

        <span>----------众筹-----------------------------------</span>
        <h4>查找</h4>
        <form action="WebCrowdfunding/findByQueryCondition" method="post">
            <table>
                <tr>
                    <td>类型</td>
                    <td>
                        <select name="type">
                            <option value="all">不指定列 : all</option>
                            <option value="crowdfunding_type">type</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>查询值</td>
                    <td>
                        <select name="queryValue">
                            <option value="1">创意众筹</option>
                            <option value="2">爱心众筹</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>类型</td>
                    <td>
                        <select name="secondType">
                            <option value="all">不指定列 : all</option>
                            <option value="add_user">添加人 : add_user</option>
                            <option value="title">标题 : title</option>
                            <option value="origin">来源 : origin</option>
                            <option value="crowdfunding_id">众筹id : crowdfunding_id</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>查询值</td>
                    <td><input name="secondQueryValue"/></td>
                </tr>
                <tr>
                    <td>排序方式</td>
                    <td>
                        <select name="order">
                            <option value="ASC">升序:ASC</option>
                            <option value="DESC">降序:DESC</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>排序依据</td>
                    <td>
                        <select name="orderBy">
                            <option value="add_date">发布时间:add_date</option>
                            <option value="target_amount">目标金额:target_amount</option>
                            <option value="now_amount">现得到金额:now_amount</option>
                            <option value="support_num">支持人数:support_num</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>模糊查询字段</td>
                    <td><input name="indistinctField"/></td>
                </tr>
                <tr>
                    <td>查询位置</td>
                    <td><input name="index" value="0"/></td>
                </tr>
                <tr>
                    <td>查询数量</td>
                    <td><input name="size" value="10"/></td>
                </tr>
            </table>
            <input type="submit" value="提交">
        </form>

        <span>-----------商店-----------------------------------</span>
        <h4>添加</h4>
        <form action="/WebStore/insert" method="post" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>描述</td>
                    <td><input name="description"/></td>
                </tr>
                <tr>
                    <td>店名</td>
                    <td><input name="storeName"/></td>
                </tr>
                <tr>
                    <td>图片</td>
                    <td><input name="images" type="file" /></td>
                </tr>
            </table>
            <input type="submit" value="提交">
        </form>

        <span>-----------商店-----------------------------------</span>
        <h4>查找所有商店 </h4>
        <form action="WebStore/findAll" method="post">
            <input type="submit" value="提交">
        </form>



        <h4>----------------添加角色----------------</h4>
        <form action="WebRole/findByQueryCondition" method="post">
            <table>
                <tr>
                    <td>类型</td>
                    <td>
                        <select name="type">
                            <option value="all">不指定列 : all</option>
                            <option value="role_id">id : role_id</option>
                            <option value="role_name">名称 : role_name</option>
                            <option value="status">状态 : status</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>查询值</td>
                    <td><input name="queryValue"/></td>
                </tr>
                <tr>
                    <td>查询位置</td>
                    <td><input name="index" value="0"/></td>
                </tr>
                <tr>
                    <td>查询数量</td>
                    <td><input name="size" value="10"/></td>
                </tr>
            </table>
            <input type="submit" value="提交">
        </form>

        <h4>----------------添加角色----------------</h4>
        <form action="/UsedMarket/WebRole/insert" method="post">
            <table>
                <tr>
                    <td>角色英文名称</td>
                    <td><input name="roleName"/></td>
                </tr>
                <tr>
                    <td>角色自定义名称</td>
                    <td><input name="roleRealName"/></td>
                </tr>
                <tr>
                    <td>状态</td>
                    <td>
                        <select name="roleRealName">
                            <option value="1">使用：1</option>
                            <option value="”0">停用：0</option>
                        </select>
                    </td>
                </tr>
            </table>
            <input type="submit" value="提交">
        </form>

        <h4>----------------修改角色----------------</h4>
        <form action="/UsedMarket/WebRole/update" method="post">
            <table>
                <tr>
                    <td>角色Id</td>
                    <td><input name="roleId"/></td>
                </tr>
                <tr>
                    <td>角色英文名称</td>
                    <td><input name="roleName"/></td>
                </tr>
                <tr>
                    <td>角色自定义名称</td>
                    <td><input name="roleRealName"/></td>
                </tr>
                <tr>
                    <td>状态</td>
                    <td>
                        <select name="status">
                            <option value="1">使用：1</option>
                            <option value="”0">停用：0</option>
                        </select>
                    </td>
                </tr>
            </table>
            <input type="submit" value="提交">
        </form>

        <h4>----------------删除角色----------------</h4>
        <form action="/UsedMarket/WebRole/delete" method="post">
            <table>
                <tr>
                    <td>角色Id</td>
                    <td><input name="roleId"/></td>
                </tr>
            </table>
            <input type="submit" value="提交">
        </form>

        <h4>----------------推荐/跑马条----------------</h4>
        <form action="/UsedMarket/Sentence/add" method="post">
            <table>
                <tr>
                    <td>类型</td>
                    <td>
                        <select name="type">
                            <option value="1">跑马条：1</option>
                            <option value="0">推荐：0</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>文本</td>
                    <td><input name="text"/></td>
                </tr>
            </table>
            <input type="submit" value="提交">
        </form>


    </div>
</div>
</body>

<script src="/static/js/jquery-3.0.0.js"></script>
<script type="text/javascript">

    /*    $(function(){
     $.ajax({
     type:'post',
     url:'/UserInfo/login',
     //请求是key/value这里不需要指定contentType，因为默认就 是key/value类型
     //contentType:'application/json;charset=utf-8',
     //数据格式是json串，商品信息
     data:{username:"11111",password:"1111"},
     success:function(data){//返回json结果
     if( "" == data ){
     alert("是null");
     }else{
     alert("不是null");
     }
     alert(data);
     }
     });
     });*/

</script>
</html>
