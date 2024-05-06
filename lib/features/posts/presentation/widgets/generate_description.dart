import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakini_gp/features/posts/presentation/manager/cubit/cubit/generate_descp_cubit/generate_description_cubit.dart';

class GenerateDescription extends StatelessWidget {
  const GenerateDescription({super.key, this.textData});
  final String? textData;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        BlocProvider.of<GenerateDescriptionCubit>(context)
            .fetchDescription(text: textData!);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff0075FF),
      ),
      child: const Text('Generate\nDescription'),
    );
  }
}
