class DefaultScene
  def initialize
    @tim = Tim.new(x: 600, y: 600)
  end

  def tick(args)
    # For debug purpose
    $gtk_args = args

    args.outputs.labels << [args.grid.left.shift_right(5), args.grid.top.shift_down(5),
                            "This is a label located at the top left."]

    case args.inputs.keyboard.up_down
    when -1
      case args.inputs.keyboard.left_right
      when -1 then @tim.go_down_left
      when  0 then @tim.go_down
      when  1 then @tim.go_down_right
      end
    when 0
      case args.inputs.keyboard.left_right
      when -1 then @tim.go_left
      when  0 then @tim.idle
      when  1 then @tim.go_right
      end
    when 1
      case args.inputs.keyboard.left_right
      when -1 then @tim.go_up_left
      when  0 then @tim.go_up
      when  1 then @tim.go_up_right
      end
    end

    args.outputs.sprites << @tim.sprite
  end
end
