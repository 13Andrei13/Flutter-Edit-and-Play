import 'package:am_proiect/container/user_container.dart';
import 'package:am_proiect/models/index.dart';
import 'package:flutter/material.dart';

class AvatarCircle extends StatelessWidget {
  const AvatarCircle({
    Key? key,
    required this.sizeWidth,
    required this.avatarColorTx,
    required this.avatarColorBg,
  })  : assert(sizeWidth != null),
        assert(avatarColorTx != null),
        assert(avatarColorBg != null),
        super(key: key);

  final double sizeWidth;
  final Color avatarColorTx;
  final Color avatarColorBg;

  @override
  Widget build(BuildContext context) {
    return UserContainer(
      builder: (BuildContext context, AppUser? user) {
        return CircleAvatar(
          backgroundColor: avatarColorBg,
          foregroundImage: user!.photoUrl != null ? NetworkImage(user.photoUrl!) : null,
          radius: MediaQuery.of(context).size.width * sizeWidth,
          child: user.photoUrl != null
              ? null
              : Text(
                  user.fullName[0].toUpperCase(),
                  style: TextStyle(color: avatarColorTx),
                ),
        );
      },
    );
  }
}
