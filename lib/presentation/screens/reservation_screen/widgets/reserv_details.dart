import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';

class ReservDetails extends StatefulWidget {
  final void Function(DateTime) onDateSelected;
  final void Function(TimeOfDay) onTimeSelected;

  const ReservDetails({
    super.key,
    required this.onDateSelected,
    required this.onTimeSelected,
  });

  @override
  _ReservDetailsState createState() => _ReservDetailsState();
}

class _ReservDetailsState extends State<ReservDetails> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });

      // ✅ Notify parent (ReservationCubit)
      widget.onDateSelected(pickedDate);
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });

      // ✅ Notify parent (ReservationCubit)
      widget.onTimeSelected(pickedTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Tarix",
            style: TextStyle(fontSize: 17, color: AppColors.lightGray),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => _selectDate(context),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primaryYellow),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      selectedDate != null
                          ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
                          : 'Tarix seçin',
                      style: const TextStyle(fontSize: 17, color: AppColors.primaryYellow),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            "Saat",
            style: TextStyle(fontSize: 17, color: AppColors.lightGray),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => _selectTime(context),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primaryYellow),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      selectedTime != null
                          ? '${selectedTime!.hour.toString().padLeft(2, '0')}:${selectedTime!.minute.toString().padLeft(2, '0')}'
                          : 'Saat seçin',
                      style: const TextStyle(fontSize: 17, color: AppColors.primaryYellow),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
