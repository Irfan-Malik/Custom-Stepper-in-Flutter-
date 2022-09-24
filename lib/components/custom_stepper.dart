import 'package:flutter/material.dart';

class MyCustomStepper extends StatelessWidget {
  const MyCustomStepper({
    Key? key,
    this.title,
    this.subTitle,
    this.index,
    this.selectedIndex,
    this.itemsLength,
    this.onContinue,
    this.onBack,
    this.onFinish,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  }) : super(key: key);

  final String? title;
  final String? subTitle;
  final int? index;
  final int? selectedIndex;
  final int? itemsLength;
  final VoidCallback? onContinue;
  final VoidCallback? onBack;
  final VoidCallback? onFinish;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(

                  color: index!! <= selectedIndex! ? Colors.blue : Colors.grey,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: index! < selectedIndex!
                      ? const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 16,
                        )
                      : Text(
                          '${index! + 1}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null)
                    Text(
                      title!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  if (index == itemsLength! - 1) ...[
                    const SizedBox(
                      height: 2,
                    ),
                    const Text(
                      'LastStep',
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    )
                  ]
                ],
              )
            ],
          ),
          const SizedBox(height: 5),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: index != itemsLength! - 1 ? 5 : 20),
                if (index != itemsLength! - 1)
                  const VerticalDivider(
                    color: Colors.black38,
                    thickness: 1,
                    indent: 5,
                  ),
                const SizedBox(width: 15),
                Expanded(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (selectedIndex == index) ...[
                      if (subTitle != null) Text(subTitle!),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: index == itemsLength! - 1
                                ? onFinish
                                : onContinue,
                            child: Text(index == itemsLength! - 1
                                ? 'Finish'
                                : 'Continue'),
                          ),
                          TextButton(
                              onPressed: onBack,
                              child: const Text(
                                'Back',
                                style: TextStyle(color: Colors.black38),
                              ))
                        ],
                      )
                    ],
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
