class InitialSchema < ActiveRecord::Migration[5.2]
  def up
    create_table :stories do |t|
      t.string :title, null: false
      t.text :description
      t.integer :board_id
      t.integer :source_id
      t.integer :external_id
      t.integer :priority
      t.integer :type_id
      t.integer :status_id
      t.integer :assigned_to
      t.integer :created_by
      t.integer :order

      t.timestamps
    end

    create_table :story_types do |t|
      t.string :name, null: false

      t.integer :order
    end

    create_table :tags do |t|
      t.string :name, null: false
    end

    create_join_table :stories, :tags do |t|
      t.index :story_id
      t.index :tag_id
    end

    create_table :boards do |t|
      t.string :name, null: false
      t.integer :order

      t.timestamps
    end

    create_table :tasks do |t|
      t.integer :name
      t.integer :story_id
      t.integer :status
      t.integer :order
      t.timestamps

      t.index :story_id
    end

    create_table :story_comments do |t|
      t.integer :story_id
      t.text :text, null: false

      t.index :story_id
    end

    create_table  :attachments do |t|
      t.string :url
      t.text :meta
      t.integer :attachable_id
      t.string :attachable_type

      t.timestamps
    end

    create_table :users do |t|
      t.string :full_name
      t.string :password_digest
      t.string :avatar
      t.boolean :enabled
      t.integer :role
      
      t.timestamps
    end
  end

  def down
    ActiveRecord::Base.connection.tables.each do |table|
      next if table == 'schema_migrations'
      drop_table table
    end
  end
end
