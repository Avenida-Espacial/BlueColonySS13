#define Clamp(x, y, z) 	(x <= y ? y : (x >= z ? z : x))

#define CLAMP01(x) 		(Clamp(x, 0, 1))

#define span(class, text) ("<span class='[class]'>[text]</span>")

#define get_turf(A) get_step(A,0)

#define get_x(A) (get_step(A, 0)?.x || 0)

#define get_y(A) (get_step(A, 0)?.y || 0)

#define get_z(A) (get_step(A, 0)?.z || 0)

#define isAI(A) istype(A, /mob/living/silicon/ai)

#define isalien(A) istype(A, /mob/living/carbon/alien)

#define isanimal(A) istype(A, /mob/living/simple_animal)

#define isairlock(A) istype(A, /obj/machinery/door/airlock)

#define isbrain(A) istype(A, /mob/living/carbon/brain)

#define iscarbon(A) istype(A, /mob/living/carbon)

#define iscorgi(A) istype(A, /mob/living/simple_animal/corgi)

#define isEye(A) istype(A, /mob/observer/eye)

#define ishuman(A) istype(A, /mob/living/carbon/human)

#define isliving(A) istype(A, /mob/living)

#define ismouse(A) istype(A, /mob/living/simple_animal/mouse)

#define isnewplayer(A) istype(A, /mob/new_player)

#define isobserver(A) istype(A, /mob/observer/dead)

#define isorgan(A) istype(A, /obj/item/organ/external)

#define ispAI(A) istype(A, /mob/living/silicon/pai)

#define isrobot(A) istype(A, /mob/living/silicon/robot)

#define issilicon(A) istype(A, /mob/living/silicon)

#define isvoice(A) istype(A, /mob/living/voice)

#define isslime(A) istype(A, /mob/living/simple_animal/slime)

#define isbot(A) istype(A, /mob/living/bot)

#define isxeno(A) istype(A, /mob/living/simple_animal/xeno)

#define isopenspace(A) istype(A, /turf/simulated/open)

#define sequential_id(key) uniqueness_repository.Generate(/datum/uniqueness_generator/id_sequential, key)

#define random_id(key,min_id,max_id) uniqueness_repository.Generate(/datum/uniqueness_generator/id_random, key, min_id, max_id)

#define isweakref(A) istype(A, /weakref)

#define MAP_IMAGE_PATH "nano/images/[using_map.path]/"

#define map_image_file_name(z_level) "[using_map.path]-[z_level].png"

#define RANDOM_BLOOD_TYPE pick(4;"O-", 36;"O+", 3;"A-", 28;"A+", 1;"B-", 20;"B+", 1;"AB-", 5;"AB+")

#define isclient(A) istype(A, /client)

#define to_chat(target, message) target << message
#define to_world(message) world << message
#define to_world_log(message) world.log << message
// TODO - Baystation has this log to crazy places. For now lets just world.log, but maybe look into it later.
#define log_world(message) world.log << message
#define to_file(file_entry, source_var) file_entry << source_var
#define from_file(file_entry, target_var) file_entry >> target_var

// From TG, might be useful to have.
// Didn't port SEND_TEXT() since to_chat() appears to serve the same purpose.
#define DIRECT_OUTPUT(A, B) A << B
#define SEND_IMAGE(target, image) DIRECT_OUTPUT(target, image)
#define SEND_SOUND(target, sound) DIRECT_OUTPUT(target, sound)

#define CanInteract(user, state) (CanUseTopic(user, state) == STATUS_INTERACTIVE)

#define QDEL_NULL_LIST(x) if(x) { for(var/y in x) { qdel(y) } ; x = null }

#define QDEL_NULL(x) if(x) { qdel(x) ; x = null }

#define ARGS_DEBUG log_debug("[__FILE__] - [__LINE__]") ; for(var/arg in args) { log_debug("\t[log_info_line(arg)]") }

// Helper macros to aid in optimizing lazy instantiation of lists.
// All of these are null-safe, you can use them without knowing if the list var is initialized yet

//Picks from the list, with some safeties, and returns the "default" arg if it fails
#define DEFAULTPICK(L, default) ((istype(L, /list) && L:len) ? pick(L) : default)
// Ensures L is initailized after this point
#define LAZYINITLIST(L) if (!L) L = list()
// Sets a L back to null iff it is empty
#define UNSETEMPTY(L) if (L && !L.len) L = null
// Removes I from list L, and sets I to null if it is now empty
#define LAZYREMOVE(L, I) if(L) { L -= I; if(!L.len) { L = null; } }
// Adds I to L, initalizing I if necessary
#define LAZYADD(L, I) if(!L) { L = list(); } L += I;
// Adds I to L, initalizing L if necessary, if I is not already in L
#define LAZYDISTINCTADD(L, I) if(!L) { L = list(); } L |= I;
// Reads I from L safely - Works with both associative and traditional lists.
#define LAZYACCESS(L, I) (L ? (isnum(I) ? (I > 0 && I <= L.len ? L[I] : null) : L[I]) : null)
// Reads the length of L, returning 0 if null
#define LAZYLEN(L) length(L)
// Null-safe L.Cut()
#define LAZYCLEARLIST(L) if(L) L.Cut()
// Reads L or an empty list if L is not a list.  Note: Does NOT assign, L may be an expression.
#define SANITIZE_LIST(L) ( islist(L) ? L : list() )

#define to_chat(target, message)                            target << message
#define to_world(message)                                   world << message
#define to_world_log(message)                               world.log << message
#define sound_to(target, sound)                             target << sound
#define to_file(file_entry, source_var)                     file_entry << source_var
#define from_file(file_entry, target_var)                   file_entry >> target_var
#define show_browser(target, browser_content, browser_name) target << browse(browser_content, browser_name)
#define show_image(target, image)                           target << image
#define send_rsc(target, rsc_content, rsc_name)             target << browse_rsc(rsc_content, rsc_name)

#define any2ref(x) "\ref[x]"

//Currently used in SDQL2 stuff
#define send_output(target, msg, control) target << output(msg, control)
#define send_link(target, url) target << link(url)

#define SPAN_NOTICE(X) "<span class='notice'>[X]</span>"

#define SPAN_WARNING(X) "<span class='warning'>[X]</span>"

#define SPAN_DANGER(X) "<span class='danger'>[X]</span>"

#define SPAN_OCCULT(X) "<span class='cult'>[X]</span>"

#define FONT_SMALL(X) "<font size='1'>[X]</font>"

#define FONT_NORMAL(X) "<font size='2'>[X]</font>"

#define FONT_LARGE(X) "<font size='3'>[X]</font>"

#define FONT_HUGE(X) "<font size='4'>[X]</font>"

#define FONT_GIANT(X) "<font size='5'>[X]</font>"