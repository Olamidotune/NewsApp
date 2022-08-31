import 'package:flutter/material.dart';
import 'package:news/models/articles_model.dart';
import 'package:news/screens/article_screen.dart';
import 'package:news/widgets/bottom_nav_bar.dart';
import 'package:news/widgets/custom_tag.dart';
import 'package:news/widgets/image_container.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'HomeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Article article = Article.articles[0];

    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          backgroundColor: Colors.transparent),
      extendBodyBehindAppBar: true,
      bottomNavigationBar: const BottomNavBar(
        index: 0,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          _NewsOfTheDay(article: article),
          _BreakingNews(
            articles: Article.articles,
          )
        ],
      ),
    );
  }
}

class _BreakingNews extends StatelessWidget {
  final List<Article> articles;

  const _BreakingNews({
    Key? key,
    required this.articles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Breaking News',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.black,
                    height: 0,
                    fontWeight: FontWeight.bold,
                    fontSize: 7.sp),
              ),
              TextButton(
                child: Text(
                  'More',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.black, fontSize: 5.sp),
                ),
                onPressed: () {},
              )
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          SizedBox(
            height: 80.h,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: articles.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: MediaQuery.of(context).size.width * .4,
                  margin: const EdgeInsets.only(right: 10),
                  child: InkWell(
                    highlightColor: Colors.grey,
                    onTap: () => Navigator.pushNamed(
                        context, ArticleScreen.routeName,
                        arguments: articles[index]),
                    child: Column(
                      children: [
                        ImageContainer(
                          height: 20.h,
                            width: MediaQuery.of(context).size.width * 0.5.h,
                            imageUrl: articles[index].urltoImage),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          articles[index].title,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.black,
                                    height: 0,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.sp
                                  ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          'by ${articles[index].author}',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                               fontSize: 7.sp
                          ),
                          
                          textAlign: TextAlign.center,
                          
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _NewsOfTheDay extends StatelessWidget {
  const _NewsOfTheDay({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return ImageContainer(
      height: MediaQuery.of(context).size.height * 0.45,
      width: double.infinity,
      imageUrl: article.urltoImage,
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTag(backgroundColor: Colors.grey.withAlpha(150), children: [
            Text(
              'News of the day',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 10.sp,
                  ),
            )
          ]),
          SizedBox(height: 2.h),
          Text(
            article.title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                  height: 0,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                ),
          ),
          SizedBox(height: 1.h),
          TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Text(
                  'Learn More',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white,
                      ),
                ),
                const Icon(
                  Icons.arrow_right_alt,
                  color: Colors.white,
                  size: 30,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
