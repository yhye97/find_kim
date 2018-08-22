class CreateFjobs < ActiveRecord::Migration
  def change
    create_table :fjobs do |t|
      t.string :name
      t.string :nickname
      t.string :portfolio_img
      t.string :category
      t.string :career
      t.integer :contract
      t.string :date
      t.integer :starttime #몇시시작
      t.integer :endtime #몇시 끝남
      t.integer :timetotal #몇시간 근무
      t.string :home_environment  #true: 재택근무 / false: 출근
      t.string :location #근무 지역
      t.timestamps null: false
    end
  end
end
