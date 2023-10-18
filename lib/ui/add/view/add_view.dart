import 'package:cuzdan/core/base/state/base_state.dart';
import 'package:cuzdan/core/base/view/base_view.dart';
import 'package:cuzdan/core/init/theme/color_scheme_dark.dart';
import 'package:cuzdan/ui/add/viewmodel/add_view_model.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class AddView extends StatefulWidget {
  @override
  State<AddView> createState() => _AddViewState();
}

class _AddViewState extends BaseState<AddView> {
  OutlineInputBorder border = OutlineInputBorder(borderSide: BorderSide(color: ColorSchemeDark.instance!.blue, width: 1.0), borderRadius: BorderRadius.circular(7.0));
  TextStyle style = TextStyle(fontSize: 16, fontWeight: FontWeight.w400, fontFamily: 'Gilroy');

  Map<String, dynamic> gelir = {'A': Icons.abc, 'B': Icons.abc, 'C': Icons.abc, 'D': Icons.abc, 'E': Icons.abc, 'F': Icons.abc, 'G': Icons.abc, 'H': Icons.abc, 'I': Icons.abc};
  Map<String, dynamic> gider = {'1': Icons.add, '2': Icons.add, '3': Icons.add, '4': Icons.add, '5': Icons.add, '6': Icons.add, '7': Icons.add, '8': Icons.add, '9': Icons.add};
  int initialIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BaseView<AddViewModel>(
      viewModel: AddViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, AddViewModel value) => Scaffold(
        key: value.scaffoldState,
        backgroundColor: Color(0xff111016),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTextHeader(),
                  buildTextFormFieldName(value),
                  buildTextFormFieldPrice(value),
                  buildTextFormFieldDate(value),
                  buildTextFormFieldSelect(value),
                  buildElevatedButtonDone(value),
                ],
              ),
              Column(
                children: [
                  Expanded(
                    child: DraggableScrollableSheet(
                      maxChildSize: 0.35,
                      minChildSize: 0.1,
                      initialChildSize: 0.1,
                      builder: (BuildContext context, myScrollController) {
                        return SingleChildScrollView(
                          clipBehavior: Clip.none,
                          controller: myScrollController,
                          child: Container(
                            //constraints: BoxConstraints.expand(width: width, height: height),
                            decoration: BoxDecoration(
                              color: Color(0xff141516),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff2B44FF),
                                  offset: Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 5.0,
                                ),
                              ],
                              borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
                            ),
                            //color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 21.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(12.0),
                                    height: dynamicHeight(3),
                                    width: dynamicWidth(26),
                                    color: Color.fromRGBO(255, 255, 255, 0.4),
                                  ),
                                  Text(
                                    'Kategori Seçimi',
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, fontFamily: 'Gilroy'),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: dynamicWidth(29),
                                      top: dynamicHeight(18),
                                      right: dynamicWidth(29),
                                    ),
                                    width: dynamicWidth(332),
                                    height: dynamicHeight(40),
                                    decoration: BoxDecoration(color: Color(0XFF111016), border: Border.all(color: Color(0XFF232527)), borderRadius: BorderRadius.all(Radius.circular(6.0))),
                                    child: ToggleSwitch(
                                      cornerRadius: 6.0,
                                      minWidth: dynamicWidth(164.3),
                                      activeBgColor: [Color(0XFF232527)],
                                      activeFgColor: Colors.white,
                                      inactiveBgColor: Color(0XFF111016),
                                      inactiveFgColor: Color(0XFF666666),
                                      initialLabelIndex: initialIndex,
                                      totalSwitches: 2,
                                      labels: ['gelir', 'gider'],
                                      onToggle: (index) {
                                        setState(() {
                                          initialIndex = index!;
                                          value.ioController?.text = index == 0 ? 'Gelir Bilgisi' : 'Gider Bilgisi';
                                        });
                                      },
                                    ),
                                  ),
                                  getCategory(initialIndex == 0 ? gelir : gider, value),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container getCategory(Map<String, dynamic> list, AddViewModel value) {
    return Container(
      padding: EdgeInsets.only(top: 8.0),
      height: dynamicHeight(height * 0.25),
      child: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () => value.categoryController?.text = list.entries.toList()[index].key,
            child: Padding(
              padding: const EdgeInsets.only(top: 21.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 40.0, right: 20.0),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    padding: EdgeInsets.all(8.0),
                    child: Icon(list.entries.toList()[index].value, color: Color(0xff2B44FF)),
                  ),
                  Text(list.entries.toList()[index].key)
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildTextHeader() {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(left: dynamicWidth(32), top: dynamicHeight(75)),
          width: dynamicWidth(67.15),
          height: dynamicHeight(67.15),
          decoration: BoxDecoration(
            color: Color(0xff2B44FF),
            shape: BoxShape.circle,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: dynamicWidth(44.79), top: dynamicHeight(80)),
          child: Text(
            'cüzdana ekle',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.w500, fontFamily: 'Gilroy'),
          ),
        ),
      ],
    );
  }

  Widget buildTextFormFieldName(AddViewModel viewModel) {
    return Container(
      margin: EdgeInsets.only(left: dynamicWidth(30), top: dynamicHeight(29.85)),
      width: dynamicWidth(330),
      height: dynamicHeight(50),
      child: TextFormField(
        style: style,
        controller: viewModel.nameController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: dynamicWidth(15), top: dynamicHeight(16)),
          focusColor: Colors.white,
          enabledBorder: border,
          focusedBorder: border,
          fillColor: Colors.grey,
          hintText: "Name",
          hintStyle: style,
        ),
      ),
    );
  }

  Widget buildTextFormFieldPrice(AddViewModel viewModel) {
    return Container(
      margin: EdgeInsets.only(left: dynamicWidth(30), top: dynamicHeight(15)),
      width: dynamicWidth(330),
      height: dynamicHeight(50),
      child: TextFormField(
        style: style,
        controller: viewModel.priceController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: dynamicWidth(15), top: dynamicHeight(16)),
          focusColor: Colors.white,
          suffixIcon: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'TL',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xffE16A28)),
              ),
            ],
          ),
          enabledBorder: border,
          focusedBorder: border,
          fillColor: Colors.grey,
          hintText: "Price",
          hintStyle: style,
        ),
      ),
    );
  }

  Widget buildTextFormFieldDate(AddViewModel viewModel) {
    return Container(
      margin: EdgeInsets.only(left: dynamicWidth(30), top: dynamicHeight(15)),
      width: dynamicWidth(330),
      height: dynamicHeight(50),
      child: TextFormField(
        style: style,
        controller: viewModel.dateController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: dynamicWidth(15), top: dynamicHeight(16)),
          focusColor: Colors.white,
          suffixIcon: Icon(
            Icons.date_range,
            color: Color(0xffE16A28),
          ),
          enabledBorder: border,
          focusedBorder: border,
          fillColor: Colors.grey,
          hintText: "Date",
          hintStyle: style,
        ),
      ),
    );
  }

  Widget buildTextFormFieldSelect(AddViewModel viewModel) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: dynamicWidth(30), top: dynamicHeight(15)),
          width: dynamicWidth(150),
          height: dynamicHeight(48),
          child: TextFormField(
            style: style,
            controller: viewModel.ioController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: dynamicWidth(15), top: dynamicHeight(16)),
              focusColor: Colors.white,
              enabledBorder: border,
              focusedBorder: border,
              fillColor: Colors.grey,
              hintText: "IO",
              hintStyle: style,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: dynamicWidth(30), top: dynamicHeight(15)),
          width: dynamicWidth(150),
          height: dynamicHeight(48),
          child: TextFormField(
            style: style,
            controller: viewModel.categoryController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: dynamicWidth(15), top: dynamicHeight(16)),
              focusColor: Colors.white,
              enabledBorder: border,
              focusedBorder: border,
              fillColor: Colors.grey,
              hintText: "Category",
              hintStyle: style,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildElevatedButtonDone(AddViewModel viewModel) {
    return Container(
      margin: EdgeInsets.only(left: dynamicWidth(30), top: dynamicHeight(148)),
      width: dynamicWidth(330),
      height: dynamicHeight(50),
      decoration: BoxDecoration(border: Border.all(color: Color.fromRGBO(43, 68, 255, 0.2)), borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: ElevatedButton(
        style: ButtonStyle(
          side: MaterialStateProperty.all(BorderSide(width: 1.0, color: Color(0xff2B44FF))),
          textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
          backgroundColor: MaterialStateProperty.all(Color.fromRGBO(43, 68, 255, 0.2)),
          alignment: Alignment.center,
        ),
        child: Text(
          'onayla',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, fontFamily: 'Gilroy'),
          textAlign: TextAlign.center,
        ),
        onPressed: () {
          //TODO
        },
      ),
    );
  }
}
