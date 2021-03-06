ActiveRecord::Schema.define do
  self.verbose = false

  create_table :events, :force => true do |t|
    t.string :gid
    t.string :name
    t.string :description
    t.string :status
    t.datetime :start_at
    t.datetime :end_at
    t.datetime :created_at
    t.datetime :updated_at
  end

  create_table :event_jeus, :force => true do |t|
    t.string :gid
    t.string :name
    t.datetime :start_at
    t.datetime :end_at
    t.datetime :created_at
    t.datetime :updated_at
  end

  create_table :users, :force => true do |t|
    t.string :first_name
    t.string :name
  end
end