import 'dart:io';

import 'package:ellipsis_care/src/shared/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/colors.dart';

class UserAvatar extends StatelessWidget {
  final double radius;
  const UserAvatar({super.key, this.radius = 15});

  final String _defaultPicUrl =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiLp4JVcnUNcHcBofrZOiYcWZv4bAm-tF8DQ&s";

  @override
  Widget build(BuildContext context) {
    context.read<UserBloc>().add(GetUserEvent());
    final bloc = context.watch<UserBloc>().state;

    return CircleAvatar(
      minRadius: radius,
      backgroundColor: AppColors.black,
      backgroundImage: bloc.user != null && bloc.user?.photoUrl != null
          ? FileImage(File(bloc.user!.photoUrl!))
          : NetworkImage(_defaultPicUrl),
    );
  }
}
