import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controller/bloc/dashboard_bloc.dart';

class PromptResponses extends StatelessWidget {
  const PromptResponses({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Semantics(
            child: Icon(Icons.info_outline),
          ),
        )
      ],
    );
  }
}
