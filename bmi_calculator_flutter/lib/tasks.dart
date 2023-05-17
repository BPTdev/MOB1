void performTasks() async {
  task1();
  String task2Result = await task2();
  task3(task2Result);
}

void task1() {
  print('Task 1 completed');
}

Future<String> task2() async {
  Duration treeSeconds = const Duration(seconds: 3);
  String result = '';

  await Future.delayed(treeSeconds, () {
    result = 'task 2 data';
    print('Task 2 completed');
  });

  return result;
}

void task3(String task2Data) {
  print('Task 3 complete with $task2Data');
}
