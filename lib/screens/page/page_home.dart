import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PageHome extends StatelessWidget {
  const PageHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as User?;
    return Scaffold(
        appBar: AppBar(
          title: const Text('LUNO Budget Buddy'),
          actions: [
            CircleAvatar(
              backgroundImage: NetworkImage(user?.photoURL ??
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/330px-No-Image-Placeholder.svg.png'),
            ),
            const SizedBox(
              width: 30,
            )
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: SizedBox(
                height: 200,
                child: Image.network(
                    'https://images.squarespace-cdn.com/content/v1/5648e25be4b00accac880a0e/1457644713650-UD0301XZBAC9649KAE1R/shop-online.png'),
              ),
            ),
          ],
        ));
  }
}
