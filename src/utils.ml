module Calendar = CalendarLib.Calendar

let offset = 10l

let string_of_calendar cal =
  (string_of_int (Calendar.day_of_month cal)) ^ "/" ^
    (string_of_int (Calendar.Date.int_of_month (Calendar.month cal))) ^ "/" ^
    (string_of_int (Calendar.year cal)) ^ " à " ^
    (string_of_int (Calendar.hour cal)) ^ ":" ^
    (string_of_int (Calendar.minute cal)) ^ ":" ^
    (string_of_int (Calendar.second cal))

let string_is_empty str =
  let length = String.length str in
  let rec inner i =
    if i < length then
      (str.[i] = ' ') && inner (i + 1)
    else
      true in
  inner 0

let msg str = [
  Html.p [
    Html.pcdata str
  ]
]

let is_invalid_url =
  let regexp_match_url =
    let legit_chars = "[]0-9A-Za-z_~().,+=&%-]" in
    let num = "[0-9]?" in
    "^\\(https?\\|ftp\\)://" ^                         (* Protocol *)
      "\\(" ^ legit_chars ^ "*?" ^                     (* Username *)
      "\\(:" ^legit_chars ^ "*\\)?@\\)?" ^             (* Password *)
      "[A-Za-z0-9._-]+" ^                              (* Domain name *)
      "\\(:" ^ num ^ num ^ num ^ num ^ num ^ "\\)?" ^  (* Port *)
      "\\(/"   ^ legit_chars ^ "*\\)*" ^               (* Arborescence *)
      "\\(\\?" ^ legit_chars ^ "*\\)?" ^               (* Parameters *)
      "\\(#"   ^ legit_chars ^ "*\\)?$"                (* Anchor *) in
  (fun input ->
    not (Str.string_match (Str.regexp regexp_match_url) input 0)
  )

let is_invalid_email =
  let email_regexp = Str.regexp "\\([^<>(),; \t]+@[^<>(),; \t]+\\)" in
  (fun email ->
    not (Str.string_match email_regexp email 0)
  )

let get_gravatar email =
  let md5_email = Digest.to_hex (Digest.string (String.lowercase email)) in
  Eliom_service.external_service
    ~prefix:"http://www.gravatar.com"
    ~path:[ "avatar"; md5_email ]
    ~get_params:Eliom_parameter.((int "s") ** (string "d"))
    ()

let strip =
  let regexp_begin = Str.regexp "^[ ]+" in
  let regexp_end = Str.regexp "[ ]+$" in
  (fun str ->
    let str = Str.replace_first regexp_begin "" str in
    Str.replace_first regexp_end "" str
  )

let split =
  let regexp = Str.regexp "[,]+" in
  (fun str ->
    Str.split regexp str
  )
