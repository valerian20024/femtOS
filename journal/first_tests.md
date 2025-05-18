# Journal - first steps

End of april 2025

J'ai recherché un peu sur internet quelques ressources utiles. La bible c'est OSDev.org mais j'aimerais bien utiliser le tuto WrittenOS pour réussir à booter.

May 3, 2025

J'ai essayé de suivre le premier tuto sur OSDev.org pour créer un Bare bones en C. Le premier objectif était de recompiler GCC pour cibler l'architecture du futur OS. J'ai réussi à recompiler Binutils mais pas GDB ni GCC. J'ai une erreur pour GDB, je pense que c'est parce que je n'ai pas assez de ressources pour le compiler sur mon portable. Je réessayerai autrement plus tard. Avec GCC, je n'ai pas l'impression qu'il l'ait vraiment compilé ... Je réessayerai avec une combinaison de binutils et GCC qui est reconnue pour marcher, toujours référencée sur OSDev.org.

J'aimerais bien réussir à juste booter en utilisant Bochs pour afficher un texte à l'écrann en utilisant le BIOS.

J'ai réussi à suivre le tutoriel sur MikeOS pour charger depuis QEMU. C'est l'étape à laquelle je voulais arriver. Pour une fois, j'ai juste copié collé pour voir si ça fonctionnait d'abord. Je vais maintenant pouvoir étudier le code et le changer pour voir. On n'utilise pas encore de bootloader comme GRUB. Ca tient en quelques octets, femto porte bien son nom.

May 10, 2025
Réussi à écrire le binary de femto (femto.bin) sur une clé USB et à booter sur un support physique (mon portable). Mais par contre pas sur tous les supports. J'ai essayé de booter sur un AIO HP, mais seulement "Welc" s'est affiché, pas le reste.
Est-ce un problème de version ou de BIOS ? Sur mon portable c'était l'UEFI qui prenait le relais.

J'ai utilisé ces commandes :
J'ai branché la clé, puis je l'ai vidée et démontée: 

`lsblk`

`sudo umount /dev/sdb1`

Ensuite j'ai écrit en raw sur la clé sur le premier secteur (à la place du MBR):

`sudo dd if=femto.bin of=/dev/sdb bs=512 count=1`

J'ai testé sur QEMU (obligé de mettre ces arguments pour forcer le fait de lire du raw):

`sudo qemu-system-i386 -drive file=/dev/sdb,format=raw,index=0,media=disk`

Ensuite je démarre le PC physique, j'entre dans le BIOS et je choisis de booter sur la clé, et j'ai "Welcome to femtOS!" qui apparaît.

Au final franchement content, mais j'ai de nouveaux sujets à creuser pour comprendre pourquoi un bootloader aussi simple ne fonctionne pas à tous les coups.

May 11, 2025

J'ai regardé comment lier un programme en C au mini bootloader en asm. J'ai trouvé des ressources intéressantes. Il faut que j'apprenne à utiliser inline asm dans un code C (qu'on voit dans experiment). Ca va demander un peu de travail pour faire tout fonctionner ensemble donc je vais attendre d'être plus à l'aise avec avant de vraiment tester sur femto.

May 17, 2025

Je m'amuse avec Termux, ca refonctionne. J'ai mis git et la je code sur telephone. C'est marrant.

May 18, 2025
Essayé de linker un kernel.c avec l'asm du bootloader. Pas réussi, doit comprendre comment `ld` fonctionne. Les questions auxquelles repondre :
- Comment utilise le langage de script de `ld`?
- Comment la memoire est segmentee en 16-bit real mode => comment jmp correctement vers le code C?
- Faire une synthese de ce que j'ai appris avec le inline assembly parce que je sens que j'ai un peu oublie. En particulier, etre plus familier avec le AT&T style utilise par GAS.
- Regarder les intterupts du BIOS et comment les utiliser pour imprimer des caracters.
- Connaitre les registres utilises sur x86 et a quoi ils servent dans le contexte actuel.

