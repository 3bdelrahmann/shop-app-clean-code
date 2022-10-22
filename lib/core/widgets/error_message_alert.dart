import 'package:flutter/material.dart';
import 'package:inthekloud_shop_app/core/resources/app_fonts.dart';
import 'package:inthekloud_shop_app/core/resources/app_text_styles.dart';

Future<void> messageAlert(BuildContext context, String message) {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding: const EdgeInsets.only(top: 0, bottom: 0),
        content: ClipRRect(
          child: SizedBox(
            //height: 280,
            width: MediaQuery.of(context).size.width * 0.9,
            //margin: EdgeInsets.only(bottom: 20,right: 20,left: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              //mainAxisAlignment: M,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          width: 42,
                          height: 42,
                          alignment: Alignment.center,
                          child: const Icon(
                            Icons.close,
                            color: Colors.black,
                            size: 14,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 50, left: 50),
                  alignment: Alignment.center,
                  child: Text(
                    message,
                    style: AppTextStyles().getRegularStyle(
                        color: Colors.black, fontSize: AppFontSize.s16),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
