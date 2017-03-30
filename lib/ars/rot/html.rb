module Ars
  module ROT
    class HTML < Ars::ROT::Base
      include Ars::ROT::Layout

      def css_classes
        [
          "level-#{level}"
        ].join(' ')
      end

      class Hash < HTML
        def find_deps
          @deps = object.map{|k,v| KV.new [k,v]}
        end
        def render_as
          <<-eos.left_align
          <div>
            #{deps.map(&:render).join}
          </div>
          eos
        end
        class KV < Hash
          def find_deps
            rot = self.class.rot_for(object[1])
            @deps = [rot.new(object[1])]
          end
          def render_as
            <<-eos.left_align
            <div class='#{css_classes}'>
              <div>
                #{object[0]}
              </div>
              <div>
                #{deps.map(&:render).join}
              </div>
            </div>
            eos
          end
        end
      end

      class Generic < HTML
        def render_as
          <<-eos.left_align
          <div>
            #{object.to_s}
          </div>
          eos
        end
      end
    end
  end
end
