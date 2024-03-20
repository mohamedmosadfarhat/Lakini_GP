import 'package:flutter/material.dart';

import 'package:lakini_gp/features/profile/presentation/views/edit_profile.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.postIcon,
    required this.preIcon,
  });

  final IconData postIcon;
  final IconData preIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, right: 8, left: 8, bottom: 8),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.zero,
          ),
          IconButton(
            splashRadius: 5,
            onPressed: () {},
            icon: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey.withOpacity(0.1),
                child: Icon(
                  preIcon,
                  color: const Color(0xffF3F3F3),
                )),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, EditProfileScreen.id);
            },
            icon: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey.withOpacity(0.1),
              child: Icon(
                postIcon,
                color: const Color(0xffF3F3F3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
