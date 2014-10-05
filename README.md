Sauron
======

"One Class to rule them all, One Class to find them, One Class to bring them all and in the storyboard bind them"

Civilized storyboard navigation


Description
-----------
Navigate through different and modular storyboards and their views. No boilerplate required.

Error handler when no storyboards are found and multiple handy methods such as:
-Push
-Present
-Interrupt: a modal view controller to be presented from the first view in the window hierarchy.
-Switch: The next view controller will replace the first one in the window hierarchy.
-Hook: A view controller will be push and embedded within a Navigation Controller in the process.

Supports dependency inyection through the use of blocks.


Use
---
- Push to a view created in a separate Storyboard
[self pushToStoryboardNamed:storyboardName
        withViewIdentifier:nil
    returningViewController:^(id nextVC) {
        [nextVC setTitle:@"NewTitle"];
    }];

- Present any Scene
[self presentStoryboardNamed:storyboardName
              withViewIdentifier:@"detailVC"
         returningViewController:nil];

- Interrupt the user with any scene within the app. This rises a view controller from the first controller in your window hierarchy. Very useful for Showing a PIN or Password code at anytime.
  [MHJSauron interruptWithStoryboardNamed:storyboardName
                         withViewIdentifier:@"lockVC"
                    returningViewController:^(id nextVC) {
                        [nextVC setTitle:@"Introduce your Password"];
    }];

- Switch your first view controller in the window hierarchy for another one. Helpful when you want to get rid of the previous flow that has been added in your NavigationController.
  [MHJSauron switchToStoryboardNamed:storyboardName
                    withViewIdentifier:@"clientsVC"
               returningViewController:^(id nextVC) {
                  MHJClientsVC *clientsVC = nextVC;
                  [clientsVC setManagedObjectContext: self.context];
    }];
    


Extras
------
Storyboard Builder
–Create TabBars and SplitViewControllers from an array of Storyboard names.

UIViewController+Segues Category (prepareForSegue: convenience methods). 
—Asks the segue for the class of the next View Controller (instead of the string name of the segue inside the Storyboard).
