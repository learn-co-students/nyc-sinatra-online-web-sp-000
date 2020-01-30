FiguresController
  allows you to view form to create a new figure
  allows you to create a new figure with a title
  allows you to create a new figure with a landmark
  allows you to create a new figure with a new title
  allows you to create a new figure with a new landmark
  creates checkboxes for all the landmarks and titles created on the Figures new page
  allows you to list all figures
  allows you to see a single Figure
  allows you to view form to edit a single figure
  allows you to edit a single figure
LandmarksController
  allows you to view form to create a new landmark
  allows you to create a new landmark
  allows you to list all landmarks
  allows you to see a single landmark
  allows you to view the form to edit a single landmark
  allows you to edit a single landmark
Figure
  has a name
  has many landmarks
  has many titles
Landmark
  has a name and a year_completed
  belongs to a figure
Title
  has a name
  has many figures
Finished in 1.62 seconds (files took 1.61 seconds to load)
23 examples, 0 failures
