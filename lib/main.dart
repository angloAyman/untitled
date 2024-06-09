// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled/models/GridColumn.dart';
import 'package:untitled/models/user.dart';
import 'package:untitled/providers/user_provider.dart';
import 'package:untitled/screens/add_user_screen.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
// import 'package:syncfusion_flutter_datagrid_export/export.dart';
// import 'package:syncfusion_flutter_xlsio/xlsio.dart' hide Column, Row;
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';

// Local import
import '../helper/save_file_mobile.dart'
if (dart.library.html) '../helper/save_file_web.dart' as helper;


void main() {


runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,

       ],
      supportedLocales: [
     // const Locale('en', ''),
        const Locale('ar',''),// English
      // Add other locales as needed
    ],

      debugShowCheckedModeBanner: false,
      title: 'بيانات المواطنين السودانين',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserTableScreen(),
    );
  }
}

class UserDataSource extends DataGridSource {


  List<DataGridRow> _users = [];

  UserDataSource({required List<User> users}) {

    _users = users
        .map<DataGridRow>((user) => DataGridRow(cells: [
      DataGridCell<int>(columnName: 'id', value: user.id),
      DataGridCell<String>(columnName: 'name', value: user.CitizensName),
      DataGridCell<String>(columnName: 'email', value: user.PhoneNumber),
      DataGridCell<String>(columnName: 'PassportNumber', value: user.PassportNumber),
      DataGridCell<String>(columnName: 'Nationality', value: user.Nationality),
      DataGridCell<String>(columnName: 'genre', value: user.genre),
      DataGridCell<String>(columnName: 'Age', value: user.Age),
      DataGridCell<String>(columnName: 'education', value: user.education),
      DataGridCell<String>(columnName: 'MaritalStatus', value: user.MaritalStatus),
      DataGridCell<String>(columnName: 'address', value: user.address),
      DataGridCell<String>(columnName: 'notes', value: user.notes),

    ]))
        .toList();
  }

  @override
  List<DataGridRow> get rows => _users;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: [
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.0),
        child: Text(row.getCells()[0].value.toString()),
      ),
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.0),
        child: Text(row.getCells()[1].value.toString()),
      ),
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.0),
        child: Text(row.getCells()[2].value.toString()),
      ),
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.0),
        child: Text(row.getCells()[2].value.toString()),
      ),
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.0),
        child: Text(row.getCells()[2].value.toString()),
      ),
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.0),
        child: Text(row.getCells()[2].value.toString()),
      ),
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.0),
        child: Text(row.getCells()[2].value.toString()),
      ),
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.0),
        child: Text(row.getCells()[2].value.toString()),
      ),
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.0),
        child: Text(row.getCells()[2].value.toString()),
      ),
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.0),
        child: Text(row.getCells()[2].value.toString()),
      ),
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.0),
        child: Text(row.getCells()[2].value.toString()),
      ),

    ]);
  }
}


class UserTableScreen extends ConsumerStatefulWidget {
  @override
  _UserTableScreenState createState() => _UserTableScreenState();
}

class _UserTableScreenState extends ConsumerState<UserTableScreen> {
  late UserDataSource _userDataSource ;
  List<User> _users = [];
  List<User> _filteredUsers = [];
  String _filterQuery = '';
  DataGridController _dataGridController = DataGridController();
  GlobalKey<SfDataGridState> _key = GlobalKey<SfDataGridState>();


  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    final userList = await ref.read(userListProvider.future);
    setState(() {
      _users = userList;
      _filteredUsers = userList ;
      _userDataSource = UserDataSource(users: _filteredUsers);
    });
  }

  // Future<void> _exportDataGridToExcel() async {
  //   final Workbook workbook = _key.currentState!.exportToExcelWorkbook(rows: _dataGridController.selectedRows,);
  //
  //   final List<int> bytes = workbook.saveAsStream();
  //   workbook.dispose();
  //
  //   await helper.saveAndLaunchFile(bytes, 'DataGrid.xlsx');
  // }
  //
  // Future<void> _exportSelectedDataGridToExcel() async {
  //   final Workbook workbook = _key.currentState!.exportToExcelWorkbook(rows: _dataGridController.selectedRows,);
  //
  //   final List<int> bytes = workbook.saveAsStream();
  //   workbook.dispose();
  //
  //   await helper.saveAndLaunchFile(bytes, 'DataGrid.xlsx');
  // }


  void _filterUsers(String query) {
    setState(() {
      _filterQuery = query;
      _filteredUsers = _users.where((user) {
        return user.CitizensName!.toLowerCase().contains(query.toLowerCase()) ||
            user.PassportNumber!.toLowerCase().contains(query.toLowerCase());
      }).toList();
      _userDataSource = UserDataSource(users: _filteredUsers);
    });
  }

  // Future<void> _exportData() async {
  //   final workbook = xlsio.Workbook();
  //   final sheet = workbook.worksheets[0];
  //
  //   // Adding headers
  //   sheet.getRangeByName('A1').setText('ID');
  //   sheet.getRangeByName('B1').setText('Name');
  //   sheet.getRangeByName('C1').setText('Email');
  //
  //   // Adding data
  //   for (int i = 0; i < _filteredUsers.length; i++) {
  //     final user = _filteredUsers[i];
  //     sheet.getRangeByName('A${i + 2}').setNumber(user.id.toDouble());
  //     sheet.getRangeByName('B${i + 2}').setText(user.name);
  //     sheet.getRangeByName('C${i + 2}').setText(user.email);
  //   }
  //
  //   final List<int> bytes = workbook.saveAsStream();
  //   workbook.dispose();
  //
  //   final directory = await getApplicationDocumentsDirectory();
  //   final path = '${directory.path}/Users.xlsx';
  //   final file = File(path);
  //   await file.writeAsBytes(bytes, flush: true);
  //
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(content: Text('Exported to $path')),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('بيانات المواطنين السودانين'),
        actions: [
          IconButton(
              icon: Icon(Icons.download),
              onPressed: (){}
            // _exportData,
          ),
        ],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(height: 40.0,width: 20.0,),
//-------------Clear Filter
                MaterialButton(
                    color: Colors.blue,
                    onPressed: () {_userDataSource.clearFilters();},
                    child: const Center(
                        child: Text('Clear Filter',
                          style: TextStyle(color: Colors.white),
                        ))),
                SizedBox(height: 40.0,width: 20.0,),
//-------------CLEAN SelectionMode
                MaterialButton(
                    color: Colors.blue,
                    onPressed: () {this._dataGridController.selectedRow = null;},
                    child: const Center(
                        child: Text(
                          'clean SelectionMode ',
                          style: TextStyle(color: Colors.white),
                        ))),
//--------------export selected excel
                SizedBox(
                  height: 40.0,
                  width: 20.0,),
                MaterialButton(
                    color: Colors.blue,
                    onPressed:(){}
                    //  _exportSelectedDataGridToExcel
                    ,
                    child: const Center(
                        child: Text(
                          'Export SelectedData to Excel',
                          style: TextStyle(color: Colors.white),
                        ))),
//--------------export all to exxcel
                SizedBox(height: 40.0,width: 20.0,),
                MaterialButton(
                    color: Colors.blue,
                    onPressed:(){}
                    //_exportDataGridToExcel
                    ,
                    child: const Center(
                        child: Text(
                          'Export to Excel',
                          style: TextStyle(color: Colors.white),
                        ))),
//--------------add new row
                SizedBox(
                  height: 40.0,
                  width: 20.0,),
                MaterialButton(
                    color: Colors.blue,
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddUserScreen()),
                      );
                    },
                    child: const Center(
                        child: Text(
                          'add Row',
                          style: TextStyle(color: Colors.white),
                        ))),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Filter by name or email',
                border: OutlineInputBorder(),
              ),
              onChanged:
              _filterUsers,
            ),
          ),
          Expanded(
            child: SfDataGrid(
              key: _key,
              columnResizeMode: ColumnResizeMode.onResize,

              // columnWidthMode: ColumnWidthMode.fill,
              columnWidthMode: ColumnWidthMode.auto,
              allowEditing: true,
              allowFiltering: true,
              source: _userDataSource,
              columns: getColumns(),
              controller: _dataGridController,
              selectionMode: SelectionMode.multiple,
              //selectionMode: SelectionMode.single,
              // navigationMode: GridNavigationMode.cell,


              // navigationMode: GridNavigationMode.cell,
            ),




            // child: SfDataGrid(
            //   source: _userDataSource,
            //   columns: [
            //     GridColumn(
            //         columnName: 'id',
            //         label: Container(
            //           padding: EdgeInsets.all(8.0),
            //           alignment: Alignment.center,
            //           child: Text('ID'),
            //         )),
            //     GridColumn(
            //         columnName: 'name',
            //         label: Container(
            //           padding: EdgeInsets.all(8.0),
            //           alignment: Alignment.center,
            //           child: Text('Name'),
            //         )),
            //     GridColumn(
            //         columnName: 'email',
            //         label: Container(
            //           padding: EdgeInsets.all(8.0),
            //           alignment: Alignment.center,
            //           child: Text('Email'),
            //         )),
            //   ],
            // ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddUserScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
