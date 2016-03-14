class AddPageContentFk < ActiveRecord::Migration[5.0]
  def change
    # PageContent.connection.execute(%q`ALTER TABLE page_contents DROP FOREIGN KEY fk_page_id`)
    PageContent.connection.execute(%q`ALTER TABLE page_contents ADD CONSTRAINT fk_page_id FOREIGN KEY (page_id) REFERENCES pages(id) ON DELETE CASCADE`)
  end
end
