Play the game on [CodinGame](https://www.codingame.com/training/hard/sokoban)

<h1>Installation</h1>

Maven, Git et Gradle doivent être installé sur la machine.

D'abord on ouvre une invite de commande dans le répertoire ou on soihaite installer le projet puis un execute les commandes suivante :

```
git clone https://github.com/Calu12/Sokoban_GENEVEY_PERNIER.git
 ```  

Installer pddl4j (https://github.com/pellierd/pddl4j) :
```
mvn install:install-file -Dfile="pddl4j/build/libs/pddl4j-4.0.0.jar" -DgroupId=fr.uga -DartifactId=pddl4j -Dversion=4.0.0 -Dpackaging=jar -DgeneratePom=false
```

```
mvn clean compile -U
```

```
mvn clean install
```

```
mvn clean package
```

<h1>Lancer le Jeu</h1>

Exécuter la commande suivante pour generer le problème et trouver la solution :

```
java --add-opens java.base/java.lang=ALL-UNNAMED     -server -Xms2048m -Xmx2048m      -cp target/sokoban-1.0-SNAPSHOT-jar-with-dependencies.jar       sokoban.MyPlanner src\main\java\sokoban\domain.pddl src\main\java\sokoban\sokoban_problem.pddl
```

Executer la commande suivant pour lancer l'interface Sokoban : 
```
java --add-opens java.base/java.lang=ALL-UNNAMED -server -Xms2048m -Xmx2048m -cp target/sokoban-1.0-SNAPSHOT-jar-with-dependencies.jar sokoban.SokobanMain
```

Aller à l'adresse http://localhost:8888/test.html sur un navigateur pour regarder la résoltion sur l'interface.

Il est possible de changer de niveau, pour ce faire un faut modifier les chemins d'acces suivants :
   
   -Sokoban_GENEVEY_PERNIER/src/main/java/sokoban/jsonCharArray.java ligne 15
   
   -src/main/java/sokoban/SokobanMain.java ligne 9

   
Puis il faut executer à nouveau la commande : 
```
mvn clean compile -U
```
```
mvn clean install
```

```
mvn clean package
```
Notez que pour faire ces changement il faut arreter le jeu et le relancer apres.
