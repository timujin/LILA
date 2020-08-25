extends Position2D

class_name BlurbPoint

func display(text:String,icon:Texture=null, buttontext=null, call_target=null, callback=null):
	ItemInteractionPopup.display(text, icon, buttontext, self)
	ItemInteractionPopup.call_target = call_target
	ItemInteractionPopup.callback = callback
