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

Executer la commande suivant pour lancer l'interface Sokoban : 
```
java --add-opens java.base/java.lang=ALL-UNNAMED -server -Xms2048m -Xmx2048m -cp target/sokoban-1.0-SNAPSHOT-jar-with-dependencies.jar sokoban.SokobanMain
```

Aller à l'adresse http://localhost:8888/test.html sur un navigateur pour acceder à l'interface, puis cliquer sur le bouton de lecture pour regarder la résoltion du jeu.

<h1>Changement de niveau</h1>

Il est possible de changer de niveau, une liste de test est disponible dans le dossier config à la racine du projet.

Pour changer de niveau, il faut remplacer la valeur "test15.json" à la ligne 7 du fichier "src/main/java/sokoban/SokobanMain.java" par le nom du fichier de configuration souhaité.

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
