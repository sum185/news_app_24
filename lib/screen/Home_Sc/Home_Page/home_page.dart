import 'package:flutter/material.dart';
import 'package:news_app_24/screen/Home_Sc/Home_Controller/home_controller.dart';
import 'package:news_app_24/screen/Home_Sc/Home_Model/News_Model.dart';
import 'package:news_app_24/utils/api_helper.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  Home_Contoller home_contoller = Get.put(Home_Contoller());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
          length: 4,
          child: Scaffold(
            backgroundColor: Colors.amber,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('asset/image/news.png',height: 10.h,width: 50.w,fit: BoxFit.fill,),
                    ],
                  ),
                  Container(
                    height: 60,
                    width: double.infinity,
                    color: Colors.black,
                    child: TabBar(
                      physics: AlwaysScrollableScrollPhysics(),
                      isScrollable: true,
                      unselectedLabelColor: Colors.white,
                      labelColor: Colors.yellow,
                      indicatorColor: Colors.white,
                      onTap: (value) {
                        home_contoller.tabIndex.value = value;
                      },
                      tabs: home_contoller.cate.map((e) => Tab(text: "$e")).toList(),
                    ),
                  ),
                  Container(
                    height: 500,
                    width: double.infinity,
                    color: Colors.black,
                    child: Obx(
                      () =>  FutureBuilder<NewsModel?>(
                        future: ApiHelper.apiHelper.getNewsData("${home_contoller.cate[home_contoller.tabIndex.value]}"),
                        builder: (context, snapshot) {
                          if(snapshot.hasError){
                            return Text("${snapshot.hasError}");
                          }
                          else if(snapshot.hasData){
                            List<Articles> n1 = snapshot.data!.articles!;

                            return ListView.builder(itemCount: n1.length,itemBuilder: (context, index) {
                              return InkWell(
                                onTap: (){
                                  home_contoller.d1=n1[index];
                                  Get.toNamed('data');
                                },
                                child: ListTile(
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                      ),
                                      child: Image.network("${n1[index].urlToImage}"),
                                    ),
                                  ),
                                  title: Text("${n1[index].title}",style: TextStyle(color: Colors.white),),

                                ),
                              );
                            },);
                          }
                          return const Center(child: CircularProgressIndicator());
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Obx(
              () =>  BottomNavigationBar(
                backgroundColor: Colors.amber,
                selectedItemColor: Colors.white,
                items: [
                  BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
                  BottomNavigationBarItem(icon: Icon(Icons.language),label: "World"),
                  BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
                ],
                currentIndex: home_contoller.selectIndex.value,
                onTap: (index){
                  home_contoller.selectIndex.value= index;
                },

              ),
            ),
          ),
        )
    );
  }
}
