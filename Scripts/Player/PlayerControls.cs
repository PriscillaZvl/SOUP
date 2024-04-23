using Godot;
using System;

public partial class PlayerControls : Node2D
{
	private PlayerStats PlayerStats;
	
	public override void _Ready()
	{
		PlayerStats = GetNode<PlayerStats>("PlayerStats");
	}
	
	
	public override void _Process(double delta)
	{
		Vector2 velocity = new Vector2();

		// Input controls
		if (Input.IsActionPressed("Up"))
			velocity.Y -= 1;
		if (Input.IsActionPressed("Down"))
			velocity.Y += 1;
		if (Input.IsActionPressed("Left"))
			velocity.X -= 1;
		if (Input.IsActionPressed("Right"))
			velocity.X += 1;

		// Normalize the velocity so it's independent of framerate
		Position += velocity.Normalized() * PlayerStats.MovementSpeed * (float)delta;
	}
}
