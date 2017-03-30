module Ars::ROT
  RSpec.describe HTML do
    example do
      obj = {
        a: [1, 2, 3],
        b: "Hi",
        c: true,
        d: false,
        e: nil
      }
      
      html = HTML.layout(obj)
      html.render
      p html.level.inspect
    end
  end
end
