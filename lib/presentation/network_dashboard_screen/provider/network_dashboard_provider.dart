import 'package:family_wifi/core/utils/print_log_helper.dart';
import 'package:family_wifi/presentation/home_screen/models/topology_info.dart'
    hide Node;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';

import '../../../core/app_export.dart';
import '../models/network_dashboard_model.dart';
import '../models/network_item_model.dart';

class NetworkDashboardProvider {
  NetworkDashboardModel networkDashboardModel = NetworkDashboardModel();
  List<NetworkItemModel> networkItems = [];

  final Graph graph = Graph()..isTree = true;
  final BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();

  void initialize() {
    _initializeNetworkItems();
  }

  void _initializeNetworkItems() {
    networkItems = [
      NetworkItemModel(
        title: '12 Devices',
        subtitle: 'Mobile Devices',
        value: '2.5 GB',
        onTap: () {
          // NavigatorService.pushNamed(AppRoutes.networkDevicesManagementScreen);
        },
      ),
      NetworkItemModel(
        title: 'Family WiFi',
        subtitle: 'Manage parental controls',
        value: '3 Groups',
        onTap: () {
          NavigatorService.pushNamed(AppRoutes.familyWiFiManagementScreen);
        },
      ),
      NetworkItemModel(
        title: 'Speed Test',
        subtitle: 'Last test: 2024-01-20 10:00 AM',
        value: '100 Mbps',
        onTap: () {
          NavigatorService.pushNamed(AppRoutes.speedTestProgressScreen);
        },
      ),
    ];
  }

  final ValueNotifier<bool> displayGraph = new ValueNotifier(false);

  void handleTopologyInfo(TopologyInfo? topologyInfo) {
    if (topologyInfo != null && (topologyInfo.nodes?.isNotEmpty ?? false)) {
      int nodeKey = 1;
      topologyInfo.nodes!.forEach((tpNode) {
        final graphNodeInfo = GraphNodeInfo(
          nodeKey++,
          '0',
          'NODE',
          color: Colors.lightBlue,
          addtlInfo: tpNode.serial,
        );
        final gvNode = Node.Id(graphNodeInfo);
        graph.addNode(gvNode);
        int noOfClients = 0;
        tpNode.aps?.forEach((apNode) {
          // final gvAPNode = Node.Id(
          //   GraphNodeInfo(
          //     nodeKey++,
          //     apNode.ssid ?? 'AP',
          //     'AP',
          //     Icons.wifi,
          //     Colors.teal,
          //   ),
          // );
          // graph.addEdge(
          //   gvNode,
          //   gvAPNode,
          //   paint: Paint()..color = Colors.tealAccent,
          // );
          apNode.clients?.forEach((clientNode) {
            noOfClients++;
            final gvClientNode = Node.Id(
              GraphNodeInfo(
                nodeKey++,
                clientNode.station ?? 'CLIENT',
                'CLIENT',
                icon: Icons.devices,
                color: Colors.cyan,
              ),
            );
            graph.addEdge(
              gvNode,
              gvClientNode,
              paint: Paint()..color = Colors.cyanAccent,
            );
          });
        });
        if (noOfClients > 0) {
          graphNodeInfo.label = noOfClients.toString();
        }
      });

      if (topologyInfo.edges?.mesh?.isNotEmpty ?? false) {
        topologyInfo.edges?.mesh!.forEach((meshInfo) {
          logPrint('Graph Nodes: ${graph.nodes.length}');
          if ((meshInfo.from?.isNotEmpty ?? false) &&
              (meshInfo.to?.isNotEmpty ?? false)) {
            try {
              Node matchingFromNode = graph.nodes.firstWhere((graphNode) {
                GraphNodeInfo graphNodeInfo =
                    graphNode.key?.value as GraphNodeInfo;
                return graphNodeInfo.type == 'NODE' &&
                    graphNodeInfo.addtlInfo == meshInfo.from;
              });

              Node matchingToNode = graph.nodes.firstWhere((graphNode) {
                GraphNodeInfo graphNodeInfo =
                    graphNode.key?.value as GraphNodeInfo;
                return graphNodeInfo.type == 'NODE' &&
                    graphNodeInfo.addtlInfo == meshInfo.to;
              });

              graph.addEdge(
                matchingFromNode,
                matchingToNode,
                paint: Paint()
                  ..color = Colors.limeAccent
                  ..strokeWidth = 3,
              );
            } catch (e, stack) {
              logPrint(
                'No matching node found with "from" value: ${meshInfo.from} or "to" value: ${meshInfo.to}',
              );
            }
          }
        });
      }
      displayGraph.value = true;
    } else {
      if (graph.edges.isNotEmpty) graph.removeEdges(graph.edges);
      displayGraph.value = false;
    }

    builder
      ..siblingSeparation = (150)
      ..levelSeparation = (200)
      ..subtreeSeparation = (150)
      ..useCurvedConnections = false
      ..orientation = (BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM);
  }
}

class GraphNodeInfo {
  int key;
  String label;
  String type;
  IconData? icon;
  Color? color;
  String? addtlInfo;

  GraphNodeInfo(
    this.key,
    this.label,
    this.type, {
    this.icon,
    this.color,
    this.addtlInfo,
  });
}
