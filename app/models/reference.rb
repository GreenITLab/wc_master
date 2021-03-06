class Reference < ActiveRecord::Base

  has_paper_trail :on=>[:create, :destroy]
  
  belongs_to :relationship, :counter_cache => true 
  belongs_to :user
  
  validates_url_format_of :reference_content,
                          :allow_nil => true,
                          :message => ' is not a valid URL'
                          
  validates :reference_content, :presence => true, :uniqueness => {:scope => :relationship_id, :message => ' is already submitted.'}                     

end
