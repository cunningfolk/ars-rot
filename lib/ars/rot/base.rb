module Ars
  module ROT
    class Level
      def initialize(int = 0)
        @int = int
      end
      def to_int
        @int
      end
      def inspect
        to_s
      end
      def to_s
        to_int
      end
      def push
        old = @int
        @int += 1
        old
      end
      def pop
        old = @int
        @int -= 1
        old
      end
    end
    class Base

      def self.rot_for(obj)
        const = obj.singleton_class ? obj.class : obj
        name = const.name.split('::')
        namespace = self.name.split('::')
        top = namespace[0..2].join('::')
        while namespace.size > 0
          potential = self.class.const_get( (namespace + name).join('::') )
          namespace.pop
          if potential && potential.name.split('::').size > 1
            return potential if potential
          end
        end
        self.class.const_get("#{top}::Generic")
      end

      attr_reader :object, :deps
      def initialize(obj)
        @object = obj
        find_deps
      end

      def level
        @@level ||= Level.new
      end

      def find_deps
      end

      def render
        old = level.push
        out = render_as.gsub(/^/, '  ' * old)
        level.pop
        out
      end
    end
  end
end
