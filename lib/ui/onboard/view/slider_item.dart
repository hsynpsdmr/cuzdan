import '../../../core/base/state/base_state.dart';
import '../viewmodel/onboard_viewmodel.dart';
import 'package:flutter/cupertino.dart';

class SlideItem extends BaseStateless {
  final OnboardViewModel model;
  final int index;
  const SlideItem(this.index, this.model);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: dynamicWidth(context, 35),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Column(
              children: [
                Image.asset('assets/icons/cuzdanicon.png', height: dynamicHeight(context, 70)),
                SizedBox(height: dynamicHeight(context, 50)),
                Text(
                  model.onboardModelList![index].header,
                  style: TextStyle(fontSize: 44.0, fontFamily: 'Gilroy'),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Expanded(
            child: Text(
              model.onboardModelList![index].title + 'Lorem ipsum dolor sit amet, consec adipiscing elit. Accumsan in lorem. Accumsan in lorem.',
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18.0, fontFamily: 'Gilroy'),
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(height: bottomPadding(context)),
        ],
      ),
    );
  }
}

//! Servisten gelen url olmadığı için commentli olarak bıraktım
 // Container(
        //   height: 300,
        //   child: Padding(
        //     padding:
        //         EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.14),
        //     child: Container(
        //       height: MediaQuery.of(context).size.width,
        //       width: MediaQuery.of(context).size.height,
        //       decoration: BoxDecoration(
        //         image: DecorationImage(
        //           fit: BoxFit.fill,
        //           image: AssetImage(
        //             model.onboardModelList![index].imageUrl,
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),