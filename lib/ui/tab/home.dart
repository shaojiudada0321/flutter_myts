import 'package:flutter/material.dart';
import 'package:flutter_myts/ui/base_view.dart';
import 'package:flutter_myts/ui/gridview/mock_data.dart';
import 'package:flutter_myts/ui/gridview/service_item.dart';
import 'package:flutter_myts/common/view_state.dart';
import 'package:flutter_myts/viewModel/home_view_model.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';

class HomePageWidget extends StatelessWidget{


  @override
  Widget build(BuildContext context) {

    //final provider = Provider.of<HomeViewModel>(context);

    return BaseView<HomeViewModel>(
      onModelReady: (model) async {
        model.initData();
      },
      model: HomeViewModel(api: Provider.of(context)),
      builder: (context, model, child) => Scaffold(
        // backgroundColor: Color(0xFFF5F5F5),
        // appBar: AppBar(
        //   title: Text('首页'),
        // ),
        body: _buildBody(context, model),
      ),
    );
  }



  Widget _buildBody(BuildContext context, HomeViewModel model) {

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
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
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
        //border: Border.all(color: Color.fromRGBO(226, 226, 226, 1),width: 0.5),
          borderRadius: BorderRadius.circular(5.0)
      ),
      width: double.infinity,
      height: 120,
      child: Image.asset(
        "images/homeAdvertisement.png",
        fit: BoxFit.cover,),
    );

    /* 首页宫格菜单 */
    Widget gridview_menu = Container(
        margin: EdgeInsets.all(10.0),
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
          crossAxisCount: 4,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(vertical: 0),
          children: serviceList.map((item) => ServiceItem(data: item)).toList(),
        )
    );

    /* 首页宫格项目介绍 */
    Widget gridview_prevention = Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          //border: Border.all(color: Colors.grey,width: 0.5,),
            borderRadius: BorderRadius.circular(8.0),
            color: Color.fromRGBO(250, 232, 220, 1)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 10.0,top: 15.0,bottom: 5.0),
              child: Text('预防胜于治疗',style: TextStyle(
                  color: Color.fromRGBO(228, 129, 43, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                //border: Border.all(color: Colors.grey,width: 0.5,),
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white
              ),
              child: GridView.count(
                crossAxisCount: 3,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(vertical: 0),
                children: gridview_prevention_List.map((item) => ServiceItem(data: item)).toList(),
              ),
            )

          ],
        )
    );

    /* 热门爆款 */
    Widget hot_list = Container(
        child:Column(
          children: [
            Container(
              margin: EdgeInsets.all(10.0),
              alignment: Alignment.centerLeft,
              child: Text('热门爆款',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),
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
                  leading: Image.asset(
                    "${func["image"]}",
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
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
                          "${func["desc"]}",
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
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) {
                    //     return FirstScreen();
                    //   }),
                    // );
                  },
                );
              },
            )
          ],
        )
    );
    return  Container(
        child: model.state == ViewState.Idle ? GestureDetector(
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
            gridview_menu,
            gridview_prevention,
            hot_list
          ],
        ),
      ): Center(
         child: Text('加载数据中...'))
    );
  }
}