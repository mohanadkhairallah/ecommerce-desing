import 'package:flutter/material.dart';

import '../resources/assets_manager.dart';

class AvatarsStack extends StatelessWidget {
  AvatarsStack({Key? key}) : super(key: key);

  final double overlap = 64.0;

  final items = [
    const AvatarItem(
      image: ImageManager.avatar0,
    ),
    const AvatarItem(
      image: ImageManager.avatar1,
    ),
    const AvatarItem(
      image: ImageManager.avatar2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> stackLayers =
        List<Widget>.generate(items.length, (index) {
      return Padding(
        padding: Directionality.of(context) == TextDirection.rtl
            ? EdgeInsets.fromLTRB(0, 0, index.toDouble() * overlap, 0)
            : EdgeInsets.fromLTRB(index.toDouble() * overlap, 0, 0, 0),
        child: items[index],
      );
    });
    return Stack(
      children: stackLayers.toList(),
    );
  }
}

class AvatarItem extends StatelessWidget {
  const AvatarItem({required this.image, Key? key}) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey[600]!,
          blurRadius: 5,
        ),
      ], shape: BoxShape.circle),
      child: CircleAvatar(
        radius: 40,
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8), // Border radius
          child: ClipOval(
              child: Image.asset(
            image,
          )),
        ),
      ),
    );
  }
}
