import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('City Arena'),
        actions: [IconButton(icon: Icon(Icons.notifications), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildOccupancyCard(),
            _buildVenueBookingTable(),
            _buildPieChart(),
            _buildVenueRatingsTable(),
            _buildDownloadButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildOccupancyCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Occupancy Rate', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('85% (56/67)', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.blue)),
            SizedBox(height: 8),
            Text('▲ 17.5%', style: TextStyle(color: Colors.green)),
          ],
        ),
      ),
    );
  }

  Widget _buildVenueBookingTable() {
    return Card(
      elevation: 4,
      margin: EdgeInsets.only(top: 16.0),
      child: Column(
        children: [
          ListTile(title: Text('Venue Booking Performance', style: TextStyle(fontWeight: FontWeight.bold))),
          DataTable(columns: [
            DataColumn(label: Text('Venue Name')),
            DataColumn(label: Text('Booking %')),
            DataColumn(label: Text('Rating')),
          ], rows: [
            _buildDataRow('City Arena', '35%', '★ 4.8'),
            _buildDataRow('Sports Club', '30%', '★ 4.3'),
            _buildDataRow('Sports Arena', '27%', '★ 4.6'),
            _buildDataRow('Arena Club', '8%', '★ 4.6'),
          ]),
        ],
      ),
    );
  }

  DataRow _buildDataRow(String venue, String booking, String rating) {
    return DataRow(cells: [
      DataCell(Text(venue)),
      DataCell(Text(booking)),
      DataCell(Text(rating)),
    ]);
  }

  Widget _buildPieChart() {
    return Card(
      elevation: 4,
      margin: EdgeInsets.only(top: 16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Most Preferred Sport', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            SizedBox(
              height: 200,
              child: PieChart(
                PieChartData(
                  sections: [
                    _buildPieChartSection(27, Colors.blue, 'Football'),
                    _buildPieChartSection(27, Colors.green, 'Volleyball'),
                    _buildPieChartSection(8, Colors.orange, 'Basketball'),
                    _buildPieChartSection(20, Colors.red, 'Cricket'),
                    _buildPieChartSection(18, Colors.purple, 'Golf'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  PieChartSectionData _buildPieChartSection(double value, Color color, String title) {
    return PieChartSectionData(
      value: value,
      color: color,
      radius: 50,
      title: title,
      titleStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }

  Widget _buildVenueRatingsTable() {
    return Card(
      elevation: 4,
      margin: EdgeInsets.only(top: 16.0),
      child: Column(
        children: [
          ListTile(title: Text('Venue Ratings', style: TextStyle(fontWeight: FontWeight.bold))),
          DataTable(columns: [
            DataColumn(label: Text('Venue Name')),
            DataColumn(label: Text('Rating')),
            DataColumn(label: Text('Total Reviews')),
          ], rows: [
            _buildDataRow('City Arena', '★ 4.8', '35'),
            _buildDataRow('Sports Club', '★ 4.3', '30'),
            _buildDataRow('Sports Arena', '★ 4.6', '27'),
            _buildDataRow('Arena Club', '★ 4.6', '8'),
          ]),
        ],
      ),
    );
  }

  Widget _buildDownloadButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.file_download),
          label: Text('CSV format'),
        ),
        SizedBox(width: 16),
        ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.picture_as_pdf),
          label: Text('PDF format'),
        ),
      ],
    );
  }
}
