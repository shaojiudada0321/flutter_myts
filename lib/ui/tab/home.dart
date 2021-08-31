import 'package:flutter/material.dart';

import '../firstScreen.dart';

class HomePageWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomePageWidgetState();
  }
}


var funcLists = [];

class HomePageWidgetState extends State<HomePageWidget>{

  @override
  void initState() {
    super.initState();

    initData();
  }

  @override
  void dispose() {
    super.dispose();
  }

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

    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("首页"),
        ),
        body: TextFileWidget());

//     return Scaffold(
//         appBar: new AppBar(
// //      centerTitle: true,
//           backgroundColor: Colors.black,
//           title: TextFileWidget(),
//           automaticallyImplyLeading: false,
//         ));
  }

}
/*顶部搜索*/
class TextFileWidget extends StatelessWidget{

  Widget buildTextField(){
    //theme设置局部主题
    return TextField(
      cursorColor: Colors.black,//设置光标
      //textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        //输入框decoration属性
        //contentPadding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 1.0),
          contentPadding: EdgeInsets.only(left: 0,right: 24,top: 0,bottom: 15),
          border: InputBorder.none,
          // icon: ImageIcon(
          // AssetImage("image/search.png")
          // ),
          icon: Icon(Icons.search),
          hintText: "输入搜索商品",
          hintStyle: TextStyle(fontSize: 14,color: Colors.grey)),
      style: TextStyle(fontSize: 14,color: Colors.black),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget editView(){
      return Container(
        //修饰黑色背景与圆角
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey,width: 1.0),//灰色一层边框
            color: Color.fromRGBO(246, 246, 246, 1),
            borderRadius: BorderRadius.all(Radius.circular(15.0))
        ),
        alignment: Alignment.center,
        height: 36,
        margin: EdgeInsets.only(top: 10.0,right: 10.0),
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
        child: buildTextField(),
      );
    }

    var cancleView = Text("广州");

    Widget listView(){
      return ListView.builder(
        padding: const EdgeInsets.all(15.0),
        itemCount: funcLists.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var func = funcLists[index];
          return ListTile(
            contentPadding: const EdgeInsets.all(10.0),
            title: Text(
              "${func["name"]}",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              "${func["desc"]}",
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return FirstScreen();
                }),
              );
            },
          );
        },
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: const EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0),
                child: cancleView,),
              Expanded(child: editView(),flex: 1)
            ]
        ),
        Expanded(child: listView(),flex: 1)
      ],
    );
  }

}