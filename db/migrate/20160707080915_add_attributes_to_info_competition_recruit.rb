class AddAttributesToInfoCompetitionRecruit < ActiveRecord::Migration
  def change
    add_column :info_competition_recruits, :school_person, :string
    add_column :info_competition_recruits, :school_phone, :string
  end
end
