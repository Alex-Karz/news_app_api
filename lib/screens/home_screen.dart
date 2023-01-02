import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:news_app_api/services/utils.dart';
import 'package:news_app_api/widgets/drawer_widget.dart';
import 'package:news_app_api/widgets/vertical_spacing.dart';

import '../consts/vars.dart';

import '../widgets/articles_widget.dart';
import '../widgets/tabs_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var newsType = NewsType.allNews;
  String sortBy = SortByEnum.relevancy.name;
  late int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'News App',
            style: GoogleFonts.ubuntu(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
        ),
        drawer: const DrawerWidget(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  TabsWidget(
                    color: color,
                    text: 'All News',
                    onTap: () {
                      if (newsType == NewsType.allNews) {
                        return;
                      }
                      setState(() {
                        newsType = NewsType.allNews;
                      });
                    },
                    fontSize: newsType == NewsType.allNews ? 22 : 14,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  TabsWidget(
                    color: color,
                    text: 'Top trending',
                    onTap: () {
                      if (newsType == NewsType.topTrending) {
                        return;
                      }
                      setState(() {
                        newsType = NewsType.topTrending;
                      });
                    },
                    fontSize: newsType == NewsType.topTrending ? 22 : 14,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              newsType == NewsType.topTrending
                  ? Container()
                  : SizedBox(
                      height: kBottomNavigationBarHeight * 0.6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          paginationButton(
                              onTap: () {
                                setState(() {
                                  if (currentPageIndex > 0) {
                                    currentPageIndex--;
                                  } else {
                                    return;
                                  }
                                });
                              },
                              text: 'Prev'),
                          const SizedBox(
                            width: 26,
                          ),
                          Flexible(
                            flex: 2,
                            child: ListView.builder(
                                itemCount: 5,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: ((context, index) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        currentPageIndex = index;
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.symmetric(horizontal: 6),
                                      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: currentPageIndex == index ? Colors.amber : Colors.blueGrey,
                                      ),
                                      child: Text(
                                        '${index + 1}',
                                        style: const TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  );
                                })),
                          ),
                          const SizedBox(
                            width: 26,
                          ),
                          paginationButton(
                              onTap: () {
                                setState(() {
                                  currentPageIndex == 4 ? currentPageIndex = 4 : currentPageIndex++;
                                });
                              },
                              text: 'Next'),
                        ],
                      ),
                    ),
              const VerticalSpacingWidget(height: 12),
              newsType == NewsType.topTrending ? Container() :
              Material(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueGrey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: DropdownButton(
                        focusColor: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(10),
                        value: sortBy,
                        items: dropdownItems,
                        onChanged: (String? value) {
                          setState(() {});
                        }),
                  )),
              Expanded(
                child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                  return const ArticlesWidget();
                }),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
        value: SortByEnum.relevancy.name,
        child: Text(
          SortByEnum.relevancy.name,
          style: TextStyle(fontSize: 19),
        ),
      ),
      DropdownMenuItem(
        value: SortByEnum.publishedAt.name,
        child: Text(SortByEnum.publishedAt.name),
      ),
      DropdownMenuItem(
        value: SortByEnum.popularity.name,
        child: Text(SortByEnum.popularity.name),
      ),
    ];
    return menuItems;
  }

  ElevatedButton paginationButton({required Function onTap, required String text}) {
    return ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueGrey,
        textStyle: GoogleFonts.ubuntu(fontSize: 14, fontWeight: FontWeight.w600),
      ),
      child: Text(text),
    );
  }
}
