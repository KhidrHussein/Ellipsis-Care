import 'package:ellipsis_care/config/router/route_names.dart';
import 'package:ellipsis_care/core/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/asset_strings.dart';

part 'cubit.dart';

class NavigatorShell extends StatelessWidget {
  final Widget child;
  const NavigatorShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: const NavigationRow(),
    );
  }
}

class NavigationRow extends StatelessWidget {
  const NavigationRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(bottom: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(height: 0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: navigationRowIconPaths.map(
              (icon) {
                return BlocBuilder<NavigationRowCubit, String>(
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () =>
                          context.read<NavigationRowCubit>().goToRoute(icon),
                      child: NavigationRowItem(
                        iconPath: icon,
                        selectedIcon: icon == state,
                      ),
                    );
                  },
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}

class NavigationRowItem extends StatelessWidget {
  final String iconPath;
  final bool selectedIcon;

  const NavigationRowItem({
    super.key,
    required this.iconPath,
    required this.selectedIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: Column(
        children: [
          if (selectedIcon)
            Container(
              width: 54.w,
              height: 2.h,
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(24.r),
              ),
            ),
          SizedBox(height: 8.h),
          if (iconPath == AssetStringPath.emergency)
            Container(
              padding: REdgeInsetsDirectional.all(8),
              decoration: BoxDecoration(
                color: switch (selectedIcon) {
                  true => AppColors.black,
                  false => AppColors.red,
                },
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                iconPath,
                fit: BoxFit.cover,
                colorFilter: const ColorFilter.mode(
                  AppColors.white,
                  BlendMode.srcIn,
                ),
              ),
            )
          else
            SvgPicture.asset(
              iconPath,
              width: 24.w,
              height: 24.h,
               colorFilter: ColorFilter.mode(
                switch (selectedIcon) {
                  true => AppColors.black,
                  false => AppColors.navigationIconColor,
                },
                BlendMode.srcIn,
              ),
            )
        ],
      ),
    );
  }
}
