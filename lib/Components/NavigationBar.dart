import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Controller/BottomNavigationBar.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavController controller = Get.put(BottomNavController());
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            width: 200,
            height: 60,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      controller.index.value = 0;
                    },
                    child: Obx(
                      () => AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.bounceInOut,
                        height: 40,
                        width: 40,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: controller.index.value == 0
                              ? Theme.of(context).colorScheme.primary
                              : null,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Icon(Icons.home,
                            size: 25,
                            color: controller.index.value == 0
                                ? Theme.of(context).colorScheme.onSurface
                                : Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer),
                      ),
                    )),
                InkWell(
                    onTap: () {
                      controller.index.value = 1;
                    },
                    child: Obx(
                      () => AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.bounceInOut,
                        height: 40,
                        width: 40,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: controller.index.value == 1
                              ? Theme.of(context).colorScheme.primary
                              : null,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Icon(Icons.book,
                            size: 25,
                            color: controller.index.value == 1
                                ? Theme.of(context).colorScheme.onSurface
                                : Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer),
                      ),
                    )),
                InkWell(
                    onTap: () {
                      controller.index.value = 2;
                    },
                    child: Obx(() => AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.bounceInOut,
                          height: 40,
                          width: 40,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: controller.index.value == 2
                                ? Theme.of(context).colorScheme.primary
                                : null,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Icon(Icons.settings,
                              size: 25,
                              color: controller.index.value == 2
                                  ? Theme.of(context).colorScheme.onSurface
                                  : Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer),
                        ))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
