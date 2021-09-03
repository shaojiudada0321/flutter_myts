import 'package:flutter/material.dart';
import 'package:flutter_myts/common/view_state.dart';
import 'package:flutter_myts/ui/base_view.dart';
import 'package:flutter_myts/ui/gridview/mock_data.dart';
import 'package:flutter_myts/ui/gridview/service_item.dart';
import 'package:flutter_myts/viewModel/hot_view_model.dart';
import 'package:provider/provider.dart';

class HotPageWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return BaseView<HotViewModel>(
      onModelReady: (model){
        //加载
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
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5),
            top: BorderSide(color: Colors.grey, width: 0.5),
            left: BorderSide(color: Colors.grey, width: 0.5),
            right: BorderSide(color: Colors.grey, width: 0.5),
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))
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

    // return  Container(
    //     child: model.state == ViewState.Idle ? GestureDetector(
    //       onTap: () {
    //         // 点击空白区域，回收键盘
    //         print("点击了空白区域");
    //         //provider.focusNodePassWord.unfocus();
    //         //provider.focusNodeUserName.unfocus();
    //       },
    //       child: new ListView(
    //         children: <Widget>[
    //           //new SizedBox(height: 60,),
    //           /*顶部搜索*/
    //           Row(mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 Padding(padding: const EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0), ),
    //                 Expanded(child: toptitle_editView(),flex: 1),
    //               ]
    //           ),
    //           gridview_menu,
    //         ],
    //       ),
    //     ): Center(
    //         child: Text('加载数据中...'))
    // );

    return Container(
      child: model.state == ViewState.Idle ? GestureDetector(
          child: new ListView(
            children: <Widget>[
              Padding(padding: const EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0), child: toptitle_editView(),),
              //Expanded(child: toptitle_editView(),flex: 1),
              gridview_menu,
            ]
          )
        ): Center(
            child: Text('加载数据中...'))
    );
  }
}