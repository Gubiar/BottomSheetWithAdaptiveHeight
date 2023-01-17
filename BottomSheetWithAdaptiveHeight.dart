import 'package:flutter/material.dart';

class BottomSheetWithAdaptiveHeight{

  static Future<void> getModalPrazoPagamento({
    required BuildContext context,
    double? maxHeight,

    //need ListView with "shrinkWrap: true" AND physics: const ClampingScrollPhysics(), to work
    required ListView child,
  }) async{
    Size windowSize = MediaQuery.of(context).size;

    await showModalBottomSheet<dynamic>(
        isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(12)
            )
        ),
        builder: (BuildContext bc) {
          return Wrap(
            children: [

              Center(
                child: Container(
                  width: 100,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  margin: const EdgeInsets.only(
                    bottom: 20,
                    top: 20
                  ),
                ),
              ),

              Container(
                constraints: BoxConstraints(
                  maxHeight: maxHeight ?? windowSize.height - 100
                ),
                child: Scrollbar(
                  thumbVisibility: true,
                  thickness: 5,
                  radius: const Radius.circular(20),
                  scrollbarOrientation: ScrollbarOrientation.right,
                  child: SingleChildScrollView(
                    child: Wrap(
                      children: <Widget>[
                        Expanded(
                          child: child,
                        ),
                      ]
                    ),
                  ),
                ),
              ),

            ],
          );
        }
    );
  }
}