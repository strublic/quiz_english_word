class Language < ApplicationRecord
    has_many :words
    
    validates :name, presence: true, inclusion: { in: LanguageList::COMMON_LANGUAGES.map(&:name)}
end
