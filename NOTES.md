# NYC *Sinatra* Project
Build a history site for New York City.

The *app* should have a special focus on historical figures.

For this reason:
* figure views
* figure controllers
will mostly go through your app.

#Your app will have
1. view pages for all of the @landmarks
2. a @user will be able to create new @landmarks
3. when a @user creates (new) or edits (patch) a @figure,
   they should also be able to:
   - select OR create a new @landmark and/or @title to associate to
     that @figure.
4. the form for a new @figure and the form to edit a figure should:
   - allow the @user to select from existing @landmarks and @title
   - create new @landmarks and @titles to associate to the @figure.



*NOTE*
**Titles** are not important so you're not required to build
a @titles controller or any @titles views.

New @titles will only get created in the
context of creating or editing a @figure.



*MODELS*

**Landmarks**
#id	  name	                 figure_id	year_completed
 1	  BQE	                      1          1947
 2	  Holland Tunnel	          5	         1927
 3	  Wall Street Wall	          4	         1684
 4	  Brooklyn Battery Tunnel	  10	     1973

**Figures**
#id	  name
 1	  Robert Moses
 2	  Al Smith
 3	  Theodore Roosevelt
 4	  Peter Stuyvesant
 5	  Boss Tweed
 6	  Michael Bloomberg
 7	  Ed Koch
 8	  Fiorello LaGuardia
 9	  Jimmy Walker
 10	  Belle Moskowitz

**FigureTitles**
#id     title_id    figure_id
  1	        3	         2
  2	        3	         3
  3	        2	         3
  4	        1	         9
  5	        4	         1

**Titles**
#id	  name
 1	  Mayor
 2	  President
 3	  Governor
 4	  NYC Parks commissioner



*JOIN TABLES*
Any time you have a __has_many__ to __has_many relationship__,
you need to create a join table.

An example of a __has_many__ to __has_many relationship__ is:
@titles and @figures.

Your Join Table is called @figure_titles

use the:
* has_many
* belongs_to
* has_many, :through
macros associate models.



*ASSOCIATIONS*

@figures    --<     @figure_title   >--     @title
 name                figure_id               name
  |                   title_id
  |
  ^
@landmark
 name
 year_completed
 figure_id

###########################################################

A @figure   __has_many__     @landmarks
A @landmark __belongs_to__ a @figure

A @figure   __has_many__     @figure_titles
A @figure   __has_many__     @titles through @figure_titles

A @title    __has_many__     @figure_titles
A @title    __has_many__     @figures through @figure_titles

A @figure_title __belongs_to__ a @figure
A @figure_title __belongs_to__ a @title



#real world logic
A title has many figures because many people hold a title over time.
A figure usually has many titles over their career.



*VIEWS and CONTROLLERS*
You should create:
1. a @landmarks controller
2. a @figures Controller.

This project is test-driven;
It may be possible to create an app that behaves as expected but \
will not pass the specific tests.

#forms
Use the tests to determine how to structure forms
* in particular: **the names assigned to specific inputs**

#your forms will need to be complex.

# new form
your form for a new  @figure should:
* dynamically generate checkboxes
  out of the available @landmarks and @titles.

and also have fields for:
* creating a new @landmark and/or @title

# controller
The controller action that catches the *POST* request sent by
submitting @this form should account for all of that.

# edit form
The same is true of your form for editing a given @figure.

# remember...
read the tests carefully to understand how to set up
your forms.



*Top-Tip*
# tux
1. Type 'tux' in your terminal in the directory of this project to
   use an interactive Ruby console that is connected
   to your models and database.

   Here, you can play around with creating and associating
   instances of the classes you create once you're properly set up

   This is helpful to solidify your understanding of the
   relationships between models before building:
   * routes
   * views
   * and forms
   that will allow your users to interact with @them.

# begin with...
2. Start out by creating a new @figure, @landmark and @title.

# next...
3. add that @landmark and @title to the @figures collection of
   @landmarks and @titles respectively.

# test database migration
4. migrate your test database by running:
   - $ bundle exec rake db:migrate SINATRA_ENV=test

# seed data
After your Active Record models have been properly defined
5. load the seed data by running:
   - $ bundle exec rake db:seed



**TUX Playground**
>> lnmrk.figure
=> #<Figure id: 6, name: "Patrick Ewing">

>> lnmrk.figure.title
NoMethodError: undefined method `title' for #<Figure id: 6, name: "Patrick Ewing">
Did you mean?  titles
               titles=
     `method_missing'
    (ripl):35:in `<main>'

>> lnmrk.figures.title
NoMethodError: undefined method `figures' for #<Landmark:0x00007ff73f183bf0>
Did you mean?  figure
               figure=
     `method_missing'
    (ripl):36:in `<main>'

>> lnmrk.title
NoMethodError: undefined method `title' for #<Landmark:0x00007ff73f183bf0>
     `method_missing'
    (ripl):37:in `<main>'

>> lnmrk.figure
=> #<Figure id: 6, name: "Patrick Ewing">

>> fig
=> #<Figure id: 6, name: "Patrick Ewing">

>> FigureTitle.last
D, [2019-05-10T00:10:12.659702 #15749] DEBUG -- :   FigureTitle Load (0.2ms)  SELECT  "figure_titles".* FROM "figure_titles"  ORDER BY "figure_titles"."id" DESC LIMIT 1
=> #<FigureTitle id: 2, figure_id: 1, title_id: 5>

>> FigureTitle.last.figure
D, [2019-05-10T00:10:25.300030 #15749] DEBUG -- :   FigureTitle Load (0.2ms)  SELECT  "figure_titles".* FROM "figure_titles"  ORDER BY "figure_titles"."id" DESC LIMIT 1
D, [2019-05-10T00:10:25.300640 #15749] DEBUG -- :   Figure Load (0.1ms)  SELECT  "figures".* FROM "figures" WHERE "figures"."id" = ? LIMIT 1  [["id", 1]]
=> #<Figure id: 1, name: "William H. Bonnie">

>> FigureTitle.all.count
D, [2019-05-10T00:10:33.266984 #15749] DEBUG -- :    (0.2ms)  SELECT COUNT(*) FROM "figure_titles"
=> 2

>> Figure.last
D, [2019-05-10T00:11:06.381417 #15749] DEBUG -- :   Figure Load (0.2ms)  SELECT  "figures".* FROM "figures"  ORDER BY "figures"."id" DESC LIMIT 1
=> #<Figure id: 6, name: "Patrick Ewing">

>> Title.last
D, [2019-05-10T00:11:11.976763 #15749] DEBUG -- :   Title Load (0.2ms)  SELECT  "titles".* FROM "titles"  ORDER BY "titles"."id" DESC LIMIT 1
=> #<Title id: 6, name: "The Hoya Destroya">

>> ft = FigureTitle.create(figure_id: 6, title_id: 6)
D, [2019-05-10T00:11:56.632896 #15749] DEBUG -- :    (0.1ms)  begin transaction
D, [2019-05-10T00:11:56.633979 #15749] DEBUG -- :   SQL (0.5ms)  INSERT INTO "figure_titles" ("figure_id", "title_id") VALUES (?, ?)  [["figure_id", 6], ["title_id", 6]]
D, [2019-05-10T00:11:56.635480 #15749] DEBUG -- :    (1.2ms)  commit transaction
=> #<FigureTitle id: 3, figure_id: 6, title_id: 6>

>> ft.save
D, [2019-05-10T00:11:58.778987 #15749] DEBUG -- :    (0.1ms)  begin transaction
D, [2019-05-10T00:11:58.779385 #15749] DEBUG -- :    (0.0ms)  commit transaction
=> true

>> FigureTitle.all
D, [2019-05-10T00:12:04.277931 #15749] DEBUG -- :   FigureTitle Load (0.3ms)  SELECT "figure_titles".* FROM "figure_titles"
=> #<ActiveRecord::Relation [#<FigureTitle id: 1, figure_id: 5, title_id: 4>, #<FigureTitle id: 2, figure_id: 1, title_id: 5>, #<FigureTitle id: 3, figure_id: 6, title_id: 6>]>

>> FigureTitle.all.count
D, [2019-05-10T00:12:08.830610 #15749] DEBUG -- :    (0.1ms)  SELECT COUNT(*) FROM "figure_titles"
=> 3

>> ft.figure
D, [2019-05-10T00:12:17.608801 #15749] DEBUG -- :   Figure Load (0.1ms)  SELECT  "figures".* FROM "figures" WHERE "figures"."id" = ? LIMIT 1  [["id", 6]]
=> #<Figure id: 6, name: "Patrick Ewing">

>> ft.figure.name
=> "Patrick Ewing"

>> ft.title.name
D, [2019-05-10T00:12:28.888811 #15749] DEBUG -- :   Title Load (0.1ms)  SELECT  "titles".* FROM "titles" WHERE "titles"."id" = ? LIMIT 1  [["id", 6]]
=> "The Hoya Destroya"

>> lnmrk.figure
=> #<Figure id: 6, name: "Patrick Ewing">

>> lnmrk.figure.name
=> "Patrick Ewing"

>> tit
=> #<Title id: 6, name: "The Hoya Destroya">

>> tit.figure
NoMethodError: undefined method `figure' for #<Title id: 6, name: "The Hoya Destroya">
Did you mean?  figures
               figures=
     `method_missing'
    (ripl):56:in `<main>'

>> tit
=> #<Title id: 6, name: "The Hoya Destroya">

>> tit.figures.name
=> "Figure"

>> tit.figure.name
NoMethodError: undefined method `figure' for #<Title id: 6, name: "The Hoya Destroya">
Did you mean?  figures
               figures=
     `method_missing'
    (ripl):59:in `<main>'

>> figure.title.name
NameError: undefined local variable or method `figure' for main:Object
Did you mean?  configure
    (ripl):60:in `<main>'

>> fig
=> #<Figure id: 6, name: "Patrick Ewing">

>> fig.titles
D, [2019-05-10T00:13:34.758601 #15749] DEBUG -- :   Title Load (0.1ms)  SELECT "titles".* FROM "titles" INNER JOIN "figure_titles" ON "titles"."id" = "figure_titles"."title_id" WHERE "figure_titles"."figure_id" = ?  [["figure_id", 6]]
=> #<ActiveRecord::Associations::CollectionProxy [#<Title id: 6, name: "The Hoya Destroya">]>

>> fig.titles.name
=> "Title"

>> fig.titles.select {|x| x.name}
=> [#<Title id: 6, name: "The Hoya Destroya">]

>> fig.titles.select {|x| x[:name]}
=> [#<Title id: 6, name: "The Hoya Destroya">]

>> fig.titles.map {|x| x.name}
=> ["The Hoya Destroya"]

>> fig.titles.map {|x| "#{x.name}"}
=> ["The Hoya Destroya"]
