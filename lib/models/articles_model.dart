import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final String id;
  final String title;
  final String name;
  final String author;
  final String desription;
  final String url;
  final String urltoImage;
  final DateTime publishedAt;
  final String content;
  final String category;

  const Article({
    required this.id,
    required this.author,
    required this.title,
    required this.name,
    required this.desription,
    required this.url,
    required this.urltoImage,
    required this.publishedAt,
    required this.content,
    required this.category,
  });

  static List<Article> articles = [
    Article(
        id: '1',
        author: "Jake Peterson",
        name: "Lifehacker.com",
        desription: "All computers act up from time to time."
            "When things go awry, my first recommendation is always to simply shut down and reboot: "
            "Often, this simple power cycle fixes the issue. However, you might run into the odd problem that doesn't go away. Maybe your MacBook…",
        url:
            "https://lifehacker.com/your-mac-has-secret-reset-buttons-1849445974",
        urltoImage:
            "https://i.kinja-img.com/gawker-media/image/upload/c_fill,f_auto,fl_progressive,g_center,h_675,pg_1,q_80,w_1200/84e6fb0df7c721a1b5176e8a1e985674.jpg",
        publishedAt: DateTime.now().subtract(
          (const Duration(hours: 5)),
        ),
        content:
            "All computers act up from time to time. When things go awry, my first recommendation is always to simply shut down and reboot: Often, this simple power cycle fixes the issue.",
        title: "Your Mac Has Secret Reset ' Buttons' ",
        category: 'Technology'),
    Article(
      category: 'Technology',
        id: '2',
        author: "Terrence O'Brien",
        name: "Engadget",
        desription:
            "If you're a music maker, chances are you've signed up for a music distribution service like DistoKid, maybe you have a subscription to a sample depot like Splice, and even pay monthly for an instrument like Output's Arcade",
        url:
            "https://www.engadget.com/landr-studio-subscription-everything-you-need-to-make-and-release-music-143835793.html",
        urltoImage:
            "https://s.yimg.com/os/creatr-uploaded-images/2022-08/ac556fe0-22ec-11ed-afec-db41ee3a0d28",
        publishedAt: DateTime.now().subtract(
          (const Duration(hours: 5)),
        ),
        content:
            "If you're a music maker, chances are you've signed up for a music distribution service like DistoKid, maybe you have a subscription to a sample depot like Splice, and even pay monthly for an instrumeent.",
        title:
            '"LANDR Studio has everything you need to make and release music (except a DAW)",'),
    Article(
       category: 'Health',
        id: '3',
        author: "Claire Lower",
        title: "Your BLT Needs This Stealth Bacon",
        name: "Lifehacker.com",
        desription:
            "A BLT is a pretty perfect sandwich. I don't thing I need to explain why the combination of crispy, salty bacon, crunchy lettuce, creamy mayo, and juicy tomatoes taste good together. ",
        url:
            "https://lifehacker.com/your-blt-needs-this-stealth-bacon-1849448203",
        urltoImage:
            "https://i.kinja-img.com/gawker-media/image/upload/c_fill,f_auto,fl_progressive,g_center,h_675,pg_1,q_80,w_1200/57976b2e74e5358c45df1aea447022c6.jpg",
        publishedAt: DateTime.now().subtract(
          (const Duration(hours: 5)),
        ),
        content:
            "A BLT is a pretty perfect sandwich. I dont thing I need to explain why the combination of crispy, salty bacon, crunchy lettuce, creamy mayo, and juicy tomatoes taste good together."),
    Article(
       category: 'Technology',
      id: '4',
      author: "Mat Smith",
      title:
          "The Morning After: Our verdict on Samsung's Galaxy Z Fold 4 and Galaxy Z Flip 4",
      name: "Engadget",
      desription:
          "We’ve spent some time with Samsung's latest foldable phones, and both continue to refine and improve. The Galaxy Z Fold 4 still unfurls into a squareish tablet for bigger web browsing, Google Maps navigation and more but has improved multitasking features.",
      url:
          "https://www.engadget.com/the-morning-after-our-verdict-on-samsungs-galaxy-z-fold-4-and-galaxy-z-flip-4-111559562.html",
      urltoImage:
          "https://s.yimg.com/os/creatr-uploaded-images/2022-08/9d158df0-22f9-11ed-bb77-9e0f99f330db",
      content:
          "Weve spent some time with Samsungs latest foldable phones, and both continue to refine and improve. The Galaxy Z Fold 4 still unfurls into a squareish tablet for bigger web browsing",
      publishedAt: DateTime.now().subtract(
        (const Duration(hours: 5)),
      ),
    ),
    Article(
       category: 'Technology',
      id: '5',
      author: "Pranay Parab",
      title: "Enable These Instagram Privacy Settings Right Now",
      name: "Lifehacker.com",
      desription:
          "Instagram has been through so many changes, it's hard to remember what is truly private on your account and what’s not. ",
      url:
          "https://lifehacker.com/enable-these-instagram-privacy-settings-right-now-1849456072",
      urltoImage:
          "https://i.kinja-img.com/gawker-media/image/upload/c_fill,f_auto,fl_progressive,g_center,h_675,pg_1,q_80,w_1200/b2db3da824e15fc793b0d9fabe1e0085.jpg",
      content:
          "Instagram has been through so many changes, its hard to remember what is truly private on your account and whats not. ",
      publishedAt: DateTime.now().subtract(
        (const Duration(hours: 5)),
      ),
    ),
  ];

  @override
  List<Object?> get props => [
        id,
        name,
        author,
        desription,
        url,
        urltoImage,
        publishedAt,
        content,
      ];
}
