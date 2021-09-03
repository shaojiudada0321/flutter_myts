import 'package:flutter/material.dart';
import 'package:flutter_myts/common/view_state.dart';
import 'package:flutter_myts/model/user.dart';
import 'package:flutter_myts/ui/base_view.dart';
import 'package:flutter_myts/ui/gridview/mock_data.dart';
import 'package:flutter_myts/ui/gridview/service_item.dart';
import 'package:flutter_myts/ui/product/hot_product_info.dart';
import 'package:flutter_myts/viewModel/hot_view_model.dart';
import 'package:provider/provider.dart';

class HotPageWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return BaseView<HotViewModel>(
      onModelReady: (model) async {
        model.initData();
      },
      model: HotViewModel(api: Provider.of(context)),
      builder: (context,model,child) => Scaffold(
        body: _buildBody(context, model),
      ),
    );
  }
  Widget _buildBody(BuildContext context, HotViewModel model) {
    /*热销顶部搜索栏*/
    Widget buildTextField() {
      //theme设置局部主题
      return TextField(
        cursorColor: Colors.black, //设置光标
        //textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          //输入框decoration属性
          //contentPadding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 1.0),
            contentPadding: EdgeInsets.only(
                left: 0, right: 24, top: 0, bottom: 15),
            border: InputBorder.none,
            // icon: ImageIcon(
            // AssetImage("image/search.png")
            // ),
            icon: Icon(Icons.search),
            hintText: "输入搜索商品",
            hintStyle: TextStyle(fontSize: 14, color: Colors.grey)),
        style: TextStyle(fontSize: 14, color: Colors.black),
      );
    }
    Widget toptitle_editView() {
      return Container(
        //修饰黑色背景与圆角
        decoration: BoxDecoration(
            border: Border.all(color: Color.fromRGBO(86, 187, 146, 1), width: 1.0), //灰色一层边框
            color: Color.fromRGBO(246, 246, 246, 1),
            borderRadius: BorderRadius.all(Radius.circular(15.0))
        ),
        alignment: Alignment.center,
        height: 36,
        margin: EdgeInsets.only(top: 10.0, right: 10.0),
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
        child: buildTextField(),
      );
    }

    /**/
    /* 首页宫格菜单 */
    Widget gridview_menu = Container(
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Color.fromRGBO(250, 250, 250, 1), width: 0.1),
            top: BorderSide(color: Color.fromRGBO(250, 250, 250, 1), width: 0.1),
            left: BorderSide(color: Color.fromRGBO(250, 250, 250, 1), width: 0.1),
            right: BorderSide(color: Color.fromRGBO(250, 250, 250, 1), width: 0.1),
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
              color: Colors.grey,
              offset: Offset(1.0, 4.0), //阴影y轴偏移量
              blurRadius: 2, //阴影模糊程度
              spreadRadius: 0 //阴影扩散程度
          )
        ],
        color: Color.fromRGBO(250, 250, 250, 1)
      ),
      child: GridView.count(
        // //水平子Widget之间间距
        // crossAxisSpacing: 10.0,
        // //垂直子Widget之间间距
        // mainAxisSpacing: 30.0,
        // //GridView内边距
        // padding: EdgeInsets.all(10.0),
        // //子Widget宽高比例
        // childAspectRatio: 2.0,
        // //一行的Widget数量
        crossAxisCount: 5,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 0),
        children: hot_gridview_List.map((item) => ServiceItem(data: item)).toList(),
      )
    );

    /* 热销页产品列表 */
    Widget product_list = Container(
        child:Column(
          children: [
            new SizedBox(height: 30,),
            ListView.builder(
              itemCount: model.funcLists.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var func = model.funcLists[index];
                return ListTile(
                  contentPadding: const EdgeInsets.all(10.0),
                  isThreeLine: true,//子item的是否为三行
                  dense: false,
                  leading: Container(
                    child: Image.asset(
                      "${func["image"]}",
                      fit: BoxFit.cover,
                    ),
                    width: 120,
                    height: 150,
                    color: Colors.orange,
                  ),
                  title: Text(
                    "${func["name"]}",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 5.0),
                        child: Text(
                          "${func["desc"]==null?"":func["desc"]}",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.bottomCenter,
                            margin: EdgeInsets.only(top: 8.0),
                            child: Text(
                              "${func["Price"]}￥",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.orange,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            height: 32,
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            margin: EdgeInsets.only(top: 8.0,left: 20.0),
                            child: Text(
                              "${func["PreOrder"]}人已预购",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            height: 35,
                          ),
                        ],
                      )
                    ],
                  ),
                  onTap: () {
                    //爆款列表点击逻辑处理
                    model.jump_Product();
                    //Navigator.of(context).pushNamed('hot_product_info', arguments: User(25, "xuchaodong"));
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //       builder: (context) => ProductWidget(),
                    //       settings: RouteSettings(
                    //         arguments: User(25, "xuchaodong"),
                    //       )
                    //   ),
                    // );
                    print("跳转到详情页");
                  },
                );
              },
            )
          ],
        )
    );

    return Container(
      child: model.state == ViewState.Idle ? GestureDetector(
          child: new ListView(
            children: <Widget>[
              Padding(padding: const EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0), child: toptitle_editView(),),
              //Expanded(child: toptitle_editView(),flex: 1),
              gridview_menu,
              product_list
            ]
          )
        ): Center(
            child: Text('加载数据中...'))
    );
  }
}