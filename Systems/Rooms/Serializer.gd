extends Node

class_name Serializer

#signal serialized
#signal deserialized

func serialize():
	assert(false)
	
func deserialize():
	assert(false)
	
	
func load_data(default):
	var roomid = get_parent().roomID
	print("inputs", roomid, default)
	return Character.rooms.deserialize(roomid, default)

func store_data(data):
	var roomid = get_parent().roomID
	return Character.rooms.serialize(roomid, data)
	
