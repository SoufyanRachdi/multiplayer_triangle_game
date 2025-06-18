extends Node

const IP_ADDRESS: String = "localhost"
const PORT: int = 7000

var peer: ENetMultiplayerPeer

func start_server() -> void:
	peer = ENetMultiplayerPeer.new()
	var result = peer.create_server(PORT)
	if result != OK:
		push_error("Failed to create server: Error code %d" % result)
		return
	multiplayer.multiplayer_peer = peer

func start_client() -> void:
	peer = ENetMultiplayerPeer.new()
	peer.create_client(IP_ADDRESS, PORT)
	multiplayer.multiplayer_peer = peer
