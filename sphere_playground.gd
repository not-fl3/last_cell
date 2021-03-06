extends Node

var cell_fn
var viewport_size = Vector2(0, 0)
var rng
var node_2d

func _init(_viewport_size, _rng, _node_2d):
	cell_fn = load("res://cell_fn.gd").new()
	viewport_size = _viewport_size
	rng = _rng
	node_2d = _node_2d

func init_cell():
	return {
		"cell_fn": cell_fn.FN_SPHERE_PLAYGROUND,
		"sphere_mass": 0,
		"rotate": 0,
		"force_value": 0,
		"force": [0, 0, 0, 0, 0, 0, 0, 0],
		"is_player": false
	}

func draw_cell(cell, x, y):
	var label_text = \
		"m:" + str(cell.state.sphere_mass) + "\n" + \
		"r:" + str(cell.state.rotate) + "\n" + \
		"f:" + str(cell.state.force_value) + "\n" + \
		("p" if cell.state.is_player else "")
	
	if cell.geometry == null:
		var label = Label.new()
		label.text = label_text
		label.rect_position = Vector2(
			viewport_size.x * float(x + 0.0)/cell_fn.X_SIZE,
			viewport_size.y * float(y + 0.0)/cell_fn.Y_SIZE
		)
		node_2d.add_child(label)
		
		return label
	else:
		cell.geometry.text = label_text
		return cell.geometry

func update_cell(current_cell, neighbours):
	return current_cell
