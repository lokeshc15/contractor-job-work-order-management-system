import 'package:flutter/material.dart';
import '../utils/logout_helper.dart';

class ContractorDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        title: const Text("Contractor Dashboard"),
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
              "Available Jobs",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            Expanded(
              child: ListView(
                children: [
                  _jobCard(
                    "Electrician Work",
                    "Office wiring maintenance",
                    "OPEN",
                  ),
                  _jobCard(
                    "Plumbing Job",
                    "Apartment water leakage fix",
                    "OPEN",
                  ),
                  _jobCard(
                    "AC Service",
                    "Annual maintenance service",
                    "APPLIED",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _jobCard(String title, String desc, String status) {
    Color statusColor =
        status == "OPEN" ? Colors.green : Colors.orange;

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            desc,
            style: const TextStyle(color: Colors.black54),
          ),
          const SizedBox(height: 12),

          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: TextStyle(color: statusColor),
                ),
              ),
              const Spacer(),
              if (status == "OPEN")
                ElevatedButton(
                  onPressed: () {
                    // apply job logic later
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFF4B6CB7),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text("Apply"),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
