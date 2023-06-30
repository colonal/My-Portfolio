import 'package:flutter/material.dart';

class NoInternet extends StatelessWidget {
  final void Function()? onPressed;
  const NoInternet({required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/images/NoInternet.gif"),
        const SizedBox(height: 20),
        Container(
          width: 200,
          height: 50,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Theme.of(context).hintColor,
          ),
          child: MaterialButton(
            onPressed: onPressed,
            child: const Text("Try agen"),
          ),
        )
      ],
    );
  }
}
