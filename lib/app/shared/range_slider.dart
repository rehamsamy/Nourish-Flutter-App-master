import 'package:flutter/material.dart';

typedef OnApplyButtonClick<T> = Function(RangeValues? selectedValues);

class RangeSliderPicker extends StatefulWidget {
  final RangeValues? selectedRangeValues;
  final int minValue;
  final int maxValue;
  final int divisions;

  const RangeSliderPicker({
    Key? key,
    this.selectedRangeValues,
    this.divisions = 1,
    this.maxValue = 40,
    this.minValue = 0,
  }) : super(key: key);

  @override
  _RangeSliderPickerState createState() => _RangeSliderPickerState();
}

class _RangeSliderPickerState extends State<RangeSliderPicker> {
  late RangeValues _selectedRangeValues;

  @override
  void initState() {
    super.initState();
    _selectedRangeValues = widget.selectedRangeValues ??
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
                    values: _selectedRangeValues,
                    divisions: widget.maxValue,
                    labels: RangeLabels(
                      _selectedRangeValues.start.round().toString(),
                      _selectedRangeValues.end.round().toString(),
                    ),
                    onChanged: (RangeValues values) {
                      setState(() {
                        _selectedRangeValues = values;
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
