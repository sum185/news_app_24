import 'package:get/get.dart';
import 'package:news_app_24/screen/Home_Sc/Home_Model/News_Model.dart';

class Home_Contoller extends GetxController
{

  RxString name ="Business".obs;
  RxList cate = ["Business","Sports","Entertainment","Technology"].obs;
  RxInt tabIndex = 0.obs;
  RxInt i=0.obs;
  RxInt selectIndex = 0.obs;

  Articles d1 = Articles();

}