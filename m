Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C754B38E5C5
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 16:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789661875; cv=none; b=VnM+gPJ0EgNEVjxSnJVRTAbPbPGA5yugGPj395HTEm39hFHT+oz0xs+btOSBe3JsKv44gkmts3QS7e97tgxUNuwd6sfWtsrElPfTqCCj+raa7Vad0UvEkoEKFaV4QP9dnYjjpOjZ7FfmSOUZ4+Hel+WKFx3QwvizQhpf2cDZRi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789661875; c=relaxed/simple;
	bh=SDaV3rzT6KJZgeDxC5xmOVUqA53t/p7Ib6D/MRfRyhE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=NQRwtZgFGy9G31M6MfmZiPVQpuNgzBUWjotRPLtytcEcx3tjq4cRyYAelRgzdGZnr9IUV2ErWl72EhgSuv3f6hjf2OFyP/p2BJAHk+33tAO+PR0pxFC0wfImpeLub+MAqgyPEs8G8P8FHGHNfpstOIW8lBFXAML92N8ijoadupg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=HSqRtAnW; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="HSqRtAnW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789661871;
	bh=SDaV3rzT6KJZgeDxC5xmOVUqA53t/p7Ib6D/MRfRyhE=;
	h=From:Date:Subject:References:In-Reply-To:To:From;
	b=HSqRtAnWcfE5ePkymffl2gykl1hznq6SdeeADIAse4DMV0YD7wxgh56HObo3qjOSD
	 m6DEV+F7EOvnwgm9B/H2Xcf+9r/iPHEvZX0QuqVHoF5i/N9kftiJJCdbdT+pdL0nf9
	 9qNfXX9e+4WEVVLW8+y2FEyPRIkCEUlWGcNIR/OIEniZkX8GxzKM5HhmjR9Hnz6J9F
	 r7r0qacT7tVpupoxJDLrvdSNzW4l4OLX4etplN/i5uR7QHWvo/KIyucR3F53UsTfit
	 ihDe0noPIF03Op0jhDZ8d9iDPj4u3+L7JhKS2AR3EskZLngA5+OM1MuSYjDWahj/Fc
	 vE4msUBktjTGg==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C3B0117E0C7E;
	Thu, 17 Sep 2026 18:17:50 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Thu, 17 Sep 2026 12:17:47 -0400
Subject: [PATCH RFC v4l-utils v2 2/3] meson: Add meson build file for
 v4l2top
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-add-v4l2top-v2-2-80970c6210c5@collabora.com>
References: <20260917-add-v4l2top-v2-0-80970c6210c5@collabora.com>
In-Reply-To: <20260917-add-v4l2top-v2-0-80970c6210c5@collabora.com>
To: linux-media@vger.kernel.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.17-dev-4066f

The build file uses a cargo wrapper to build the project.

It will convert the build type (release/debug) to what cargo understands
and install the binary at the install step.

If cargo is not present on the build machine, v4l2top will be skipped.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 meson.build                    |  1 +
 meson_options.txt              |  2 ++
 utils/v4l2top/cargo-wrapper.sh | 22 +++++++++++++++++++++
 utils/v4l2top/meson.build      | 43 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 68 insertions(+)

diff --git a/meson.build b/meson.build
index 07a603ed..db94e149 100644
--- a/meson.build
+++ b/meson.build
@@ -496,4 +496,5 @@ summary({
             'v4l2-ctl-32' : is_variable('v4l2_ctl_32'),
             'v4l2-ctl-32-time64' : is_variable('v4l2_ctl_32_time64'),
             'v4l2-tracer' : is_variable('v4l2_tracer'),
+            'v4l2top' : is_variable('v4l2top'),
         }, bool_yn : true, section : 'Applications')
diff --git a/meson_options.txt b/meson_options.txt
index 3d04cfb4..0a7c681b 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -12,6 +12,8 @@ option('qvidcap', type : 'feature', value : 'auto',
        description : 'Enable qvidcap compilation')
 option('v4l2-tracer', type : 'feature', value : 'auto',
        description : 'Enable v4l2-tracer compilation')
+option('v4l2top', type : 'feature', value : 'auto',
+       description : 'Enable v4l2top compilation (requires cargo)')
 
 # Options
 option('v4l-plugins', type : 'boolean',
diff --git a/utils/v4l2top/cargo-wrapper.sh b/utils/v4l2top/cargo-wrapper.sh
new file mode 100755
index 00000000..05c728aa
--- /dev/null
+++ b/utils/v4l2top/cargo-wrapper.sh
@@ -0,0 +1,22 @@
+#!/bin/sh
+# Wrapper that drives `cargo build` from meson and copies the resulting
+# binary to the location meson expects.
+#
+# Usage: cargo-wrapper.sh <cargo> <manifest> <target-dir> <profile> <binary> <output>
+
+set -e
+
+CARGO="$1"
+MANIFEST="$2"
+TARGET_DIR="$3"
+PROFILE="$4"
+BINARY="$5"
+OUTPUT="$6"
+
+if [ "$PROFILE" = "release" ]; then
+    "$CARGO" build --manifest-path "$MANIFEST" --target-dir "$TARGET_DIR" --release
+else
+    "$CARGO" build --manifest-path "$MANIFEST" --target-dir "$TARGET_DIR"
+fi
+
+cp -f "$TARGET_DIR/$PROFILE/$BINARY" "$OUTPUT"
diff --git a/utils/v4l2top/meson.build b/utils/v4l2top/meson.build
new file mode 100644
index 00000000..2bdfa7da
--- /dev/null
+++ b/utils/v4l2top/meson.build
@@ -0,0 +1,43 @@
+v4l2top_opt = get_option('v4l2top')
+
+cargo = find_program('cargo', required : v4l2top_opt)
+
+if not cargo.found()
+    subdir_done()
+endif
+
+v4l2top_sources = files(
+    'Cargo.toml',
+    'Cargo.lock',
+    'src/main.rs',
+    'src/renderers.rs',
+    'src/v4l2_mem.rs',
+    'src/v4l2_metrics.rs',
+)
+
+# Map meson buildtypes to cargo profiles. Cargo only knows two built-in
+# profiles: 'dev' (target/debug) and 'release' (target/release). Treat any
+# optimised meson buildtype as a cargo release build.
+if get_option('buildtype') in ['release', 'debugoptimized', 'minsize', 'custom']
+    cargo_profile = 'release'
+else
+    cargo_profile = 'debug'
+endif
+
+v4l2top = custom_target('v4l2top',
+    output : 'v4l2top',
+    input : v4l2top_sources,
+    build_by_default : true,
+    install : true,
+    install_dir : get_option('bindir'),
+    console : true,
+    command : [
+        files('cargo-wrapper.sh'),
+        cargo.full_path(),
+        meson.current_source_dir() / 'Cargo.toml',
+        meson.current_build_dir() / 'target',
+        cargo_profile,
+        'v4l2top',
+        '@OUTPUT@',
+    ],
+)

-- 
2.55.0

