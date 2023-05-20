import 'package:flutter/material.dart';
import 'package:simutax_mobile/routes.dart';
import 'package:simutax_mobile/theme/app_style.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ProfileScreenViewState();
}

class _ProfileScreenViewState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final appStyle = AppStyle(context);

    final profileClip = Material(
      borderRadius: BorderRadius.circular(80),
      elevation: 5,
      color: appStyle.darkBlue,
      child: CircleAvatar(
        radius: 80,
        backgroundColor: Colors.transparent,
        child: Text(
          "F",
          style: appStyle.profileClipStyle,
        ),
      ),
    );

    final profileName = SizedBox(
      width: appStyle.width / 1.1,
      height: appStyle.height / 40,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "Fulano de Tal",
              style: appStyle.profileNameStyle,
            ),
          )
        ],
      ),
    );

    final profileContainer = SizedBox(
      width: appStyle.width / 1.1,
      height: appStyle.height / 4.5,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: profileClip,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: profileName,
          ),
        ],
      ),
    );

    final editInformationsButton = MaterialButton(
      onPressed: () {
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.of(context).pushNamed(AppRoutes.editProfileScreen);
        });
      },
      child: SizedBox(
        width: appStyle.width / 1.1,
        child: Container(
          decoration: BoxDecoration(
            color: appStyle.mediumGrey,
            shape: BoxShape.rectangle,
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8),
                child: SizedBox(
                  height: appStyle.height / 20,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Text("EDITAR INFORMAÇÕES",
                                style: appStyle.labelStyle),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    final comparationHistoryButton = MaterialButton(
      onPressed: () {
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.of(context).pushNamed(AppRoutes.comparationScreen);
        });
      },
      child: SizedBox(
        width: appStyle.width / 1.1,
        child: Container(
          decoration: BoxDecoration(
            color: appStyle.mediumGrey,
            shape: BoxShape.rectangle,
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8),
                child: SizedBox(
                  height: appStyle.height / 20,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Text("VISUALIZAR COMPARAÇÕES",
                                style: appStyle.labelStyle),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    final logoffButton = MaterialButton(
      onPressed: () {
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.of(context).pushNamed(AppRoutes.comparationScreen);
        });
      },
      child: SizedBox(
        width: appStyle.width / 1.1,
        child: Container(
          decoration: BoxDecoration(
            color: appStyle.mediumGrey,
            shape: BoxShape.rectangle,
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8),
                child: SizedBox(
                  height: appStyle.height / 20,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Text("SAIR DA CONTA",
                                style: appStyle.labelStyle),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    final actionsContainer = SizedBox(
      height: appStyle.height / 1.35,
      child: Column(
        children:
            [editInformationsButton, comparationHistoryButton, logoffButton]
                .map((widget) => Padding(
                      padding: EdgeInsets.only(bottom: appStyle.height / 60),
                      child: widget,
                    ))
                .toList(),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Conta'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Color.fromARGB(255, 95, 95, 95)),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: profileContainer,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: actionsContainer,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
