<%--
  Created by IntelliJ IDEA.
  User: Peivxuan
  Date: 2016/12/1
  Time: 12:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页管理</title>
</head>
<body>
    <div>
        <span>-----------轮播图-----------------------------------</span>
        <h4>添加</h4>
        <form action="Carousel/upload" method="post" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>轮播图标题</td>
                    <td><input name="title"/></td>
                </tr>
                <tr>
                    <td>图片</td>
                    <td><input name="image" type="file" /></td>
                </tr>
            </table>
            <input type="submit" value="提交">
        </form>

        <span>-----------推荐/跑马条-----------------------------------</span>
        <h4>添加</h4>
        <form action="Sentence/add" method="post">
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

        <span>-----------新增动态-----------------------------------</span>
        <h4>校园动态：跳转到新增动态页面 (web使用的)</h4>
        <form action="WebDynamics/toInsertSchool" method="post">
            <input type="submit" value="点击按钮跳转">
        </form>
        <h4>捐赠动态：跳转到新增动态页面 (web使用的)</h4>
        <form action="WebDynamics/toInsertDonation" method="post">
            <input type="submit" value="点击按钮跳转">
        </form>

        <span>-----------商店-----------------------------------</span>
        <h4>添加</h4>
        <form action="WebStore/insert" method="post" enctype="multipart/form-data">
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

        <span>-----------标题头-----------------------------------</span>
        <h4>添加</h4>
        <form action="SubjectHead/insert" method="post">
            <table>
                <tr>
                    <td>类型</td>
                    <td>
                        <select name="type">
                            <option value="0">火热众筹</option>
                            <option value="1">二手专题</option>
                            <option value="2">特色店铺</option>
                            <option value="3">热门动态</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>类型</td>
                    <td>
                        <select name="title">
                            <option value="火热众筹">火热众筹</option>
                            <option value="二手专题">二手专题</option>
                            <option value="特色店铺">特色店铺</option>
                            <option value="热门动态">热门动态</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>“更多”文字描述</td>
                    <td><input name="moreDes"/></td>
                </tr>
            </table>
            <input type="submit" value="提交">
        </form>
    </div>
</body>
</html>
