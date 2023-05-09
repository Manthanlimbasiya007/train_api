import 'package:flutter/cupertino.dart';
import '../../utils/api_helper.dart';

class HomeProvider extends ChangeNotifier
{
  Future<List> getTrain() async {
    ApiHelper apiHelper = ApiHelper();
    List l1 = await apiHelper.TrainApicall();
    return l1;
  }
}