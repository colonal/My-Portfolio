import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:my_profile/core/theme/app_color.dart';
import 'package:my_profile/core/widget/screen_helper.dart';
import 'package:my_profile/features/contact/persentation/bloc/contact_bloc.dart';

class FormSubmitBtn extends StatefulWidget {
  const FormSubmitBtn({Key? key}) : super(key: key);

  @override
  State<FormSubmitBtn> createState() => _FormSubmitBtnState();
}

class _FormSubmitBtnState extends State<FormSubmitBtn>
    with SingleTickerProviderStateMixin {
  bool isSend = false;
  bool isLoading = false;
  bool isDone = false;
  bool isError = false;

  late AnimationController controller;
  late Animation<Offset> offset;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    offset = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(1.5, 0.0),
    ).animate(controller);

    offset.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isLoading = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = ScreenHelper.isDesktop(context);
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: isDesktop ? 50 : 30,
        width: 200,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
            color: Theme.of(context).textTheme.headline1!.color,
            borderRadius: BorderRadius.circular(isSend ? 0 : 8),
            border: isSend
                ? null
                : Border.all(
                    color: Theme.of(context).textTheme.headline1!.color!,
                    width: 2,
                  )),
        child: InkWell(
          onTap: () async {
            if (ContactBloc.get(context).onPressed() == 0) {
              setState(() {
                isSend = !isSend;

                controller.forward();
              });
              ContactBloc.get(context).send().then((value) {
                setState(() {
                  isLoading = false;
                  isDone = true;
                });
                if (value == 1) {
                  isError = true;
                }
                Future.delayed(const Duration(seconds: 3), () {
                  setState(() {
                    if (value == 1) {
                      isError = false;
                    }
                    isDone = false;
                  });
                });

                setState(() {
                  isSend = !isSend;
                  controller.reverse();
                });
              });
            }
          },
          // minWidth: isDesktop ? 200 : 150,
          hoverColor: Theme.of(context).primaryColorDark,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: isSend ? 200 : null,
            decoration: BoxDecoration(
              color: isDone
                  ? (isError ? Colors.redAccent : Colors.greenAccent)
                  : (isSend ? Colors.white : Colors.transparent),
            ),
            child: isLoading
                ? Center(
                    child: DefaultTextStyle(
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: isDesktop ? 16 : 12,
                            color: AppColor.textColorDark,
                          ),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          WavyAnimatedText('Wait'),
                          WavyAnimatedText('Loading'),
                        ],
                        isRepeatingAnimation: true,
                      ),
                    ),
                  )
                : isDone
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Transform.scale(
                            scale: isSend ? 3 : 1,
                            child: Container(
                              width: 50,
                              height: isSend ? 50 : 40,
                              decoration: BoxDecoration(
                                color: Theme.of(context).cardColor,
                                shape: isSend
                                    ? BoxShape.rectangle
                                    : BoxShape.circle,
                              ),
                              child: SlideTransition(
                                position: offset,
                                child: Icon(
                                  isError ? Icons.error : Icons.done,
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .color!,
                                ),
                              ),
                            ),
                          ),
                          SlideTransition(
                            position: offset,
                            child: Text(
                              isError ? "Failed" : "Done",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: isDesktop ? 16 : 12,
                                  ),
                            ),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Transform.scale(
                            scale: 1,
                            child: Container(
                              width: 50,
                              height: isDesktop ? (isSend ? 50 : 40) : 20,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  shape: BoxShape.circle),
                              child: SlideTransition(
                                position: offset,
                                child: Icon(
                                  Icons.send_rounded,
                                  size: isDesktop ? 25 : 15,
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .color!,
                                ),
                              ),
                            ),
                          ),
                          SlideTransition(
                            position: offset,
                            child: Text(
                              "SEND MESSAGE",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: isDesktop ? 16 : 12,
                                  ),
                            ),
                          ),
                        ],
                      ),
          ),
        ),
      ),
    );
  }
}
