extends Resource

class_name InventoryEntry

export(Resource) var species
export(int) var amount
export(bool) var equipped
export(String) var error_message # For MissingNo

func _init(id, amount = 0):
	self.species = Item.load_by_id(id)
	if self.species.id == "MissingNo":
		error_message = "Item ID: %s" % id
	else:
		error_message = null
	self.amount = amount
	self.equipped = false
	
func is_id(id:String):
	return id.to_lower() == species.id.to_lower()
	
func add_items(amount:int):
	self.amount += amount
	
func remove_items(amount:int):
	self.amount -= amount
	self.amount = max(self.amount, 0)
	
func bring_up_to_amount(amount:int):
	self.amount = max(self.amount, amount)
		
func is_enough_items(amount:int):
	return self.amount >= amount
	
func is_empty():
	return self.amount <= 0