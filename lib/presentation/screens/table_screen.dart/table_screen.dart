import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frango_restaurant_app/utils/helpers/pager.dart';
import 'package:frango_restaurant_app/cubits/table/table_cubit.dart';
import 'package:frango_restaurant_app/presentation/screens/table_screen.dart/widgets/build_detail_row.dart';

class TableScreen extends StatelessWidget {
  const TableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: theme.appBarTheme.iconTheme?.color,
          ),
        ),
        titleSpacing: 105,
        title: Text(
          'Masalar',
          style: theme.appBarTheme.titleTextStyle,
        ),
      ),
      body: BlocBuilder<TableCubit, TableState>(
        builder: (context, state) {
          if (state is TableLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TableSuccess) {
            final tables = state.tables;
            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: tables.length,
              itemBuilder: (_, index) {
                final table = tables[index];
                return Card(
                  color: theme.colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  child: Theme(
                    data: theme.copyWith(
                      dividerColor: Colors.transparent,
                      iconTheme: const IconThemeData(color: Colors.black),
                    ),
                    child: ExpansionTile(
                      title: Text(
                        "${table.no.toString()} nömrəli masa",
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
                        BuildDetailRow(
                          label: 'Mərtəbə',
                          value: table.floor.toString(),
                        ),
                        BuildDetailRow(
                          label: 'Tutum',
                          value: '${table.capacity} nəfərlik',
                        ),
                        BuildDetailRow(
                          label: 'Siqaret icazəsi',
                          value: table.cigarette! ? 'Bəli' : 'Xeyr',
                        ),
                        BuildDetailRow(
                          label: 'Pəncərə kənarı',
                          value: table.windowView! ? 'Var' : 'Yoxdur',
                        ),
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: theme.scaffoldBackgroundColor,
                            ),
                            onPressed: () {
                              final tableCubit = context.read<TableCubit>();
                              tableCubit.selectTable(table);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => Pager.reservation(
                                    context,
                                    table: table,
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              'Rezerv et',
                              style: TextStyle(
                                color: theme.listTileTheme.textColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text(
                "No data to display",
                style: TextStyle(color: theme.listTileTheme.textColor),
              ),
            );
          }
        },
      ),
    );
  }
}
