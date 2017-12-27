require 'csv'
class Article < ApplicationRecord
  belongs_to :category
  belongs_to :user

  validates :title, :presence => true
  validates :body, :presence => true

  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      article = find_by(id: row["id"]) || new
      article.attributes = row.to_hash
      article.save!
    end
  end

  def self.to_csv(articles, options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      articles.compact.each do |article|
        csv << article.attributes.values
      end
    end
  end
end
