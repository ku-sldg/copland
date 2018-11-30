Preamble.vo Preamble.glob Preamble.v.beautified: Preamble.v
Preamble.vio: Preamble.v
More_lists.vo More_lists.glob More_lists.v.beautified: More_lists.v
More_lists.vio: More_lists.v
Term.vo Term.glob Term.v.beautified: Term.v Preamble.vo
Term.vio: Term.v Preamble.vio
Event_system.vo Event_system.glob Event_system.v.beautified: Event_system.v Preamble.vo
Event_system.vio: Event_system.v Preamble.vio
Term_system.vo Term_system.glob Term_system.v.beautified: Term_system.v Preamble.vo More_lists.vo Term.vo Event_system.vo
Term_system.vio: Term_system.v Preamble.vio More_lists.vio Term.vio Event_system.vio
Trace.vo Trace.glob Trace.v.beautified: Trace.v Preamble.vo More_lists.vo Term.vo Event_system.vo Term_system.vo
Trace.vio: Trace.v Preamble.vio More_lists.vio Term.vio Event_system.vio Term_system.vio
LTS.vo LTS.glob LTS.v.beautified: LTS.v Preamble.vo Term.vo
LTS.vio: LTS.v Preamble.vio Term.vio
Main.vo Main.glob Main.v.beautified: Main.v Preamble.vo More_lists.vo Term.vo LTS.vo Event_system.vo Term_system.vo Trace.vo
Main.vio: Main.v Preamble.vio More_lists.vio Term.vio LTS.vio Event_system.vio Term_system.vio Trace.vio
