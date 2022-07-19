import 'package:locus/locus.dart';

void main() {
  runApp(LocusLabApp());
}

class LocusLabApp extends StatefulWidget {
  @override
  State<LocusLabApp> createState() => _LocusLabAppState();
}

class _LocusLabAppState extends State<LocusLabApp> {
  @override
  Widget build(BuildContext context) {
    return LocusApp(
      home: LocusScaffold(
        navigationBar: NavigationBar(
          middle: Text('Demo Page'),
        ),
        body: Builder(
          builder: (BuildContext context) {
            return ListView.builder(
              itemCount: 1,
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).padding.top + 40,
                horizontal: 15,
              ),
              itemBuilder: (context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Locus Design Kit',
                    style: LocusTheme.of(context).typography.giant,
                  ),
                  SizedBox(height: 10),
                  Hero(
                    tag: 'jopa',
                    child: Container(
                      color: LocusColors.black,
                      height: 100,
                      width: 200,
                    ),
                  ),
                  SizedBox(height: 10),
                  Interactable(
                    onTap: () => Navigator.of(context).push(
                      LocusPageRoute(
                        builder: (BuildContext context) => LocusScaffold(
                          body: Hero(
                            tag: 'jopa',
                            child: Container(
                              color: LocusColors.black,
                              height: 100,
                              width: 100,
                            ),
                          ),
                          navigationBar: NavigationBar(
                            middle: Text('Профиль'),
                          ),
                        ),
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          color: LocusColors.black,
                          borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      child: Text(
                        'Open new Page',
                        style: LocusTheme.of(context)
                            .typography
                            .body1
                            .copyWith(color: LocusColors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            );
          },
        ),
      ),
      title: 'Lab',
    );
  }
}
