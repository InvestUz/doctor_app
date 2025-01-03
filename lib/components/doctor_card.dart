import 'package:doctor_app/utils/config.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key, required this.route});

  final String route;

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      height: 150,
      child: GestureDetector(
        child: Card(
          elevation: 5,
          color: Colors.white,
          child: Row(
            children: [
              SizedBox(
                // width: Config.widthSize * 0.10,
                // height: Config.heightSize * 0.10,
                child: Image.asset(
                  'assets/doctor_2.jpg',
                  fit: BoxFit.fill,
                ),
              ),
              const Flexible(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Dr Abdusattorov',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Dental',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.star_border,
                          color: Colors.yellow,
                          size: 16,
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Text('4.5'),
                        Spacer(
                          flex: 1,
                        ),
                        Text('Reviews'),
                        Spacer(
                          flex: 1,
                        ),
                        Text('(20)'),
                        Spacer(
                          flex: 7,
                        ),
                      ],
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
        onTap: () {
          Navigator.of(context).pushNamed(route);
        }, //redirect to doctor show
      ),
    );
  }
}
