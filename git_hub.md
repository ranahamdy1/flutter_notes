### Link project to git hub
```
git init

git add .

git remote add origin https://github.com/ranahamdy1/paymob_api.git

git commit -m "App Architecture & Welcome Screens"

git push -u origin main
```

### Upload Edit
```
git add *

git commit -m "Update README"

git push origin main
```

### Merge or pull
```
git fetch origin main 

then

git merge origin main 
or 
git pull origin main 
```

### From master to main
```
git branch -m main

git push -uf origin main
```

### Add branches
```
(Abdullah Mansour)
1- checkout master
2- update master
3- create branch 
4- code.....
5- commit
6- chechout master
7- update master
8- checkout your local branch
9- merge master with my current branch
10- push
11- create pull request

OR

1- create branch 
2- code.....
3- commit
4- push
```

### Connect mobile as emmeletor with wifi
```
adb tcpip 5555

adb connect IP_address
```

### Commit for build_runner
```
flutter packages pub run build_runner build
```
