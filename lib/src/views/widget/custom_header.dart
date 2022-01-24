import 'package:flutter/material.dart';

class custom_header extends StatelessWidget {
  custom_header({Key? key, this.checked = false, this.title}) : super(key: key);

  bool checked;
  var title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 6,
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.chevron_left,
                    size: 40,
                  ),
                ),
              ),
              if (title != null)
                Flexible(
                  flex: 6,
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 30),
                  ),
                ),
            ],
          ),
        ),
        Flexible(
          flex: 1,
          child: Row(
            children: [
              if (checked)
                ImageIcon(
                  AssetImage("assets/icon/shield_check.png"),
                  color: Colors.red,
                  size: 40,
                ),
              IconButton(
                  onPressed: () => Navigator.pushNamed(
                      context, '/src/view/ui/user_setting_screen'),
                  icon: Icon(
                    Icons.settings_outlined,
                    size: 40,
                  )),
            ],
          ),
        )
      ],
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );
  }
}
