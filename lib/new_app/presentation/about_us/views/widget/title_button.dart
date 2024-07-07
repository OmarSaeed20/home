import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home/core/consts/app_colors.dart';
import 'package:home/core/consts/app_images.dart';
import 'package:home/core/consts/app_strings.dart';
import 'package:home/core/util/helper/lunch_helper.dart';
import 'package:home/core/widget/app_text/text_styles.dart';
import 'package:home/core/widget/app_text/text_widget.dart';
import 'package:home/core/widget/image_widget.dart';
import 'package:home/new_app/data/extensions.dart';
import 'package:home/new_app/routes/app_pages.dart';

class TitleButton extends StatelessWidget {
  final String image, title;
  final String? sup;
  final bool isNotification, isLoading;
  final VoidCallback? onTap;
  const TitleButton({
    super.key,
    required this.image,
    required this.title,
    required this.sup,
    this.onTap,
    this.isNotification = false,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    void copyText(BuildContext context) {
      if (!sup.toString().valide().isEmptyOrNul &&
          title != KStrings.location.tr) {
        Clipboard.setData(ClipboardData(text: sup!));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: TextWidget(
              '$sup copied to clipboard',
              style: HomeTxStyle.gStyle14.copyWith(color: KColors.white),
            ),
          ),
        );
      }
    }

    return InkWell(
      onLongPress: () => copyText(context),
      child: Container(
        decoration:
            BoxDecoration(borderRadius: 8.radiusAll, color: KColors.white),
        child: ListTile(
          style: ListTileStyle.list,
          shape: RoundedRectangleBorder(borderRadius: 8.radiusAll),
          trailing:
              const Icon(Icons.arrow_forward_ios, color: KColors.txPrimary),
          leading: title == KStrings.workingHours.tr
              ? const Icon(
                  Icons.watch_later_outlined,
                  size: 25,
                  color: KColors.txPrimary,
                )
              : ImageWidget(
                  path: Get.currentRoute == NewAppRoutes.serviceDetails
                      ? Kimage.whatsappFill
                      : title == KStrings.phone.tr
                          ? Kimage.whatsapp
                          : image,
                  width: 25,
                  height: 25,
                  colorFilter: Get.currentRoute == NewAppRoutes.serviceDetails
                      ? null
                      : const ColorFilter.mode(
                          KColors.txPrimary,
                          BlendMode.srcIn,
                        ),
                  fit: BoxFit.fill,
                ),
          contentPadding: 8.padHorizontal,
          horizontalTitleGap: 8.w,
          title: TextWidget(
            title.tr,
            style: HomeTxStyle.gStyle16.copyWith(
              height: 17.86 / 16,
              color: KColors.txPrimary,
            ),
          ),
          subtitle: TextWidget(
            title == KStrings.location.tr ? "Tab to open map" : sup ?? '',
            style: HomeTxStyle.gStyle12.copyWith(color: KColors.txInfo),
          ),
          onTap: () {
            title.valide().printy();
            "$sup >>>>> ".valide().printy();

            if (!sup.toString().valide().isEmptyOrNul) {
              if (title == KStrings.address.tr) {
                LunchHelper.launchMap(sup.valide());
              }
              if (sup.toString().valide().contains("</iframe>")) {
                LunchHelper.launchURL((sup).toString().valide());
              }
              if (sup.toString().valide().isURL) {
                LunchHelper.launchURL(sup.toString().valide());
              }
              if (sup.toString().valide().isPhoneNumber ||
                  title.toString() == KStrings.phone.tr) {
                LunchHelper.launchWhatsapp(sup.toString().valide().trim());
              }
            }
          },
        ),
      ),
    );
  }
}

/* class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key, this.url});
  final String? url;

  @override
  // ignore: library_private_types_in_public_api
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  WebViewController? controllerGlobal;
  bool _isLoading = true;

  Future<bool> _exitApp() async {
    if (controllerGlobal != null) {
      if (await controllerGlobal!.canGoBack()) {
        controllerGlobal!.goBack();
        return Future.value(false);
      } else {
        return Future.value(true);
      }
    } else {
      return Future.value(true);
    }
  }

  @override
  Future<void> initState() async {
    super.initState();
    // Enable hybrid composition.
    // if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    controllerGlobal = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('${widget.url}'));

    if (Platform.isAndroid) {
      await InAppWebViewController.setWebContentsDebuggingEnabled(true);

      bool swAvailable = await WebViewFeature.isFeatureSupported(
          WebViewFeature.SERVICE_WORKER_BASIC_USAGE);
      bool swInterceptAvailable = await WebViewFeature.isFeatureSupported(
          WebViewFeature.SERVICE_WORKER_SHOULD_INTERCEPT_REQUEST);

      if (swAvailable && swInterceptAvailable) {
        ServiceWorkerController serviceWorkerController =
            ServiceWorkerController.instance();
        await serviceWorkerController
            .setServiceWorkerClient(ServiceWorkerClient(
          shouldInterceptRequest: (request) async {
            if (kDebugMode) {
              print(request);
            }
            return null;
          },
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: _exitApp,
      child: Scaffold(
        body: Stack(
          children: [
            WebViewWidget(
              controller: controllerGlobal!,
              /* javascriptMode: JavascriptMode.unrestricted,
              initialUrl: widget.url,
              gestureNavigationEnabled: true,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.future.then((value) => controllerGlobal = value);
                _controller.complete(webViewController);
              },
              onPageStarted: (String url) {
                if (kDebugMode) {
                  print('Page started loading: $url');
                }
                setState(() {
                  _isLoading = true;
                });
              },
              onPageFinished: (String url) {
                if (kDebugMode) {
                  print('Page finished loading: $url');
                }
                setState(() {
                  _isLoading = false;
                });
              }, */
            ),
            _isLoading ? const LoadingWidget() : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
 */