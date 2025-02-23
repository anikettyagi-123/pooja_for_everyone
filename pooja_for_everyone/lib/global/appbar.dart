import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/appBar_controller.dart';
import '../view/User_Address/Address.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppbar({super.key});

  @override
  Widget build(BuildContext context) {
// Access the UserController
    final AppBarController userController = Get.put(AppBarController());

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.orangeAccent,
      title: Obx(() {
// Show loading state or address
        if (userController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 2,
            ),
          );
        }

        if (userController.addressList.isNotEmpty) {
// Extract address fields from the first item in `poshakList`
          final address = userController.addressList.first;
          final houseNo = address['houseNo'] ?? '';
          final area = address['area'] ?? '';
          final town = address['town'] ?? '';
          final name = address['userName'] ?? '';

// Display the address in a row
          return Row(
            children: [
              Expanded(
                child: Text(
                  '$name-- $houseNo, $area, $town',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.dialog(
                    AlertDialog(
                      title: Center(child: Text('Delivery Details')),
                      content: SizedBox(
                        height: MediaQuery.of(context).size.height * .19,
                        child: Column(
                          children: [
                            Expanded(
                              child: Text(
                                '$name \n$houseNo, \n$area, \n$town',
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 16),
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  Get.back();  // Close the dialog first
                                  Future.delayed(Duration(milliseconds: 300), () {
                                    Get.to(() => AddressScreen());
                                  });
                                },
                                child: Text('Change delivery details'))
                          ],
                        ),
                      ),
                    ),
                  );
                },
                child: Icon(Icons.arrow_drop_down, size: 30),
              ),
            ],
          );
        } else {
          return const Text(
            'Address not found',
            style: TextStyle(color: Colors.white),
          );
        }
      }),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
