class User < ActiveRecord::Base
  def to_displayable_content
    "#{id}.  Name: #{name}  E-Mail: #{email}"
  end
end