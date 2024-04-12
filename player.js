class GameScene extends Phaser.Scene {

    constructor() {
        super({ key: 'Game' });
    }

    // Initialize player speed
    init() {
        this.playerSpeed = 1.5;
    }

    // TODO: Player sprite art. Blue box placeholder sprite for now.
    preload() {
        var graphics = this.make.graphics();
        graphics.fillStyle(0x0000FF, 1);
        graphics.fillRect(0, 0, 20, 20);
        graphics.generateTexture('player', 20, 20);
    }

    // Create player sprite 
    create() {
        this.player = this.add.sprite(window.innerWidth / 2, window.innerHeight / 2, 'player');
        this.player.setInteractive();

        // Arrow keys for movement
        this.cursors = this.input.keyboard.createCursorKeys();
    }

    // Player movement
    update() {
        // Handles left/right movement
        if (this.cursors.left.isDown) {
            this.player.x -= this.playerSpeed;
        } else if (this.cursors.right.isDown) {
            this.player.x += this.playerSpeed;
        }

        // Handles up/down movement
        if (this.cursors.up.isDown) {
            this.player.y -= this.playerSpeed;
        } else if (this.cursors.down.isDown) {
            this.player.y += this.playerSpeed;
        }
    }
}

window.onload = function () {
    if (typeof Phaser !== "undefined") {
        window.gameScene = new GameScene();

        window.game = new Phaser.Game({
            type: Phaser.AUTO,
            width: window.innerWidth,
            height: window.innerHeight,
            scene: [gameScene],
            backgroundColor: '#5F8575'
        });
    } else {
        console.log("Phaser is undefined :(");
    }
}