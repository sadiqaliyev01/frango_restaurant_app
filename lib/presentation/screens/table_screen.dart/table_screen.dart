import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/utils/helpers/pager.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:frango_restaurant_app/data/models/local/table_model.dart';

class TableScreen extends StatelessWidget {
  TableScreen({super.key});

  final List<TableModel> tables = [
    TableModel(
      tableNo: 'Masa 1',
      floor: 1,
      capacity: 2,
      cigarette: false,
      windowView: true,
    ),
    TableModel(
      tableNo: 'Masa 2',
      floor: 1,
      capacity: 4,
      cigarette: true,
      windowView: false,
    ),
    TableModel(
      tableNo: 'Masa 3',
      floor: 2,
      capacity: 6,
      cigarette: false,
      windowView: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlack,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon:
              const Icon(Icons.arrow_back_ios, color: AppColors.primaryYellow),
        ),
        titleSpacing: 105,
        title: const Text(
          'Masalar',
          style: TextStyle(color: AppColors.lightGray),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: tables.length,
        itemBuilder: (context, index) {
          final table = tables[index];
          return Card(
            color: AppColors.primaryYellow,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            child: Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent,
                iconTheme: const IconThemeData(color: Colors.black),
              ),
              child: ExpansionTile(
                title: Text(
                  table.tableNo,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                childrenPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                children: [
                  _buildDetailRow('Mərtəbə', table.floor.toString()),
                  _buildDetailRow('Tutum', '${table.capacity} nəfərlik'),
                  _buildDetailRow(
                      'Siqaret icazəsi', table.cigarette ? 'Bəli' : 'Xeyr'),
                  _buildDetailRow(
                      'Pəncərə kənarı', table.windowView ? 'Var' : 'Yoxdur'),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryBlack,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => Pager.reservation(),
                          ),
                        );
                      },
                      child: const Text(
                        'Rezerv et',
                        style: TextStyle(
                          color: AppColors.primaryYellow,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.primaryBlack,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: AppColors.primaryBlack,
            ),
          ),
        ],
      ),
    );
  }
}
