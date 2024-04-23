using Godot;
using System;

public partial class PlayerStats : Node
{
	[Export] public int maxHP = 100;
	[Export] public int HP { get; private set; }
	[Export] public int AttackDamage { get; private set; } = 10;
	[Export] public float AttackSpeed { get; private set; } = 2f;
	[Export] public float MovementSpeed { get; private set; } = 200f;
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

	public void DealDamage(PlayerStats target)
	{
		// Calculate damage dealt based on AttackDamage
		int damageDealt = AttackDamage;

		// Apply damage to the target
		target.TakeDamage(AttackDamage);

		// Apply lifesteal
		int healthToSteal = Mathf.FloorToInt(damageDealt * Lifesteal);
		Heal(healthToSteal);
	}

	// Heal the player
	public void Heal(int amount)
	{
		HP += amount;
		HP = Mathf.Min(HP, maxHP);
	}

	// Player attacks
	public void OnAttack(PlayerStats target)
	{
		DealDamage(target);
	}

}
