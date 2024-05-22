import 'package:flutter/material.dart';

import '../../constant/constant.dart';

class TermsandConditionsScreen extends StatelessWidget {
  const TermsandConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appcolor,
        title: const Text("Terms and Conditions"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Row(
                children: [
                  Text(
                    "Acceptance of Terms:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              sizedboxh(10.0),
              const Text(
                "By using MyTagCall, you agree to comply with and be bound by these Terms of Use.",
                textAlign: TextAlign.justify,
              ),
              sizedboxh(20.0),
              const Row(
                children: [
                  Text(
                    "User Responsibilities:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              sizedboxh(10.0),
              const Text(
                "You are responsible for maintaining the confidentiality of your account information and for all activities that occur under your account.",
                textAlign: TextAlign.justify,
              ),
              sizedboxh(20.0),
              const Row(
                children: [
                  Text(
                    "Prohibited Activities:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              sizedboxh(10.0),
              const Text(
                "Users must not engage in any unlawful or harmful activities while using MyTagCall, including but not limited to spamming, hacking, or distributing malware.",
                textAlign: TextAlign.justify,
              ),
              sizedboxh(20.0),
              const Row(
                children: [
                  Text(
                    "Intellectual Property:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              sizedboxh(10.0),
              const Text(
                "MyTagCall and its content are the intellectual property of WeCare Technologies.",
                textAlign: TextAlign.justify,
              ),
              sizedboxh(10.0),
              const Text(
                "Users are prohibited from reproducing, distributing, or modifying any part of the service without explicit permission.",
                textAlign: TextAlign.justify,
              ),
              sizedboxh(20.0),
              const Row(
                children: [
                  Text(
                    "Service Availability:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              sizedboxh(10.0),
              const Text(
                "We strive to maintain the availability and functionality of MyTagCall, but we do not guarantee uninterrupted access or error-free operation.",
                textAlign: TextAlign.justify,
              ),
              sizedboxh(20.0),
              const Row(
                children: [
                  Text(
                    "Termination:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              sizedboxh(10.0),
              const Text(
                "We reserve the right to terminate or suspend your access to MyTagCall at our discretion, without notice, for any reason.",
                textAlign: TextAlign.justify,
              ),
              sizedboxh(20.0),
              const Row(
                children: [
                  Text(
                    "Disclaimer:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              sizedboxh(10.0),
              const Text(
                "By using MyTagCall, you acknowledge that you have read, understood, and agreed to these Privacy Policy and Terms of Use. If you do not agree, please refrain from using MyTagCall. For any questions or concerns, please contact us at MyTagCall@gmail.com.",
                textAlign: TextAlign.justify,
              ),
              sizedboxh(20.0),
              const Row(
                children: [
                  Text(
                    "Additional Permissions and Support:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              sizedboxh(10.0),
              const Text(
                "In addition to the aforementioned policies, users of MyTagCall hereby grant permission for the application to access call logs and run background processes on their devices. These permissions are necessary for the proper functioning of the MyTagCall service, including features such as call history tracking and real-time messaging.",
                textAlign: TextAlign.justify,
              ),
              sizedboxh(20.0),
              const Row(
                children: [
                  Text(
                    "User Support:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              sizedboxh(10.0),
              const Text(
                "We understand that users may have questions or concerns regarding the application's functionality, compatibility, or usage. Our support team is available to assist users with any inquiries they may have. Users can reach out to our support team for assistance by contacting MyTagCall@gmail.com.",
                textAlign: TextAlign.justify,
              ),
              sizedboxh(20.0),
              const Row(
                children: [
                  Text(
                    "Device Model Information:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              sizedboxh(10.0),
              const Text(
                "In order to provide optimal support and troubleshoot any technical issues that may arise, our support team may request information about the model of the user's device. This information helps us tailor our assistance to the specific characteristics of the user's device and ensure a smooth user experience.",
                textAlign: TextAlign.justify,
              ),
              sizedboxh(20.0),
              const Text(
                "By continuing to use MyTagCall, you acknowledge and consent to the addition of call log access and background process permissions, as well as the provision of support services that may involve requesting device model information. If you have any questions or concerns about these updates, please don't hesitate to contact us at MyTagCall@gmail.com.",
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
