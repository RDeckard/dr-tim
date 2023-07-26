require "app/models/entity.rb"
require "app/models/tim.rb"
require "app/scenes/default_scene.rb"

def tick(args)
  args.state.current_scene ||= DefaultScene.new

  args.state.current_scene.tick(args)
end
