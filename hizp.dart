import 'dart:io';
import 'dart:convert';

void main(List<String> args) async {
  print('This script will take page number from user and then use it to write insert query for hizp table');
  var file = File('juz.txt');
  String line = '';

  while (true) {
    print('Please insert page number');
    line = stdin.readLineSync(encoding: utf8)!;

    if (line.contains('b')) {
      break;
    }

    await file.writeAsString(insertQuery(line.trim()), mode: FileMode.append);
  }
}

int quarter = -1;
int hizp = 1;
int juz = 1;

String insertQuery(page) {
  return "insert into hizp (quarter, hizp, juz, page) values (${calculateQuarter()}, $hizp, $juz, $page);\n";
}

int calculateQuarter() {
  quarter++;

  if (quarter > 3) {
    quarter = 0;
    hizp++;

    if (hizp % 2 != 0) {
      juz++;
    }
  }

  return quarter;
}