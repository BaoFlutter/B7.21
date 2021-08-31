import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

// Tạo một Action : Tăng
enum Actions { Increment }

// The reducer : Khi nhận được Action:  Increment, thì biến số state sẽ thay đổi- tăng lên 1
int counterReducer(int state, dynamic action) {
  if (action == Actions.Increment) {
    return state + 1;
  }

  return state;
}

void main() {
  // Khởi tạo một Store có State ban đầu là 0, counterReducer thì State cũng thay đổi
  final store = new Store<int>(counterReducer, initialState: 0);

  runApp(new FlutterReduxApp(
    title: 'Flutter Redux Demo',
    store: store,
  ));
}

class FlutterReduxApp extends StatelessWidget {
  final Store<int>? store;
  final String? title;

  FlutterReduxApp({Key? key,  this.store, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Kết nối Store với App thông qua StoreProvider
    return new StoreProvider<int>(
      store: store!,
      child: new MaterialApp(
        theme: new ThemeData.dark(),
        title: title!,
        home: new Scaffold(
          appBar: new AppBar(
            title: new Text(title!),
          ),
          body: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Text(
                  'You have pushed the button this many times:',
                ),
                // StoreConnector - là một interface với App để hiển thị hoặc tương tác
                new StoreConnector<int, String>(
                  converter: (store) => store.state.toString(),
                  builder: (context, count) {
                    return new Text(
                      count,
                      style: Theme.of(context).textTheme.display1,
                    );
                  },
                )
              ],
            ),
          ),
          // StoreConnector - là một interface với App để tương tác
          floatingActionButton: new StoreConnector<int, VoidCallback>(
            converter: (store) {
              return () => store.dispatch(Actions.Increment);
            },
            builder: (context, callback) {
              return new FloatingActionButton(
                onPressed: callback,
                tooltip: 'Increment',
                child: new Icon(Icons.add),
              );
            },
          ),
        ),
      ),
    );
  }
}