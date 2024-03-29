class MoveBodyFromShoutsToTextShouts < ActiveRecord::Migration
  def up
    add_column :shouts, :medium_type, :string
    add_column :shouts, :medium_id, :integer
    select_all("SELECT id, body, created_at, updated_at FROM shouts").each do |shout|
      id = insert <<-SQL
        INSERT INTO text_shouts (body, created_at, updated_at)
        values ("#{shout["body"]}", "#{shout["created_at"]}", "#{shout["created_at"]}")
      SQL
      update <<-SQL
        UPDATE shouts
        SET medium_type ="TextShout", medium_id=#{id}
        WHERE shouts.id = #{shout["id"]}
      SQL
    end
    remove_column :shouts, :body
  end

      update <<-SQL
        UPDATE shouts
        SET body="#{text_shout["body"]}"
        WHERE medium_id=#{text_shout["id"]}
      SQL
    end
    remove_column :shouts, :medium_id
    remove_column :shouts, :medium_type
    delete("DELETE FROM text_shouts");
  end

end
