import 'package:crypto_exchange/store/reducers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatefulWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 5, left: 15, right: 5),
        //svg viewBox a part of margin
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Home",
                style: TextStyle(fontSize: 25.0,
                    fontWeight: FontWeight.w800,
                    color: Colors.white)),
            StoreConnector<AppState, String>(
              converter: (store)=>store.state.email,
                builder: (context, email) {
                  return new Text(email,
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white));
                }),
            // Row(
            //   children: [
            //
            //     // IconButton(
            //     //   icon: SvgPicture.asset('assets/images/analytics.svg', color: Colors.white),
            //     //   onPressed: null,
            //     // ),
            //     // IconButton(
            //     //   icon: SvgPicture.asset('assets/images/search.svg', color: Colors.white),
            //     //   onPressed: null,
            //     // ),
            //     // IconButton(
            //     //   icon: SvgPicture.asset('assets/images/more.svg', color: Colors.white),
            //     //   onPressed: null,
            //     // ),
            //   ],
            // )
          ],
        ));
  }
}
