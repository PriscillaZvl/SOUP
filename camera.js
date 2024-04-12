class Camera {
    constructor(scene, player) {
        this.scene = scene;
        this.player = player;
        this.camera = this.scene.cameras.main;
    }

    interpolation_x = 0.5;
    interpolation_y = 0.5;

    startFollow() {
        this.camera.startFollow(this.player.sprite);
        this.camera.setFollowStyle(Phaser.Cameras.Scene2D.Camera.FOLLOW_LOCKON, interpolation_x, interpolation_y);
        this.camera.setLerp(interpolation_x, interpolation_y);
    }
}

export default Camera;