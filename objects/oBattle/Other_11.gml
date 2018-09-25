/// @description end battle animation
if animation_state == 0 {
	animation_state = 9;
} else if animation_state == 9 {
	instance_destroy();
}

/*	pseudocode
Pokemon fainted
Winner gained exp points
Trainer is about to use pokemon
...
Pokemon fainted
winner gained exp points
player defeated trainer
trainer dialog
player got money for winning
fadeout

okay, so I got the pokemon fainting on the move script object. Looking again at the sequence above, it seems as
though the logical place to call this event would be in the AI script. On the other hand, it needs a check to
make sure it isn't just the first of several trainers to fall. That shouldn't be too difficult, actually. All I
need to do is set a check in the AI script that consults battle for remaining pokemon on one side

okay, now how do I handle the pokemon fainting? I need an animation state for that too, don't I?
well, at least a simple one. It needs to be able to move the fainted pokemon down below screen,
then read when it reaches a certain point and display text. And also grant exp to the victor/s.
after that, it needs to check whether the trainer has another pokemon and pick one to switch in
otherwise, it needs to display defeat text and exit the battle, but only if there are no other active pokemon
so essentially I may be able to handle the faint animation in the move, before checking for a replacement
and the battle itself should move to an ending phase when it determines a winner

okay, new problem. I just had a test where the player's first pokemon fainted. The game sent me to the selection
menu as intended, but then ended the battle before I could select a new pokemon. I'm thinking I need to do the
end battle check in the AI script instead of the battle step event.