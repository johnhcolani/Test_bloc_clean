
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class AppBackground{
  static AssetImage getBackgroundImage(){
    DateTime now =DateTime.now();
    String formattedData = DateFormat('kk').format(now);
    if(6>int.parse(formattedData)){
      return const AssetImage('assets/images/simpsonsDark.png');

    }else if(18> int.parse(formattedData)){
      return const AssetImage('assets/images/simpsons.png');
    } else {
      return const AssetImage('assets/images/simpsonsDark.png');
    }
  }
}