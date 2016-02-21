# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

content = <<END.gsub(/\s+/, " ").strip
<h2>The standard Lorem Ipsum passage, used since the 1500s</h2>
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

<h3>Section 1.10.32 of "de Finibus Bonorum et Malorum", written by Cicero in 45 BC</h3>
Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?

<h4>1914 translation by H. Rackham</h4>
But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?

<h5>Section 1.10.33 of "de Finibus Bonorum et Malorum", written by Cicero in 45 BC</h5>
At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.

<h6>1914 translation by H. Rackham</h6>
On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.
END

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

page_1 = Page.create(name: 'movie 1', content: content, page_category: categ_4, published: true, is_main_nav: true)
page_2 = Page.create(name: 'movie 2', content: content, page_category: categ_4, published: true, is_main_nav: true)
page_3 = Page.create(name: 'movie 3', content: content, page_category: categ_4, published: true, is_main_nav: true)
page_4 = Page.create(name: 'movie 4', content: content, page_category: categ_5, published: true, is_main_nav: true)
page_5 = Page.create(name: 'movie 5', content: content, page_category: categ_5, published: true, is_main_nav: true)
page_6 = Page.create(name: 'movie 6', content: content, page_category: categ_5, published: true, is_main_nav: true)
page_7 = Page.create(name: 'movie 7', content: content, page_category: categ_3, published: true, is_main_nav: true)
page_8 = Page.create(name: 'gallery 1', content: content, page_category: categ_14, published: true, is_main_nav: true)
page_9 = Page.create(name: 'gallery 2', content: content, page_category: categ_14, published: true, is_main_nav: true)
page_10 = Page.create(name: 'gallery 3 super long link name', content: content, page_category: categ_14, published: true, is_main_nav: true)
page_11 = Page.create(name: 'gallery 4 super long link name', content: content, page_category: categ_13, published: true, is_main_nav: true)
page_12 = Page.create(name: 'gallery 5 no vectorial category 1', content: content, page_category: categ_8, published: true, is_main_nav: true)
page_13 = Page.create(name: 'gallery 6 no vectorial category 2', content: content, page_category: categ_8, published: true, is_main_nav: true)
page_14 = Page.create(name: 'gallery 7', content: content, page_category: categ_12, published: true, is_main_nav: true)
page_15 = Page.create(name: 'gallery 8', content: content, page_category: categ_12, published: true, is_main_nav: true)
page_16 = Page.create(name: 'gallery 9', content: content, page_category: categ_12, published: true, is_main_nav: true)
page_17 = Page.create(name: 'gallery 10', content: content, page_category: categ_11, published: true, is_main_nav: true)
page_18 = Page.create(name: 'gallery 11', content: content, page_category: categ_11, published: true, is_main_nav: true)
page_19 = Page.create(name: 'gallery 12', content: content, page_category: categ_11, published: true, is_main_nav: true)
page_20 = Page.create(name: 'gallery 13', content: content, page_category: categ_11, published: true, is_main_nav: true)
page_21 = Page.create(name: 'movie 8 comedy no category', content: content, page_category: categ_2, published: true, is_main_nav: true)
page_22 = Page.create(name: 'about movies', content: content, page_category: categ_1, published: true, is_main_nav: true)
page_23 = Page.create(name: 'page 1', content: content, published: true, is_main_nav: true, root_page: '1')
# page_23.update(root_page: '1')
page_24 = Page.create(name: 'page 2', content: content, published: true, is_main_nav: true, root_page: '0')
# page_24.update(root_page: '0')









