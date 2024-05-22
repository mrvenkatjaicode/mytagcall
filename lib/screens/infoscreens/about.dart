import 'package:flutter/material.dart';

import '../../constant/constant.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appcolor,
        title: const Text("About Us"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                "Welcome to MyTagCall, the revolutionary WhatsApp Messaging Tool introduced by WeCare Technologies in 2024. Our goal is to simplify communication for businesses, and MyTagCall reflects this commitment. Utilizing the capabilities of WhatsApp, it acts as your dedicated messaging partner, ensuring effortless and automated connections with your audience.",
                textAlign: TextAlign.justify,
              ),
              sizedboxh(20.0),
              Text(
                "Through automated messaging triggered by incoming or outgoing calls, MyTagCall consistently delivers your business message daily without requiring manual intervention. The comprehensive call history feature offers valuable insights into communication patterns, allowing strategic analysis for your business. Additionally, MyTagCall puts you in charge of your data, providing an easy-to-use interface for seamless management of communication history and customization of messaging content to adapt to your evolving business needs.",
                textAlign: TextAlign.justify,
              ),
              sizedboxh(20.0),
              Text(
                "The advantages for your business are significant. MyTagCall facilitates improved outreach by directly reaching your customers on WhatsApp, a platform with billions of active users globally. Its automation capabilities save time and resources, allowing you to focus on the core of your business. Moreover, the informed decisions empowered by MyTagCall's call history insights enable you to understand customer interactions better and tailor your strategies for maximum impact.",
                textAlign: TextAlign.justify,
              ),
              sizedboxh(20.0),
              Text(
                "In essence, MyTagCall by WeCare Technologies is more than just a tool; it's a transformative force in business communication. It serves as the bridge that seamlessly connects your business with your audience, ensuring efficiency, control, and strategic growth. Welcome to the future of communication with MyTagCall.",
                textAlign: TextAlign.justify,
              ),
              sizedboxh(20.0),
              Text(
                "Elevate your business communication with MyTagCall – where innovation meets efficiency. Join the WeCare Technologies community and make every interaction count.",
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
