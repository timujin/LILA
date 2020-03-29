extends Resource

class_name CombatCard

export(String) var id
export(String) var title
export(Texture) var icon
export(String) var description
export(String) var category
export(int) var ap_cost

export(GDScript) var appearance_condition
export(GDScript) var effect
export(Dictionary) var other_data = {} # String -> anything