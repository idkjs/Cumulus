type user

val user_new : unit -> user
(* TODO: Change the return type *)
val user_is_connected : user -> bool Lwt.t
val user_connect : user -> string -> string -> unit Lwt.t
val user_disconnect : user -> bool Lwt.t
