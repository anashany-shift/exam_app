import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_assets.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          const CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 50,
            backgroundImage: AssetImage(AppAssets.photo),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(AppAssets.camera,)),
        ],
      ),
    );
  }
}
