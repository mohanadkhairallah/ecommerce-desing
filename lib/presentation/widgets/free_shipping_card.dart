import 'package:flutter/material.dart';

class FreeShippingCard extends StatelessWidget {
  const FreeShippingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        color: Color(0xFFfff2d7),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(
              Icons.wallet_giftcard_outlined,
              color: Color(0xFFfc943d),
            ),
            Column(
              children: const [
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    'Free Shipping over 49',
                    style: TextStyle(
                      color: Color(0xFFdea17b),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    'Free returns and exchange',
                    style: TextStyle(
                      color: Color(0xFFfc943d),
                    ),
                  ),
                ),
              ],
            ),
            const Icon(
              Icons.wallet_giftcard_outlined,
              color: Color(0xFFfc943d),
            ),
          ],
        ),
      ),
    );
  }
}
