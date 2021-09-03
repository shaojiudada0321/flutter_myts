import 'package:flutter/material.dart';

class ServiceItem extends StatelessWidget {
  final ServiceItemViewModel data;

  ServiceItem({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(bottom: 5),
      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 10.0,bottom: 10.0),child: this.data.icon,),
          Container(
            //decoration: BoxDecoration(color: Colors.red),
            alignment: Alignment.center,
            width: 70,
            child: Text(
              this.data.title,
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF333333),
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}

class ServiceItemViewModel {
  /// 图标
  final Icon icon;

  /// 标题
  final String title;

  const ServiceItemViewModel({
    this.icon,
    this.title,
  });
}
