import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:ellipsis_care/src/features/emergency/presentation/widgets/header.dart';

import '../bloc/emergency_bloc.dart';
import 'contact_tile.dart';

class ContactSheet extends StatelessWidget {
  const ContactSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final emergencyContactBloc = context.read<EmergencyContactBloc>();

    return DraggableScrollableSheet(
      minChildSize: .1,
      initialChildSize: .1,
      builder: (context, scrollController) {
        return Container(
          padding: REdgeInsets.only(left: 16.w, right: 16.w, top: 5.h),
          decoration: BoxDecoration(
            color: context.themeExtension.emergencySheetBgColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.r),
              topRight: Radius.circular(40.r),
            ),
          ),
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              const SliverToBoxAdapter(child: Header()),
              BlocBuilder<EmergencyContactBloc, EmergencyContactState>(
                bloc: emergencyContactBloc..add(FetchContactsEvent()),
                builder: (context, state) {
                  if (state.contacts.isNotEmpty) {
                    return SliverReorderableList(
                      itemCount: state.contacts.length + 1,
                      onReorder: (oldIndex, newIndex) {},
                      onReorderStart: (index) {
                        index.printLog();
                      },
                      itemBuilder: (context, index) {
                        if (index == state.contacts.length) {
                          return AddEmergencyContact(
                            key: const ValueKey("add"),
                            addContact: () =>
                                emergencyContactBloc.add(AddContactEvent()),
                          );
                        }
                        return EmergencyContactTile(
                          key: ValueKey(state.contacts[index]),
                          contact: state.contacts[index],
                        );
                      },
                    );
                  }
                  return SliverToBoxAdapter(
                    child: AddEmergencyContact(
                      addContact: () =>
                          emergencyContactBloc.add(AddContactEvent()),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
