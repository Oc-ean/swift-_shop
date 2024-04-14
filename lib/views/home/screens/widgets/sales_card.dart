import 'package:flutter/material.dart';

class SaleCard extends StatelessWidget {
  const SaleCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF7A60A5),
            Color(0xFF101010),
            // Color(0xFF82C3DF),
          ],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(1.0, 0.0),
          stops: [
            0.0,
            1.0,
          ],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Row(
        children: [
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF82C3DF),
                      Color(0xFF7A60A5),
                    ],
                    begin: FractionalOffset(0.0, 0.0),
                    end: FractionalOffset(1.0, 0.0),
                    stops: [
                      0.0,
                      1.0,
                    ],
                    tileMode: TileMode.clamp,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Get the special discount',
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        '50 % OFF',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Flexible(
                        child: Container(
                          height: 31,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                          child: const Center(
                            child: Text(
                              'Buy now!',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Image.network(
                'https://i.ibb.co/vwB46Yq/shoes.png',
                width: double.infinity,
                fit: BoxFit.contain,
              ),
            ),
          )
        ],
      ),
    );
  }
}
