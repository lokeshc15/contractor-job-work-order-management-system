import 'package:flutter/material.dart';

class InvoiceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        title: const Text("Invoice"),
        backgroundColor: const Color(0xFF4B6CB7),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Invoice Details",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            _infoRow("Job", "Electrician Work"),
            _infoRow("Contractor", "Ramesh"),
            _infoRow("Invoice ID", "#INV-1023"),
            _infoRow("Status", "GENERATED"),

            const SizedBox(height: 20),

            Container(
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
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Amount",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "₹ 4,500",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Description",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Complete office wiring maintenance work.",
                  ),
                ],
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xFF4B6CB7),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(
                    const SnackBar(
                      content:
                          Text("Invoice marked as PAID"),
                    ),
                  );
                },
                child: const Text("Mark as Paid"),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Expanded(
              child: Text(title,
                  style: const TextStyle(
                      color: Colors.black54))),
          Text(
            value,
            style:
                const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
