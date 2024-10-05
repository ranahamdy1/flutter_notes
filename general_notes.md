## For Dark mode:
add in material =>> theme: ThemeData.dark().copyWith(),
- for dark or special color >> theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: kPrimaryColor,) 
//add const value to kPrimaryColor for examble: Color(0xff100B20),

```
theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kPrimaryColor, //dark mode
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme), // font Text Style
      ),
```

## Edit Size:
EX:
- height: MediaQuery.of(context).size.height * .25,
- var width = MediaQuery.of(context).size.width;

## scroll
```
  return const CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: ,
        ),
      ],
    );
  ```
- like => SingleChildScrollView

### for font:
add in pubspec.yaml:
```
fonts:
- family: GT Sectra Fine
fonts:
- asset: assets/fonts/GT Sectra Fine Regular.ttf
```
### Navigation
```
Navigator.push (
    context,
    MaterialPageRoute(builder: (context) => SecondRoute()),
);
```
