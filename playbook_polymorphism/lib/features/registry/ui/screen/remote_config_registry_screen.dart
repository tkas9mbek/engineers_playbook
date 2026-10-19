import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:playbook_polymorphism/features/registry/ui/widget/remote_config_panel.dart';
import 'package:playbook_polymorphism/features/registry/ui/widget/remote_config_scope.dart';
import 'package:playbook_uikit/widgets/article/pattern_layout.dart';

@RoutePage()
class RemoteConfigRegistryScreen extends StatelessWidget {
  const RemoteConfigRegistryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const RemoteConfigScope(
      child: PatternLayout(
        title: 'Registry',
        intro:
            'A registry is a lookup table. You ask it for something, and it '
            'knows where to find it. The server stores configs under text '
            'keys like "support". The registry knows those keys, so your '
            'code just asks for the type it wants: '
            'get<RemoteSupportConfig>().\n\n'
            'The server has no "limits" entry, so you get the default value '
            'instead.',
        demo: RemoteConfigPanel(),
        whenToUse:
            'You have many things of one kind (configs, screens, plugins) and '
            'you do not want every caller to know how to find each one. Adding '
            'one more is a new model and one descriptor in the registry. The '
            'repository, the data source and the bloc do not change.',
        whenToSkip:
            'You have two or three things that rarely change. A constructor '
            'argument or a plain map is enough. A registry is one more place '
            'to keep in sync.',
        tryThis:
            'add a "limits" entry to MockRemoteConfigDataSource and watch the '
            'default disappear.',
      ),
    );
  }
}
