#ifndef DARLING_TESTSUITE_BSD_IMPL_SYS_POSIX_SPAWN_SYSCALL
#define DARLING_TESTSUITE_BSD_IMPL_SYS_POSIX_SPAWN_SYSCALL

#include <syscall/macros.h>
#include <syscall/types.h>

#include <spawn.h>
#include <stdbool.h>

// https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/bsd/sys/spawn_internal.h#L114
#define NBINPREFS 4

// https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/bsd/sys/spawn_internal.h#L352-L360
typedef enum {
	PSFA_OPEN = 0,
	PSFA_CLOSE = 1,
	PSFA_DUP2 = 2,
	PSFA_INHERIT = 3,
	PSFA_FILEPORT_DUP2 = 4,
	PSFA_CHDIR = 5,
	PSFA_FCHDIR = 6
} psfa_t;

// https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/bsd/sys/spawn_internal.h#L75-L83
typedef enum {
	PSPA_SPECIAL = 0,
	PSPA_EXCEPTION = 1,
	PSPA_AU_SESSION = 2,
	PSPA_IMP_WATCHPORTS = 3,
	PSPA_REGISTERED_PORTS = 4,
	PSPA_PTRAUTH_TASK_PORT = 5,
	PSPA_SUID_CRED = 6,
} pspa_t;

// https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/bsd/sys/spawn_internal.h#L148-L155
struct _posix_spawn_coalition_info {
	struct {
		uint64_t psci_id;
		uint32_t psci_role;
		uint32_t psci_reserved1;
		uint64_t psci_reserved2;
	} psci_info[COALITION_NUM_TYPES];
};

// https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/bsd/sys/spawn_internal.h#L178-L186
struct _posix_spawn_persona_info {
    uid_t pspi_id;
    uint32_t pspi_flags;
    uid_t pspi_uid;
    gid_t pspi_gid;
    uint32_t pspi_ngroups;
    gid_t pspi_groups[NGROUPS];
    uid_t pspi_gmuid;
};

// https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/bsd/sys/spawn_internal.h#L160-L168
struct _posix_spawn_posix_cred_info {
	uint32_t pspci_flags;
	uid_t pspci_uid;
	gid_t pspci_gid;
	uint32_t pspci_ngroups;
	gid_t pspci_groups[16];
	uid_t pspci_gmuid;
	char pspci_login[256];
};

// https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/bsd/sys/spawn_internal.h#L90-L97
typedef struct _ps_port_action {
    pspa_t port_type;
    exception_mask_t mask;
    mach_port_name_t new_port;
    exception_behavior_t behavior;
    thread_state_flavor_t flavor;
    int which;
} _ps_port_action_t;

// https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/bsd/sys/spawn_internal.h#L102-L106
typedef struct _posix_spawn_port_actions {
    int pspa_alloc;
    int pspa_count;
    _ps_port_action_t pspa_actions[];
} *_posix_spawn_port_actions_t;

// https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/bsd/sys/spawn_internal.h#L119-L126
typedef struct _ps_mac_policy_extension {
	char policyname[128];
	union {
		uint64_t data;
		void *datap;
	};
	uint64_t datalen;
} _ps_mac_policy_extension_t;

// https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/bsd/sys/spawn_internal.h#L131-L135
typedef struct _posix_spawn_mac_policy_extensions {
    int psmx_alloc;
    int psmx_count;
    _ps_mac_policy_extension_t psmx_extensions[];
} *_posix_spawn_mac_policy_extensions_t;

// https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/bsd/sys/spawn_internal.h#L212-L253
typedef struct _posix_spawnattr {
    short psa_flags;
    short flags_padding;
    sigset_t psa_sigdefault;
    sigset_t psa_sigmask;
    pid_t psa_pgroup;
    cpu_type_t psa_binprefs[NBINPREFS];
    int psa_pcontrol;
    int psa_apptype;
    uint64_t psa_cpumonitor_percent;
    uint64_t psa_cpumonitor_interval;
    uint64_t psa_reserved;

    short psa_jetsam_flags;
    short short_padding;
    int psa_priority;
    int psa_memlimit_active;
    int psa_memlimit_inactive;

    uint64_t psa_qos_clamp;
    task_role_t psa_darwin_role;
    int psa_thread_limit;

    uint64_t psa_max_addr;
    bool psa_no_smt;
    bool psa_tecs;
    int psa_platform;

    cpu_subtype_t psa_subcpuprefs[NBINPREFS];
    uint32_t psa_options;

    _posix_spawn_port_actions_t psa_ports;
    _posix_spawn_mac_policy_extensions_t psa_mac_extensions;
    struct _posix_spawn_coalition_info *psa_coalition_info;
    struct _posix_spawn_persona_info *psa_persona_info;
    struct _posix_spawn_posix_cred_info *psa_posix_cred_info;
    char *psa_subsystem_root_path;
} *_posix_spawnattr_t;

// https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/bsd/sys/spawn_internal.h#L375-L394
typedef struct _psfa_action {
	psfa_t  psfaa_type;
	union {
		int psfaa_filedes;
		mach_port_name_t psfaa_fileport;
	};
	union {
		struct {
			int psfao_oflag;
			mode_t psfao_mode;
			char psfao_path[PATH_MAX];
		} psfaa_openargs;
		struct {
			int psfad_newfiledes;
		} psfaa_dup2args;
		struct {
			char psfac_path[PATH_MAX];
		} psfaa_chdirargs;
	};
} _psfa_action_t;

// https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/bsd/sys/spawn_internal.h#L414-L418
typedef struct _posix_spawn_file_actions {
	int psfa_act_alloc;
	int psfa_act_count;
	_psfa_action_t psfa_act_acts[];
} *_posix_spawn_file_actions_t;

// https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/bsd/sys/spawn_internal.h#L441-L465
struct _posix_spawn_args_desc {
	__darwin_size_t attr_size;
	_posix_spawnattr_t attrp;

	__darwin_size_t file_actions_size;
	_posix_spawn_file_actions_t file_actions;

	__darwin_size_t port_actions_size;
	_posix_spawn_port_actions_t port_actions;

	__darwin_size_t mac_extensions_size;
	_posix_spawn_mac_policy_extensions_t mac_extensions;

	__darwin_size_t coal_info_size;
	struct _posix_spawn_coalition_info* coal_info;

	__darwin_size_t persona_info_size;
	struct _posix_spawn_persona_info* persona_info;

	__darwin_size_t posix_cred_info_size;
	struct _posix_spawn_posix_cred_info* posix_cred_info;

	__darwin_size_t subsystem_root_path_size;
	char* subsystem_root_path;
};

#endif // DARLING_TESTSUITE_BSD_IMPL_SYS_POSIX_SPAWN_SYSCALL