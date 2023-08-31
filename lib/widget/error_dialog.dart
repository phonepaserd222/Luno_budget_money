import 'package:flutter/material.dart';

void errorDialog({
  required String error,
  required BuildContext context,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('ເກິດຂໍ້ຜິດພາດ'),
      content: const SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('ບັນຊີ ຫຼື ລະຫັດຜ່ານຂອງທ່ານບໍ່ຖືກຕ້ອງ'),
            Text('ກະລຸນາລອງໃຫມ່ອີກຄັ້ງ'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('ຕົກລົງ'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    ),
  );
}
