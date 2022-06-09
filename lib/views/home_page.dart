// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last

import 'package:api1/models/post.dart';
import 'package:api1/services/remote_services.dart';
import 'package:api1/widgets/skeleton_card.dart';
import 'package:flutter/material.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  List<Welcome>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    posts = await RemoteServices().getPosts();
    Future.delayed(
        Duration(
          seconds: 2,
        ), () {
      {
        setState(() {
          isLoaded = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[50],
        centerTitle: true,
        title: Text(
          'Home Page',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: posts?.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 10,
                bottom: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  20,
                ),
                border: Border.all(
                  width: 1,
                  color: Colors.amber,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      top: 8,
                      bottom: 8,
                    ),
                    child: Image.network(
                      'https://cdn.icon-icons.com/icons2/1161/PNG/512/1487716857-user_81635.png',
                      width: 85,
                      height: 85,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        top: 15,
                        bottom: 8,
                        right: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            posts![index].id.toString(),
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            posts![index].title,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            posts![index].body!,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        replacement: ListView.separated(
          itemBuilder: (context, index) => SkeletonCardWidget(),
          separatorBuilder: (context, index) => SizedBox(
            height: 16,
          ),
          itemCount: 10,
        ),
      ),
    );
  }
}
