import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ellipsis_care/core/constants/asset_strings.dart';
import 'package:ellipsis_care/core/utils/extensions.dart';

class ResponseHistoryGroup extends StatelessWidget {
  final String groupHeader;
  final List<String> responses;

  const ResponseHistoryGroup({
    super.key,
    required this.groupHeader,
    required this.responses,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            groupHeader,
            style: context.textTheme.bodySmall
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          10.verticalSpace,
          ...responses.map((response) => _buildResponseRow(context, response))
        ],
      ),
    );
  }

  Widget _buildResponseRow(BuildContext context, String response) {
    return Padding(
      padding: REdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Container(
            padding: REdgeInsets.all(8),
            decoration: BoxDecoration(
              color: context.themeExtension.homeColor,
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: SvgPicture.asset(
              AssetStrings.previousMessageIcon,
              colorFilter: ColorFilter.mode(
                context.themeExtension.homeIconColor,
                BlendMode.srcIn,
              ),
            ),
          ),
          10.horizontalSpace,
          Expanded(
            child: Text(
              response,
              style: context.textTheme.labelLarge?.copyWith(fontSize: 15.sp),
            ),
          )
        ],
      ),
    );
  }
}
