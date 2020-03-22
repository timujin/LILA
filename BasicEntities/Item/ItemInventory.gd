extends Resource

class_name ItemInventory

signal item_gained (item, amount)

export(Resource) var species
export(int) var amount


func _init(id):
	var item = GlobalRegister.item(id)
	if item == null:
		return null
	self.species = species
	self.amount = 0
	
func is_id(id:String):
	return id == species.id
	
func add_items(amount:int):
	self.amount += amount
	
func remove_items(amount:int):
	self.amount -= amount
	self.amount = max(self.amount, 0)
	
func bring_up_to_amount(amount:int):
	self.amount = max(self.amount, amount)
		
func is_enough_items(amount:int):
	return self.amount >= amount