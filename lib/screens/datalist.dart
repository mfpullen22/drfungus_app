import 'package:flutter/material.dart';
import 'package:drfungus_app/services/firebase_service.dart';
import 'package:drfungus_app/screens/item_details_screen.dart';

class DataListScreen extends StatefulWidget {
  const DataListScreen({this.title, this.docIds, super.key});

  final String? title;
  final List<String>? docIds;

  @override
  State<DataListScreen> createState() => _DataListScreenState();
}

class _DataListScreenState extends State<DataListScreen> {
  final ScrollController _scrollController = ScrollController();
  final Map<String, int> _letterIndexMap = {};
  List<dynamic> _sortedData = [];

  Future<List<dynamic>>? getData() {
    if (widget.title == "Fungi") return getBugs();
    if (widget.title == "Medications") return getDrugs();
    if (widget.title == "Mycoses") return getMycoses();
    if (widget.title == "Trials") return getTrials();
    if (widget.title == "Active Trials") {
      return getActiveTrials(widget.docIds!);
    }
    return null;
  }

  void _generateIndexMap() {
    _letterIndexMap.clear();
    for (int i = 0; i < _sortedData.length; i++) {
      final firstLetter = _sortedData[i].name[0].toUpperCase();
      if (!_letterIndexMap.containsKey(firstLetter)) {
        _letterIndexMap[firstLetter] = i;
      }
    }
  }

  void _scrollToLetter(String letter) {
    final index = _letterIndexMap[letter];
    if (index != null) {
      final offset = index * 58.0; // ListTile + SizedBox
      _scrollController.animateTo(
        offset,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
      );
    }
  }

  Widget _buildAlphabetHeader() {
    const letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Container(
      color: Colors.black,
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: letters.length,
        itemBuilder: (context, index) {
          final letter = letters[index];
          return GestureDetector(
            onTap: () => _scrollToLetter(letter),
            child: Container(
              alignment: Alignment.center,
              width: 30,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                letter,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final futureData = getData();

    return Scaffold(
      appBar: AppBar(title: Text(widget.title ?? "Data List")),
      body: FutureBuilder<List<dynamic>>(
        future: futureData,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text("An error occurred!"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No data available"));
          }

          _sortedData = List.from(snapshot.data!)
            ..sort((a, b) => a.name.compareTo(b.name));
          _generateIndexMap();

          return Column(
            children: [
              _buildAlphabetHeader(),
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: _sortedData.length,
                  itemBuilder: (ctx, index) {
                    final item = _sortedData[index];
                    return Column(
                      children: [
                        ListTile(
                          title: Text(item.name),
                          tileColor:
                              Theme.of(context).colorScheme.secondaryContainer,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (ctx) => ItemDetailsScreen(
                                  name: item.name,
                                  data: item,
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 2),
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

/* import 'package:azlistview/azlistview.dart';
import 'package:drfungus_app/services/firebase_service.dart';
import 'package:drfungus_app/screens/item_details_screen.dart';
import 'package:flutter/material.dart';

class DataListScreen extends StatefulWidget {
  const DataListScreen({this.title, this.docIds, super.key});

  final String? title;
  final List<String>? docIds;

  @override
  State<DataListScreen> createState() => _DataListScreenState();
}

class _DataListScreenState extends State<DataListScreen> {
  late Future<List<ISuspensionBean>>? futureData;

  Future<List<ISuspensionBean>>? getData() {
    if (widget.title == "Fungi") {
      return getBugs();
    } else if (widget.title == "Medications") {
      return getDrugs();
    } else if (widget.title == "Mycoses") {
      return getMycoses();
    } else if (widget.title == "Trials") {
      return getTrials();
    } else if (widget.title == "Active Trials") {
      return getActiveTrials(widget.docIds!) as Future<List<ISuspensionBean>>;
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    futureData = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? "Data List"),
      ),
      body: FutureBuilder<List<ISuspensionBean>>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('An error occurred!'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No data available"));
          } else {
            final data = snapshot.data!;
            return AzListView(
              data: data,
              itemCount: data.length,
              indexBarAlignment: Alignment.centerRight,
              itemBuilder: (context, index) {
                final item = data[index];
                return Column(
                  children: [
                    ListTile(
                      tileColor:
                          Theme.of(context).colorScheme.secondaryContainer,
                      title: Text((item as dynamic).name),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => ItemDetailsScreen(
                              name: (item as dynamic).name,
                              data: item,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 2),
                  ],
                );
              },
              indexBarData: SuspensionUtil.getTagIndexList(data),
              indexBarOptions: IndexBarOptions(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                selectTextStyle: const TextStyle(
                  color: Colors.yellow,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                selectItemDecoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black87,
                ),
              ),
            );
          }
        },
      ),
    );
  }
} */

/* import 'package:flutter/material.dart';
import 'package:drfungus_app/services/firebase_service.dart';
import 'package:drfungus_app/screens/item_details_screen.dart';

class DataListScreen extends StatefulWidget {
  const DataListScreen({this.title, this.docIds, super.key});

  final String? title;
  final List<String>? docIds;

  @override
  State<DataListScreen> createState() => _DataListScreenState();
}

class _DataListScreenState extends State<DataListScreen> {
  final ScrollController _scrollController = ScrollController();
  final Map<String, int> _letterIndexMap = {};
  List<dynamic> _sortedData = [];

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<List<dynamic>>? getData() {
    if (widget.title == "Fungi") {
      return getBugs();
    } else if (widget.title == "Medications") {
      return getDrugs();
    } else if (widget.title == "Mycoses") {
      return getMycoses();
    } else if (widget.title == "Trials") {
      return getTrials();
    } else if (widget.title == "Active Trials") {
      return getActiveTrials(widget.docIds!);
    }
    return null;
  }

  void _generateIndexMap() {
    _letterIndexMap.clear();
    for (int i = 0; i < _sortedData.length; i++) {
      final firstLetter = _sortedData[i].name[0].toUpperCase();
      if (!_letterIndexMap.containsKey(firstLetter)) {
        _letterIndexMap[firstLetter] = i;
      }
    }
  }

  void _scrollToLetter(String letter) {
    final index = _letterIndexMap[letter];
    if (index != null) {
      _scrollController.animateTo(
        index * 72.0, // estimated tile height
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Widget _buildAlphabetBar() {
    const letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: letters.length,
        itemBuilder: (context, index) {
          final letter = letters[index];
          return GestureDetector(
            onTap: () => _scrollToLetter(letter),
            child: Container(
              alignment: Alignment.center,
              width: 30,
              margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                letter,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final futureData = getData();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? "Data List"),
      ),
      body: FutureBuilder(
        future: futureData,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('An error occurred!'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No data available"));
          } else {
            _sortedData = List.from(snapshot.data!)
              ..sort((a, b) => a.name.compareTo(b.name));
            _generateIndexMap();

            return Column(
              children: [
                _buildAlphabetBar(),
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: _sortedData.length,
                    itemBuilder: (ctx, index) {
                      final item = _sortedData[index];
                      return Column(
                        children: [
                          ListTile(
                            title: Text(item.name),
                            tileColor: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => ItemDetailsScreen(
                                  name: item.name,
                                  data: item,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 2),
                        ],
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
} */

/* import 'package:drfungus_app/services/firebase_service.dart';
import 'package:drfungus_app/screens/item_details_screen.dart';
import "package:flutter/material.dart";

class DataListScreen extends StatelessWidget {
  const DataListScreen({this.title, this.docIds, super.key});

  final String? title;
  final List<String>? docIds;

  @override
  Widget build(BuildContext context) {
    Future<List<dynamic>>? data;

    if (title == "Fungi") {
      data = getBugs();
    } else if (title == "Medications") {
      data = getDrugs();
    } else if (title == "Mycoses") {
      data = getMycoses();
    } else if (title == "Trials") {
      data = getTrials();
    } else if (title == "Active Trials") {
      data = getActiveTrials(docIds!);
    }

    Widget content = FutureBuilder(
      future: data,
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.error != null) {
          // Handle error
          return const Center(child: Text('An error occurred!'));
        } else if (snapshot.hasData && snapshot.data!.isEmpty) {
          // Check if the data is empty
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "No data available",
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
              ],
            ),
          );
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (ctx, index) {
              return Column(
                children: [
                  ListTile(
                    title: Text(snapshot.data![index].name),
                    tileColor: Theme.of(context).colorScheme.secondaryContainer,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => ItemDetailsScreen(
                            name: snapshot.data![index].name,
                            data: snapshot.data![index],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 2),
                ],
              );
            },
          );
        }
      },
    );

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
} */



/*  ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: ListTile(
            tileColor: Theme.of(context).colorScheme.secondaryContainer,
            title: Text(data[index].name),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => ItemDetailsScreen(
                    name: data[index].name,
                    data: data[index],
                  ),
                ),
              );
            },
          ),
        );
      },
    ); */


