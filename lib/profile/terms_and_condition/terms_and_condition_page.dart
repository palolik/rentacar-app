import 'package:rent_my_ride_s1/utils/constant.dart';
import 'package:flutter/material.dart';

import '../../../utils/widgets.dart';

class TermsAndConditionPage extends StatelessWidget {
  const TermsAndConditionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMethod(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heightSpace20,
              Text('Company Policies', style: blackMedium18),
              heightSpace8,
              Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget molestie tellus mauris metus nisi urna nibh netus at',
                  style: color94Regular13),
              heightSpace8,
              Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Et aliquam interdum mi vitae tortor. Vel eu dictum nibh a eget lacus. Purus urna purus ipsum ullamcorper iaculis. Velit, ullamcorper eget tellus arcu dui est.',
                  style: color94Regular13),
              heightSpace8,
              Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Est scelerisque urna rutrum duis. Risus scelerisque sed neque massa feugiat. Maecenas tincidunt consectetur quis ut. Dui nec metus, at tristique parturient faucibus. Nibh augue mauris tellus ultrices diam. Venenatis turpis sagittis faucibus sed tristique.',
                  style: color94Regular13),
              heightSpace20,
              Text('Terms of Use', style: blackMedium18),
              heightSpace8,
              Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget molestie tellus mauris metus nisi urna nibh netus at',
                  style: color94Regular13),
              heightSpace8,
              Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Et aliquam interdum mi vitae tortor. Vel eu dictum nibh a eget lacus. Purus urna purus ipsum ullamcorper iaculis. Velit, ullamcorper eget tellus arcu dui est.',
                  style: color94Regular13),
              heightSpace8,
              Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Est scelerisque urna rutrum duis. Risus scelerisque sed neque massa feugiat. Maecenas tincidunt consectetur quis ut. Dui nec metus, at tristique parturient faucibus. Nibh augue mauris tellus ultrices diam. Venenatis turpis sagittis faucibus sed tristique.',
                  style: color94Regular13),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSize appBarMethod() {
    return const PreferredSize(
      preferredSize: Size.fromHeight(56),
      child: MyAppBar(title: 'Terms & Conditions'),
    );
  }
}
