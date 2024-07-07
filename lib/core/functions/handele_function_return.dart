import 'dart:developer';

import 'package:flutter/material.dart';
import '/core/network/base/network_exceptions/network_exceptions.dart';
import '/core/network/base/response/pagenation_model.dart';
import '/core/util/enums.dart';
import '/core/util/toast_manager.dart';

RequestState handleRxFailure(
  NetworkExceptions exceptions, {
  bool showTost = true,
  bool showError = false,
}) {
  String error = NetworkExceptions.getErrorMessage(exceptions);
  if (showTost) ToastManager.showSnak(error, isSuc: false);
  // if (showTost) ToastManager.showError(error);
  if (showError) log("error is >>>> $error");
  return switch (exceptions) {
    NoInternetConnection() => RequestState.offLineFailure,
    _ => RequestState.failure,
  };
}

RequestState handleRxLoading({bool isRef = false, int page = 1}) =>
    switch (isRef) {
      true => RequestState.loadingRef,
      false => switch (page) {
          1 => RequestState.loading,
          _ => RequestState.loadMore
        },
    };

RequestState handleRxSuccess({
  bool isRef = false,
  // EasyRefreshController? refControlle,
}) =>
    RequestState.success;

RequestState handleRxList<T>(List<T> responseList) => switch (responseList) {
      [] => RequestState.empty,
      _ => RequestState.success,
    };

List<T> handlePagenationResponse<T>({
  required List<T> responselist,
  required List<T> currentList,
}) {
  if (currentList.isEmpty) return responselist;
  currentList.addAll(responselist);
  return currentList;
}

void handleScrListener({
  required ScrollController scrCtrl,
  required Function() fun,
  MetaDataModel? meta,
  int? last,
  int? current,
}) async {
  if (scrCtrl.offset >= scrCtrl.position.maxScrollExtent &&
      !scrCtrl.position.outOfRange) {
    if (meta != null) {
      /*   debugPrint("last > current is ${meta.lastPage! > meta.currentPage!}");
      debugPrint("last : current => ${meta.lastPage} : ${meta.currentPage}"); */
      if (meta.lastPage! > meta.currentPage!) await fun();
    } else {
      if (last! > current!) await fun();
    }
  }
}

void handleDisposeScrAndRefCtrl({
  required ScrollController scrCtrl,
  required void Function() fun,
  // EasyRefreshController? refCtrl,
}) {
  scrCtrl.removeListener(fun);
  scrCtrl.dispose();
  // if (refCtrl != null) refCtrl.dispose();
}

Future<void> handleOnRefresh({
  // required EasyRefreshController controller,
  // required RefreshController controller,
  required Future<void> fun,
}) async {
  //debugPrint(">>>>>>>>>>>>>>>>>> Refresh start");
  // await controller.callRefresh();
  await fun;
  // //debugPrint(">>>>>>>>>>>>>>>>>> Refresh finish");
  // controller.resetHeader();
  // controller.resetFooter();
}

// Future<void> handleOnLoad({
  // required EasyRefreshController controller,
// }) async =>
// ? need mor handle
    // controller.finishLoad(IndicatorResult.noMore);

/* void handleRefFinish(
  bool isRef, {
  // required EasyRefreshController refCtrl,
  bool success = true,
}) =>
    switch (isRef) {
      true => refCtrl.finishRefresh(
          switch (success) {
            true => IndicatorResult.success,
            false => IndicatorResult.fail,
          },
          true,
        ),
      false => () {},
    };
 */
/* 
  Future<void> onRefresh() async {
    await getHome();
    state.value.refrController.refreshToIdle();
  }
 */
