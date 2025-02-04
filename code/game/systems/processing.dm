SYSTEM_CREATE(processing)
	name = "processing"
	flags = S_PROCESS
	var/list/processing = list()

/system/processing/process()
	for (var/datum/game_object/O as anything in processing)
		O.process()
		check_cpu

/system/processing/proc/start_processing(datum/game_object/O)
	if (O.datum_flags & DATUM_PROCESSING)
		return
	O.datum_flags |= DATUM_PROCESSING
	processing += O

/system/processing/proc/stop_processing(datum/game_object/O)
	if (!(O.datum_flags & DATUM_PROCESSING))
		return
	O.datum_flags &= ~DATUM_PROCESSING
	processing -= O