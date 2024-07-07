import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

class CupertinoContextMenuWidget extends StatelessWidget {
  const CupertinoContextMenuWidget({
    super.key,
    required this.actions,
    required this.child,
  });
  final List<Widget> actions;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return CupertinoContextMenu(
      actions: actions,
      child: child,
    );
  }
}

//* Example

/* class CupertinoContextMenuWidget extends StatelessWidget {
  const CupertinoContextMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoContextMenu(
      actions: <Widget>[
        CupertinoContextMenuAction(
          isDefaultAction: true,
          trailingIcon: Icons.content_copy,
          onPressed: () {
            toasty(context, "Copy");
            finish(context);
          },
          child: Text(
            'Copy',
            style: primaryTextStyle(color: Colors.black),
          ),
        ),
        CupertinoContextMenuAction(
          trailingIcon: Icons.share,
          onPressed: () {
            toasty(context, "Share");
            finish(context);
          },
          child: Text('Share', style: primaryTextStyle(color: Colors.black)),
        ),
        CupertinoContextMenuAction(
          trailingIcon: Icons.delete,
          onPressed: () {
            toasty(context, "Delete");
            finish(context);
          },
          child: Text('Delete', style: primaryTextStyle(color: Colors.black)),
        ),
      ],
      child: Container(
        margin: EdgeInsets.only(
          bottom: MediaQuery.sizeOf(context).height * .5,
          right: 16,
          left: 16,
        ),
        child: FadeInImage(
          fit: BoxFit.cover,
          placeholder: Image.asset(Kimage.onBoarding1, fit: BoxFit.cover).image,
          image: const CachedNetworkImageProvider(
            "https://assets.iqonic.design/old-themeforest-images/prokit/images/defaultTheme/slider/01.jpg",
          ),
          // height: 150,
          width: MediaQuery.of(context).size.width,
        ).cornerRadiusWithClipRRect(10),
      ),
    );
  }
}
 */