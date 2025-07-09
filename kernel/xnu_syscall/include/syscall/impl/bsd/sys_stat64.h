#ifndef DARLING_TESTSUITE_BSD_IMPL_SYS_STAT64_SYSCALL
#define DARLING_TESTSUITE_BSD_IMPL_SYS_STAT64_SYSCALL

#include <sys/stat.h>

// https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/bsd/sys/stat.h#L166-L182
// https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/bsd/sys/stat.h#L136-L140
struct darling_stat64 {
	dev_t               st_dev;
	mode_t              st_mode;
	nlink_t             st_nlink;
	__darwin_ino64_t    st_ino;
	uid_t               st_uid;
	gid_t               st_gid;
	dev_t               st_rdev;
	struct timespec     st_atimespec;
	struct timespec     st_mtimespec;
	struct timespec     st_ctimespec;
	struct timespec     st_birthtimespec;
	off_t               st_size;
	blkcnt_t            st_blocks;
	blksize_t           st_blksize;
	__uint32_t          st_flags;
	__uint32_t          st_gen;
	__int32_t           st_lspare;
	__int64_t           st_qspare[2];
};

#endif // DARLING_TESTSUITE_BSD_IMPL_SYS_STAT_SYSCALL
