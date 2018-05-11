/// @desc type_to_text(type)
/// @arg type

switch argument0 {
	case 0:		return "Normal";	break;
	case 1:		return "Flying";	break;
	case 2:		return "Electric";	break;
	case 3:		return "Ground";	break;
	case 4:		return "Grass";		break;
	case 5:		return "Fire";		break;
	case 6:		return "Water";		break;
	case 7:		return "Bug";		break;
	case 8:		return "Poison";	break;
	case 9:		return "Rock";		break;
	case 10:	return "Fighting";	break;
	case 11:	return "Psychic";	break;
	case 12:	return "Ghost";		break;
	case 13:	return "Dark";		break;
	case 14:	return "Dragon";	break;
	case 15:	return "Ice";		break;
	case 16:	return "Fairy";		break;
	default:	return "Unknown";	break;
}