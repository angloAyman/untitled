import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

List<GridColumn> getColumns() {
  List<GridColumn> columns;
  columns = ([
    GridColumn(
      columnName: 'id',
      width: 70,
      label: Container(
        padding: EdgeInsets.all(1),
        alignment: Alignment.centerRight,
        child: Text(
          'كود',
          overflow: TextOverflow.ellipsis,
          softWrap: true,

        ),
      ),
    ),
    GridColumn(
      columnName: 'CitizensName',
      width: 140,
      label: Container(
        padding: EdgeInsets.all(8),
        alignment: Alignment.centerRight,
        child: Text(
          'اسم المواطن',
          overflow: TextOverflow.clip,
          softWrap: true,
        ),
      ),
    ),
    GridColumn(
      columnName: 'PhoneNumber',
      width: 120,
      label: Container(
        padding: EdgeInsets.fromLTRB(0.1,0,0,0),
        alignment: Alignment.center,
        child: Text(
          '     رقم الهاتف',
          // overflow: TextOverflow.fade,
          // softWrap: true,
        ),
      ),
    ),
    GridColumn(
      columnName: 'PassportNumber',
      width: 150,
      label: Container(
        padding: EdgeInsets.fromLTRB(20,0,0,0),
        alignment: Alignment.centerRight,
        child: Text(
          'رقم الجواز',
          // overflow: TextOverflow.fade,
          // softWrap: true,
        ),
      ),
    ),
    GridColumn(
      columnName: 'Nationality',
      width: 90,
      label: Container(
        padding: EdgeInsets.all(1),
        alignment: Alignment.centerRight,
        child: Text('الجنسية'),
      ),
    ),
    GridColumn(
      columnName: 'genre',
      width: 90,
      label: Container(
        padding: EdgeInsets.all(0),
        alignment: Alignment.centerRight,
        child: Text(
          'النوع',
          overflow: TextOverflow.clip,
          softWrap: true,
        ),
      ),
    ),
    GridColumn(
      columnName: 'Age',
      width: 95,
      label: Container(
        padding: EdgeInsets.all(0),
        alignment: Alignment.centerRight,
        child: Text(
          'السن ',
          overflow: TextOverflow.visible,
          softWrap: true,
        ),
      ),
    ),
    GridColumn(
      columnName: 'education',
      width: 95,
      label: Container(
        padding: EdgeInsets.all(0),
        alignment: Alignment.centerRight,
        child: Text(
          'التعليم',
          overflow: TextOverflow.clip,
          softWrap: true,
        ),
      ),
    ),
    GridColumn(
      columnName: 'MaritalStatus  ',
      width: 120,
      label: Container(
        padding: EdgeInsets.fromLTRB(20,0,0,0),
        alignment: Alignment.centerRight,
        child: Text(
          'الحالة الاجتماعية',
          overflow: TextOverflow.visible,
          softWrap: true,
        ),
      ),
    ),
    GridColumn(
      columnName: 'MaritalStatus  ',
      width: 120,
      label: Container(
        padding: EdgeInsets.fromLTRB(20,0,0,0),
        alignment: Alignment.centerRight,
        child: Text(
          'الحالة الاجتماعية',
          overflow: TextOverflow.visible,
          softWrap: true,
        ),
      ),
    ),
    GridColumn(
      columnName: 'notes',
      width: 100,
      label: Container(
        padding: EdgeInsets.all(0),
        alignment: Alignment.centerRight,
        child: Text('ملاحظات'),
      ),
    )
  ]);
  return columns;
}