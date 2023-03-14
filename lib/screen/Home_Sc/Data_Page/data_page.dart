import 'package:flutter/material.dart';
import 'package:news_app_24/screen/Home_Sc/Home_Controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class Data_Page extends StatefulWidget {
  const Data_Page({Key? key}) : super(key: key);

  @override
  State<Data_Page> createState() => _Data_PageState();
}

class _Data_PageState extends State<Data_Page> {
  Home_Contoller s1 = Get.put(Home_Contoller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Obx(() => Text(
              "${s1.cate[s1.tabIndex.value]}",
              style: TextStyle(color: Colors.black),
            )),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  height: 200,
                  width: 400,
                  decoration: BoxDecoration(
                      color: Colors.blue, boxShadow: [BoxShadow(blurRadius: 5)],
                  border: Border.all(color: Colors.white)
                  ),
                  child: Image.network(
                    "${s1.d1.urlToImage}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "${s1.d1.title}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
                textAlign: TextAlign.center,
              ),
              TextButton(
                  onPressed: () async {
                    await launchUrl(Uri.parse("${s1.d1.url}"));
                  },
                  child: Text("Read more....",style: TextStyle(fontSize: 15,color: Colors.blue),)),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text(
                      "Author by:",
                      style: TextStyle(fontSize: 20,color: Colors.white),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "${s1.d1.author}",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Text("Publishe At:",style: TextStyle(fontSize: 20,color: Colors.white),),
                  SizedBox(width: 5,),
                  Text("${s1.d1.publishedAt}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
