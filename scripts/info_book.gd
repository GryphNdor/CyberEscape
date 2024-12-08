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
    [i]134[/i]
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
    [i]Whirlpool of cat: f62082311e1548a968b52af4b63e4e33284aac01b4395ec631cb727590a3f52498dfb49b27f5dfe5bc529028d97d1b6eac23f098fca48ae88a835d7681368f44[/i]

    """
    ,
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
        _:
            return ""