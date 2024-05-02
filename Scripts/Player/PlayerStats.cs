using Godot;
using System;

public partial class PlayerStats : Node
{
	[Export] public int maxHP = 100;
	[Export] public int HP { get; private set; }
	[Export] public int FireDamage { get; private set; } = 10;
	[Export] public int LanceDamage { get; private set; } = 5;
	[Export] public float AttackSpeed { get; private set; } = 2f;
	[Export] public float MovementSpeed { get; private set; } = 50f;
	[Export] public float DodgeChance { get; private set; } = 0.01f;
	[Export] public float Lifesteal { get; private set; } = 0f;

	public void TakeDamage(int amount)
	{
		// Dodge chance calculation
		if (GD.Randf() <= DodgeChance)
		{
			return;
		}

		// Health calculation
		HP -= amount;
		HP = Mathf.Max(HP, 0);
	}
}
