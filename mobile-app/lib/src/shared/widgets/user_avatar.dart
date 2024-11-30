import 'package:ellipsis_care/src/shared/controller/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/asset_strings.dart';
import '../../../core/constants/colors.dart';

class UserAvatar extends StatelessWidget {
  final double radius;
  const UserAvatar({super.key, this.radius = 15});

  @override
  Widget build(BuildContext context) {
    final userBloc = context.watch<UserBloc>().state;

    return CircleAvatar(
      minRadius: radius,
      backgroundColor: AppColors.white,
      backgroundImage: userBloc.user?.photoUrl != null
          ? NetworkImage(userBloc.user!.photoUrl!)
          : const AssetImage(AssetStrings.logo),
    );
  }
}
