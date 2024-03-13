import 'package:rent_my_ride_s1/utils/constant.dart';
import 'package:flutter/material.dart';

import '../../../utils/widgets.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map> faqList = [
      {
        'title': "What happens if I return car late?",
        'msg':
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id ipsum porttitor ut ultricies nibh urna. Nibh placerat at ut id quis."
      },
      {
        'title': "Is there a km limit how much can i drive?",
        'msg':
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id ipsum porttitor ut ultricies nibh urna. Nibh placerat at ut id quis."
      },
      {
        'title': "How to book car?",
        'msg':
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id ipsum porttitor ut ultricies nibh urna. Nibh placerat at ut id quis."
      },
      {
        'title': "How can I edit my profile?",
        'msg':
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id ipsum porttitor ut ultricies nibh urna. Nibh placerat at ut id quis."
      },
      {
        'title': "How to change pick-up location?",
        'msg':
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id ipsum porttitor ut ultricies nibh urna. Nibh placerat at ut id quis."
      },
      {
        'title':
            "Do I have to return the car to the same location where I picked it up?",
        'msg':
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id ipsum porttitor ut ultricies nibh urna. Nibh placerat at ut id quis."
      },
      {
        'title': "What happens if I return car late?",
        'msg':
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id ipsum porttitor ut ultricies nibh urna. Nibh placerat at ut id quis."
      },
      {
        'title': "Is there a km limit how much can i drive?",
        'msg':
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id ipsum porttitor ut ultricies nibh urna. Nibh placerat at ut id quis."
      },
      {
        'title': "How can I edit my profile?",
        'msg':
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id ipsum porttitor ut ultricies nibh urna. Nibh placerat at ut id quis."
      },
      {
        'title': "How to book car?",
        'msg':
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id ipsum porttitor ut ultricies nibh urna. Nibh placerat at ut id quis."
      },
      {
        'title': "How can I edit my profile?",
        'msg':
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id ipsum porttitor ut ultricies nibh urna. Nibh placerat at ut id quis."
      },
      {
        'title': "How to change pick-up location?",
        'msg':
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id ipsum porttitor ut ultricies nibh urna. Nibh placerat at ut id quis."
      },
      {
        'title':
            "Do I have to return the car to the same location where I picked it up?",
        'msg':
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id ipsum porttitor ut ultricies nibh urna. Nibh placerat at ut id quis."
      },
      {
        'title': "What happens if I return car late?",
        'msg':
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id ipsum porttitor ut ultricies nibh urna. Nibh placerat at ut id quis."
      },
      {
        'title': "Is there a km limit how much can i drive?",
        'msg':
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id ipsum porttitor ut ultricies nibh urna. Nibh placerat at ut id quis."
      },
      {
        'title': "How can I edit my profile?",
        'msg':
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id ipsum porttitor ut ultricies nibh urna. Nibh placerat at ut id quis."
      },
    ];

    return Scaffold(
      appBar: appBarMethod(),
      body: SingleChildScrollView(
          child: ListView.builder(
        itemCount: faqList.length,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(width: 0.1))),
            child: ListTileTheme(
              contentPadding: EdgeInsets.zero,
              dense: true,
              minVerticalPadding: 0,
              child: ExpansionTile(
                iconColor: color94,
                collapsedIconColor: color94,
                title: Text(
                  faqList[index]['title'],
                  style: blackRegular15,
                ),
                children: <Widget>[
                  ListTile(
                    contentPadding:
                        const EdgeInsets.only(bottom: 20, left: 10, right: 10),
                    title: Text(
                      faqList[index]['msg'],
                      style: color94Regular13,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      )),
    );
  }

  PreferredSize appBarMethod() {
    return const PreferredSize(
      preferredSize: Size.fromHeight(56),
      child: MyAppBar(title: 'FAQs'),
    );
  }
}
