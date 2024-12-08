extends AudioStreamPlayer

const level_music = preload('res://assets/Moonbeams.mp3')

func _play_music(music: AudioStream):
    if stream == music:
        return
    stream = music
    volume_db = -20.0
    play()

func play_level_music():
    _play_music(level_music)