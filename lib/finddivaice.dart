// ignore_for_file: unused_catch_clause, unused_local_variable, prefer_const_constructors, non_constant_identifier_names

import 'dart:io' show Platform;

import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:get_ip_address/get_ip_address.dart';

void main() => runApp(const Find());

class Find extends StatelessWidget {
  const Find({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Woolha.com Flutter Tutorial',
      home: GetDeviceIdExample(),
    );
  }
}

class GetDeviceIdExample extends StatefulWidget {
  const GetDeviceIdExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _GetDeviceIdExampleState();
  }
}

class _GetDeviceIdExampleState extends State<GetDeviceIdExample> {
  final dieviceinfoPlgin = DeviceInfoPlugin();
  dynamic ip = "";
  String? _deviceId;

  @override
  void initState() {
    super.initState();
    _getDeviceId();
    main();
  }

  void _getDeviceId() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String? deviceId;

    if (kIsWeb) {
      final webBrowserInfo = await deviceInfo.webBrowserInfo;
      deviceId =
          '${webBrowserInfo.vendor ?? '-'} + ${webBrowserInfo.userAgent ?? '-'} + ${webBrowserInfo.hardwareConcurrency.toString()}';
    } else if (Platform.isAndroid) {
      const androidId = AndroidId();
      deviceId = await androidId.getId();
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      deviceId = iosInfo.identifierForVendor;
    } else if (Platform.isLinux) {
      final linuxInfo = await deviceInfo.linuxInfo;
      deviceId = linuxInfo.machineId;
    } else if (Platform.isWindows) {
      final windowsInfo = await deviceInfo.windowsInfo;
      deviceId = windowsInfo.deviceId;
    } else if (Platform.isMacOS) {
      final macOsInfo = await deviceInfo.macOsInfo;
      deviceId = macOsInfo.systemGUID;
    }

    setState(() {
      _deviceId = deviceId;
    });
  }


  void name () async {
    try {
      /// Initialize Ip Address
      var ipAddress = IpAddress(type: RequestType.json);

      /// Get the IpAddress based on requestType.
      dynamic data = await ipAddress.getIpAddress();
      ip = data;
    } on IpAddressException catch (exception) {
      /// Handle the exception.
    }
  }

  final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  getModel() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 130,
        title: Center(
          child: Column(
            children: [
              InkWell(onTap: (){

              },
                child: Container(
                  height: 40,
                  width: double.infinity,
                  color: Colors.green,
                  child: Center(
                    child: Text(
                      'Device ID: ${_deviceId ?? '-'},',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 42, 10, 135)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(onTap: (){
                 name();
              },
                child: Container(
                  height: 40,
                  width: double.infinity,
                  color: Colors.orange,
                  child: Center(
                    child: Text(
                      "  ip Number ${ip.toString()}",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Platform.isAndroid
          ? ShadowAndrodinfo()
          : SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      'Device ID: ${_deviceId ?? '-'},',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 42, 10, 135)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "  ip Number ${ip.toString()}",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  // ElevatedButton(
                  //     onPressed: () {
                  //       getModel();
                  //     },
                  //     child: Text("gg")),
                ],
              ),
            ),
    );
  }

  ShadowAndrodinfo() {
    return FutureBuilder(
        future: dieviceinfoPlgin.androidInfo,
        builder: ((context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.hasData) {
            AndroidDeviceInfo info = snapshot.data!;
            return SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  item("Andriod Model", info.model),
                  item("Andriod  brand Name ", info.brand),
                  item("Andriod Hardware", info.hardware),
                  item("Andriod Host", info.host),
                  item("Andriod Id", info.id),
                  item("Andriod type", info.type),
                  item("Andriod type", info.displayMetrics.toString()),
                  item("Andriod type", info.displayMetrics.toString()),
                  item(
                      "Andriod  Is Physical", info.isPhysicalDevice.toString()),
                  item("Andriod  Sdk Int ", info.version.sdkInt.toString()),
                  item("Andriod manufacturer ", info.version.toString()),
                  item("Andriod  display ", info.display),
                  item("Andriod Brand ", info.data.toString()),
                  item("Andriod System Features",
                      info.systemFeatures.toString()),
                ],
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        }));
  }

  item(String name, String value) {
    return Container(
      width: double.infinity,
      color: Colors.blue,
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            value,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}














// import 'dart:async';
// import 'dart:developer' as developer;

// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// void main() {
//   runZonedGuarded(() {
//     runApp(const Find());
//   }, (dynamic error, dynamic stack) {
//     developer.log("Something went wrong!", error: error, stackTrace: stack);
//   });
// }

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
//   Map<String, dynamic> _deviceData = <String, dynamic>{};

//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();
//   }

//   Future<void> initPlatformState() async {
//     var deviceData = <String, dynamic>{};

//     try {
//       if (kIsWeb) {
//         deviceData = _readWebBrowserInfo(await deviceInfoPlugin.webBrowserInfo);
//       } else {
//         deviceData = switch (defaultTargetPlatform) {
//           TargetPlatform.android =>
//             _readAndroidBuildData(await deviceInfoPlugin.androidInfo),
//           TargetPlatform.iOS =>
//             _readIosDeviceInfo(await deviceInfoPlugin.iosInfo),
//           TargetPlatform.linux =>
//             _readLinuxDeviceInfo(await deviceInfoPlugin.linuxInfo),
//           TargetPlatform.windows =>
//             _readWindowsDeviceInfo(await deviceInfoPlugin.windowsInfo),
//           TargetPlatform.macOS =>
//             _readMacOsDeviceInfo(await deviceInfoPlugin.macOsInfo),
//           TargetPlatform.fuchsia => <String, dynamic>{
//               'Error:': 'Fuchsia platform isn\'t supported'
//             },
//         };
//       }
//     } on PlatformException {
//       deviceData = <String, dynamic>{
//         'Error:': 'Failed to get platform version.'
//       };
//     }

//     if (!mounted) return;

//     setState(() {
//       _deviceData = deviceData;
//     });
//   }

//   Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
//     return <String, dynamic>{
//       'version.securityPatch': build.version.securityPatch,
//       'version.sdkInt': build.version.sdkInt,
//       'version.release': build.version.release,
//       'version.previewSdkInt': build.version.previewSdkInt,
//       'version.incremental': build.version.incremental,
//       'version.codename': build.version.codename,
//       'version.baseOS': build.version.baseOS,
//       'board': build.board,
//       'bootloader': build.bootloader,
//       'brand': build.brand,
//       'device': build.device,
//       'display': build.display,
//       'fingerprint': build.fingerprint,
//       'hardware': build.hardware,
//       'host': build.host,
//       'id': build.id,
//       'manufacturer': build.manufacturer,
//       'model': build.model,
//       'product': build.product,
//       'supported32BitAbis': build.supported32BitAbis,
//       'supported64BitAbis': build.supported64BitAbis,
//       'supportedAbis': build.supportedAbis,
//       'tags': build.tags,
//       'type': build.type,
//       'isPhysicalDevice': build.isPhysicalDevice,
//       'systemFeatures': build.systemFeatures,
//       'displaySizeInches':
//           ((build.displayMetrics.sizeInches * 10).roundToDouble() / 10),
//       'displayWidthPixels': build.displayMetrics.widthPx,
//       'displayWidthInches': build.displayMetrics.widthInches,
//       'displayHeightPixels': build.displayMetrics.heightPx,
//       'displayHeightInches': build.displayMetrics.heightInches,
//       'displayXDpi': build.displayMetrics.xDpi,
//       'displayYDpi': build.displayMetrics.yDpi,
//       'serialNumber': build.serialNumber,
//     };
//   }

//   Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
//     return <String, dynamic>{
//       'name': data.name,
//       'systemName': data.systemName,
//       'systemVersion': data.systemVersion,
//       'model': data.model,
//       'localizedModel': data.localizedModel,
//       'identifierForVendor': data.identifierForVendor,
//       'isPhysicalDevice': data.isPhysicalDevice,
//       'utsname.sysname:': data.utsname.sysname,
//       'utsname.nodename:': data.utsname.nodename,
//       'utsname.release:': data.utsname.release,
//       'utsname.version:': data.utsname.version,
//       'utsname.machine:': data.utsname.machine,
//     };
//   }

//   Map<String, dynamic> _readLinuxDeviceInfo(LinuxDeviceInfo data) {
//     return <String, dynamic>{
//       'name': data.name,
//       'version': data.version,
//       'id': data.id,
//       'idLike': data.idLike,
//       'versionCodename': data.versionCodename,
//       'versionId': data.versionId,
//       'prettyName': data.prettyName,
//       'buildId': data.buildId,
//       'variant': data.variant,
//       'variantId': data.variantId,
//       'machineId': data.machineId,
//     };
//   }

//   Map<String, dynamic> _readWebBrowserInfo(WebBrowserInfo data) {
//     return <String, dynamic>{
//       'browserName': describeEnum(data.browserName),
//       'appCodeName': data.appCodeName,
//       'appName': data.appName,
//       'appVersion': data.appVersion,
//       'deviceMemory': data.deviceMemory,
//       'language': data.language,
//       'languages': data.languages,
//       'platform': data.platform,
//       'product': data.product,
//       'productSub': data.productSub,
//       'userAgent': data.userAgent,
//       'vendor': data.vendor,
//       'vendorSub': data.vendorSub,
//       'hardwareConcurrency': data.hardwareConcurrency,
//       'maxTouchPoints': data.maxTouchPoints,
//     };
//   }

//   Map<String, dynamic> _readMacOsDeviceInfo(MacOsDeviceInfo data) {
//     return <String, dynamic>{
//       'computerName': data.computerName,
//       'hostName': data.hostName,
//       'arch': data.arch,
//       'model': data.model,
//       'kernelVersion': data.kernelVersion,
//       'majorVersion': data.majorVersion,
//       'minorVersion': data.minorVersion,
//       'patchVersion': data.patchVersion,
//       'osRelease': data.osRelease,
//       'activeCPUs': data.activeCPUs,
//       'memorySize': data.memorySize,
//       'cpuFrequency': data.cpuFrequency,
//       'systemGUID': data.systemGUID,
//     };
//   }

//   Map<String, dynamic> _readWindowsDeviceInfo(WindowsDeviceInfo data) {
//     return <String, dynamic>{
//       'numberOfCores': data.numberOfCores,
//       'computerName': data.computerName,
//       'systemMemoryInMegabytes': data.systemMemoryInMegabytes,
//       'userName': data.userName,
//       'majorVersion': data.majorVersion,
//       'minorVersion': data.minorVersion,
//       'buildNumber': data.buildNumber,
//       'platformId': data.platformId,
//       'csdVersion': data.csdVersion,
//       'servicePackMajor': data.servicePackMajor,
//       'servicePackMinor': data.servicePackMinor,
//       'suitMask': data.suitMask,
//       'productType': data.productType,
//       'reserved': data.reserved,
//       'buildLab': data.buildLab,
//       'buildLabEx': data.buildLabEx,
//       'digitalProductId': data.digitalProductId,
//       'displayVersion': data.displayVersion,
//       'editionId': data.editionId,
//       'installDate': data.installDate,
//       'productId': data.productId,
//       'productName': data.productName,
//       'registeredOwner': data.registeredOwner,
//       'releaseId': data.releaseId,
//       'deviceId': data.deviceId,
//     };
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         useMaterial3: true,
//         colorSchemeSeed: const Color(0x9f4376f8),
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(_getAppBarTitle()),
//           elevation: 4,
//         ),
//         body: ListView(
//           children: _deviceData.keys.map(
//             (String property) {
//               return Row(
//                 children: <Widget>[
//                   Container(
//                     padding: const EdgeInsets.all(10),
//                     child: Text(
//                       property,
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(vertical: 10),
//                       child: Text(
//                         '${_deviceData[property]}',
//                         maxLines: 10,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ).toList(),
//         ),
//       ),
//     );
//   }

//   String _getAppBarTitle() => kIsWeb
//       ? 'Web Browser info'
//       : switch (defaultTargetPlatform) {
//           TargetPlatform.android => 'Android Device Info',
//           TargetPlatform.iOS => 'iOS Device Info',
//           TargetPlatform.linux => 'Linux Device Info',
//           TargetPlatform.windows => 'Windows Device Info',
//           TargetPlatform.macOS => 'MacOS Device Info',
//           TargetPlatform.fuchsia => 'Fuchsia Device Info',
//         };
// }