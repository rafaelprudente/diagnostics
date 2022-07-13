import 'package:diagnostics/ad_helper.dart';
import 'package:diagnostics/routes/routes.dart' as routes;
import 'package:diagnostics/ui/widgets/my_scaffold.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class MedicalExamListPage extends StatefulWidget {
  final String title;

  const MedicalExamListPage({Key? key, required this.title}) : super(key: key);

  @override
  State<MedicalExamListPage> createState() => _MedicalExamListPageState();
}

class _MedicalExamListPageState extends State<MedicalExamListPage> {
  BannerAd? _bannerAd;

  @override
  void initState() {
    super.initState();

    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (ad, err) {
          if (kDebugMode) {
            print('Failed to load a banner ad: ${err.message}');
          }
          ad.dispose();
        },
      ),
    ).load();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: widget.title,
      body: buildBody(),
      floatingActionButton: buildFloatingActionButton(),
    );
  }

  Widget buildBody() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        getList(),
        if (_bannerAd != null)
          SizedBox(
            width: _bannerAd!.size.width.toDouble(),
            height: _bannerAd!.size.height.toDouble(),
            child: AdWidget(ad: _bannerAd!),
          ),
      ],
    );
  }

  Widget buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () => Get.toNamed(routes.medicalExamAddPage),
      tooltip: 'Add New',
      child: const Icon(Icons.add),
    );
  }

  Widget getList() {
    return Flexible(
        child: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) {
              return ListTile(
                contentPadding: const EdgeInsets.all(0),
                //leading: getFileIcon(files[index]),
                //title: Text(basename(files[index].path)),
                title: const Text('Teste teste teste teste'),
                trailing: IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(Icons.delete_outline, color: Colors.grey),
                    onPressed: () async {
                      //files.remove(files[index]);
                      setState(() {});
                    }),
              );
            }));
  }
}
