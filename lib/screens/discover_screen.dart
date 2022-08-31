import 'package:flutter/material.dart';
import 'package:news/models/articles_model.dart';
import 'package:news/screens/article_screen.dart';

import 'package:news/widgets/bottom_nav_bar.dart';
import 'package:news/widgets/image_container.dart';
import 'package:sizer/sizer.dart';

class DiscoverScreen extends StatelessWidget {
  static const String routeName = 'DiscoverScreen';
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> tabs = ['Health', 'Politics', 'Art', 'Food', 'Sciences'];

    return DefaultTabController(
      length: tabs.length,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                Icons.menu,
                size: 30,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            backgroundColor: Colors.transparent),
        bottomNavigationBar: const BottomNavBar(
          index: 1,
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  const _DiscoverNews(),
                  _CategoryNews(
                    tabs: tabs,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryNews extends StatelessWidget {
  final List<String> tabs;

  const _CategoryNews({
    Key? key,
    required this.tabs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final articles = Article.articles;
    return Column(
      children: [
        TabBar(
          isScrollable: true,
          indicatorColor: Colors.black,
          tabs: tabs
              .map(
                (tab) => Tab(
                  icon: Text(
                    tab,
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp),
                    maxLines: 1,
                  ),
                ),
              )
              .toList(),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: TabBarView(
            children: tabs
                .map(
                  (tab) => ListView.builder(
                    physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, ArticleScreen.routeName,
                                arguments: articles[index]);
                          },
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: ImageContainer(
                                  margin: const EdgeInsets.all(15),
                                  borderRadius: 1,
                                  imageUrl: articles[index].urltoImage,
                                  width: 20.w,
                                  height: 20.w,
                                ),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      articles[index].title,
                                      maxLines: 3,
                                      overflow: TextOverflow.clip,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(fontSize: 8.sp),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'by ${articles[index].author}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(fontSize: 6.sp),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                )
                .toList(),
          ),
        )
      ],
    );
  }
}

class _DiscoverNews extends StatelessWidget {
  const _DiscoverNews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Discover',
            style: Theme.of(context).textTheme.headline4?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 15.sp),
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            'News from the Tech world',
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Colors.black45, fontSize: 7.sp),
          ),
          SizedBox(
            height: 3.h,
          ),
          TextFormField(
            decoration: InputDecoration(
              fillColor: Colors.grey.shade400,
              filled: true,
              prefixIcon: const Icon(Icons.search),
              hintText: 'Search',
              suffixIcon:
                  const RotatedBox(quarterTurns: 1, child: Icon(Icons.tune)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none),
            ),
          )
        ],
      ),
    );
  }
}
