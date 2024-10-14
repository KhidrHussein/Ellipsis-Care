import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';
import '../widgets/contact_tile.dart';
import '../widgets/header_information.dart';

class Emergency extends StatelessWidget {
  const Emergency({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: HeaderInformation()),
          BlocBuilder<EmergencyContactBloc, EmergencyContactState>(
            bloc: context.watch<EmergencyContactBloc>()
              ..add(FetchContactsFromStorageEvent()),
            builder: (context, state) {
              if (state.contacts.isNotEmpty) {
                return SliverList.builder(
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
                );
              }
              return SliverToBoxAdapter(
                child: AddEmergencyContact(
                  addContact: () => context
                      .read<EmergencyContactBloc>()
                      .add(AddContactEvent()),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
