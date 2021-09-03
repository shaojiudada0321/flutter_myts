import 'package:flutter/material.dart';
import 'package:flutter_myts/common/custom_icons.dart';

import 'service_item.dart';

/// 喜马拉雅 - 相声节目清单
// const List<ProgrammeViewModel> programmeList = [
//   ProgrammeViewModel(
//     title: '笑坛三巨匠之一：郭德纲最新高清相声集',
//     playsCount: 363182465,
//     needVip: false,
//     coverImgUrl:
//         'http://imagev2.xmcdn.com/group61/M0A/5D/74/wKgMcF0IoUmCLEZIAAfqML_y44E351.jpg!op_type=5&upload_type=album&device_type=ios&name=large&magick=png',
//   ),
//   ProgrammeViewModel(
//     title: '德云社相声十年经典之一',
//     playsCount: 10236432,
//     needVip: false,
//     coverImgUrl:
//         'http://imagev2.xmcdn.com/group43/M01/AC/C8/wKgKklskehLi4XS1AARLpcjABqA907.jpg!op_type=5&upload_type=album&device_type=ios&name=large&magick=png',
//   ),
//   ProgrammeViewModel(
//     title: '郭德纲经典相声',
//     playsCount: 8628885,
//     needVip: true,
//     coverImgUrl:
//         'http://imagev2.xmcdn.com/group63/M02/5E/4C/wKgMaF0IomXwR0fMAAbRPUR6d-E118.jpg!op_type=5&upload_type=album&device_type=ios&name=large&magick=png',
//   ),
//   ProgrammeViewModel(
//     title: '丑女也能做皇后 | 郭德纲笑说钟无艳的绝世奇闻',
//     playsCount: 35346856,
//     needVip: false,
//     coverImgUrl:
//         'http://imagev2.xmcdn.com/group61/M01/5D/AD/wKgMZl0Io4zSQaoqAApJnId5Fxs220.jpg!op_type=5&upload_type=album&device_type=ios&name=large&magick=png',
//   ),
//   ProgrammeViewModel(
//     title: '女妖精的一推就软？听郭德纲单口《九尾狐》',
//     playsCount: 17787252,
//     needVip: true,
//     coverImgUrl:
//         'http://imagev2.xmcdn.com/group63/M04/60/DB/wKgMaF0Ir5bAs3I6AAi5jSpprHU406.jpg!op_type=5&upload_type=album&device_type=ios&name=large&magick=png',
//   ),
//   ProgrammeViewModel(
//     title: '周文强老师财富本质课程独播',
//     playsCount: 10361,
//     needVip: false,
//     coverImgUrl:
//         'http://imagev2.xmcdn.com/group63/M04/11/7C/wKgMaF0hpLWDI57SAALanlUKN40914.jpg!op_type=5&upload_type=album&device_type=ios&name=large&magick=png',
//   ),
// ];

/// 首页宫格菜单
const List<ServiceItemViewModel> serviceList = [
  ServiceItemViewModel(
    title: '专项体检',
    icon: Icon(
      CustomIcons.breakFirst,
      size: 25,
      color: Colors.lightBlue,
    ),
  ),
  ServiceItemViewModel(
    title: '健康百科',
    icon: Icon(
      CustomIcons.baozi,
      size: 25,
      color: Colors.orangeAccent,
    ),
  ),
  ServiceItemViewModel(
    title: '健康自测',
    icon: Icon(
      CustomIcons.friedFood,
      size: 25,
      color: Colors.deepOrangeAccent,
    ),
  ),
  ServiceItemViewModel(
    title: '科普视频',
    icon: Icon(
      CustomIcons.sweetmeats,
      size: 25,
      color: Colors.pinkAccent,
    ),
  ),
  ServiceItemViewModel(
    title: '互助通道',
    icon: Icon(
      CustomIcons.xiangCuisine,
      size: 25,
      color: Colors.redAccent,
    ),
  ),
  ServiceItemViewModel(
    title: '专家咨询',
    icon: Icon(
      CustomIcons.truck,
      size: 25,
      color: Colors.orange,
    ),
  ),
  ServiceItemViewModel(
    title: '影像筛查',
    icon: Icon(
      CustomIcons.motorbike,
      size: 25,
      color: Colors.blueAccent,
    ),
  ),
  ServiceItemViewModel(
    title: '私人定制',
    icon: Icon(
      CustomIcons.shop,
      size: 25,
      color: Colors.lightGreen,
    ),
  ),
];
/// 首页服务菜单
const List<ServiceItemViewModel> gridview_prevention_List = [
  ServiceItemViewModel(
    title: '结直肠风险早期筛查',
    icon: Icon(
      CustomIcons.breakFirst,
      size: 25,
      color: Colors.lightBlue,
    ),
  ),
  ServiceItemViewModel(
    title: '肺癌风险早期筛查',
    icon: Icon(
      CustomIcons.baozi,
      size: 25,
      color: Colors.orangeAccent,
    ),
  ),
  ServiceItemViewModel(
    title: '肝癌风险早期筛查',
    icon: Icon(
      CustomIcons.friedFood,
      size: 25,
      color: Colors.deepOrangeAccent,
    ),
  ),
  ServiceItemViewModel(
    title: '胰腺癌风险早期筛查',
    icon: Icon(
      CustomIcons.sweetmeats,
      size: 25,
      color: Colors.pinkAccent,
    ),
  ),
  ServiceItemViewModel(
    title: '胃癌风险早期筛查',
    icon: Icon(
      CustomIcons.xiangCuisine,
      size: 25,
      color: Colors.redAccent,
    ),
  ),
  ServiceItemViewModel(
    title: '血液普查102项检查',
    icon: Icon(
      CustomIcons.truck,
      size: 25,
      color: Colors.orange,
    ),
  ),
];

/// 热销页面菜单
const List<ServiceItemViewModel> hot_gridview_List = [
  ServiceItemViewModel(
    title: '新品推荐',
    icon: Icon(
      CustomIcons.breakFirst,
      size: 25,
      color: Colors.lightBlue,
    ),
  ),
  ServiceItemViewModel(
    title: '专项检查',
    icon: Icon(
      CustomIcons.baozi,
      size: 25,
      color: Colors.orangeAccent,
    ),
  ),
  ServiceItemViewModel(
    title: '居家检测',
    icon: Icon(
      CustomIcons.friedFood,
      size: 25,
      color: Colors.deepOrangeAccent,
    ),
  ),
  ServiceItemViewModel(
    title: '影响筛查',
    icon: Icon(
      CustomIcons.sweetmeats,
      size: 25,
      color: Colors.pinkAccent,
    ),
  ),
  ServiceItemViewModel(
    title: '私人定制',
    icon: Icon(
      CustomIcons.xiangCuisine,
      size: 25,
      color: Colors.redAccent,
    ),
  ),
];
