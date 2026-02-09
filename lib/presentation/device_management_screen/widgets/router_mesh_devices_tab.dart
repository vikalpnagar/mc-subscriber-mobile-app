import 'package:family_wifi/presentation/device_management_screen/models/router_device_info_model.dart';
import 'package:family_wifi/presentation/device_management_screen/provider/device_management_provider.dart';
import 'package:family_wifi/presentation/device_management_screen/widgets/router_device_item_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RouterMeshDevicesTab extends StatelessWidget {
  const RouterMeshDevicesTab({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<DeviceManagementProvider>();
    return _buildRouterMeshDevicesList(controller);
  }

  Widget _buildRouterMeshDevicesList(
    DeviceManagementProvider deviceMngmtController,
  ) {
    return StreamProvider<List<RouterDeviceInfoModel>?>.value(
      initialData: deviceMngmtController.routerDevicesInitialData,
      value: deviceMngmtController.routerDevices,
      child: Consumer<List<RouterDeviceInfoModel>?>(
        builder:
            (
              BuildContext context,
              List<RouterDeviceInfoModel>? value,
              Widget? child,
            ) {
              final itemCount = value?.length ?? 0;
              final items = value ?? [];
              return ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: itemCount,
                itemBuilder: (context, index) {
                  return RouterDeviceItemView(
                    deviceItem: items[index],
                    onButtonTap: () {},
                    onDeleteAction: () {
                      return deviceMngmtController.handleRouterMeshDelete(
                        index,
                      );
                    },
                  );
                },
              );
            },
      ),
    );
  }
}
