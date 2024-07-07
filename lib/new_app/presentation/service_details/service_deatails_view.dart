/* import 'package:flutter/material.dart';
import '/core/util/animation/widgets/fade_transition.dart';
import '/core/widget/app_text/text_dart';
import '/new_app/data/extensions.dart';

class ServiceDetails extends StatelessWidget {
  const ServiceDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget('My Cart'),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: CustomFadeIn(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CartItem(
                  name: 'Vegetables', price: '\$40.90', quantity: '6 items'),
              const CartItem(
                  name: 'Fruits', price: '\$40.56', quantity: '10 items'),
              const CartItem(
                  name: 'Meat', price: '\$12.90', quantity: '1 item'),
              20.sH,
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const TextWidget('Repeat previous order'),
              ),
              const Spacer(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    'Total amount',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextWidget(
                    '\$94.52',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              20.sH,
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const TextWidget('Pay Now'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String name;
  final String price;
  final String quantity;

  const CartItem(
      {super.key,
      required this.name,
      required this.price,
      required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: TextWidget(name),
        subtitle: TextWidget(quantity),
        trailing: TextWidget(price),
      ),
    );
  }
}
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home/core/widget/lists/animation_list_vertical_widget.dart';
import 'package:home/new_app/presentation/about_us/views/widget/build_setting_card.dart';
import '/core/consts/app_colors.dart';
import 'package:photo_view/photo_view.dart';

import 'package:home/core/widget/image_widget.dart';
import '/core/consts/app_images.dart';
import '/core/consts/app_strings.dart';
import '/core/widget/app_text/text_styles.dart';
import '/core/widget/app_text/text_widget.dart';
import '/core/widget/build_app_bar.dart';
import '/new_app/data/extensions.dart';
import '/new_app/data/model/newapp_services_mode.dart';

class ServiceDetailsView extends StatefulWidget {
  const ServiceDetailsView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ServiceDetailsViewState createState() => _ServiceDetailsViewState();
}

class _ServiceDetailsViewState extends State<ServiceDetailsView> {
  late NewAppServicesDataMode service;

  @override
  void initState() {
    service = Get.arguments['service'] as NewAppServicesDataMode;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          BackAppBar(title: service.nameAr.translateDatabase(service.nameEn)),
      backgroundColor: KColors.scaffoldBg2,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Hero(
                  tag: service.id.toString(),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(minHeight: 250),
                    child: PostItemImage(image: service.image),
                  )

                  /*  ImageWidget(
                  path: service.image ?? "",
                  height: 200,
                  failerImg: "assets/images/img4.jpg",
                  fit: BoxFit.fill,
                ),
               */
                  ),
            ),
            20.sH,
            Padding(
              padding: 8.padVertical + 8.padHorizontal,
              child: Column(
                children: [
                  AnimationListWidget(
                    index: 0,
                    curve: Curves.fastOutSlowIn,
                    horizontal: 300,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const ImageWidget(
                          path: "assets/images/equal.svg",
                          height: 20,
                          width: 20,
                          color: KColors.cirBlueBg,
                        ),
                        10.sW,
                        TextWidget(
                          service.nameAr.translateDatabase(service.nameEn),
                          style: HomeTxStyle.gStyle24.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  10.sH,
                  AnimationListWidget(
                    curve: Curves.fastOutSlowIn,
                    vertical: 300,
                    index: 1,
                    milliseconds: 300 + (1 * 200),
                    child: BuildSettingCard(
                      children: [
                        SettingCardModel(
                          icon: Kimage.whatsappFill,
                          title: KStrings.phone.tr,
                          sup: service.phone1,
                        ),
                        SettingCardModel(
                          icon: Kimage.whatsappFill,
                          title: KStrings.phone.tr,
                          sup: service.phone2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
/* 
            20.sH,
            TextWidget(
              "Created At: ${service.createdAt}",
              style: DMTxStyle.gStyle14.copyWith(color: Colors.grey),
            ),
            TextWidget(
              "Updated At: ${service.updatedAt}",
              style: DMTxStyle.gStyle14.copyWith(color: Colors.grey),
            ),
            20.sH,
 */
          ],
        ),
      ),
    );
  }
}

class PostItemImage extends StatelessWidget {
  const PostItemImage({super.key, required this.image});
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 8.padTop,
      child: GestureDetector(
        onTap: () {
          Get.bottomSheet(
            SafeArea(
              child: SizedBox(
                height: ScreenUtil().screenHeight /*  - 50.h */,
                width: ScreenUtil().screenWidth,
                child: _HeroPhotoViewRouteWrapper(
                  imageProvider: NetworkImage(image ?? ""),
                ),
              ),
            ),
            elevation: 0.0,
            isScrollControlled: true,
            backgroundColor: KColors.black,
            shape: RoundedRectangleBorder(borderRadius: 0.radius),
          );
        },
        child: ImageWidget(
          path: image,
          // height: 165,
          failerImg: "assets/images/img4.jpg",
          width: context.width,
          fit: BoxFit.cover,
        ).radiusWithClipRRect(8),
      ),
    );
  }
}

class _HeroPhotoViewRouteWrapper extends StatelessWidget {
  const _HeroPhotoViewRouteWrapper({
    required this.imageProvider,
  });

  final ImageProvider imageProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        height: MediaQuery.sizeOf(context).height,
      ),
      padding: 20.padBtm,
      child: PhotoView(
        imageProvider: imageProvider,
        heroAttributes: const PhotoViewHeroAttributes(tag: "someTag"),
      ),
    );
  }
}
