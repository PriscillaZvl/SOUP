shader_type particles;

uniform float emission_radius;
uniform float explosion_strength;
uniform vec3 start_color;
uniform vec3 end_color;
uniform float LIFETIME_MAX;

void process() {
    // Use TIME value to get a random value per particle
    float random_value = fract(sin(dot(VELOCITY.xy ,vec2(12.9898,78.233))) * 43758.5453);
    float angle = random_value * 2.0 * PI;

    // Emit the particles in a circular pattern
    VELOCITY.xy = vec2(cos(angle), sin(angle)) * emission_radius;
    
    // Apply an explosive force to scatter the particles
    VELOCITY += normalize(VELOCITY) * explosion_strength;

    // Interpolate the color from start_color to end_color based on lifetime
    COLOR = vec4(mix(start_color, end_color, LIFETIME / LIFETIME_MAX), 1.0);
}

void start() {
	// Called when a particle is spawned.
}