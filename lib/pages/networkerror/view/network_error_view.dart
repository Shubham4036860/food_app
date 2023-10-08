import 'package:eatery/pages/networkerror/controller/network_error_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class NetworkErrorView extends GetView<NetworkErrorController>{
  const NetworkErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.red
              ),
              child: const Center(
                child: Text(
                  "!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 60.0,
                      fontWeight: FontWeight.w700
                  ),
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const Text(
              "Check Your Network Connectivity",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500
              ),
              softWrap: true,
              textAlign: TextAlign.center,
              overflow: TextOverflow.visible,
              maxLines: 4,
            ).marginOnly(top: 20)
          ],
        ).marginSymmetric(horizontal: 20),
      ),
    );
  }

}