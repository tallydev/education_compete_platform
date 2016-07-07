class AddAttributesToTalkCompetitionRecruit < ActiveRecord::Migration
  def change
    add_column :talk_competition_recruits, :school_person, :string
    add_column :talk_competition_recruits, :school_phone, :string
  end
end
