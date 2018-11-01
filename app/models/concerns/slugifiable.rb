require 'pry'
module Slug
  module InstanceMethods
    def slug
      self.name.gsub(/[ ]/, '-')
    end
  end

  module ClassMethods

    def find_by_slug(slugged_name)
      binding.pry
      self.all.select {|obj| obj.slug == slugged_name}

    end

  end
end
