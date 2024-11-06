import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:ellipsis_care/src/features/emergency/domain/emergency_contact.dart';
import 'package:ellipsis_care/src/features/emergency/presentation/bloc/emergency_bloc.dart';

import '../../../../../core/constants/colors.dart';

class EmergencyContactTile extends StatefulWidget {
  final EmergencyContact contact;

  const EmergencyContactTile({super.key, required this.contact});

  @override
  State<EmergencyContactTile> createState() => _EmergencyContactTileState();
}

class _EmergencyContactTileState extends State<EmergencyContactTile> {
  bool _canEditContactName = false;
  bool _canEditContactPhone = false;

  late final TextEditingController _nameController;
  late final TextEditingController _phoneNumberController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.contact.name);
    _phoneNumberController =
        TextEditingController(text: widget.contact.phoneNumber);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  Widget _contactEditor(TextEditingController controller) {
    return SizedBox(
      height: 32.h,
      child: TextField(
        controller: controller,
        keyboardType:
            _canEditContactName ? TextInputType.text : TextInputType.phone,
        style: context.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w400,
          color: _canEditContactName
              ? AppColors.black
              : AppColors.emergencyContactNumberColor,
          fontSize: _canEditContactName ? 15.sp : 12.sp,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.editContactTextFieldColor,
          contentPadding: REdgeInsets.symmetric(horizontal: 5, vertical: 2),
          focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }

  Widget _actionButton({
    required Color color,
    required String text,
    required VoidCallback onTap,
  }) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        backgroundColor: color,
        minimumSize: Size(135.w, 40.h),
        padding: REdgeInsets.symmetric(horizontal: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      child: Text(
        text,
        style: context.textTheme.bodyMedium?.copyWith(
          fontSize: 15.sp,
          color: AppColors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final emergencyContactBloc = context.read<EmergencyContactBloc>();

    return GestureDetector(
      onTap: () {
        setState(() {
          _canEditContactName = true;
          _canEditContactPhone = false;
        });
      },
      child: Container(
        margin: REdgeInsets.only(bottom: 5),
        padding: REdgeInsets.symmetric(horizontal: 10, vertical: 9),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: AppColors.outlinedButtonBorder),
        ),
        child: Row(
          children: [
            if (widget.contact.photo != null)
              CircleAvatar(
                radius: 22,
                backgroundImage: MemoryImage(widget.contact.photo!),
              )
            else
              const CircleAvatar(),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (_canEditContactName)
                    _contactEditor(_nameController)
                  else
                    Text(
                      widget.contact.name,
                      style: context.textTheme.bodyLarge?.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  if (_canEditContactPhone)
                    _contactEditor(_phoneNumberController)
                  else
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _canEditContactName = false;
                          _canEditContactPhone = true;
                        });
                      },
                      child: Text(
                        widget.contact.phoneNumber ?? "",
                        style: context.textTheme.bodyLarge?.copyWith(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.emergencyContactNumberColor,
                        ),
                      ),
                    ),
                  if (_canEditContactName || _canEditContactPhone)
                    Padding(
                      padding: REdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          _actionButton(
                            color: AppColors.black,
                            text: "Done",
                            onTap: () async {
                              setState(() {
                                _canEditContactName = false;
                                _canEditContactPhone = false;
                              });
                              emergencyContactBloc.add(
                                EditContactEvent(
                                  contact: widget.contact.copyWith(
                                    name: _nameController.text,
                                    phoneNumber: _phoneNumberController.text,
                                  ),
                                ),
                              );
                            },
                          ),
                          16.sizedBoxWidth,
                          _actionButton(
                            color: AppColors.deleteButtonColor,
                            text: "Delete",
                            onTap: () {
                              emergencyContactBloc.add(
                                DeleteContactEvent(id: widget.contact.id),
                              );
                            },
                          ),
                        ],
                      ),
                    )
                ],
              ),
            ),
            if (_canEditContactName || _canEditContactPhone)
              const SizedBox()
            else
              GestureDetector(
                child: Icon(Icons.move_down),
              )
          ],
        ),
      ),
    );
  }
}

class AddEmergencyContact extends StatelessWidget {
  final VoidCallback? addContact;
  const AddEmergencyContact({super.key, this.addContact});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: addContact,
      child: Container(
        padding: REdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: AppColors.outlinedButtonBorder),
        ),
        child: Row(
          children: [
            const Icon(Icons.add_circle_outline_outlined, size: 24),
            10.sizedBoxWidth,
            Text(
              "Add new",
              style: context.textTheme.bodyLarge?.copyWith(
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
