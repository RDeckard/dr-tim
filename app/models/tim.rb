class Tim < Entity
  SPRITE_SHEET = "assets/images/tim_animations.png".freeze
  FRAMES_COLLECTIONS = { idle: 0, up: 1, down: 2, left: 3, right: 4 }.freeze
  FRAMES_PER_COLLECTION = 4
  TICKS_PER_FRAME = 12
  PIXELS_PER_STEP = 8
  SQUARED_PIXELS_PER_STEP = Math.sqrt(PIXELS_PER_STEP) * 2

  def initialize(x:, y:)
    super(x: x, y: y)

    go_down
  end

  def idle
    animation(:idle, frames_collection: :idle)
  end

  def go_up
    @y += PIXELS_PER_STEP
    animation(:go_up, frames_collection: :up)
  end

  def go_down
    @y -= PIXELS_PER_STEP
    animation(:go_down, frames_collection: :down)
  end

  def go_left
    @x -= PIXELS_PER_STEP
    animation(:go_left, frames_collection: :left)
  end

  def go_right
    @x += PIXELS_PER_STEP
    animation(:go_right, frames_collection: :right)
  end

  def go_up_left
    @x -= SQUARED_PIXELS_PER_STEP; @y += SQUARED_PIXELS_PER_STEP
    animation(:go_up_left, frames_collection: :up)
  end

  def go_up_right
    @x += SQUARED_PIXELS_PER_STEP; @y += SQUARED_PIXELS_PER_STEP
    animation(:go_up_right, frames_collection: :up)
  end

  def go_down_left
    @x -= SQUARED_PIXELS_PER_STEP; @y -= SQUARED_PIXELS_PER_STEP
    animation(:go_down_left, frames_collection: :down)
  end

  def go_down_right
    @x += SQUARED_PIXELS_PER_STEP; @y -= SQUARED_PIXELS_PER_STEP
    animation(:go_down_right, frames_collection: :down)
  end

  def animation(action, frames_collection:)
    return if action == @current_action

    @current_action       = action
    @animation_started_at = $gtk.args.state.tick_count
    @frames_collection    = FRAMES_COLLECTIONS[frames_collection]
  end

  def sprite
    cycling_animated_sprite
  end
end
