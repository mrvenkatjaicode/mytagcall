import 'package:flutter/material.dart';

import '../../constant/constant.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appcolor,
        title: const Text("Privacy Policy"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text(
                "Welcome to MyTagCall, the revolutionary WhatsApp Messaging Tool by WeCare Technologies. We are committed to safeguarding your privacy and ensuring the security of your information. This Privacy Policy outlines how we collect, use, disclose, and protect your data when you use MyTagCall.",
                textAlign: TextAlign.justify,
              ),
              sizedboxh(20.0),
              const Row(
                children: [
                  Text(
                    "Information We Collect:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              sizedboxh(10.0),
              const Text(
                "We collect personal information such as your name, contact details, and business information when you register for MyTagCall.",
                textAlign: TextAlign.justify,
              ),
              sizedboxh(10.0),
              const Text(
                "Call history and messaging data are stored for analytical purposes, helping you understand your communication patterns.",
                textAlign: TextAlign.justify,
              ),
              sizedboxh(20.0),
              const Row(
                children: [
                  Text(
                    "How We Use Your Information:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              sizedboxh(10.0),
              const Text(
                "Your personal information is used to provide you with the services of MyTagCall and for communication purposes.",
                textAlign: TextAlign.justify,
              ),
              sizedboxh(10.0),
              const Text(
                "Call history and messaging data are analysed to provide insights and improve the functionality of MyTagCall.",
                textAlign: TextAlign.justify,
              ),
              sizedboxh(20.0),
              const Row(
                children: [
                  Text(
                    "Data Security:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              sizedboxh(10.0),
              const Text(
                "We employ industry-standard security measures to protect your information from unauthorized access, disclosure, alteration, or destruction.",
                textAlign: TextAlign.justify,
              ),
              sizedboxh(10.0),
              const Text(
                "Your data is stored on secure servers, and all communications with MyTagCall are encrypted.",
                textAlign: TextAlign.justify,
              ),
              sizedboxh(20.0),
              const Row(
                children: [
                  Text(
                    "Data Sharing:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              sizedboxh(10.0),
              const Text(
                "We do not sell, trade, or otherwise transfer your personal information to third parties without your consent, except as required by law.",
                textAlign: TextAlign.justify,
              ),
              sizedboxh(10.0),
              const Text(
                "We may share aggregated, non-personal information for statistical analysis and business improvement.",
                textAlign: TextAlign.justify,
              ),
              sizedboxh(20.0),
              const Row(
                children: [
                  Text(
                    "Your Choices:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              sizedboxh(10.0),
              const Text(
                "You have the right to access, update, or delete your personal information.",
                textAlign: TextAlign.justify,
              ),
              sizedboxh(10.0),
              const Text(
                "You can opt-out of promotional communications at any time by following the instructions provided in the communication.",
                textAlign: TextAlign.justify,
              ),
              sizedboxh(20.0),
              const Row(
                children: [
                  Text(
                    "Cookies:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              sizedboxh(10.0),
              const Text(
                "MyTagCall may use cookies to enhance user experience and collect anonymous data about how the service is used.",
                textAlign: TextAlign.justify,
              ),
              sizedboxh(20.0),
              const Row(
                children: [
                  Text(
                    "Updates to Privacy Policy:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              sizedboxh(10.0),
              const Text(
                "We reserve the right to update our Privacy Policy. Any changes will be communicated through the MyTagCall platform or via email.",
                textAlign: TextAlign.justify,
              ),
              sizedboxh(20.0),
            ],
          ),
        ),
      ),
    );
  }
}
