import 'package:flutter/material.dart';
import 'package:flutter_myts/common/view_state.dart';
import 'package:flutter_myts/model/user.dart';
import 'package:flutter_myts/ui/base_view.dart';
import 'package:flutter_myts/viewModel/hot_product_view_model.dart';
import 'package:provider/provider.dart';

class ProductWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    /*获取传递过来的参数*/
    User user = ModalRoute.of(context).settings.arguments;
    print("data:"+user.id.toString()+","+user.name);
    return BaseView<ProductViewModel>(
      onModelReady: (model) async {
        model.initData();
      },
      model: ProductViewModel(api: Provider.of(context)),
      builder: (context,model,child) => Scaffold(
        body: _buildBody(context, model),
      ),
    );
  }
  Widget _buildBody(BuildContext context, ProductViewModel model) {
    
    Widget hot_product_image = Container(
      child: Image.asset('images/hotprodectinfo.png'),
    );
    
    
    return Container(
        child: model.state == ViewState.Idle ? GestureDetector(
            child: new ListView(
                children: <Widget>[
                  Padding(padding: const EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0), child: hot_product_image,),
                  //Expanded(child: toptitle_editView(),flex: 1),
                  //gridview_menu,
                  //product_list
                ]
            )
        ): Center(
            child: Text('加载数据中...'))
    );
  }
}