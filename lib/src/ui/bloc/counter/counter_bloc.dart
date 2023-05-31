import 'dart:async';

import 'package:my_tasks/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterBloc {
  int counter;
  final String counterName;
  final StreamController<CounterData> _counterStreamController =
      StreamController<CounterData>.broadcast();

  CounterBloc(this.counterName, this.counter) {
    _counterStreamController.sink.add(CounterData(counterName, counter));
    _loadCounterFromStorage();
  }

  Stream<CounterData> get counterStream => _counterStreamController.stream;

  Future<bool> incrementCounter() async {
    if(await _sendServerEvent('Suma')){
      counter++;
      _saveCounterToStorage();
      _counterStreamController.sink.add(CounterData(counterName, counter));
      return true;
    }
    return false;
  }

  Future<bool> decrementCounter() async {
    if(await _sendServerEvent('Resta')){
      counter--;
      _saveCounterToStorage();
      _counterStreamController.sink.add(CounterData(counterName, counter));
      return true;
    }
    return false;
  }

  void dispose() {
    _counterStreamController.close();
  }

  void _saveCounterToStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(counterName, counter);
  }

  void _loadCounterFromStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? storedCounter = prefs.getInt(counterName);
    if (storedCounter != null) {
      counter = storedCounter;
      _counterStreamController.sink.add(CounterData(counterName, counter));
    }
  }

  Future<bool> _sendServerEvent(evento) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try{
      var response = await supabase.from('eventos').insert([
        {
          'nombre_contador': counterName,
          'accion': evento,
          'valor': counter,
          'device_id': prefs.getString('ID'),
        },
      ]).select().onError((error, stackTrace) => throw error!);
      if(response == null || response.hashCode != 200){
        return false;
      }else{
        return true;
      }
    }catch(e){
      return false;
    }
  }
}

class CounterData {
  final String counterName;
  final int counterValue;

  CounterData(this.counterName, this.counterValue);
}
