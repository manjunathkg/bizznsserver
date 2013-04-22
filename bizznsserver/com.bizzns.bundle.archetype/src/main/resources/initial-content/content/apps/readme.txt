content/apps folder will have any application related data like menus on the screen,
links, data needed by screens etc.

Rename the folder appname-placeholder to the name of the application. example appname "timeSheets"
Under this folder - two folders are expected - admin and main.. admin will hold an admin application
to manage timeSheet application.. it will give a runtime ui to manage timesheet app-ui related data.

the timeSheet/admin will be picked up by the main admin application to give a gbobal 
admin app some data to work with.

timesheet/main folder will have data structures specific to timeSheet application.

under appname-placeholder, create two json files to represent timesheet/admin and timesheet/main types.
These json files will be used to resolve the jsp to be used when these nodes and their children 
are called. Two example json files are stored here.. admin.json and cms.json.

NOTE: BOTH THESE JSON FILES need to be renamed and edited to reflect proper types for this bundle.








