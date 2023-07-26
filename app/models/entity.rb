class Entity
  SPRITE_SIZE = 16
  SPRITE_SCALE = 4
  DIRECTION_OF_COLLECTIONS = :vertical
  FRAMES_PER_COLLECTION = 1
  TICKS_PER_FRAME = 6
  TILES_ORIGIN_X = 0
  TILES_ORIGIN_Y = 0

  def initialize(x:, y:, w: SPRITE_SIZE, h: SPRITE_SIZE)
    @x = x
    @y = y
    @w = w
    @h = h
  end

  def cycling_animated_sprite
    tile_index = @animation_started_at.frame_index(self.class::FRAMES_PER_COLLECTION, self.class::TICKS_PER_FRAME, true)

    tile_x_index = self.class::DIRECTION_OF_COLLECTIONS == :vertical   ? @frames_collection : tile_index
    tile_y_index = self.class::DIRECTION_OF_COLLECTIONS == :horizontal ? @frames_collection : tile_index

    $gtk.args.outputs.debug << [@x, @y, tile_index, 255, 0, 0].label

    {
      x: @x, y: @y,
      w: @w, h: @h,
      path: self.class::SPRITE_SHEET,
      tile_x: self.class::TILES_ORIGIN_X + (tile_x_index * @w),
      tile_y: self.class::TILES_ORIGIN_Y + (tile_y_index * @h),
      tile_w: @w, tile_h: @h
    }.scale_rect(self.class::SPRITE_SCALE)
  end
end
