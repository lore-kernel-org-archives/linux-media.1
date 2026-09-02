Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F954AA1FD
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 16:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788365650; cv=pass; b=mJWD4IStHOwWBE5RGdLAEC+4EgqQ5ru/c7gWm4EI7DSHIqT2gbmwBFByJ2PE2q2+igzKVtIMLObq6HR7GWclh181TziQEvlJs67JrBWFKooCTPv2IPMIEnr8TYjbRxvSBYlXxm1JfCZjkEIjnIU6O4sSmSFoLYFItTHuyIVDGN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788365650; c=relaxed/simple;
	bh=NSKf3Rnraq+cWMw0aPUF95BKtdSq+8ZHXfee6LOqvO0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=TiFABRudPr3ZA6OUzEfv48YQSGydd/iEJ6XAvEc9qJNvIXut5LwThZLJMN1Qbp7yvlMjAfCIAkVGanJNjtSPUT/rObZrU67mu8ChYxX2kfxQL4DForuKuwiBqcZxuL+f9eWZTqm1yWmUzkg9NWkRQUCxgJ+e7KQH3u6Pd8rRTT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=denys.f@collabora.com header.b=V3vfqg4R; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=denys.f@collabora.com header.b="V3vfqg4R"
ARC-Seal: i=1; a=rsa-sha256; t=1788365643; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NCEs2OSDIkMixILnePJMoRGlDR7FgFFek8m194DOqqYuMoGofPzlkmJvC/qByEVB4TPnF2aSzHxkyVjVMsMLipdZmTHTbyHkmUK9UDv71x+qYgTESzSRdXDVPuvtdsWR9NK1zHTs+qRhA5DKyL4s37hfhcXAOJByD2LTzyS6gBc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788365643; h=Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=VQGyMCvW5QvTyXbgQ2LxnrEatacqjQFZ6H1uMkS/GGQ=; 
	b=D+6zqitFdd5iGtEMDQsdOXU9nYuX0am4pWSu/nzz3A5K5LFhDH1aUTh8I0AwSfXMeQ6LSiHLBsNrqunMJv9bYFJP8si+R5wGfCxXqd9QGYsJXwrPEktKQ03p9gjtO1BTFnq01PEEOiNaMiqy7FpeolXzmKb6dfVhMo3MDBU1x1U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=denys.f@collabora.com;
	dmarc=pass header.from=<denys.f@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788365643;
	s=zohomail; d=collabora.com; i=denys.f@collabora.com;
	h=From:From:To:To:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=VQGyMCvW5QvTyXbgQ2LxnrEatacqjQFZ6H1uMkS/GGQ=;
	b=V3vfqg4RuHP/PQlP1pgEqoUV4tcUKucTLE9/ceOHcCznJgGgTU2prsYkTOTREvEC
	GVdczGpQZ7FeXJvg2yZwJ9k+qkpu93uQn8kaAzw2SPDgwEBspUet9c6EJi8RfVoMfkX
	8L9VrotcyegvQbvXAAlq7El+rkePyGWuvEf6tuWQ=
Received: by mx.zohomail.com with SMTPS id 1788365640769727.9976470591408;
	Wed, 2 Sep 2026 09:14:00 -0700 (PDT)
From: Denys Fedoryshchenko <denys.f@collabora.com>
To: linux-media@vger.kernel.org
Subject: [PATCH] v4l-utils: add missing <cstdlib> includes
Date: Wed,  2 Sep 2026 19:13:26 +0300
Message-ID: <20260902161325.2122745-2-denys.f@collabora.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Several utilities call std::exit() but include only <stdlib.h>, or no
standard library header at all. This relies on transitive includes to make
std::exit() available.

The issue can be reproduced with libc++ by configuring with:

  CXX=clang++ \
    CXXFLAGS="-stdlib=libc++ -D_LIBCPP_REMOVE_TRANSITIVE_INCLUDES=1" \
    meson setup build
  ninja -C build

Include <cstdlib> for std::exit(). cec-test-fuzzing.cpp calls random() and
cec-tuner.cpp calls abs() unqualified, so include <stdlib.h> there.

Signed-off-by: Denys Fedoryshchenko <denys.f@collabora.com>
---
 utils/cec-compliance/cec-compliance.h     | 1 +
 utils/cec-compliance/cec-test-fuzzing.cpp | 1 +
 utils/cec-ctl/cec-ctl.cpp                 | 1 +
 utils/cec-follower/cec-tuner.cpp          | 1 +
 utils/common/cv4l-helpers.h               | 1 +
 utils/edid-decode/calc-ovt.cpp            | 1 +
 utils/edid-decode/edid-decode.cpp         | 1 +
 utils/rds-ctl/rds-ctl.cpp                 | 1 +
 utils/v4l2-compliance/v4l2-compliance.h   | 1 +
 utils/v4l2-ctl/v4l2-ctl.h                 | 1 +
 utils/v4l2-dbg/v4l2-dbg.cpp               | 1 +
 11 files changed, 11 insertions(+)

diff --git a/utils/cec-compliance/cec-compliance.h b/utils/cec-compliance/cec-compliance.h
index 8cb316f..93606b2 100644
--- a/utils/cec-compliance/cec-compliance.h
+++ b/utils/cec-compliance/cec-compliance.h
@@ -13,6 +13,7 @@
 
 #include <cec-info.h>
 
+#include <cstdlib>
 #include <vector>
 
 #define TAG_AUDIO_RATE_CONTROL		1
diff --git a/utils/cec-compliance/cec-test-fuzzing.cpp b/utils/cec-compliance/cec-test-fuzzing.cpp
index 0fe1d5a..0f550d4 100644
--- a/utils/cec-compliance/cec-test-fuzzing.cpp
+++ b/utils/cec-compliance/cec-test-fuzzing.cpp
@@ -9,6 +9,7 @@
 #include <sys/ioctl.h>
 
 #include "cec-compliance.h"
+#include <stdlib.h>
 
 int testFuzzing(struct node &node, unsigned me, unsigned la)
 {
diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
index 5638ca8..8209466 100644
--- a/utils/cec-ctl/cec-ctl.cpp
+++ b/utils/cec-ctl/cec-ctl.cpp
@@ -27,6 +27,7 @@
 
 #include "cec-ctl.h"
 #include "compiler.h"
+#include <cstdlib>
 
 static struct timespec start_monotonic;
 static struct timeval start_timeofday;
diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index a2cb6ca..b0a8870 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -10,6 +10,7 @@
 
 #include "cec-follower.h"
 #include "compiler.h"
+#include <stdlib.h>
 
 #define NUM_ANALOG_FREQS 3
 #define NUM_DIGITAL_CHANS 3
diff --git a/utils/common/cv4l-helpers.h b/utils/common/cv4l-helpers.h
index ab9c64b..ba47e26 100644
--- a/utils/common/cv4l-helpers.h
+++ b/utils/common/cv4l-helpers.h
@@ -9,6 +9,7 @@
 #ifndef _CV4L_HELPERS_H_
 #define _CV4L_HELPERS_H_
 
+#include <cstdlib>
 #include <limits.h>
 #include <v4l-helpers.h>
 
diff --git a/utils/edid-decode/calc-ovt.cpp b/utils/edid-decode/calc-ovt.cpp
index 91472d8..2528ac9 100644
--- a/utils/edid-decode/calc-ovt.cpp
+++ b/utils/edid-decode/calc-ovt.cpp
@@ -12,6 +12,7 @@
 #include <numeric>
 
 #include "edid-decode.h"
+#include <cstdlib>
 
 #define MinVblankDuration 460
 #define MinVblankLines 20
diff --git a/utils/edid-decode/edid-decode.cpp b/utils/edid-decode/edid-decode.cpp
index 4505cf3..ca2e8dc 100644
--- a/utils/edid-decode/edid-decode.cpp
+++ b/utils/edid-decode/edid-decode.cpp
@@ -17,6 +17,7 @@
 #include <unistd.h>
 
 #include "edid-decode.h"
+#include <cstdlib>
 
 #define STR(x) #x
 #define STRING(x) STR(x)
diff --git a/utils/rds-ctl/rds-ctl.cpp b/utils/rds-ctl/rds-ctl.cpp
index bff9d04..de4ac69 100644
--- a/utils/rds-ctl/rds-ctl.cpp
+++ b/utils/rds-ctl/rds-ctl.cpp
@@ -28,6 +28,7 @@
 #include <v4l2-info.h>
 #include <libv4l2rds.h>
 #include <v4l-getsubopt.h>
+#include <cstdlib>
 
 using dev_vec = std::vector<std::string>;
 using dev_map = std::map<std::string, std::string>;
diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
index b43c581..7ca4744 100644
--- a/utils/v4l2-compliance/v4l2-compliance.h
+++ b/utils/v4l2-compliance/v4l2-compliance.h
@@ -25,6 +25,7 @@
 #include <set>
 #include <string>
 #include <cstdint>
+#include <cstdlib>
 
 #include <linux/videodev2.h>
 #include <linux/v4l2-subdev.h>
diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
index ae6f43f..c4d955d 100644
--- a/utils/v4l2-ctl/v4l2-ctl.h
+++ b/utils/v4l2-ctl/v4l2-ctl.h
@@ -4,6 +4,7 @@
 #include <cstdint>
 #include <linux/videodev2.h>
 #include <linux/v4l2-subdev.h>
+#include <cstdlib>
 #include <stdlib.h>
 #include <v4l-getsubopt.h>
 
diff --git a/utils/v4l2-dbg/v4l2-dbg.cpp b/utils/v4l2-dbg/v4l2-dbg.cpp
index 6c8fa69..5c92bfb 100644
--- a/utils/v4l2-dbg/v4l2-dbg.cpp
+++ b/utils/v4l2-dbg/v4l2-dbg.cpp
@@ -42,6 +42,7 @@
 #include "v4l2-dbg-ac97.h"
 #include "v4l2-dbg-tvp5150.h"
 #include "v4l2-dbg-micron.h"
+#include <cstdlib>
 
 struct board_list {
 	const char *name;
-- 
2.53.0

