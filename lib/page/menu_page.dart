import 'package:flutter/material.dart';
import 'package:flutter_only/page/flutter_network_page.dart';
import 'package:flutter_only/page/implementation/basket_counter_page.dart';
import 'package:flutter_only/page/implementation/bio_sosmed_page.dart';
import 'package:flutter_only/page/implementation/calculator_page.dart';
import 'package:flutter_only/page/implementation/game/game_gallery_page.dart';
import 'package:flutter_only/page/implementation/random_dice.dart';
import 'package:flutter_only/page/implementation/webview_page.dart';
import 'package:flutter_only/page/interaction/action_page.dart';
import 'package:flutter_only/page/interaction/alert_notif_page.dart';
import 'package:flutter_only/page/interaction/dialog_page.dart';
import 'package:flutter_only/page/interaction/input_page.dart';
import 'package:flutter_only/page/interaction/picker_page.dart';
import 'package:flutter_only/page/local_db/bookmark_animal_page.dart';
import 'package:flutter_only/page/local_db/pref_page.dart';
import 'package:flutter_only/page/styling_page.dart';
import 'package:flutter_only/page/ui_list/another_list_page.dart';
import 'package:flutter_only/page/ui_list/article_page.dart';
import 'package:flutter_only/page/ui_list/custom_scroll_page.dart';
import 'package:flutter_only/page/ui_list/data_table_page.dart';
import 'package:flutter_only/page/ui_list/drag_scroll_page.dart';
import 'package:flutter_only/page/ui_list/expansion_list_page.dart';
import 'package:flutter_only/page/ui_list/grid_page.dart';
import 'package:flutter_only/page/ui_list/list_page.dart';
import 'package:flutter_only/page/ui_list/list_page_dinamis.dart';
import 'package:flutter_only/page/ui_list/list_page_model.dart';
import 'package:flutter_only/page/ui_list/nested_scroll_page.dart';
import 'package:flutter_only/page/ui_list/reorder_list_page.dart';
import 'package:flutter_only/page/ui_list/responsive_space_page.dart';
import 'package:flutter_only/page/ui_list/table_page.dart';
import 'implementation/note/list_note_page.dart';
import 'navigation/bottom_nav_page.dart';
import 'navigation/drawer_page.dart';
import 'navigation/tabbar_page.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menu Page')),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ArticlePage()),
                  );
                },
                child: const Text('Artikel Page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListPage()),
                  );
                },
                child: const Text('List Page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListPageDinamis()),
                  );
                },
                child: const Text('List Page Dinamis'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListPageModel()),
                  );
                },
                child: const Text('List Page Model'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GridPage()),
                  );
                },
                child: const Text('Grid Page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResponsiveSpacePage()),
                  );
                },
                child: const Text('Responsive Space Page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AnotherListPage()),
                  );
                },
                child: const Text('Another List Page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ReorderListPage()),
                  );
                },
                child: const Text('Another List Page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ExpansionListPage()),
                  );
                },
                child: const Text('Expansion List Page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TablePage()),
                  );
                },
                child: const Text('Table Page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DataTablePage()),
                  );
                },
                child: const Text('Data Table Page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CustomScrollPage()),
                  );
                },
                child: const Text('Custom Scroll Page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DragScrollPage()),
                  );
                },
                child: const Text('Drag Scroll Page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NestedScrollPage()),
                  );
                },
                child: const Text('Nested Scroll Page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DrawerPage()),
                  );
                },
                child: const Text('Drawer Page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TabbarPage()),
                  );
                },
                child: const Text('Tabbar Page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BottomNavPage()),
                  );
                },
                child: const Text('Buttom Nav Page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InputPage()),
                  );
                },
                child: const Text('Input Page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AlertNotifPage()),
                  );
                },
                child: const Text('Alert Notif Page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DialogPage()),
                  );
                },
                child: const Text('Dialog Page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PickerPage()),
                  );
                },
                child: const Text('Picker Page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ActionPage()),
                  );
                },
                child: const Text('Action Page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StylingPage()),
                  );
                },
                child: const Text('Styling Page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PrefPage()),
                  );
                },
                child: const Text('Preferences Page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BookmarkAnimalPage()),
                  );
                },
                child: const Text('Bookmark Animal Page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FlutterNetworkPage()),
                  );
                },
                child: const Text('Network Page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RandomDicePage()),
                  );
                },
                child: const Text('Random Dice Page'),
              ),
               ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BasketCounterPage()),
                  );
                },
                child: const Text('Basket Counter Page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CalculatorPage()),
                  );
                },
                child: const Text('Calculator Page'),
              ),
               ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WebviewPage()),
                  );
                },
                child: const Text('Webview Page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BioSosmedPage()),
                  );
                },
                child: const Text('BioSosmed Page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListNotePage()),
                  );
                },
                child: const Text('List Note Page'),
              ),
               ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GameGalleryPage()),
                  );
                },
                child: const Text('Game Gallery Page'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
