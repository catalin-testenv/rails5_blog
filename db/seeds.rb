# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

content = <<'END'
<p>`[Time.now]`</p>
<ul>
  <%=
    ['hello', 'world'].map{|w|"<li>#{w}</li>"}.join("\n").html_safe
  %>
</ul>
<pre data-editor-ace='{"sessionOptions": {"language":"javascript"}, "editorOptions":{"theme":"ace/theme/cobalt"}}'>

    function myFunc () {
        return 'hello';
    }
</pre>
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

comment = <<'END'
<pre>
preformatted
  code
     here
</pre>
<a href='http://catalinenache.com'>link</a>
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
categ_14 = PageCategory.create(name: 'corel articles', parent: categ_8)

page_1 = Page.create(name: 'movie 1', page_category: categ_4, published: true, is_main_nav: true, page_content_attributes: {content: content})
page_2 = Page.create(name: 'movie 2', page_category: categ_4, published: true, is_main_nav: true, page_content_attributes: {content: content})
page_3 = Page.create(name: 'movie 3', page_category: categ_4, published: true, is_main_nav: true, page_content_attributes: {content: content})
page_4 = Page.create(name: 'movie 4', page_category: categ_5, published: true, is_main_nav: true, page_content_attributes: {content: content})
page_5 = Page.create(name: 'movie 5', page_category: categ_5, published: true, is_main_nav: true, page_content_attributes: {content: content})
page_6 = Page.create(name: 'movie 6', page_category: categ_5, published: true, is_main_nav: true, page_content_attributes: {content: content})
page_7 = Page.create(name: 'movie 7', page_category: categ_3, published: true, is_main_nav: true, page_content_attributes: {content: content})
page_8 = Page.create(name: 'gallery 1', page_category: categ_14,  published: true, is_main_nav: false, page_content_attributes: {content: content, excerpt: 'gallery 1 excerpt'})
page_9 = Page.create(name: 'gallery 2', page_category: categ_14, published: true, is_main_nav: false, page_content_attributes: {content: content, excerpt: ''})
page_10 = Page.create(name: 'gallery 3 super long link name', page_category: categ_14, published: true, is_main_nav: false, page_content_attributes: {content: content})
page_11 = Page.create(name: 'gallery 4 super long link name', page_category: categ_13, published: true, is_main_nav: true, page_content_attributes: {content: content})
page_12 = Page.create(name: 'gallery 5 no vectorial category 1', page_category: categ_8, published: true, is_main_nav: true, page_content_attributes: {content: content})
page_13 = Page.create(name: 'gallery 6 no vectorial category 2', page_category: categ_8, published: true, is_main_nav: true, page_content_attributes: {content: content})
page_14 = Page.create(name: 'gallery 7', page_category: categ_12, published: true, is_main_nav: true, page_content_attributes: {content: content})
page_15 = Page.create(name: 'gallery 8', page_category: categ_12, published: true, is_main_nav: true, page_content_attributes: {content: content})
page_16 = Page.create(name: 'gallery 9', page_category: categ_12, published: true, is_main_nav: true, page_content_attributes: {content: content})
page_17 = Page.create(name: 'gallery 10', page_category: categ_11, published: true, is_main_nav: true, page_content_attributes: {content: content})
page_18 = Page.create(name: 'gallery 11', page_category: categ_11, published: true, is_main_nav: true, page_content_attributes: {content: content})
page_19 = Page.create(name: 'gallery 12', page_category: categ_11, published: true, is_main_nav: true, page_content_attributes: {content: content})
page_20 = Page.create(name: 'gallery 13', page_category: categ_11, published: true, is_main_nav: true, page_content_attributes: {content: content})
page_21 = Page.create(name: 'movie 8 comedy no category', page_category: categ_2, published: true, is_main_nav: true, page_content_attributes: {content: content})
page_22 = Page.create(name: 'about movies', page_category: categ_1, published: true, is_main_nav: true, page_content_attributes: {content: content})
page_23 = Page.create(name: 'page 1', published: true, is_main_nav: true, root_page: '1',
                      page_content_attributes: {
                          content: content, meta_css: 'h6 {color:green;}', meta_js: 'function f() {} f();', meta_description: 'description',
                          excerpt: '<strong>excerpt</strong>'}
                      )
# page_23.update(root_page: '1')
page_24 = Page.create(name: 'page 2', published: true, is_main_nav: true, root_page: '0', page_content_attributes: {content: content})
# page_24.update(root_page: '0')

Tag.destroy_all
page_1.tags << Tag.find_or_create_by(name: 'movies')
page_1.tags << Tag.find_or_create_by(name: 'films')
page_2.tags << Tag.find_or_create_by(name: 'movies')
page_2.tags << Tag.find_or_create_by(name: 'films')
page_3.tags << Tag.find_or_create_by(name: 'movies')
page_3.tags << Tag.find_or_create_by(name: 'films')

%w(one two three four five six seven eight nine ten
eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen twenty
twenty_one twenty_two twenty_four twenty_five twenty_six twenty_seven twenty_eight twenty_nine thirty).each do |tag|
  page_1.tags << Tag.find_or_create_by(name: tag)
end


LayoutRegion.destroy_all
LayoutRegion.create(name: 'before_site_content', content: '')
LayoutRegion.create(name: 'before_site_footer', content: '')
LayoutRegion.create(name: 'before_site_header', content: '')
LayoutRegion.create(name: 'before_site_main_navigation', content: '')
LayoutRegion.create(name: 'sidebar_left', content: '')
LayoutRegion.create(name: 'sidebar_right', content: '')
LayoutRegion.create(name: 'site_footer', content: '')
LayoutRegion.create(name: 'site_header', content: '')


Setting.destroy_all

Setting.create(group: '00|site', ordering: 0, key: 'brand_name', val: 'My Blog', kind: 'string', cast: 'to_s', options: nil)
Setting.create(group: '00|site', ordering: 0, key: 'tag_line', val: 'motto here', kind: 'string', cast: 'to_s', options: nil)

Setting.create(group: '01|admin', ordering: 0, key: 'listing_items_per_page', val: '10', kind: 'enum', cast: 'to_i', options: '10|20|50|100|200|500|1000')

Setting.create(group: '02|email', ordering: 0, key: 'inbox_email_address', val: 'me@example.com', kind: 'string', cast: 'to_s', options: nil)

Setting.create(group: '03|page', ordering: 0, key: 'listing_blogs_per_page', val: '10', kind: 'enum', cast: 'to_i', options: '10|20|50|100|200|500|1000')
Setting.create(group: '03|page', ordering: 0, key: 'listing_comments_per_page', val: '10', kind: 'enum', cast: 'to_i', options: '10|20|50|100|200|500|1000')

Setting.create(group: '04|global_inclusions', ordering: 0, key: 'global_css', val: '.my-class {color: red;}', kind: 'text', cast: 'to_s', options: nil)
Setting.create(group: '04|global_inclusions', ordering: 0, key: 'global_javascript', val: 'function myF() {}', kind: 'text', cast: 'to_s', options: nil)


jon = User.find_or_create_by(name: 'Jon Doe')
will = User.find_or_create_by(name: 'Will Smith')

Comment.destroy_all

10.times do |i|
  page_1.comments.create(content: "#{i.to_s} #{comment} #{(i.to_s+' ') * 100}", user: jon)
end
10.times do |i|
  page_2.comments.create(content: "#{i.to_s} #{comment} #{(i.to_s+' ') * 100}", user: will)
end


