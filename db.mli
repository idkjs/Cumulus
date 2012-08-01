val get_user_name_and_email_with_id : int32 ->
  < email : < get : unit; nul : Sql.non_nullable; t : Sql.string_t > Sql.t;
    name : < get : unit; nul : Sql.non_nullable; t : Sql.string_t > Sql.t >
    Lwt.t
val get_user_with_name : string ->
  < email : < get : unit; nul : Sql.non_nullable; t : Sql.string_t > Sql.t;
  id : < get : unit; nul : Sql.non_nullable; t : Sql.int32_t > Sql.t;
  name : < get : unit; nul : Sql.non_nullable; t : Sql.string_t > Sql.t;
  password : < get : unit; nul : Sql.non_nullable; t : Sql.string_t > Sql.t >
    option Lwt.t
val get_feeds : ?starting:int32 -> ?number:int32 -> unit ->
  (< author : < get : unit; nul : Sql.non_nullable; t : Sql.int32_t > Sql.t;
   id : < get : unit; nul : Sql.non_nullable; t : Sql.int32_t > Sql.t;
   timedate : < get : unit; nul : Sql.non_nullable; t : Sql.timestamp_t > Sql.t;
   title : < get : unit; nul : Sql.non_nullable; t : Sql.string_t > Sql.t;
   url : < get : unit; nul : Sql.non_nullable; t : Sql.string_t > Sql.t >
     list *
     (int32 *
      < tag : < get : unit; nul : Sql.non_nullable; t : Sql.string_t > Sql.t >
        list)
     list Lwt.t)
    Lwt.t
val get_feeds_with_author : ?starting:int32 -> ?number:int32 -> string ->
  (< author : < get : unit; nul : Sql.non_nullable; t : Sql.int32_t > Sql.t;
   id : < get : unit; nul : Sql.non_nullable; t : Sql.int32_t > Sql.t;
   timedate : < get : unit; nul : Sql.non_nullable; t : Sql.timestamp_t > Sql.t;
   title : < get : unit; nul : Sql.non_nullable; t : Sql.string_t > Sql.t;
   url : < get : unit; nul : Sql.non_nullable; t : Sql.string_t > Sql.t >
     list  *
     (int32 *
      < tag : < get : unit; nul : Sql.non_nullable; t : Sql.string_t > Sql.t >
        list)
     list Lwt.t)
    Lwt.t
val get_feeds_with_tag : ?starting:int32 -> ?number:int32 -> string ->
  (< author : < get : unit; nul : Sql.non_nullable; t : Sql.int32_t > Sql.t;
   id : < get : unit; nul : Sql.non_nullable; t : Sql.int32_t > Sql.t;
   timedate : < get : unit; nul : Sql.non_nullable; t : Sql.timestamp_t > Sql.t;
   title : < get : unit; nul : Sql.non_nullable; t : Sql.string_t > Sql.t;
   url : < get : unit; nul : Sql.non_nullable; t : Sql.string_t > Sql.t >
     list *
     (int32 *
      < tag : < get : unit; nul : Sql.non_nullable; t : Sql.string_t > Sql.t >
        list)
     list Lwt.t)
    Lwt.t
val get_feed_url_with_url : string ->
  < url : < get : unit; nul : Sql.non_nullable; t : Sql.string_t > Sql.t >
    option Lwt.t
val add_feed : string -> string -> string list -> int32 -> unit Lwt.t
val add_user : string -> string -> string -> unit Lwt.t
