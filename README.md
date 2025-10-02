# TP_FPGA
Compte rendu des TPs de FPGA avec le projet quartus

## Création d'un projet 

10) Le comportement de la LED étant inversé, il suffit de rajouter un "not" dans la ligne : led0 <= pushl; pour inverser le comportement inversé. On obtient : led0 <= not pushl;

## Faire clignoter une LED

1) En regardant dans le user manual, on voit que l'hrologe nommée "FPGA_CLK1_50" est sur le pin : "PIN_V11"

11) Le "_n" dans "i_rst_n" signifie que l'entrée est inversé. Ce qui signifie que l'entrée est active à l'état bas. 
