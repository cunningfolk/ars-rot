require 'ars/terra'

module Ars
  module ROT
    module Layout
      def self.included(subclass)
        subclass.extend(ClassHelpers)
      end
      module ClassHelpers
        def layout(obj)
          rot = rot_for(obj)
          rot.new(obj)
        end
      end
    end
  end
end
