import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/core/consts/app_colors.dart';
import 'package:home/core/consts/app_strings.dart';
import 'package:home/core/util/keys.dart';
import 'package:home/core/widget/build_app_bar.dart';
import 'package:home/new_app/app_prefs.dart';
import 'package:home/new_app/data/extensions.dart';
import 'package:home/new_app/data/model/newapp_services_mode.dart';
import 'package:home/new_app/presentation/main/controllers/new_app_main_controller.dart';

import 'new_app_main_view.dart';
import 'widget/search_widget.dart';

class SearchServiceView extends StatefulWidget {
  const SearchServiceView({super.key});

  @override
  State<SearchServiceView> createState() => _SearchServiceViewState();
}

class _SearchServiceViewState extends State<SearchServiceView> {
  List<NewAppServicesDataMode> list =
      Get.find<NewAppMainControllerImp>().state.value.servcies;
  List<NewAppServicesDataMode> finalList = [];
  @override
  void initState() {
    finalList = list;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void runFilter(String val) {
      List<NewAppServicesDataMode> result = [];
      val.isEmpty
          ? result = list
          : result = list
              .where(
                (list) => NewAppAppPreferences.to.getLang == Keys.ar
                    ? list.nameAr
                        .valide()
                        .toLowerCase()
                        .contains(val.toLowerCase())
                    : list.nameEn
                        .valide()
                        .toLowerCase()
                        .contains(val.toLowerCase()),
              )
              .toList();

      setState(() => finalList = result);
    }

    return Scaffold(
      appBar: BackAppBar(title: KStrings.search.tr),
      backgroundColor: KColors.scaffoldBg2,
      body: Column(
        children: [
          Hero(
            tag: "/_search",
            child: CustomSearchBar(
              padding: 16.padHorizontal + 8.padBtm + 8.padTop,
              onChanged: runFilter,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: ListServiceData(
                ctrl: Get.find<NewAppMainControllerImp>(),
                list: finalList,
                // isLoading:value.servcies false,
              ),
            ),
          )
        ],
      ),
    );
  }
}
