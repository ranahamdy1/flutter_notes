## data types:

String, int, double, num, List, dynamic, var(any type)
```
String name = "rana";
print(name.length);
var result = ['rana', 'hamdy'];
print(result.reversed.toList());
```

## ✨ var and dynamic
- var     => لو خصصت لها قيمه من الأول معدش هعرف اغيرها بعدين
- dynamic => لو خصصت لها قيمه من الأول هعرف اغيرها بعدين عادى

EX:
```
⚡
var x = 10; //لو خصصت لها قيمه من الأول معدش هعرف اغيرها بعدين 
x = 2;     //true    int
x ='aa'; //false string

var y; //طالما محطيطش لها قيمه فى الاول فكده هغيرها عادى
y = 10;
y = 'aa';
```

```
⚡
dynamic z = 10; //لو خصصت لها قيمه من الأول هعرف اغيرها بعدين عادى 
z = 2;    //true int
z = "aa"; //true string
```

## ✨ const and final الاتنين قيمتهم ثابته لايمكن تغيريها

```
⚡
const => compile time بيتنفذ لحظه كتابه الكود فى ال
final => run time فى ال run بيتنفذ لما اعمل
```

## ✨ Parameters types
- 1- Optional Parameters ==>>> square brackets [ ]
```
void name(String x,[String? y]){
  print("x:$x, y:$y");
}
void main(){
  name('xx'); //y is not here
}
```
- 2- Optional Named Parameters ==>>> curly braces { }
```
void name(String x,{String? y}){ //we can add required here
  print("x:$x, y:$y");
}
void main(){
  name('aa'); //Named parameters are optional by default
  name('aa',y: "aa");
}
```
- 3- Optional Default Parameters
```
void name(String x,{String? y = "rr"}){
  print("x:$x, y:$y");
}
void main(){
  name('aa'); //output = rr
  name('aa',y: "aa"); //output = aa
}
```
