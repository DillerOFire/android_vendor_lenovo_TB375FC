# TB375FC vendor blobs - LineageOS 23.2

Proprietary vendor files for the Lenovo Xiaoxin Pad Pro 12.7 (2025), `TB375FC`
(MediaTek Dimensity 8300 / MT6897), for LineageOS 23.2 (Android 16).

## Git LFS

One blob exceeds GitHub's 100 MB per-file limit and is stored with Git LFS:
`proprietary/vendor/lib64/mt6897/libaibc_tuning.so`. Install Git LFS before
cloning or syncing so it materialises as the real file instead of a pointer:

```
git lfs install
```

`repo sync` then fetches the LFS object automatically.
