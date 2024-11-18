import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:ellipsis_care/core/utils/helpers.dart';
import 'package:ellipsis_care/src/features/home/presentation/widgets/response_history_group.dart';
import 'package:ellipsis_care/src/shared/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResponseHistory extends StatefulWidget {
  const ResponseHistory({super.key});

  @override
  State<ResponseHistory> createState() => _ResponseHistoryState();
}

class _ResponseHistoryState extends State<ResponseHistory> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const IconButton(
                  onPressed: UtilHelpers.popRoute,
                  icon: Icon(Icons.navigate_before),
                ),
                Expanded(
                  child: SearchBar(
                    controller: _searchController,
                    elevation: const WidgetStatePropertyAll(0),
                  ),
                ),
                26.horizontalSpace,
                Padding(
                  padding: REdgeInsets.only(right: 16),
                  child: const UserAvatar(radius: 20),
                )
              ],
            ),
            20.verticalSpace,
            const ResponseHistoryGroup(
              groupHeader: "Previous messages",
              responses: [
                "Some history I don't know",
                "Some history I don't know",
                "Some history I don't know",
              ],
            )
          ],
        ),
      ),
    );
  }
}
