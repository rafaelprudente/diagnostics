import 'package:diagnostics/routes/routes.dart' as routes;
import 'package:diagnostics/ui/widgets/my_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MedicalExamListPage extends StatefulWidget {
  const MedicalExamListPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MedicalExamListPage> createState() => _MedicalExamListPageState();
}

class _MedicalExamListPageState extends State<MedicalExamListPage> {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: widget.title,
      body: buildBody(),
      floatingActionButton: buildFloatingActionButton(),
    );
  }

  Widget buildBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Medical Exam List Page',
          ),
          Text(
            '',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }

  Widget buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () => Get.toNamed(routes.medicalExamAddPage),
      tooltip: 'Add New',
      child: const Icon(Icons.add),
    );
  }
}
