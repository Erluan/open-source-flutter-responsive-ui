import 'package:admin/constants.dart';
import 'package:admin/data/models/MyFiles.dart';
import 'package:admin/features/dashboard/presentations/widgets/file_info_card.dart';
import 'package:flutter/material.dart';

class MyFilesGridView extends StatelessWidget {
  int? crossAxisCount;
  double? childAspectRatio;

  MyFilesGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: myFilesMock.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount!,
        mainAxisSpacing: defaultPadding,
        crossAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio!,
      ),
      itemBuilder: (context, index) => FileInfoCard(info: myFilesMock[index]),
    );
  }
}