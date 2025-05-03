# Journal - first steps

End of april 2025

J'ai recherché un peu sur internet quelques ressources utiles. La bible c'est OSDev.org mais j'aimerais bien utiliser le tuto WrittenOS pour réussir à booter.

May 3, 2025

J'ai essayé de suivre le premier tuto sur OSDev.org pour créer un Bare bones en C. Le premier objectif était de recompiler GCC pour cibler l'architecture du futur OS. J'ai réussi à recompiler Binutils mais pas GDB ni GCC. J'ai une erreur pour GDB, je pense que c'est parce que je n'ai pas assez de ressources pour le compiler sur mon portable. Je réessayerai autrement plus tard. Avec GCC, je n'ai pas l'impression qu'il l'ait vraiment compilé ... Je réessayerai avec une combinaison de binutils et GCC qui est reconnue pour marcher, toujours référencée sur OSDev.org.

J'aimerais bien réussir à juste booter en utilisant Bochs pour afficher un texte à l'écrann en utilisant le BIOS.

J'ai réussi à suivre le tutoriel sur MikeOS pour charger depuis QEMU. C'est l'étape à laquelle je voulais arriver. Pour une fois, j'ai juste copié collé pour voir si ça fonctionnait d'abord. Je vais maintenant pouvoir étudier le code et le changer pour voir. On n'utilise pas encore de bootloader comme GRUB. Ca tient en quelques octets, femto porte bien son nom.
