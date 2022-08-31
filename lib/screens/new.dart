

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/link.dart';

class NewPage extends StatelessWidget {
  static const String routeName = 'New';

  
   NewPage({Key? key}) : super(key: key);


final Uri _url = Uri.parse('https://flutter.dev');
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
            child: Link(
                  target: LinkTarget.self ,
                  builder: (context, followLink) => ElevatedButton(
                    onPressed:followLink,
                    child: const Text('Continue Reading.'),
                  ), 
                  uri: Uri.parse('https://github.com/Olamidotune'),
                ),
          ),
    );
  }
}

_launchUrl(){}


// Future<void> _launchUrl() async {
//   if (!await launchUrl(_url)) {
//     throw 'Could not launch $_url';
//   }
// }