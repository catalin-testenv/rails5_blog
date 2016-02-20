# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PageCategory.destroy_all
Page.destroy_all

categ_1 = PageCategory.create(name: 'movies')
categ_2 = PageCategory.create(name: 'comedy', parent: categ_1)
categ_3 = PageCategory.create(name: 'fantasy', parent: categ_1)
categ_4 = PageCategory.create(name: 'black', parent: categ_2)
categ_5 = PageCategory.create(name: 'white', parent: categ_2)
categ_6 = PageCategory.create(name: 'gallery')
categ_7 = PageCategory.create(name: 'photoshop', parent: categ_6)
categ_8 = PageCategory.create(name: 'vectorial', parent: categ_6)
categ_9 = PageCategory.create(name: 'web design', parent: categ_6)
categ_10 = PageCategory.create(name: 'digital art', parent: categ_7)
categ_11 = PageCategory.create(name: 'photo retouch', parent: categ_10)
categ_12 = PageCategory.create(name: 'pictures', parent: categ_10)
categ_13 = PageCategory.create(name: 'illustrator', parent: categ_8)
categ_14 = PageCategory.create(name: 'corel', parent: categ_8)

page_1 = Page.create(name: 'movie 1', content: 'movie 1', page_category: categ_4, published: true, is_main_nav: true)
page_2 = Page.create(name: 'movie 2', content: 'movie 2', page_category: categ_4, published: true, is_main_nav: true)
page_3 = Page.create(name: 'movie 3', content: 'movie 3', page_category: categ_4, published: true, is_main_nav: true)
page_4 = Page.create(name: 'movie 4', content: 'movie 4', page_category: categ_5, published: true, is_main_nav: true)
page_5 = Page.create(name: 'movie 5', content: 'movie 5', page_category: categ_5, published: true, is_main_nav: true)
page_6 = Page.create(name: 'movie 6', content: 'movie 6', page_category: categ_5, published: true, is_main_nav: true)
page_7 = Page.create(name: 'movie 7', content: 'movie 7', page_category: categ_3, published: true, is_main_nav: true)
page_8 = Page.create(name: 'gallery 1', content: 'gallery 1', page_category: categ_14, published: true, is_main_nav: true)
page_9 = Page.create(name: 'gallery 2', content: 'gallery 2', page_category: categ_14, published: true, is_main_nav: true)
page_10 = Page.create(name: 'gallery 3 super long link name', content: 'gallery 3', page_category: categ_14, published: true, is_main_nav: true)
page_11 = Page.create(name: 'gallery 4 super long link name', content: 'gallery 4', page_category: categ_13, published: true, is_main_nav: true)
page_12 = Page.create(name: 'gallery 5 no vectorial category 1', content: 'gallery 5', page_category: categ_8, published: true, is_main_nav: true)
page_13 = Page.create(name: 'gallery 6 no vectorial category 2', content: 'gallery 6', page_category: categ_8, published: true, is_main_nav: true)
page_14 = Page.create(name: 'gallery 7', content: 'gallery 7', page_category: categ_12, published: true, is_main_nav: true)
page_15 = Page.create(name: 'gallery 8', content: 'gallery 8', page_category: categ_12, published: true, is_main_nav: true)
page_16 = Page.create(name: 'gallery 9', content: 'gallery 9', page_category: categ_12, published: true, is_main_nav: true)
page_17 = Page.create(name: 'gallery 10', content: 'gallery 10', page_category: categ_11, published: true, is_main_nav: true)
page_18 = Page.create(name: 'gallery 11', content: 'gallery 11', page_category: categ_11, published: true, is_main_nav: true)
page_19 = Page.create(name: 'gallery 12', content: 'gallery 12', page_category: categ_11, published: true, is_main_nav: true)
page_20 = Page.create(name: 'gallery 13', content: 'gallery 13', page_category: categ_11, published: true, is_main_nav: true)
page_21 = Page.create(name: 'movie 8 comedy no category', content: 'movie 8', page_category: categ_2, published: true, is_main_nav: true)
page_22 = Page.create(name: 'about movies', content: 'about movies', page_category: categ_1, published: true, is_main_nav: true)
page_23 = Page.create(name: 'page 1', content: 'page 1', published: true, is_main_nav: true, root_page: '1')
# page_23.update(root_page: '1')
page_24 = Page.create(name: 'page 2', content: 'page 2', published: true, is_main_nav: true, root_page: '0')
# page_24.update(root_page: '0')









