extends StaticBody3D
class_name Book
@onready var volume = %Volume

@export var current_world: String = ""
@export var book_number: int = 0

var tutorial_info = [
	"Hey you found an information book! There may be one or more of these books around each level. Some books are here to give general information like this one, or give insights to real world applications of cyber security and others may help you solve a particular puzzle. You never know so you should read them all!"
]

var world1_info = [
	"""
	Welcome to World 1. Here the password is not as obvious as the tutorial. You'll have to be wittier than that.
	This room explore cryptography. Cryptography is used in everyday transactions with varying degrees of complexity. One of the oldest ciphers was the Caesar cipher which substituted alphabets by shifting the letters by 3. Nowadays cracking ciphers is much more difficult and backed by a lot more math. Many modern day ciphers such as RSA-2048 are even uncrackable! Although modern day cryptography usually requires a lot of mathematics and logic to solve, for this room, the goal is to learn the logic of cryptography without too much math. In addition, we also want to get you familiar with common concepts you might encounter elsewhere in the cybersecurity or computer science realm.
	[i]password = 1,3,4[/i]
	""",
	"""
	Encryption can come in many forms. Most are heavy math based, and some even in plain sight! Many basic encryptions augment the english alphabet
	An example is the simple Morse Code:
	a: .-, b: -..., c: -.-., d: -.., e: ., f: ..-., g: --., h: ...., i: .., j: .---, k: -.-, l: .-.., m: --, n: -., o: ---, p: .--., q: --.-, r: .-., s: ..., t: -, u: ..-, v: ...-, w: .--, x: -..-, y: -.--, z:--..
	[i]What did the cat eat that got him stuck in the ground?[/i]
	""",
	"""
	Hashing is quite a powerful tool when it comes to making sure information goes one way. Hashes are used all the time when it comes to keeping your information safe and secure. For example your password for Google is hashed before it is stored into Google's database therefore even if someone breached the database there would only be a bunch of hashes. Hashes can also contain many tricks such as salts or pads to increase the security even more. Common hashes include SHA-256, CRC, and MD5.

	[i]MD5 of cat: d077f244def8a70e5ea758bd8352fcd8[/i]
	[i]SHA2 of cat: 4241b986a49591d445ebb840bc4b49c12b10b392b49222bc45dfd8b871cb3d0e742cdba152aa782e253026c7fc93fe8287b95c5fd0e22467e99c89501a502cd4[/i]
	[i]Bcrypt of cat: $2a$10$bxzkt9EQ2InU4vvFq8/PCejVyswIdq3FUDO9HnSrmhI6otS32KlRK
	"""
	,
	"""
	Fun fact: A large part of the success of WWII was the breaking of the German cipher enigma. Enigma was broken by Alan Turing in due to logical guessing such as knowing the Germans would send out a daily weather report and end their messages with 'Heil Hilter'.
	Using these guesses and the invention of the Bombe by Turing to automate the process helped to lead the allies to a victory in the war
	Sources:
		[b]https://www.iwm.org.uk/history/how-alan-turing-cracked-the-enigma-code[/b]
		[b]https://www.mub.eps.manchester.ac.uk/science-engineering/2018/11/28/cracking-stuff-how-turing-beat-the-enigma/[/b]
	[i]I don't like Never Eat Soggy Waffles, I prefer Never Wear Shoes Ever. I think the cats agree with me. NWSE[/i]
	""",
	"""
	An interesting use of hashing is in the form of the blockchain! The blockchain is cleverly uses hashes to build what is known as the public ledger. Since hashes are famous for being one directional, transactions are on the blockchain not-reversible but are also highly secure.
	Sources:
		[b]https://www.scalingparrots.com/en/blockchain-hash-what-is-it/[/b]

	[i]This is a hash of kitten, what hash is it?[/i]
	[i]d83b8a52c5866bc04c7039d847766df62ceb2510ea4c8f0db57b25a35b02d82f7270628c174d5a493a4363da713c32cae0e7091a98a9ce956aeb0b49cdb01248[/i]
	"""
]

var world3_info = [
	"""
	Welcome to World 3. 
	The focus of this room is OWASP vulnerabiltiies. OWASP is a nonprofit foundation that works to improve software security. The vulnerabilites we look at are in the OWASP Top Ten list which shows the Top 10 Web Application Security Risks. This list is updated frequently with data collected from people all over the world, and these security risks will be something you will have to deal with at a cybersecurity job. Remember, this world builds upon previous knowledge gained from the other worlds, so try to remember what you did in the other worlds. We also look at one other method of trying to get information from victims.
	[i]password = 1, 3[/i]
	""",
	"""
	To recap on our previous lessons, I want to go back to encryption. Encryption has been around for a long time, and it is important to understand the beginning of cryptography. 
	[i]Paying attention to the past info books is key here![/i]
	""",
	"""
	Broken Access Control is a vulnerability that happens when the application doesn't properly enforce authorization and authentication. This means that users will have access to information that they usually would not have access to. For example, if a user account suddenly gains admin privileges, so they can now see the usernames and passwords of every user account on the application, that means the website has broken access control. This is listed as the number 1 biggest security risk on the OWASP Top Ten. Ways to prevent broken access control include proper limits for different types of accounts along with making sure that users can't gain access to admin privilegs by default.
	[i]Sure hope this room isn't broken[/i]
	""",
	"""
	Security doesn't only involve preventing vulnerabilities. Social engineering is maniuplating people into lowering their guard and making them leak confidential and sensitive information. This can be especially dangeous because the targets won't realize what information they have given up until it is too late. Ways to prevent this is awareness of these types of attacks, multi-factor authentication, and constant password management.
	[i]The admin has such an interesting room, I wonder what his interests are[/i]
	"""
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("interaction")
	volume.text = "Vol " + str(book_number)

func get_book_info() -> String:
	match (current_world):
		"tutorial":
			return tutorial_info[book_number]
		"world1":
			return world1_info[book_number]
		"world3":
			return world3_info[book_number]
		_:
			return ""
