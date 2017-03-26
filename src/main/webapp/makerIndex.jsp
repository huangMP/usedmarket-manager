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
        <span>----------------------------------------------</span>
        <h3>测试注册</h3><br/>
        <form action="AppUserInfo/insert" method="post" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>用户名</td>
                    <td><input name="username" /></td>
                </tr>
                <tr>
                    <td>密码</td>
                    <td><input name="password" /></td>
                </tr>
                <tr>
                    <td>手机</td>
                    <td><input name="phone" /></td>
                </tr>
                <tr>
                    <td>性别</td>
                    <td><input name="sex" /></td>
                </tr>
                <tr>
                    <td>头像</td>
                    <td><input type="file" name="headPortrait" ></td>
                </tr>
            </table>
            <input type="submit" value="提交">
        </form>

        <span>----------------------------------------------</span>
        <h3>测试登录</h3><br/>
        <form action="AppUserInfo/login" method="post" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>用户名</td>
                    <td><input name="username" /></td>
                </tr>
                <tr>
                    <td>密码</td>
                    <td><input name="password" /></td>
                </tr>
            </table>
            <input type="submit" value="登录">
        </form>

        <span>----------------------------------------------</span>
        <h3>测试修改头像</h3><br/>
        <form action="AppUserInfo/editHeadPortrait" method="post" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>用户Id</td>
                    <td><input name="userId"/></td>
                </tr>
                <tr>
                    <td>新头像</td>
                    <td><input type="file" name="headPortrait"></td>
                </tr>
            </table>
            <input type="submit" value="修改">
        </form>

        <span>----------------------------------------------</span>
        <h3>测试按列修改</h3><br/>
        <h4>注意：修改成功返回dto的UserInfoCustom，修改失败返回null</h4><br/>
        <form action="AppUserInfo/edit" method="post">
            <table>
                <tr>
                    <td>用户Id</td>
                    <td><input name="userId"/></td>
                </tr>
                <tr>
                    <td>要修改的列</td>
                    <td>
                        <select name="index">
                            <option value="password">密码：password</option>
                            <option value="phone">手机：phone</option>
                            <option value="sex">性别：sex</option>
                            <option value="yearOfBirth">出生年：yearOfBirth</option>
                            <option value="IDNum">身份证号：IDNum</option>
                            <option value="realName">真实姓名：realName</option>
                            <option value="school">学校：school</option>
                            <option value="shippingAddress">收货地址：shippingAddress</option>
                            <option value="constellation">星座：constellation</option>
                            <option value="bloodType">血型：bloodType</option>
                            <option value="signature">个性签名：signature</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>当前值</td>
                    <td><input name="currentValue"/></td>
                </tr>
                <tr>
                    <td>未来值</td>
                    <td><input name="futureValue"/></td>
                </tr>
            </table>
            <input type="submit" value="修改">
        </form>


        <span>----------用户查找-----------------------------------</span>
        <h4>条件查找 </h4>
        <form action="AppUserInfo/findByQueryCondition" method="post">
            <table>
                <tr>
                    <td>类型</td>
                    <td>
                        <select name="type">
                            <option value="all">all</option>
                            <option value="user_id">user_id：用户Id</option>
                            <option value="username">username：用户名</option>
                            <option value="phone">phone：手机</option>
                            <option value="sex">sex：性别</option>
                            <option value="year_of_birth">year_of_birth：出生年</option>
                            <option value="ID_num">ID_num：身份证号码</option>
                            <option value="real_name">real_name：真实姓名</option>
                            <option value="school">school：学校</option>
                            <option value="shipping_address">shipping_address：收获地址</option>
                            <option value="constellation星座">constellation星座</option>
                            <option value="blood_type">blood_type：血型</option>
                            <option value="signature">signature：个性签名</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>查询值</td>
                    <td><input name="queryValue"/></td>
                </tr>
                <tr>
                    <td>排序依据</td>
                    <td>
                        <select name="orderBy">
                            <option value="registration_date">注册时间：registration_date</option>
                        </select>
                    </td>
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

        <span>----------------------------------------------</span>
        <h4>根据userId查询该用户发布的二手商品及数量</h4>
        <form action="AppUserInfo/findCommodityCustomByUserId" method="post">
            <table>
                <tr>
                    <td>userId</td>
                    <td><input name="userId"/></td>
                </tr>
                <tr>
                    <td>从第</td>
                    <td><input name="index" /><span>条开始查</span></td>
                </tr>
            </table>
            <input type="submit" value="提交">
        </form>

        <span>----------------------------------------------</span>
        <h4>上传</h4>
        <form action="AppCommodity/upload" method="post" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>用户id</td>
                    <td><input name="userId"/></td>
                </tr>
                <tr>
                    <td>店铺id</td>
                    <td><input name="storeId"/></td>
                </tr>
                <tr>
                    <td>商品名称</td>
                    <td><input name="commodityName"/></td>
                </tr>
                <tr>
                    <td>类别</td>
                    <td><input name="category"/></td>
                </tr>
                <tr>
                    <td>价格</td>
                    <td><input name="price"/></td>
                </tr>
                <tr>
                    <td>数量</td>
                    <td><input name="amount"/></td>
                </tr>
                <tr>
                    <td>描述</td>
                    <td><input name="description"/></td>
                </tr>
                <tr>
                    <td>定位</td>
                    <td><input name="location"/></td>
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

        <span>----------------------------------------------</span>
        <h4>更新数据</h4>
        <form action="AppCommodity/updateCommodityNum" method="post">
            <table>
                <tr>
                    <td>商品id</td>
                    <td><input name="commodityId"/></td>
                </tr>
                <tr>
                    <td>数量</td>
                    <td><input name="amount"/></td>
                </tr>
                <tr>
                    <td>价格</td>
                    <td><input name="price"/></td>
                </tr>
                <tr>
                    <td>销售量</td>
                    <td><input name="salesVolume"/></td>
                </tr>
                <tr>
                    <td>收藏人数</td>
                    <td><input name="preferNum"/></td>
                </tr>
                <tr>
                    <td>销售状态</td>
                    <td><input name="status"/></td>
                </tr>
            </table>
            <input type="submit" value="提交">
        </form>

        <span>----------------------------------------------</span>

        <h4>查找</h4>
        <form action="AppCommodity/search" method="post">
            <table>
                <tr>
                    <td>类型</td>
                    <td><input name="type"/></td>
                </tr>
                <tr>
                    <td>查询值</td>
                    <td><input name="queryValue"/></td>
                </tr>
                <tr>
                    <td>排序方式</td>
                    <td><input name="order"/></td>
                </tr>
                <tr>
                    <td>排序依据</td>
                    <td><input name="orderBy"/></td>
                </tr>
                <tr>
                    <td>模糊查询字段</td>
                    <td><input name="indistinctField"/></td>
                </tr>
                <tr>
                    <td>查询位置</td>
                    <td><input name="index"/></td>
                </tr>
            </table>
            <input type="submit" value="提交">
        </form>

        <span>----------------------------------------------</span>

        <h4>删除</h4>
        <form action="AppCommodity/delete" method="post">
            <table>
                <tr>
                    <td>商品id</td>
                    <td><input name="commodityId"/></td>
                </tr>
            </table>
            <input type="submit" value="提交">
        </form>

        <span>----------捐赠物品-----------------------------------</span>
        <h4>条件查找 </h4>
        <form action="AppDonation/findByQueryCondition" method="post">
            <table>
                <tr>
                    <td>类型</td>
                    <td>
                        <select name="type">
                            <option value="donation_id">捐赠物品Id:donationId</option>
                            <option value="user_id">发布用户Id:userId</option>
                            <option value="donation_name">捐赠物品名称:donationName</option>
                            <option value="category">分类:category</option>
                            <option value="all">不指定列 : all</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>查询值</td>
                    <td><input name="queryValue"/></td>
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
                            <option value="donation_date">发布捐赠的时间:donationDate</option>
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

        <%--<span>-----------捐赠物品-----------------------------------</span>
        <h4>按列修改（不支持修改图片）</h4>
        <h4>修改成功返回 修改后的 DonationCustom；否则返回null </h4>
        <form action="Donation/edit" method="post">
            <table>
                <tr>
                    <td>捐赠Id</td>
                    <td><input name="donationId"/></td>
                </tr>
                <tr>
                    <td>要修改的列</td>
                    <td>
                        <select name="type">
                            <option value="donationName">捐赠物品名称:donationName</option>
                            <option value="category">分类:category</option>
                            <option value="amount">数量:amount</option>
                            <option value="location">定位 : location</option>
                            <option value="description">描述:description</option>
                            <option value="status">状态:status</option>
                            <option value="phone">联系电话:phone</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>当前值</td>
                    <td><input name="currentValue"/></td>
                </tr>
                <tr>
                    <td>未来值</td>
                    <td><input name="futrueValue"/></td>
                </tr>
                <tr>
                    <td>是否校验当前值</td>
                    <td>
                        <select name="isCheck">
                            <option value="true">是:true</option>
                            <option value="false">否:flase</option>
                        </select>
                    </td>
                </tr>
            </table>
            <input type="submit" value="提交">
        </form>
--%>

        <span>-----------收藏物品-----------------------------------</span>
        <h4>收藏</h4>
        <h5>添加收藏</h5>
        <form action="Collection/add" method="post">
            <table>
                <tr>
                    <td>用户id</td>
                    <td><input name="userId"/></td>
                </tr>
                <tr>
                    <td>商品id</td>
                    <td><input name="commodityId"/></td>
                </tr>
            </table>
            <input type="submit" value="提交">
        </form>
        <h5>删除收藏</h5>
        <form action="Collection/remove" method="post">
            <table>
                <tr>
                    <td>用户id</td>
                    <td><input name="userId"/></td>
                </tr>
                <tr>
                    <td>商品id</td>
                    <td><input name="commodityId"/></td>
                </tr>
            </table>
            <input type="submit" value="提交">
        </form>
        <span>-----------首页数据展示-----------------------------------</span>
        <form action="HomePage/display" method="post">
            <table>
                <tr>
                    <td>跑马条数目</td>
                    <td><input type="number" name="sentenceSize"></td>
                </tr>
                <tr>
                    <td>二手专题数目</td>
                    <td><input type="number" name="commodityCategorySize"></td>
                </tr>
                <tr>
                    <td>众筹数目</td>
                    <td><input type="number" name="crowdfundinSize"></td>
                </tr>
                <tr>
                    <td>动态数目</td>
                    <td><input type="number" name="dynamicsSize"></td>
                </tr>
                <tr>
                    <td>商店数目</td>
                    <td><input type="number" name="storeSize"></td>
                </tr>
            </table>
            <input type="submit" value="请求">
        </form>

        <span>-----------后台功能测试-----------------------------------</span>
        <div>
            <a href="webindex.jsp"><button style="color:red;"><h2>跳转到后台功能测试</h2></button></a>
        </div>

        <span>-----------推荐/跑马条-----------------------------------</span>
        <h4>查找</h4>
        <form action="Sentence/select" method="post">
            <table>
                <tr>
                    <td>类型</td>
                    <td>
                        <select name="type">
                            <option value="1">跑马条</option>
                            <option value="0">推荐</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>查询index</td>
                    <td><input name="index" type="number"/></td>
                </tr>
                <tr>
                    <td>数量</td>
                    <td><input name="num" type="number"/></td>
                </tr>
                <tr>
                    <td>是否随机取数</td>
                    <td>
                        <select name="doRandom">
                            <option value="true" typeof="java.lang.Boolean">是</option>
                            <option value="false" typeof="java.lang.Boolean">否</option>
                        </select>
                    </td>
                </tr>
            </table>
            <input type="submit" value="提交">
        </form>
        <span>----------众筹-----------------------------------</span>
        <h4>查找</h4>
        <form action="AppCrowdfunding/findByQueryCondition" method="post">
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


        <span>----------校历活动-----------------------------------</span>
        <h4>按条件查找 </h4>
        <form action="AppSchoolcalendar/findActivitiesByDate" method="post">
            <table>
                <tr>
                    <td>日期1</td>
                    <td>
                        <input name="date1" id="date1">
                    </td>
                </tr>
                <tr>
                    <td>日期2</td>
                    <td>
                        <input name="date2" id="date2">
                    </td>
                </tr>
            </table>
            <input type="submit" value="提交">
        </form>


        <span>----------二手分类-二手专题-----------------------------------</span>
        <h4>条件查找 </h4>
        <form action="CommodityCategory/findByQueryCondition" method="post">
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

        <span>-----------校园动态---捐赠动态----条件查找-----------------------</span>
        <h4>条件查找 </h4>
        <h4>找得到返回 Dynamics的list集合 </h4>
        <form action="AppDynamics/findDynamicsByQueryCondition" method="post">
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
        <span>-----------首页数据管理-----------------------------------</span>
        <div>
            <a href="homepagemngmt.jsp"><button style="color:red;"><h2>跳转到首页数据管理</h2></button></a>
        </div>


        <span>-----------校园动态-----------------------------------</span>
        <h4>通过 dynamicsId 展示某条动态</h4>
        <form action="AppDynamics/displaySchool" method="post">
            <table>
                <tr>
                    <td>动态Id</td>
                    <td><input name="dynamicsId"/></td>
                </tr>
            </table>
            <input type="submit" value="提交">
        </form>


    </div>
</div>




</body>

<script src="static/js/jquery-1.7.2.js"></script>
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
