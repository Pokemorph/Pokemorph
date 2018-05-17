/// @description Remove vision and collision
// since this door is always open, set solid permanently to false

// Inherit the parent event
event_inherited();

solid = false;
invisible = true;