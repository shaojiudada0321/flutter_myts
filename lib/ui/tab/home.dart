import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../firstScreen.dart';

class HomePageWidget extends StatelessWidget{



  var funcLists = [];



  void initData() {
    funcLists.add(
        {"name": "基础组件", "desc": "在构建您的第一个Flutter应用程序之前，您绝对需要了解这些widget。"});
    funcLists.add({
      "name": "Material Components",
      "desc": "实现了Material Design 指南的视觉、效果、motion-rich的widget。"
    });
    funcLists.add({
      "name": "Cupertino(iOS风格的widget)",
      "desc": "用于当前iOS设计语言的美丽和高保真widget。"
    });
    funcLists.add({
      "name": "Layout",
      "desc": "排列其它widget的columns、rows、grids和其它的layouts。"
    });
    funcLists.add({"name": "Text", "desc": "文本显示和样式。"});
    funcLists.add({"name": "Assets、图片、Icons", "desc": "管理assets, 显示图片和Icon。"});
    funcLists.add({
      "name": "Input",
      "desc": "Material Components 和 Cupertino中获取用户输入的widget。"
    });
    funcLists.add({"name": "动画和Motion", "desc": "在您的应用中使用动画。查看Flutter中的动画总览。"});
    funcLists.add({"name": "交互模型", "desc": "响应触摸事件并将用户路由到不同的页面视图（View）。"});
    funcLists.add({"name": "样式", "desc": "管理应用的主题，使应用能够响应式的适应屏幕尺寸或添加填充。"});
    funcLists.add(
        {"name": "绘制和效果", "desc": "Widget将视觉效果应用到其子组件，而不改变它们的布局、大小和位置。"});
    funcLists.add({"name": "Async", "desc": "Flutter应用的异步模型。"});
    funcLists.add({"name": "滚动", "desc": "滚动一个拥有多个子组件的父组件。"});
    funcLists.add({"name": "辅助功能", "desc": "给你的App添加辅助功能(这是一个正在进行的工作)。"});

    print(funcLists);

  }

  @override
  Widget build(BuildContext context) {
    //   Widget listView() {
    //     return ListView.builder(
      //     padding: const EdgeInsets.all(15.0),
      //     itemCount: funcLists.length,
      //     shrinkWrap: true,
      //     itemBuilder: (context, index) {
      //       var func = funcLists[index];
      //       return ListTile(
      //         contentPadding: const EdgeInsets.all(10.0),
      //         title: Text(
      //           "${func["name"]}",
      //           style: TextStyle(
      //             fontSize: 20,
      //             color: Colors.black,
      //           ),
      //         ),
      //         subtitle: Text(
      //           "${func["desc"]}",
      //           style: TextStyle(
      //             fontSize: 15,
      //             color: Colors.grey,
      //           ),
      //         ),
      //         onTap: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) {
      //               return FirstScreen();
      //             }),
      //           );
      //         },
      //       );
      //     },
      //   );
      // }
    /* 首页顶部搜索栏 */
    var cancleView = Text("广州");
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
            //border: Border.all(color: Colors.grey, width: 1.0), //灰色一层边框
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
    /* 首页热搜 */
    Widget hot_words = new Container(
      margin: EdgeInsets.only(left: 10.0,right: 10.0,top: 8.0),
      child: new Row(
        children: [
          Text('热搜：',style: TextStyle(color: Colors.grey)),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              //border: Border.all(color: Colors.grey,width: 0.5),
              color: Color.fromRGBO(246, 246, 246, 1),
              borderRadius: BorderRadius.circular(50.0)
            ),
            child: Text('肿瘤',style: TextStyle(color: Colors.grey)),
            width: 50.0,
            height: 25.0,
          ),Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              //border: Border.all(color: Colors.grey,width: 0.5),
                color: Color.fromRGBO(246, 246, 246, 1),
                borderRadius: BorderRadius.circular(50.0)
            ),
            child: Text('健康',style: TextStyle(color: Colors.grey)),
            width: 50.0,
            height: 25.0,
          ),Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              //border: Border.all(color: Colors.grey,width: 0.5),
                color: Color.fromRGBO(246, 246, 246, 1),
                borderRadius: BorderRadius.circular(50.0)
            ),
            child: Text('体检',style: TextStyle(color: Colors.grey),),
            width: 50.0,
            height: 25.0,
          ),
        ],
      ),
    );
    /* 首页轮播 */
    Widget _swiperBuilder(BuildContext context, int index) {
      return (Image.network(
        "http://via.placeholder.com/350x150",
        fit: BoxFit.fill,
      ));
    }
    Widget swiper = Container(
      margin: EdgeInsets.all(10.0),
      width: MediaQuery.of(context).size.width,
      height: 200.0,
      child: Swiper(
        itemBuilder: _swiperBuilder,
        itemCount: 3,
        pagination: new SwiperPagination(
            builder: DotSwiperPaginationBuilder(
              color: Colors.black54,
              activeColor: Colors.white,
            )),
        control: new SwiperControl(),
        scrollDirection: Axis.horizontal,
        autoplay: true,
        onTap: (index) => print('点击了第$index个'),
      ));

    /* 首页预约与报告 */
    Widget appointment = Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.only(top: 15.0,left: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(226, 226, 226, 1),width: 0.5),
        borderRadius: BorderRadius.circular(5.0)
      ),
      width: 160,
      height: 100,
      child: Column(
          children: [
            Row(
              children: [
                Text('预约',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
                Text('>',style: TextStyle(fontSize: 20,),),
              ],
            ),
            Text('上门/检测服务',style: TextStyle(fontSize: 12.0),)
          ],crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
    Widget report = Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.only(top: 15.0,left: 8.0),
      decoration: BoxDecoration(
          border: Border.all(color: Color.fromRGBO(226, 226, 226, 1),width: 0.5),
          borderRadius: BorderRadius.circular(5.0)
      ),
      width: 160,
      height: 100,
      child: Column(
        children: [
          Row(
            children: [
              Text('报告',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
              Text('>',style: TextStyle(fontSize: 20,),),
            ],
          ),
          Text('健康查阅/解读',style: TextStyle(fontSize: 12.0),)
        ],crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );

    /* 广告图 */
    Widget advertisement = Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          border: Border.all(color: Color.fromRGBO(226, 226, 226, 1),width: 0.5),
          borderRadius: BorderRadius.circular(5.0)
      ),
      width: double.infinity,
      height: 100,
    );

    return Scaffold(
      // appBar: AppBar(
      //   title: Text("首页"),
      // ),
      backgroundColor: Colors.white,
      // 外层添加一个手势，用于点击空白部分，回收键盘
      body: new GestureDetector(
        onTap: () {
          // 点击空白区域，回收键盘
          print("点击了空白区域");
          //provider.focusNodePassWord.unfocus();
          //provider.focusNodeUserName.unfocus();
        },
        child: new ListView(
          children: <Widget>[
             //new SizedBox(height: 60,),
            /*顶部搜索*/
            Row(mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Padding(padding: const EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0), child: cancleView,),
               Expanded(child: toptitle_editView(),flex: 1),
             ]
            ),
            hot_words,
            swiper,
            Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              appointment,
              report
            ],),
            advertisement,
          ],
        ),
      ),
    );
  }
}