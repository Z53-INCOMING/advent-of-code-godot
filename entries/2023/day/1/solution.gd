extends Node

var input_dir: String:
	get:
		return get_script().resource_path.get_base_dir()

func part_1(input_filename: String):
	var string = get_input_string(input_filename)
	var list = string.rsplit("\n")
	var sum = 0
	var digit_check = "0123456789"
	
	for line in list:
		var digit_list = []
		for char in line:
			if char in digit_check:
				digit_list.append(char)
		if !digit_list.is_empty():
			sum += int(digit_list[0] + digit_list[digit_list.size() - 1])
	
	print(sum)

func part_2(input_filename: String):
	var string = get_input_string(input_filename)
	var list = string.rsplit("\n")
	
	for i in list.size():
		var line := list[i] as String
		line = line.replace("one", "1").replace("two", "2").replace("three", "3").replace("four", "4").replace("five", "5").replace("six", "6").replace("seven", "7").replace("eight", "8").replace("nine", "9")
		list[i] = line
	
	var sum = 0
	
	for line in list:
		var digit_list = []
		for char in line:
			if char.is_valid_int():
				digit_list.append(char)
		if !digit_list.is_empty():
			sum += int(digit_list.front() + digit_list.back())
		
	print(list)
	print(sum)

func get_input_string(input_filename: String) -> String:
	var path = input_dir + "/" + input_filename
	print("Parsing %s" % path)
	
	return FileAccess.get_file_as_string(path).strip_edges().replace("\r\n", "\n")
