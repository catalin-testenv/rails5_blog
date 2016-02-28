## README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* Third party included libs
    font awesome (4.5.0) https://fortawesome.github.io/Font-Awesome/
    foundation sites 6 (6.2.0) https://github.com/zurb/foundation-sites | bower install foundation-sites
    foundation icon fonts 3 http://zurb.com/playground/foundation-icon-fonts-3
    ace code editor (1.2.3) https://github.com/ajaxorg/ace-builds
    sticky (1.0.3) http://stickyjs.com/ | https://github.com/garand/sticky
    bower-uikit (2.25.0) https://github.com/uikit/bower-uikit
    

Help:
    
    PageCategory may have children consisting in either other PageCategories or 
    Pages included or not in main nav.
    
    If a PageCategory has children consisting in other PageCategories or Pages included in main nav 
    it will not be clickable but will expand to its children
    
    If a PageCategory has children consisting in only 0 or more Pages
    NOT included in main nav, it will be clickable and the page that opens will display 
    the list of Pages
    
    In other words:
        For a Page to appear in "main nav" it has to be published and included in main nav
        under some PageCategory or directly in root
        For a Page to appear in "list of articles" it has to be published and NOT included in main nav
        and also all its siblings should NOT be included in main nav
        
    For example, if we have a PageCategory 'movies' having Pages children 'movie_1' and 'movie_2'
    published and NOT included in main nav, then 'movies' will be clickable and the page that opens
    will list excerpts for 'movie_1' and 'movie_2'
    If 'movie_3' would be added under 'movies' and would be published and included in main nav,
    then 'movies' will not be clickable but will expand to 'movie_3', so we could not be able
    to reach 'movie_1' and 'movie_2' from main nav.
    
    TL;DR: 
        in code: category_is_expandable_in_main_nav = (item.has_subcategories? || item.has_nav_pages?)
        A PageCategory will expand if it contains at least one sub-category or at least one Page that should be visible in main nav.
    
    

Guidelines:
    The user should be able to edit header, footer, sidebars without touching theme

Helpers:
    foundation provided css/js
    controller helpers:
        PageCategoriesHelper
        LayoutRegionsHelper
    js: 
        data-code-editor='{"language":"javascript"}'
