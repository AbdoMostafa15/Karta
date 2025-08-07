import 'package:flutter/material.dart';
import 'package:karta/reciept.dart';
// import 'home.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () async {
      if (!mounted) return;

      final result = await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (context) {
          return DraggableScrollableSheet(
            initialChildSize: 0.33,
            minChildSize: 0.2,
            maxChildSize: 0.5,
            expand: false,
            builder: (context, scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: Center(
                  child: SizedBox(
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: const [
                          Icon(
                            Icons.check_circle_outline,
                            color: Color(0xff6a5acd),
                            size: 80,
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Your Payment Has Been Processed',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 25),
                          ),
                          SizedBox(height: 300),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      );

      // If the sheet was dismissed, navigate
      if (result == null && mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Reciept()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 70,
        title: const Text("Wallet Payment"),
      ),
      // backgroundColor: Colors.white,
      body: Column(
        children: const [
          SizedBox(height: 50),
          Image(image: AssetImage("images/wallet.png")),
          SizedBox(height: 10),
          Text("Confirm The Payment Request"),
          Text("With Your Wallet"),
          Text("We Sent A Request To Your Wallet Provider"),
          Text("You Will Find It In Your Wallet Application"),
          SizedBox(height: 50),
          Icon(Icons.published_with_changes_outlined, size: 80),
          Text("Awaiting Payment Confirmation"),
        ],
      ),
    );
  }
}

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Success")),
      body: const Center(child: Text("Payment Successful!")),
    );
  }
}
