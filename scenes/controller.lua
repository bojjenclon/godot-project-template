local CameraController = {
	extends = "Node2D",

	speed = export({
		default = 60, -- Pixels to move per second
		type = float,
	}),
}

function CameraController:_process(dt)
	local movement_vector = Vector2()

	if Input:is_action_pressed("move_right") then
		movement_vector.x = 1
	elseif Input:is_action_pressed("move_left") then
		movement_vector.x = -1
	end

	if Input:is_action_pressed("move_up") then
		movement_vector.y = -1
	elseif Input:is_action_pressed("move_down") then
		movement_vector.y = 1
	end

	local velocity = movement_vector:normalized() * self.speed
	self:set_position(self.position + (velocity * dt))
end

return CameraController
