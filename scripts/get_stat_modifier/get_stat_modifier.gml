///@function get_stat_modifier()
///@description returns a multiplier value from the specified adjustment level
///@argument level

var lvl = argument0;

switch lvl	{
	case -4:	var mult = 0.5; break;
	case -3:	var mult = 0.55; break;
	case -2:	var mult = 0.65; break;
	case -1:	var mult = 0.8; break;
	case 1:		var mult = 1.4; break;
	case 2:		var mult = 1.7; break;
	case 3:		var mult = 1.9; break;
	case 4:		var mult = 2.0; break;
	default:	var mult = 1;
} return mult;