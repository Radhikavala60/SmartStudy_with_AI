import 'package:flutter/material.dart';
import '../database/db_helper.dart';
import '../model/study_model.dart';
import '../ai/ai_logic.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final subjectCtrl = TextEditingController();
  final hoursCtrl = TextEditingController();
  String priority = "High";
  String suggestion = "";

  DBHelper dbHelper = DBHelper();

  List<Map<String, dynamic>> studyList = [];

  loadData() async {
    studyList = await dbHelper.getStudyList();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Smart Study with AI")),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: subjectCtrl,
              decoration: const InputDecoration(labelText: "Subject"),
            ),
            TextField(
              controller: hoursCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Study Hours"),
            ),
            DropdownButton<String>(
              value: priority,
              items: ["High", "Medium", "Low"]
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
              onChanged: (val) {
                setState(() {
                  priority = val!;
                });
              },
            ),
            ElevatedButton(
              onPressed: () async {
                StudyModel model = StudyModel(
                  subject: subjectCtrl.text,
                  hours: int.parse(hoursCtrl.text),
                  priority: priority,
                );
                await dbHelper.insertStudy(model);
                suggestion =
                    getAISuggestion(priority, int.parse(hoursCtrl.text));
                subjectCtrl.clear();
                hoursCtrl.clear();
                loadData();
              },
              child: const Text("Save & Get AI Suggestion"),
            ),
            const SizedBox(height: 10),
            Text(
              suggestion,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: studyList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(studyList[index]['subject']),
                    subtitle: Text(
                        "Hours: ${studyList[index]['hours']} | Priority: ${studyList[index]['priority']}"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
