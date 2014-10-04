Sauron
======

"One Class to rule them all, One Class to find them, One Class to bring them all and in the storyboard bind them"

Civilized storyboard navigation


Description
-----------
Navigate through different and modular storyboards and their views. No boilerplate.

Error handler when no storyboard is found and multiple handy methods such as:
-Push
-Present
-Interrupt: a modal view controller will be presented from the first view in the window hierarchy.
-Switch: The next view controller will replace the first one in the window hierarchy.
-Hook: A view controller will be push and embedded within aNavigation Controller in the process.

Supports dependency inyection through the use of blocks.


Extras
------
Storyboard Builder
–Create TabBars and SplitViewControllers from an array of Storyboard names.

UIViewController+Segues Category (prepareForSegue: convenience methods). 
—Asks the segue for the class of the next View Controller (instead of the string name of the segue inside the Storyboard).
