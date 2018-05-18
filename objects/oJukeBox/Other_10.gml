/// @desc interaction codes

// for now, let's just disable the talking until I get choice UI set up

switch (state) {
	case 0: set_music("mus_harmonica"); state++; break;
	case 1: set_music("mus_mafiaTown"); state++; break;
	case 2: set_music("snd_silence"); state++; break;
	default: set_music("mus_pallet"); state = 0; break;
}