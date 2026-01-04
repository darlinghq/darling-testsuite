# XNU Syscall Implementation Detail

## BSD



| Syscall | Sysnum | Kernel Implementation | Userspace Usage |
| --- | --- | --- | --- |
syscall | 0 | *The syscall implementation live in the architecture-specific unix syscall implementation. Any nested arugments to syscall will result in a [nosys](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/bsd/kern/subr_xxx.c#L176-L189) error*<br> [arm64](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/bsd/dev/arm/systemcalls.c#L487-L496), [x86_64](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/bsd/dev/i386/systemcalls.c#L340-L350C3), [i386](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/bsd/dev/i386/systemcalls.c#L134-L139) | A direct implementation for `int syscall(int, ...)`; however, this function is deprecated.<br> 
exit | 1 | [`void exit(proc_t p, struct exit_args *uap, int *retval)`](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/bsd/kern/kern_exit.c#L832-L849) | A direct implementation for `void _exit(int status)`
fork | 2 | [`int fork(proc_t parent_proc, __unused struct fork_args *uap, int32_t *retval)`](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/bsd/kern/kern_fork.c#L872-L951) | Used by [`pid_t fork(void)`](https://github.com/apple-oss-distributions/Libc/blob/Libc-1439.141.1/sys/fork.c#L56)
read | 3 | [`int read(struct proc *p, struct read_args *uap, user_ssize_t *retval)`](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/bsd/kern/sys_generic.c#L195-L210) | A direct implementation for `ssize_t read(int fildes, void *buf, size_t nbyte)`
write | 4 | [`int write(struct proc *p, struct write_args *uap, user_ssize_t *retval)`](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/bsd/kern/sys_generic.c#L480-L493) | A direct implementation for `ssize_t write(int fildes, const void *buf, size_t nbyte)`
open | 5 | [`int open(proc_t p, struct open_args *uap, int32_t *retval)`](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/bsd/vfs/vfs_syscalls.c#L4611-L4616) | Used by [`int open(const char *path, int oflag, ...)`](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/libsyscall/wrappers/open-base.c#L98), [`int creat(const char *path, mode_t mode)`](https://github.com/apple-oss-distributions/Libc/blob/Libc-1439.141.1/compat-43/FreeBSD/creat.c#L52)
close | 6 | [`int sys_close(proc_t p, struct close_args *uap, __unused int32_t *retval)`](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/bsd/kern/kern_descrip.c#L3303-L3325) | A direct implementation for `int close(int fildes)`
wait4 | 7 | [`int wait4(proc_t q, struct wait4_args *uap, int32_t *retval)`](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/bsd/kern/kern_exit.c#L1940-L1945) | Used by: [`pid_t waitpid(pid_t pid, int *istat, int options)`](https://github.com/apple-oss-distributions/Libc/blob/Libc-1439.141.1/gen/FreeBSD/waitpid.c#L64)[1], [`pid_t wait(int *istat)`](https://github.com/apple-oss-distributions/Libc/blob/Libc-1439.141.1/gen/FreeBSD/wait.c#L53)[1]
link | 9 | [`int link(__unused proc_t p, struct link_args *uap, __unused int32_t *retval)`](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/bsd/vfs/vfs_syscalls.c#L5251-L5256) | A direct implementation for `int link(const char *path1, const char *path2);`
unlink | 10 | [`int unlink(__unused proc_t p, struct unlink_args *uap, __unused int32_t *retval)`](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/bsd/vfs/vfs_syscalls.c#L5741-L5749) | Used by [`int unlink(const char *path)`](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/libsyscall/wrappers/unlink.c#L27-L35)
sys_fcntl | 92 | [`int sys_fcntl(proc_t p, struct fcntl_args *uap, int32_t *retval)`](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/bsd/kern/kern_descrip.c#L877-L903) | Used by [`int fcntl(int fd, int cmd, ...)`](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/libsyscall/wrappers/cancelable/fcntl-base.c#L82)
lstat | 190 | [`int lstat(__unused proc_t p, struct lstat_args *uap, __unused int32_t *retval)`](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/bsd/vfs/vfs_syscalls.c#L6607-L6612) | *No longer used by default*[2]<br> A direct implementation of `int stat(const char *, struct stat *)`, if one of the following conditions is met:<br> * The minimum target is below macOS 10.6<br> * `_DARWIN_NO_64_BIT_INODE` is set on a supported platform
lseek | 199 | [`int lseek(proc_t p, struct lseek_args *uap, off_t *retval)`](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/bsd/vfs/vfs_syscalls.c#L5772-L5865) | A direct implementation for `off_t lseek(int fildes, off_t offset, int whence);`
posix_spawn | 244 | [`int posix_spawn(proc_t ap, struct posix_spawn_args *uap, int32_t *retval)`](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/bsd/kern/kern_exec.c#L3021-L4297) | Used by [`int posix_spawn(pid_t * __restrict pid, const char * __restrict path, const posix_spawn_file_actions_t *file_actions, const posix_spawnattr_t * __restrict attrp, char *const argv[__restrict], char *const envp[__restrict])`](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/libsyscall/wrappers/spawn/posix_spawn.c#L2737-L2739)
lstat64 | 340 | [`int lstat64(__unused proc_t p, struct lstat64_args *uap, __unused int32_t *retval)`](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/bsd/vfs/vfs_syscalls.c#L6614-L6619) | *Used by default*[2]<br> A direct implementation of `int stat(const char *, struct stat *)`, unless one of the following conditions is met:<br> * The minimum target is below macOS 10.6<br> * `_DARWIN_NO_64_BIT_INODE` is set on a supported platform

### BSD Notes

[1] Some libc symbols are renamed through the [`_fbsd_compat_.h`](https://github.com/apple-oss-distributions/Libc/blob/Libc-1439.141.1/fbsdcompat/_fbsd_compat_.h) file.

[2] Near the end of the PowerPC era, Apple provided a 64-bit variant for the `stat`, `statfs`, and `dirent` struct to better accommodate modern file systems.

On macOS 10.5, Apple provided two ways to use the 64-bit structs:
* A 64-bit version of the function that supports the 64-bit structs (ex: the 64-bit version of `stat` is `stat64`)
* Opt-in for the original method to use the 64-bit syscall and struct by defining the `_DARWIN_USE_64_BIT_INODE` macro.

However, Apple has deprecated the usage of the 64-bit function on 10.6. Instead, the original functions (ex: `stat`) will automatically use the 64-bit syscall and struct if the application's minimum version is built for 10.6 or later.

For architectures after i386 & x86_64, it is not possible to use the original structs. Only the 64-bit version can be used.

Below is an example of how this works with `stat`
```c
/*
 * Stat function
 */

// From https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/bsd/sys/stat.h#L566
// 
// `__DARWIN_INODE64` is used to determine which `stat` function should be used
int stat(const char *, struct stat *) __DARWIN_INODE64(stat);

// From https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/bsd/sys/cdefs.h#L760
// 
// `__DARWIN_SUF_64_BIT_INO_T` can either be defined to be <empty> or `$INODE64`
// For `stat`, this means the function's symbol could either be
// * `_stat`
// * `_stat$INODE64
#define __DARWIN_INODE64(sym) __asm("_" __STRING(sym) __DARWIN_SUF_64_BIT_INO_T)

// For architectures that were supported on 10.5:
// * `_stat` - the original implementation for stat
// * `_stat$INODE64`- the 64-bit variant of stat
// For newer architectures:
// * `___lstat` - the original implementation for stat
// * `_lstat`- the 64-bit variant of stat

/*
 * Stat structs
 */

// From https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/bsd/sys/stat.h#L166-L182
#define __DARWIN_STRUCT_STAT64 { \
	dev_t		st_dev;                 /* [XSI] ID of device containing file */ \
	mode_t		st_mode;                /* [XSI] Mode of file (see below) */ \
	nlink_t		st_nlink;               /* [XSI] Number of hard links */ \
	__darwin_ino64_t st_ino;                /* [XSI] File serial number */ \
	uid_t		st_uid;                 /* [XSI] User ID of the file */ \
	gid_t		st_gid;                 /* [XSI] Group ID of the file */ \
	dev_t		st_rdev;                /* [XSI] Device ID */ \
	__DARWIN_STRUCT_STAT64_TIMES \
	off_t		st_size;                /* [XSI] file size, in bytes */ \
	blkcnt_t	st_blocks;              /* [XSI] blocks allocated for file */ \
	blksize_t	st_blksize;             /* [XSI] optimal blocksize for I/O */ \
	__uint32_t	st_flags;               /* user defined flags for file */ \
	__uint32_t	st_gen;                 /* file generation number */ \
	__int32_t	st_lspare;              /* RESERVED: DO NOT USE! */ \
	__int64_t	st_qspare[2];           /* RESERVED: DO NOT USE! */ \
}

// From https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/bsd/sys/stat.h#L188-L190
#if __DARWIN_64_BIT_INO_T
struct stat __DARWIN_STRUCT_STAT64;

// From https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/bsd/sys/stat.h#L192-L221
//
// You can define `_DARWIN_NO_64_BIT_INODE` if you want to use the old stat.
// Remember that not all architectures support `_DARWIN_NO_64_BIT_INODE`
#else /* !__DARWIN_64_BIT_INO_T */
struct stat {
	dev_t           st_dev;         /* [XSI] ID of device containing file */
	ino_t           st_ino;         /* [XSI] File serial number */
	mode_t          st_mode;        /* [XSI] Mode of file (see below) */
	nlink_t         st_nlink;       /* [XSI] Number of hard links */
	uid_t           st_uid;         /* [XSI] User ID of the file */
	gid_t           st_gid;         /* [XSI] Group ID of the file */
	dev_t           st_rdev;        /* [XSI] Device ID */
#if !defined(_POSIX_C_SOURCE) || defined(_DARWIN_C_SOURCE)
	struct  timespec st_atimespec;  /* time of last access */
	struct  timespec st_mtimespec;  /* time of last data modification */
	struct  timespec st_ctimespec;  /* time of last status change */
#else
	time_t          st_atime;       /* [XSI] Time of last access */
	long            st_atimensec;   /* nsec of last access */
	time_t          st_mtime;       /* [XSI] Last data modification time */
	long            st_mtimensec;   /* last data modification nsec */
	time_t          st_ctime;       /* [XSI] Time of last status change */
	long            st_ctimensec;   /* nsec of last status change */
#endif
	off_t           st_size;        /* [XSI] file size, in bytes */
	blkcnt_t        st_blocks;      /* [XSI] blocks allocated for file */
	blksize_t       st_blksize;     /* [XSI] optimal blocksize for I/O */
	__uint32_t      st_flags;       /* user defined flags for file */
	__uint32_t      st_gen;         /* file generation number */
	__int32_t       st_lspare;      /* RESERVED: DO NOT USE! */
	__int64_t       st_qspare[2];   /* RESERVED: DO NOT USE! */
};

#endif /* __DARWIN_64_BIT_INO_T */

// From https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/bsd/sys/stat.h#L227-L229
//
// On supported architectures, you will also get access to the stat64 structure.
#if !__DARWIN_ONLY_64_BIT_INO_T
struct stat64 __DARWIN_STRUCT_STAT64;
#endif /* !__DARWIN_ONLY_64_BIT_INO_T */
```
