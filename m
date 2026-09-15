Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0B347ECDD
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 10:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789468376; cv=none; b=KDKKwWcGk5Co8LyZpLSYOu90mnyqWmauPRApkmja9MleTrB/P7uGw41m4xGN11VdwmCaHWTy8tRAV2Dj4MUJ2dOqotS7nQ6H2n8+X8skf8SeSLCAdszcjM8eo589HwYEJ+GKt+z+vV5Q1UgDSdbAByjGKs9CDhNHFXakoJ3l9SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789468376; c=relaxed/simple;
	bh=Bazb+3ZPQIbVKtbc1NC/uhrQ386hC/UVkJV/grBSfDA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rnPdynf9+CbKR5M/M1DRWAj5wIxORoajyRbmmTNdVWfl27NPwRTiX3aroSua9mWaxVrts8/oLSJk8EO9TW7D2/hX5CVX8swqqWhLglRAWZ6hWz5dto9Xi9hhrcy0ezxjd6eBBeY8uMDQN2C7GbrDeeoGvfi9J7tRraDLH2jk4pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=otFqRYBR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="otFqRYBR"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DE74122EC;
	Tue, 15 Sep 2026 12:31:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789468270;
	bh=Bazb+3ZPQIbVKtbc1NC/uhrQ386hC/UVkJV/grBSfDA=;
	h=From:To:Cc:Subject:Date:From;
	b=otFqRYBR5lXBj7EZ3jReQpstXHpRUOOYP5bC7PmkFQ0zzAoAnt5KxIOhlpFc++QWX
	 bl2fT7UkSoAvTEl1Xcen/jg652X9l8MuEwFIGfaePBK+2/KHkjyelmH0B0ijCNlYNx
	 juyA4csMcaR8AUqP96SaeUuu0DJqasAhI36tlAi8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Paul Elder <paul.elder@ideasonboard.com>
Subject: [raw2rgbpnm] [PATCH] Add support for the meson build system
Date: Tue, 15 Sep 2026 13:32:49 +0300
Message-ID: <20260915103249.3834605-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Meson is a modern build system with native support for
cross-compilation. Support it by adding a meson.build file, and ignore
the build/ directory that is the de facto standard for builds. Support
for make is preserved and can be removed later.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .gitignore  |  1 +
 meson.build | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meson.build

diff --git a/.gitignore b/.gitignore
index 8477d66355d9..9bb5e963abeb 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,2 +1,3 @@
+build/
 raw2rgbpnm
 *.o
diff --git a/meson.build b/meson.build
new file mode 100644
index 000000000000..4fba1229b691
--- /dev/null
+++ b/meson.build
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: CC0-1.0
+
+project('raw2rgbpnm', 'c',
+    meson_version : '>= 0.40',
+    version : '0.0.0',
+    default_options : [
+        'werror=true',
+        'warning_level=2',
+    ],
+    license : 'GPL 2.0+')
+
+#
+# Configure the build environment
+#
+cc = meson.get_compiler('c')
+
+cc_arguments = [
+    '-Wno-missing-field-initializers',
+]
+
+add_project_arguments(cc_arguments, language : 'c')
+
+#
+# raw2rgbpnm
+#
+raw2rgbpnm_sources = files([
+    'raw2rgbpnm.c',
+    'raw_to_rgb.c',
+    'utils.c',
+])
+
+raw2rgbpnm = executable('raw2rgbpnm', raw2rgbpnm_sources,
+                        include_directories : include_directories('include'),
+                        install : true)

base-commit: c23c8fa65fcfdfbb6c3ebd63d101fe9844e3c19f
-- 
Regards,

Laurent Pinchart

