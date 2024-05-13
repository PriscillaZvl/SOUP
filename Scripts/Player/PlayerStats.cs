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
	[Export] public bool Lance { get; private set; } = true;
	[Export] public bool FireSpell { get; private set; } = true;

	// Declare the signal for WeaponRepeat.gd
	[Signal] public delegate void AttackSpeedChangedEventHandler(float newSpeed);
	
	public override void _Ready()
	{
		RandomizeWeapon();
	}

	public void TakeDamage(int amount)
	{
		if (GD.Randf() <= DodgeChance)
			return;

		HP -= amount;
		HP = Mathf.Max(HP, 0);
	}

	public float GetAttackSpeed()
	{
		return AttackSpeed;
	}

	public void SetAttackSpeed(float newSpeed)
	{
		if (AttackSpeed != newSpeed)
		{
			AttackSpeed = newSpeed;
			EmitSignal(nameof(AttackSpeedChanged), newSpeed);
		}
	}
	
	public void Heal(int amount)
	{
		HP += amount;
		
		if (HP > maxHP)
			HP = maxHP;
	}
	
	private void RandomizeWeapon()
	{
		if (GD.Randi() % 2 == 0)
		{
			Lance = true;
			FireSpell = false;
			GD.Print("Using Lance!");
		}
		else {
			Lance = false;
			FireSpell = true;
			GD.Print("Using FireSpell!");
		}
	}
}
