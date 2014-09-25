#ifndef __BINDINGS_LXC_CONTAINER_H__
#define __BINDINGS_LXC_CONTAINER_H__

typedef struct {
  char *zfsroot; /*!< ZFS root path */
} zfs_t;

typedef struct {
  char *vg; /*!< LVM Volume Group name */
  char *lv; /*!< LVM Logical Volume name */
  char *thinpool; /*!< LVM thin pool to use, if any */
} lvm_t;

#endif /* __BINDINGS_LXC_CONTAINER_H__ */
