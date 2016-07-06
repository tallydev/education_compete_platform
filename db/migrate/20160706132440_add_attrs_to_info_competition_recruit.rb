class AddAttrsToInfoCompetitionRecruit < ActiveRecord::Migration
  def change
    add_column :info_competition_recruits, :project, :string
    add_column :info_competition_recruits, :name, :string
    add_column :info_competition_recruits, :version, :string
    add_column :info_competition_recruits, :comment, :text
    add_column :info_competition_recruits, :cooperater_1, :string
    add_column :info_competition_recruits, :school_1, :string
    add_column :info_competition_recruits, :course_1, :string
    add_column :info_competition_recruits, :cooperater_2, :string
    add_column :info_competition_recruits, :school_2, :string
    add_column :info_competition_recruits, :course_2, :string
    add_column :info_competition_recruits, :cooperater_3, :string
    add_column :info_competition_recruits, :school_3, :string
    add_column :info_competition_recruits, :course_3, :string
  end
end
