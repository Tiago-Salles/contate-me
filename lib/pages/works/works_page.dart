import 'package:contate_me/headers/main_header.dart';
import 'package:flutter/material.dart';

import 'works_widgets/body_works.dart';

class WorksPage extends StatelessWidget {
  const WorksPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainHeader(child: BodyWorks(collection: "users"),
    );
  }
}