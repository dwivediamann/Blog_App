// ignore_for_file: unused_local_variable

import 'package:blog_app/constant/bottomnavi.dart';
import 'package:blog_app/constant/drawer.dart';
import 'package:flutter/material.dart';

class BlogInfoPage extends StatefulWidget {
  const BlogInfoPage({super.key});

  @override
  State<BlogInfoPage> createState() => _BlogInfoPageState();
}

class _BlogInfoPageState extends State<BlogInfoPage> {
  final SearchController = TextEditingController();

  List<String> imagedata = [
    "assets/images/india.png",
    "assets/images/envi.webp",
    "assets/images/farmer.jpg",
    "assets/images/ocean.jpeg",
    "assets/images/people.jpeg",
    "assets/images/war.jpg",
    "assets/images/education.jpeg",
    "assets/images/news.jpeg",
    "assets/images/city.jpg",
    "assets/images/history.jpeg",
  ];
  List<Widget> pagesToNavigate = [
    // Page for the first image
    // Add more pages corresponding to each image
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerData(),
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "BLOG APP",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.black,
              ))
        ],
      ),
      bottomNavigationBar: Bottombardata(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: TextField(
                keyboardType: TextInputType.text,
                controller: SearchController,
                decoration: InputDecoration(
                    hintText: "Search Blogs",
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black38)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black))),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Some Important topic of Blog's",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 70,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.black,
                          )),
                      child: GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          imagedata[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 1,
              color: Colors.black,
            ),
            Row(
              children: [
                Text(
                  "Blog's Entered ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 70, left: 15, right: 15, top: 12),
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(12)),
                        child: Image.asset(
                          "assets/images/city.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
