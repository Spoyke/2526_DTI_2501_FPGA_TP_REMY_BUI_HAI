# TP_FPGA
Compte rendu des TPs de FPGA avec le projet quartus

Le but de ce TP est de se familiariser avec Quartus et d'utiliser nos compétences pour faire un écran magique. Dans un premier temps, on suit un tutoriel Quartus puis dans un deuxième temps, on se lance dans le projet écran Magic.

# TP Séance 1

## 1 - Création d'un projet 

On suit la démarche de création de projet

## 2 - Création d'un fichier VHDL

On suit la démarche de création d'un fichier

## 3 - Fichier de contraintes

On synthétise le projet et on attribue les pins.

## 4 - Compilation et programmation de la carte

10) 
Après avoir reprogrammé la carte, on remarque que le comportement de la LED est inversé. Il suffit de rajouter un "not" dans la ligne : led0 <= pushl; pour inverser le comportement inversé. 

On obtient : led0 <= not pushl;

## Faire clignoter une LED

1) En regardant dans le user manual, on voit que l'horloge nommée "FPGA_CLK1_50" est sur le pin : "PIN_V11"

3) On trace un schéma correspondant : 

![Image](Schema_led_blink.png)


4) Le schéma proposé par quartus est

![Image](Schema_led_blink_og.png)


7) En adaptant la fréquence, on a :


![Image](Schema_led_blink_delay.png)


8) On a le nouveau schéma sur RTL Viewer:

![Image](Schema_led_blink_delay_og.jpg)

11) Le "_n" dans "i_rst_n" signifie que l'entrée est inversé. Ce qui signifie que l'entrée est active à l'état bas. 



## 5 - Chenillard

On a coder le chenillard et on l'a validé.




# Petit projet : écran magique


2) La présence de deux bascules nous permet avec l'horloge d'avoir en mémoire 2 états à des moments différents : au moment où il y a un front montant au niveau de la bascule A, la bascule A sauvegarde l'état de l'entrée. La bascule B va sauvergarder cet état. Or si l'entrée change d'état entre temps, la bascule A et B auront des états différents.

On a alors un front

On peut détecter ce front avec un xor (la sortie vaut 1 si les entrées sont différentes).
On peut différencier un front montant d'un front descendant en faisant un not sur la sortie de la bascule B : si not(sortie) = 0 on a un front montant et sinon un front descendant.






