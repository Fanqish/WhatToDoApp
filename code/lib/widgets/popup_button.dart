import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import '../consts/global.dart';
import '../utils/online/analytics.dart';
import '../utils/online/other.dart';

List popupItems = [
  PopItem("Share The App", Icons.ac_unit, () {
    Share.share(
        "Are You Feeling Bored? Then Check This App >>> ${AppUrls.rate}");
  }),
  PopItem("Rate 5 Stars", Icons.star, () {
    openURL(AppUrls.rate);
  }),
  PopItem("Report Problem", Icons.report_problem, () {
    openURL(AppUrls.support);
  }),
  PopItem("Suggest Feature", Icons.featured_play_list, () {
    openURL(AppUrls.support);
  }),
  PopItem("Privacy Policy", Icons.privacy_tip, () {
    openURL(AppUrls.privacy);
  }),
];

PopupMenuButton popupMenuButton = PopupMenuButton(
  itemBuilder: (context) => (popupItems
      .map((e) => PopupMenuItem(
            child: Row(
              children: [
                Text(
                  e.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: context.theme.primaryColor,
                  ),
                ),
                Icon(
                  e.icon,
                  color: context.theme.primaryColor,
                )
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            value: e.title,
          ))
      .toList()),
  onSelected: (selected) {
    popupItems.forEach((e) {
      if (e.title == selected) {
        print(e.title);
        e.action();
        logEvent(category: "Unknown", action: e.title);
      }
    });
  },
);

class PopItem {
  final String title;
  final IconData icon;
  final Function action;

  PopItem(this.title, this.icon, this.action);
}
