import 'package:flutter/material.dart';
import 'package:flutter_myts/app/Application.dart';
import 'package:flutter_myts/ui/index.dart';
import 'package:flutter_myts/ui/product/hot_product_info.dart';

import '../main.dart';

/* 页面跳转 */
void jump_page(page_name,data){
  Navigator.of(Application.getContext()).pushNamed(page_name,arguments: data);
}