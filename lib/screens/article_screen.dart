import 'package:flutter/material.dart';
import 'package:news/models/articles_model.dart';
import 'package:news/widgets/custom_tag.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/link.dart';
import '../widgets/image_container.dart';

class ArticleScreen extends StatelessWidget {
 
  static const String routeName = 'ArticleScreen';
  const ArticleScreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    final article = ModalRoute.of(context)!.settings.arguments as Article;

    return ImageContainer(
      imageUrl: article.urltoImage,
      width: double.infinity,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.transparent,
        ),
        extendBodyBehindAppBar: true,
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            _ArticleNews(
              article: article,
            ),
            const SizedBox(
              height: 30,
            ),
            _ArticleContainer(article: article )
          ],
        ),
      ),
    );
  }
}

class _ArticleContainer extends StatelessWidget {
  const _ArticleContainer({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*45.h,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTag(
              backgroundColor: Colors.black,
              children: [
                Text(
                  'by ${article.author}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                        height: 0,
                      ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              article.title,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Colors.black,
                    height: 0,
                  ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    ' ${article.content}. to continue reading, click the button below',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.black,
                          height: 0,
                          fontSize: 11.sp,
                        ),
                  ),
                ),
              
              ],
            ),
              Link(
                  target: LinkTarget.blank ,
                  builder: (context, followLink) => TextButton(
                    onPressed:followLink,
                    child: const Text('Continue reading'),
                  ), 
                  uri: Uri.parse(article.url),
                ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            GridView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 1,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.25,
              ),
              itemBuilder: (BuildContext context, int index) {
                return ImageContainer(
                  width: MediaQuery.of(context).size.width * .45,
                  imageUrl: article.urltoImage,
                  margin: const EdgeInsets.all(5),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ArticleNews extends StatelessWidget {
  final Article article;
  const _ArticleNews({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .10,
          ),
          CustomTag(
            backgroundColor: Colors.grey.withAlpha(150),
            children: [
              Text(
                article.category,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      height: 0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
          Text(
            article.title,
            maxLines: 3,
            overflow: TextOverflow.clip,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                  height: 0,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            article.content,
            maxLines: 3,
            overflow: TextOverflow.clip,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white,
                  height: 0,
                  fontSize: 10.sp,
                ),
          ),
        ],
      ),
    );
  }
}

