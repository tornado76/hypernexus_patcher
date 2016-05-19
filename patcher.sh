# Patcher for my PureNexus custom builds
cd ..

# Clean up
rm -rf art
rm -rf bionic
rm -rf dalvik
rm -rf external/chromium-webview
rm -rf external/proguard
rm -rf prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9

# Replace repos
git clone https://github.com/frap129/hypernexus_art art
git clone https://github.com/frap129/hypernexus_bionic bionic
git clone https://github.com/BenzoRom/dalvik dalvik
git clone https://github.com/BenzoRom/external_chromium-webview external/chromium-webview
git clone https://android.googlesource.com/platform/external/dlmalloc/ -b master external/dlmalloc
git clone https://github.com/BenzoRom/external_proguard external/proguard
cp -R ~/tmp/arm-linux-androideabi-4.9 prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9

# Apply updates
cd build && git pull https://github.com/frap129/hypernexus_build && cd ..
cd external/chromium-libpac && git pull https://github.com/BenzoRom/external_chromium-libpac && cd ../..
cd external/f2fs-tools && git pull https://github.com/BenzoRom/external_f2fs-tools && cd ../..
cd external/lz4 && git pull https://android.googlesource.com/platform/external/lz4 master && cd ../..
cd external/lzma && git pull https://android.googlesource.com/platform/external/lzma master && cd ../..
cd external/skia && git pull https://github.com/BenzoRom/external_skia && cd ../..
cd external/sqltie && git pull https://github.com/BenzoRom/external_sqlite && cd ../..
cd external/v8 && git pull https://github.com/BenzoRom/external_v8 && cd ../..
cd external/vixl && git pull https://android.googlesource.com/platform/external/vixl master && cd ../..
cd frameworks/rs && git pull https://github.com/dragon-tc/android_frameworks_rs && cd ../..
cd libcore && git pull https://github.com/BenzoRom64/libcore/ && cd ..
cd prebuilts/ndk && git pull https://github.com/BenzoRom/prebuilts_ndk && cd ../..
cd system/extras && git pull https://github.com/BenzoRom/system_extras && cd ../..
cd system/netd && git pull https://github.com/BenzoRom/system_netd && cd ../..

# Cherry-picks
cd system/core && git fetch https://android.googlesource.com/platform/system/core master && git cherry-pick ac1b191 8b04714 0d6e594 c18ac7c d2a6220 619ffb4 90bf68e cdb6fee c24ca89 55bbb0d e2b4e1e 34fa704 0cd10d8 6f80022 4cd0768 1dff1aa d1fdb98 617f495 213676b 7e8cee8

# Revert commits
cd libcore && git revert 0e9a29993f2b361 && cd ..
cd vendor/nexus && git revert 5b2ec4f8292d3eef4bb7789bf6dadf3f9402e297 && cd ../..
