using Godot;
using System;

public partial class PlayerControls : Node2D
{
	private PlayerStats PlayerStats;
	private AnimationPlayer AnimationPlayer;

	public override void _Ready()
	{
		PlayerStats = GetNode<PlayerStats>("PlayerStats");
		AnimationPlayer = GetNode<AnimationPlayer>("AnimationPlayer");
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
		if (velocity.Length() > 0)
		{
			velocity = velocity.Normalized();
			Position += velocity * PlayerStats.MovementSpeed * (float)delta;
			
			// Calculate the rotation in radians and set the rotation of the player
			Rotation = velocity.Angle() + Mathf.Pi / 2;
			
			AnimationPlayer.Play("player_walk");
		}
	}
}
