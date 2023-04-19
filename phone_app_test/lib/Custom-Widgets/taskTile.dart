import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile( // you can probably remove the const keyword, but I put it here to get rid of any blue squiggles from intelli-sense

      // put listview tile code here, or make a container.
      // this will be wrapped in a listview.builder I believe,
      // since the number of elements won't be dictated statically
      // but based on the users needs

    );
  }
}
