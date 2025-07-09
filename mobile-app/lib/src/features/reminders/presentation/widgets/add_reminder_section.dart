import 'package:ellipsis_care/config/gen/assets.gen.dart' show AppAssets;
import 'package:ellipsis_care/core/utils/enums.dart';

import '../../../../../core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddReminderSection extends StatelessWidget {
  final String sectionName;
  final Widget subsection;

  const AddReminderSection({
    super.key,
    required this.sectionName,
    required this.subsection,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          sectionName,
          style: context.textTheme.headlineMedium?.copyWith(fontSize: 15.sp),
        ).alignLeft,
        5.sizedBoxHeight,
        subsection,
        10.sizedBoxHeight,
      ],
    );
  }
}

class ReminderTypeButton extends StatelessWidget {
  const ReminderTypeButton({
    super.key,
    required this.type,
    required this.notifier,
  });

  final ReminderType type;
  final ValueNotifier<ReminderType> notifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: notifier,
      builder: (context, value, child) {
        return GestureDetector(
          onTap: () => notifier.value = type,
          child: AnimatedContainer(
            duration: Durations.medium2,
            margin: REdgeInsets.only(right: 10),
            padding: REdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: switch (type) {
                ReminderType.drug => context.themeExtension.drugBgColor,
                ReminderType.food => context.themeExtension.foodBgColor,
              },
              borderRadius: BorderRadius.circular(5.r),
              border: value == type
                  ? Border.all(
                      color: context.themeExtension.reminderInverseColor)
                  : null,
            ),
            child: Column(
              children: [
                switch (type) {
                  ReminderType.drug => AppAssets.icons.icDrug.svg(
                      width: 32,
                      colorFilter: ColorFilter.mode(
                        context.themeExtension.drugColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ReminderType.food => AppAssets.icons.icFood.svg(
                      width: 32,
                      colorFilter: ColorFilter.mode(
                        context.themeExtension.foodColor,
                        BlendMode.srcIn,
                      ),
                    ),
                },
                10.sizedBoxHeight,
                Text(
                  type.name,
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontSize: 14.sp,
                    color: context.themeExtension.reminderInverseColor
                        .withValues(alpha: .3),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ReminderDropDown<T> extends StatelessWidget {
  const ReminderDropDown({
    super.key,
    required this.items,
    required this.notifier,
  });

  final Iterable<T> items;
  final ValueNotifier<T> notifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: notifier,
      builder: (context, value, child) {
        return DropdownButton<T>(
          elevation: 4,
          isExpanded: true,
          value: value,
          underline: const SizedBox(),
          borderRadius: BorderRadius.circular(5.r),
          padding: REdgeInsets.only(left: 12),
          style: context.textTheme.labelSmall?.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: context.textTheme.labelSmall?.color!.withValues(alpha: .87),
          ),
          hint: Text(
            "Daily, twice, etc",
            style: context.textTheme.labelSmall?.copyWith(
              fontSize: 14.sp,
              color: context.textTheme.labelSmall?.color!.withValues(alpha: .3),
            ),
          ),
          items: [
            for (final T item in items)
              DropdownMenuItem<T>(
                value: item,
                child: Text(
                 (item is Enum) ? item.name.toUpperCase() : "",
                ),
              ),
          ],
          onChanged: (value) => notifier.value = value as T,
        );
      },
    );
  }
}
