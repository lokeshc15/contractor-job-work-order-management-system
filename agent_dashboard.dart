import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../utils/logout_helper.dart';
import 'invoice_screen.dart';
import 'view_applications_screen.dart';


class AgentDashboard extends StatelessWidget {
  final TextEditingController titleController =
      TextEditingController();
  final TextEditingController descController =
      TextEditingController();

  void openCreateJobDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Create New Job"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: "Job Title",
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: descController,
              decoration: const InputDecoration(
                labelText: "Job Description",
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () async {
              final success = await ApiService.createJob(
                titleController.text,
                descController.text,
              );

              if (success) {
                titleController.clear();
                descController.clear();
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content:
                        Text("Job created successfully"),
                  ),
                );
              }
            },
            child: const Text("Create"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        title: const Text("Agent Dashboard"),
        backgroundColor: const Color(0xFF4B6CB7),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => logout(context),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Overview",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            Row(
              children: [
                _statCard(
                    "Total Jobs", "Live", Icons.work),
                const SizedBox(width: 16),
                _statCard("Status", "Active",
                    Icons.pending_actions),
              ],
            ),

            const SizedBox(height: 30),
            const Text(
              "Quick Actions",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // CREATE JOB
            GestureDetector(
              onTap: () => openCreateJobDialog(context),
              child: _actionCard(
                  "Create New Job", Icons.add),
            ),

            // VIEW APPLICATIONS (demo)
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ViewApplicationsScreen(),
                  ),
                );
              },
              child: _actionCard("View Applications", Icons.list),
            ),

            // INVOICE (navigation)
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => InvoiceScreen(),
                  ),
                );
              },
              child: _actionCard(
                  "Invoices", Icons.receipt_long),
            ),
          ],
        ),
      ),
    );
  }

  Widget _statCard(
      String title, String value, IconData icon) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, blurRadius: 8),
          ],
        ),
        child: Column(
          children: [
            Icon(icon,
                size: 32,
                color: const Color(0xFF4B6CB7)),
            const SizedBox(height: 10),
            Text(
              value,
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            Text(title),
          ],
        ),
      ),
    );
  }

  Widget _actionCard(String title, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
              color: Colors.black12, blurRadius: 6),
        ],
      ),
      child: Row(
        children: [
          Icon(icon,
              color: const Color(0xFF4B6CB7)),
          const SizedBox(width: 12),
          Text(
            title,
            style:
                const TextStyle(fontSize: 16),
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios,
              size: 16),
        ],
      ),
    );
  }
}
