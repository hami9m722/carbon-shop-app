import 'package:carbon_credit_trading/api/api.dart';
import 'package:carbon_credit_trading/models/project.dart';
import 'package:carbon_credit_trading/models/transaction.dart';
import 'package:carbon_credit_trading/services/service.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:carbon_credit_trading/extensions/dto.dart';

class ChartStatisticPage extends StatefulWidget {
  const ChartStatisticPage({super.key});

  @override
  createState() => _ChartStatisticPageState();
}

class _ChartStatisticPageState extends State<ChartStatisticPage> {
  late Future<List<Project>> _projectsFuture;
  late Future<List<Project>> _transactionsFuture;
  // late Future<List<dynamic>> _dataFuture;

  @override
  void initState() {
    super.initState();
    // _fetchData();
  }

  Future<List<Project>> getAllProjects() async {
    try {
      final pagedProjectDTO = await sellerControllerApi.viewAllProject1();

      if (pagedProjectDTO != null) {
        return await Future.wait(pagedProjectDTO.content.map((projectData) {
          return projectData.toProject();
        }));
      } else {
        return [];
      }
    } catch (e) {
      print("Error fetching projects: $e");
      return [];
    }
  }

  Future<List<Transaction>> getAllTransactions() async {
    try {
      final pagedTransactionDTO = await sellerControllerApi.viewAllOrders();

      if (pagedTransactionDTO != null) {
        return pagedTransactionDTO.toTransactions();
      } else {
        return [];
      }
    } catch (e) {
      print("Error fetching projects: $e");
      return [];
    }
  }

  Map<String, double> _calculateProjectPercentages(List<Project> projects) {
    print("Error fetching projects: ${projects.length}");
    int canceled = projects.where((p) => p.status == 'REJECTED').length;
    int successful = projects.where((p) => p.status == 'APPROVED').length;
    int pending = projects.where((p) => p.status == 'INIT').length;

    int total = canceled + successful + pending;

    return {
      'Bị hủy': (canceled / total) * 100,
      'Thành công': (successful / total) * 100,
      'Đang duyệt': (pending / total) * 100,
    };
  }

  Map<String, double> _calculateTransactionPercentages(
      List<Transaction> transaction) {
    print("Error fetching projects: $transaction.length}");
    int canceled = transaction.where((p) => p.status == 'CANCELLED').length;
    int successful = transaction.where((p) => p.status == 'DONE').length;
    int pending = transaction.where((p) => p.status == 'INIT').length;

    int total = canceled + successful + pending;

    return {
      'Bị hủy': (canceled / total) * 100,
      'Thành công': (successful / total) * 100,
      'Đang duyệt': (pending / total) * 100,
    };
  }

  Future<int> getRevenue() async {
    final pagedOrderDTO =
        await sellerControllerApi.viewAllOrders(status: "DONE");

    if (pagedOrderDTO != null) {
      final transactions = await pagedOrderDTO.toTransactions();
      final totalRevenue = transactions
          .map((transaction) =>
              transaction.rootDto.creditAmount! *
              int.parse(transaction.rootDto.price ?? '0'))
          .reduce((a, b) => a + b);
      return totalRevenue;
    }
    return 0;
  }

  Widget buildLegend(Map<String, double> data, List<Color> colors) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: data.entries.map((entry) {
          final index = data.keys.toList().indexOf(entry.key);
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 16,
                height: 16,
                color: colors[index],
              ),
              const SizedBox(width: 8),
              Text('${entry.key} (${entry.value.toStringAsFixed(1)}%)'),
            ],
          );
        }).toList(),
      ),
    );
  }

  // void _fetchData() {
  //   void _fetchData() {
  //     setState(() {
  //       _dataFuture = Future.wait([getAllProjects(), getAllTransactions()]);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biểu đồ Flutter'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future:
            Future.wait([getAllProjects(), getAllTransactions(), getRevenue()]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Lỗi: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            Map<String, double> projectPercentages =
                _calculateProjectPercentages(snapshot.data![0]);
            Map<String, double> transactionPercentages =
                _calculateTransactionPercentages(snapshot.data![1]);
            int venue = snapshot.data![2];

            return SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    'Giao dịch',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 200,
                    child: PieChart(
                      PieChartData(
                        sections: [
                          PieChartSectionData(
                              value: transactionPercentages['Bị hủy']!,
                              title:
                                  '${transactionPercentages['Bị hủy']!.toStringAsFixed(1)}%',
                              color: Colors.red),
                          PieChartSectionData(
                              value: transactionPercentages['Thành công']!,
                              title:
                                  '${transactionPercentages['Thành công']!.toStringAsFixed(1)}%',
                              color: Colors.green),
                          PieChartSectionData(
                              value: transactionPercentages['Đang duyệt']!,
                              title:
                                  '${transactionPercentages['Đang duyệt']!.toStringAsFixed(1)}%',
                              color: Colors.yellow),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  buildLegend(transactionPercentages,
                      [Colors.red, Colors.green, Colors.yellow]),
                  const SizedBox(height: 32.0),
                  const Text('Dự án',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 200,
                    child: PieChart(
                      PieChartData(
                        sections: [
                          PieChartSectionData(
                              value: projectPercentages['Bị hủy']!,
                              title:
                                  '${projectPercentages['Bị hủy']!.toStringAsFixed(1)}%',
                              color: Colors.red),
                          PieChartSectionData(
                              value: projectPercentages['Thành công']!,
                              title:
                                  '${projectPercentages['Thành công']!.toStringAsFixed(1)}%',
                              color: Colors.green),
                          PieChartSectionData(
                              value: projectPercentages['Đang duyệt']!,
                              title:
                                  '${projectPercentages['Đang duyệt']!.toStringAsFixed(1)}%',
                              color: Colors.yellow),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  buildLegend(projectPercentages,
                      [Colors.red, Colors.green, Colors.yellow]),
                  const SizedBox(height: 32.0),
                  const Text(
                    'Tổng doanh thu theo tháng',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 300,
                    child: BarChart(
                      BarChartData(
                        borderData: FlBorderData(show: false),
                        titlesData: FlTitlesData(show: true),
                        barGroups: [
                          BarChartGroupData(
                            x: 6,
                            barRods: [
                              BarChartRodData(
                                toY: 0,
                                color: Colors.blue,
                                width: 16,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 7,
                            barRods: [
                              BarChartRodData(
                                toY: 0,
                                color: Colors.blue,
                                width: 16,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 8,
                            barRods: [
                              BarChartRodData(
                                toY: 0,
                                color: Colors.blue,
                                width: 16,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 9,
                            barRods: [
                              BarChartRodData(
                                toY: 0,
                                color: Colors.blue,
                                width: 16,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 10,
                            barRods: [
                              BarChartRodData(
                                toY: 0,
                                color: Colors.blue,
                                width: 16,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 11,
                            barRods: [
                              BarChartRodData(
                                toY: 0,
                                color: Colors.blue,
                                width: 16,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 0,
                            barRods: [
                              BarChartRodData(
                                toY: venue.toDouble(),
                                color: Colors.blue,
                                width: 16,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text('Không có dữ liệu'));
          }
        },
      ),
    );
  }
}
