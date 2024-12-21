import 'package:carbon_credit_trading/models/project.dart';
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

  @override
  void initState() {
    super.initState();
    _projectsFuture = getAllProjects();
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

  Widget buildLegend(Map<String, double> data, List<Color> colors) {
    List<Widget> legends = [];
    int i = 0;
    data.forEach((String key, double value) {
      legends.add(Row(
        children: [
          Container(
            width: 16,
            height: 16,
            color: colors[i],
          ),
          SizedBox(width: 8),
          Text('$key (${value.toStringAsFixed(1)}%)'),
        ],
      ));
      i++;
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: legends,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biểu đồ Flutter'),
      ),
      body: FutureBuilder<List<Project>>(
        future: _projectsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Lỗi: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            Map<String, double> projectPercentages =
                _calculateProjectPercentages(snapshot.data!);

            return SingleChildScrollView(
              child: Column(
                children: [
                  Text('Giao dịch'),
                  SizedBox(
                    height: 200,
                    child: PieChart(
                      PieChartData(
                        sections: [
                          PieChartSectionData(
                            value: 40,
                            title: 'Bị hủy',
                            color: Colors.red,
                          ),
                          PieChartSectionData(
                              value: 30,
                              title: 'Thành công',
                              color: Colors.green),
                          PieChartSectionData(
                              value: 30,
                              title: 'Đang duyệt',
                              color: Colors.yellow),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 32.0),
                  Text('Dự án'),
                  buildLegend(
                      {'Bị hủy': 40, 'Thành công': 30, 'Đang duyệt': 30},
                      [Colors.red, Colors.green, Colors.yellow]),
                  SizedBox(height: 32.0),
                  Text('Dự án'),
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
                  buildLegend(projectPercentages,
                      [Colors.red, Colors.green, Colors.yellow]),
                  SizedBox(height: 32.0),
                  Text('Tổng doanh thu theo tháng'),
                  SizedBox(
                    height: 300,
                    child: LineChart(
                      LineChartData(
                        lineBarsData: [
                          LineChartBarData(
                            spots: [
                              FlSpot(0, 1),
                              FlSpot(1, 1.5),
                              FlSpot(2, 1.4),
                              FlSpot(3, 3.4),
                              FlSpot(4, 2),
                              FlSpot(5, 2.2),
                              FlSpot(6, 1.8),
                              FlSpot(7, 2.8),
                              FlSpot(8, 2.5),
                              FlSpot(9, 3.5),
                            ],
                            isCurved: true,
                            gradient: LinearGradient(
                              colors: [Colors.blue, Colors.lightBlueAccent],
                            ),
                            barWidth: 4,
                            isStrokeCapRound: true,
                            belowBarData: BarAreaData(
                              show: true,
                              gradient: LinearGradient(
                                colors: [
                                  Colors.blue.withOpacity(0.5),
                                  Colors.lightBlueAccent.withOpacity(0.5),
                                ],
                              ),
                            ),
                            dotData: FlDotData(show: false),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(child: Text('Không có dữ liệu'));
          }
        },
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: ChartStatisticPage()));
