import 'package:flutter/material.dart';
import 'package:get/get.dart';

typedef OnApplyButtonClick<T> = Function(RangeValues? selectedValues);

class RangeSliderPicker extends StatefulWidget {
  final RangeValues? selectedRangeValues;
  final int minValue;
  final int maxValue;
  final int divisions;

  const RangeSliderPicker({
    Key? key,
    this.selectedRangeValues,
    this.divisions = 2,
    this.maxValue = 2000,
    this.minValue = 0,
  }) : super(key: key);

  @override
  RangeSliderPickerState createState() => RangeSliderPickerState();



}

class RangeSliderPickerState extends State<RangeSliderPicker> {
  static RangeValues ? selectedRangeValues;



  @override
  void initState() {
    super.initState();
    selectedRangeValues = widget.selectedRangeValues ??
        RangeValues(widget.minValue.toDouble(), widget.maxValue.toDouble());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      top: 25, right: 5, bottom: 5, left: 5),
                  child: RangeSlider(
                    min: widget.minValue.toDouble(),
                    max: widget.maxValue.toDouble(),
                    values: selectedRangeValues as RangeValues,
                    divisions: widget.maxValue,
                    labels: RangeLabels(
                      (selectedRangeValues?.start.round()).toString(),
                        (selectedRangeValues?.end.round()).toString(),
                    ),
                    onChanged: (RangeValues values) {
                      setState(() {
                        selectedRangeValues = values;
                        Get.log('range =====>'+values.start.toString());
                      });
                    },
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
