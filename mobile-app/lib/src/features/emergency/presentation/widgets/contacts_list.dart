import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:ellipsis_care/src/features/emergency/presentation/bloc/bloc.dart';
import 'package:ellipsis_care/src/features/emergency/presentation/widgets/contact_tile.dart';

class EmergencyContactsList extends StatelessWidget {
  const EmergencyContactsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "My Contacts",
                style: context.textTheme.bodyLarge?.copyWith(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "See all",
                  style: context.textTheme.bodySmall?.copyWith(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 8.h),
        BlocBuilder<EmergencyContactBloc, EmergencyContactState>(
          bloc: context.watch<EmergencyContactBloc>()..add(FetchContactsFromStorageEvent()),
          builder: (context, state) {
            if (state.contacts.isNotEmpty) {
              return SizedBox(
                height: .6.sh,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.contacts.length + 1,
                  itemBuilder: (context, index) {
                    if (index == state.contacts.length) {
                      return AddEmergencyContact(
                        addContact: () => context
                            .read<EmergencyContactBloc>()
                            .add(AddContactEvent()),
                      );
                    }
                    return EmergencyContactTile(
                      name: state.contacts[index].name,
                      phoneNumber:
                          state.contacts[index].phoneNumbers?.first ?? "",
                      profilePicture: state.contacts[index].photo,
                    );
                  },
                ),
              );
            }
            return AddEmergencyContact(
              addContact: () =>
                  context.read<EmergencyContactBloc>().add(AddContactEvent()),
            );
          },
        ),
      ],
    );
  }
}
