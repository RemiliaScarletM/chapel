#undef LTTNG_UST_TRACEPOINT_PROVIDER
#define LTTNG_UST_TRACEPOINT_PROVIDER EFA_RDM_TP_PROV

#undef LTTNG_UST_TRACEPOINT_INCLUDE
#define LTTNG_UST_TRACEPOINT_INCLUDE "rxr/rxr_tp_def.h"

#if !defined(_EFA_TP_DEF_H) || defined(LTTNG_UST_TRACEPOINT_HEADER_MULTI_READ)
#define _EFA_TP_DEF_H

#include <lttng/tracepoint.h>

#define EFA_RDM_TP_PROV efa_rdm

#define X_ENTRY_ARGS \
	int, msg_id, \
	size_t, ctx, \
	int, total_len

#define X_ENTRY_FIELDS \
	lttng_ust_field_integer(int, msg_id, msg_id) \
	lttng_ust_field_integer_hex(size_t, ctx, ctx) \
	lttng_ust_field_integer(int, total_len, total_len) 

#define MSG_ARGS \
	size_t, msg_ctx, \
	size_t, addr

#define MSG_FIELDS \
	lttng_ust_field_integer_hex(size_t, msg_ctx, msg_ctx) \
	lttng_ust_field_integer_hex(size_t, addr, addr)

#define CQ_ENTRY_ARGS \
	int, tag, \
	size_t, addr

#define CQ_ENTRY_FIELDS \
	lttng_ust_field_integer(int, tag, tag) \
	lttng_ust_field_integer_hex(size_t, addr, addr)

LTTNG_UST_TRACEPOINT_EVENT(
	EFA_RDM_TP_PROV,
	send_begin,
	LTTNG_UST_TP_ARGS(
		X_ENTRY_ARGS
	),
	LTTNG_UST_TP_FIELDS(
		X_ENTRY_FIELDS  
	)
)
LTTNG_UST_TRACEPOINT_LOGLEVEL(EFA_RDM_TP_PROV, send_begin, LTTNG_UST_TRACEPOINT_LOGLEVEL_INFO)

LTTNG_UST_TRACEPOINT_EVENT(
	EFA_RDM_TP_PROV,
	send_begin_msg_context,
	LTTNG_UST_TP_ARGS(
		MSG_ARGS
	),
	LTTNG_UST_TP_FIELDS(
		MSG_FIELDS
	)
)
LTTNG_UST_TRACEPOINT_LOGLEVEL(EFA_RDM_TP_PROV, send_begin_msg_context, LTTNG_UST_TRACEPOINT_LOGLEVEL_INFO)

LTTNG_UST_TRACEPOINT_EVENT(
	EFA_RDM_TP_PROV,
	recv_begin,
	LTTNG_UST_TP_ARGS(
		X_ENTRY_ARGS
	),
	LTTNG_UST_TP_FIELDS(
		X_ENTRY_FIELDS
	)
)
LTTNG_UST_TRACEPOINT_LOGLEVEL(EFA_RDM_TP_PROV, recv_begin, LTTNG_UST_TRACEPOINT_LOGLEVEL_INFO)

LTTNG_UST_TRACEPOINT_EVENT(
	EFA_RDM_TP_PROV,
	recv_begin_msg_context,
	LTTNG_UST_TP_ARGS(
		MSG_ARGS
	),
	LTTNG_UST_TP_FIELDS(
		MSG_FIELDS
	)
)
LTTNG_UST_TRACEPOINT_LOGLEVEL(EFA_RDM_TP_PROV, recv_begin_msg_context, LTTNG_UST_TRACEPOINT_LOGLEVEL_INFO)

LTTNG_UST_TRACEPOINT_EVENT(
	EFA_RDM_TP_PROV,
	send_end,
	LTTNG_UST_TP_ARGS(
		X_ENTRY_ARGS,
		CQ_ENTRY_ARGS
	),
	LTTNG_UST_TP_FIELDS(
		X_ENTRY_FIELDS
		CQ_ENTRY_FIELDS
	)
)
LTTNG_UST_TRACEPOINT_LOGLEVEL(EFA_RDM_TP_PROV, send_end, LTTNG_UST_TRACEPOINT_LOGLEVEL_INFO)

LTTNG_UST_TRACEPOINT_EVENT(
	EFA_RDM_TP_PROV,
	recv_end,
	LTTNG_UST_TP_ARGS(
		X_ENTRY_ARGS,
		CQ_ENTRY_ARGS
	),
	LTTNG_UST_TP_FIELDS(
		X_ENTRY_FIELDS
		CQ_ENTRY_FIELDS
	)
)
LTTNG_UST_TRACEPOINT_LOGLEVEL(EFA_RDM_TP_PROV, recv_end, LTTNG_UST_TRACEPOINT_LOGLEVEL_INFO)

LTTNG_UST_TRACEPOINT_EVENT(
	EFA_RDM_TP_PROV,
	msg_match_unexpected,
	LTTNG_UST_TP_ARGS(
		X_ENTRY_ARGS,
		CQ_ENTRY_ARGS
	),
	LTTNG_UST_TP_FIELDS(
		X_ENTRY_FIELDS
		CQ_ENTRY_FIELDS
	)
)
LTTNG_UST_TRACEPOINT_LOGLEVEL(EFA_RDM_TP_PROV, msg_match_unexpected, LTTNG_UST_TRACEPOINT_LOGLEVEL_INFO)

LTTNG_UST_TRACEPOINT_EVENT(
	EFA_RDM_TP_PROV,
	msg_match_expected_nontagged,
	LTTNG_UST_TP_ARGS(
		X_ENTRY_ARGS
	),
	LTTNG_UST_TP_FIELDS(
		X_ENTRY_FIELDS
	)
)
LTTNG_UST_TRACEPOINT_LOGLEVEL(EFA_RDM_TP_PROV, msg_match_expected_nontagged, LTTNG_UST_TRACEPOINT_LOGLEVEL_INFO)

LTTNG_UST_TRACEPOINT_EVENT(
	EFA_RDM_TP_PROV,
	msg_match_expected_tagged,
	LTTNG_UST_TP_ARGS(
		X_ENTRY_ARGS
	),
	LTTNG_UST_TP_FIELDS(
		X_ENTRY_FIELDS
	)
)
LTTNG_UST_TRACEPOINT_LOGLEVEL(EFA_RDM_TP_PROV, msg_match_expected_tagged, LTTNG_UST_TRACEPOINT_LOGLEVEL_INFO)

LTTNG_UST_TRACEPOINT_EVENT(
	EFA_RDM_TP_PROV,
	longread_read_posted,
	LTTNG_UST_TP_ARGS(
		X_ENTRY_ARGS
	),
	LTTNG_UST_TP_FIELDS(
		X_ENTRY_FIELDS
	)
)
LTTNG_UST_TRACEPOINT_LOGLEVEL(EFA_RDM_TP_PROV, longread_read_posted, LTTNG_UST_TRACEPOINT_LOGLEVEL_INFO)

LTTNG_UST_TRACEPOINT_EVENT(
	EFA_RDM_TP_PROV,
	runtread_read_posted,
	LTTNG_UST_TP_ARGS(
		X_ENTRY_ARGS
	),
	LTTNG_UST_TP_FIELDS(
		X_ENTRY_FIELDS
	)
)
LTTNG_UST_TRACEPOINT_LOGLEVEL(EFA_RDM_TP_PROV, runtread_read_posted, LTTNG_UST_TRACEPOINT_LOGLEVEL_INFO)

LTTNG_UST_TRACEPOINT_EVENT(
	EFA_RDM_TP_PROV,
	read_completed,
	LTTNG_UST_TP_ARGS(
		X_ENTRY_ARGS,
		size_t, context
	),
	LTTNG_UST_TP_FIELDS(
		X_ENTRY_FIELDS
		lttng_ust_field_integer_hex(size_t, context, context)
	)
)
LTTNG_UST_TRACEPOINT_LOGLEVEL(EFA_RDM_TP_PROV, read_end, LTTNG_UST_TRACEPOINT_LOGLEVEL_INFO)

#endif // _EFA_TP_H

#include <lttng/tracepoint-event.h>