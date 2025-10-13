ENTRY(loader)			/*nom d'entré du label*/


SECTIONS{
	. = 0x00100000;		/*chargement du code à l'adresse 0x00100000*/
	.text ALIGN(0x1000):	/*alignement à 4Ko*/
	{
		*(.text)	/*toute les sections texte de tous les fichiers*/
	}
	
	.rodata ALIGN(0x1000):	/*alignemment à 4Ko*/
	{
		*(.rodata*)	/*toute les sections de données de tous les fichiers en "lecture seule" */
	}
	
	.data ALIGN (0x1000):	/*alignement de 4Ko à nouveau*/
	{
		*(.data)	/*toute les sections de donées depuis tous les fichiers.*/
	}

	.bss ALIGN (0x1000):	/*alignement de 4Ko*/
	{
		*(COMMON)	/*toutes les sections communes depuis tous les fichiers */
		*(.bss)		/*tout les sections bss de tous les fichiers (bss = block starting sympbol)*/
	}
} 
