Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795726702;
	b=lyrNCSOyyLRKo9rqzE0KWTarA6IYY8nj/mLTKIMGkyAq++b0o+GsGQ33zESlS4V+xDcK
	 uOr6g6Sr2AvYaWJ8rIRNC/E0joPdej4NYzqmzxybgt6SWxe7+tuEvVAMNgR1ZkhOjbBjW
	 kcj6GnsgmsD8RQyFb4+uS7rKQM8SUwhJpWtmz82JGoQwKqrrH9gxftkAe2z9wp8ngZjIn
	 IABHyvanUck0NMsK+ZxyoYKim7jHk2ASPIryndnlPArL67SPRE9obMzVfwhIw9F/lSw6t
	 R/z0Wtme9OdGx180p/qPJ49DBvSkWnYBKBCIs5z5Dxe5VMId283PNQ4K1NjijI/hTUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795726702;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=64p4jkLLf3hJWd/mZVm38nQSWNZQPlgWDMk1O/6JppA=;
	b=lu8Yuco/jilPSsdwLN1SHovmbjstIuIzMU0zkYTWV3xTEnJo/hTTQsjO+fUosl4w+8Ko
	 8kI2gUSY+CeWXkk/cFDD0v26C+JMlcAyKRSle4bD+NsuyrT2EQ/tZRFtz2Jhc7icvHt8V
	 pM2pjtzCIXQQ7zgAIkTZfBPIjfxlYQnAR+qrr1aesDaZtWZfpDFQdf0Od0PEPb1A4Yx4F
	 spzosYhkELTTb2+1VLnbKMBL/JTsIiGoWxbq/bpmEJQrmwl19+SleRCg4vAnl1LE+HIGB
	 xezCLkLsjufl19K/GY5n/GJI2eJ7rPxU4FUaedJ1Va1s80K6IiI47NiMRtMQlTvHvAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kwTd3Lj3;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A8D606A68B
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 20:58:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0A8D606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kwTd3Lj3
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so73798585e9.1
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 12:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795726700; x=1796331500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=64p4jkLLf3hJWd/mZVm38nQSWNZQPlgWDMk1O/6JppA=;
        b=kwTd3Lj3h7gWSW4hlXU7Y2Hp7NK6wwUFZYWzo69CLtKgp7bKq49pvznF1x1J6oforz
         XpSSx3rnD8ZJQv9ZLR1VR+o1l/woT4ePSmOxQfX8szP1xqALfPIu1f4q3yHVUIt4uuVj
         D6prSF1or6k2cZJnoVZFpsUgYFpC8ZfltX9MOTwzgbK2+UwuBE4xTL6eRy/hn3cF/KwK
         Q+segsBL2WT+V9Ix4WcDdLwge9WKoL/8jqr07iHJsSXiAIJrB86R8yxDCCkKByPJrzfj
         mhhKYRfrOZWsFnvvaEWOog1B2GXqjLL0aKHJDoZXoB9cJanXc4Q7EB6tM3MyXASpkqBS
         vNQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795726700; x=1796331500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=64p4jkLLf3hJWd/mZVm38nQSWNZQPlgWDMk1O/6JppA=;
        b=0T6S7Q+e6lgiYFhJIpqG/DIcAGEBO99EEpem6Yhzo1ONylo9mRdkSIZza4StfGOzX2
         ed65WtqJ0scPuvXvj1TsBfSuYQ75aboG2rT0HmFcR1qamg8stkD0g6sKUBUEyAaURMxQ
         w1Cmrxa6DWw9bkj0nc/2/8pqhiEAajoNG2hwYCmBddLYCwAbC0AL6jpzq823b8ycgKyA
         n+7/5Tg363EBZbdIoiUj5FjFf395bF77GcQOBceJ+uhLIx08SskXZBB7jnTm4z2ILTT6
         W8+y/KQ9bcBEj/fvznefq4D8/FbZSZYBcH4U6h3D6tej1FxmwMsdwOJ6FZrglmNv+t+M
         QbKg==
X-Forwarded-Encrypted: i=1; AL+hErGzeJRxAkuHymYbn8Q8fj0spDQ/DC51/g0KocQr3qXw3f+wsnyhMqjVRsTR7ltMcLnD9VyhKPDVlnv5fw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9UWtT+7I/uK8FX9l4AeQAAQilFYmqhH0ZlNUE7cHjaRZaMJf3a
	OHHXyocom0mavEjkS4pWh/L1So/v4Wsl7P2FhXrweW3dxBqXKK8H2Iu+
X-Gm-Gg: AZFdTZcbvj+i1pYy4GT+ks5PhpFU+LyH+4gMzrLoKZxeYu1IrV7zQhQQdNhgeIYhKDl
	jhSCpywnDquOr5v5G5owwfBYcWvVGmu45cd7X2cbXUhhCGxNYEE5RCMj8UX583N82uNRG68sXGd
	29SlQB04VkVAe8unekt31q1PCyi33CLOj9b/U6ejt88Xc3AEAFhzrXw+eiElVTaVtPaCUyqo0u9
	c8npBELSle0nip0f20G78BAKgkahW3u56c5rZHEytAcfnqlos43QkmMfUYhBxDbxwcv2AO+AMNO
	xbu4Sc6NkDv2qt1jgqFTVQVWOJWci5+CD6A0w8sCRfH9MTMRBf3NJ+OuyunYp5XK+mwqH8can2q
	BxbiHdSsJct/jrix+hT7eecmm2jmXpSefYuccGwATunO9SIY/avXM6M1UV0ZY72ovVRK3tfPqud
	d1AQzIlpeYFwEIJs1ELuOcxRn4TN94g2ovyJAQv1kZGYSSfQShlcnqjWYRvoVbRYyrPTOotFpbT
	fmBCUUpmUfZOOmiowh/VPQ+kPwxGc5RyJmgSVEN6hx6zVkUSnbGVfGmlbN6jfnDgEXGmzu0fxPV
	U0vWPZ02igAeiKGMCi3KACgTE9YMCyC+YFmzV5twy/6cVAqFik8JuGf1xtIUk6eW30vGWIKHgI/
	WIeo=
X-Received: by 2002:a05:600c:4585:b0:4a1:83f0:7c91 with SMTP id 5b1f17b1804b1-4bb8882948dmr457925855e9.18.1795726699905;
        Thu, 26 Nov 2026 12:58:19 -0800 (PST)
Received: from localhost (2001-1ae9-5b-ad10--33.ip6.tmcz.cz. [2001:1ae9:5b:ad10::33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399d52sm611178075e9.6.2026.11.26.12.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:58:19 -0800 (PST)
From: Arisa Snowbell <arisa.snowbell@gmail.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
	Arisa Snowbell <arisa.snowbell@gmail.com>,
	Matthew Brost <matthew.brost@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 4/5] drm/xe: hold video decode work and HuC queries for a pending DG2 HuC load
Date: Thu, 26 Nov 2026 21:57:56 +0100
Message-ID: <20261126205758.49845-5-arisa.snowbell@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126205758.49845-1-arisa.snowbell@gmail.com>
References: <20261126205758.49845-1-arisa.snowbell@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On DG2 the HuC load by the GSC completes asynchronously after probe, a GT
reset or a resume. Media submitted before then would run without the HuC,
and userspace querying the HuC version (as Mesa and the media driver do at
init) would see a device without one.

Like i915 (i915_request_await_huc()), make video decode jobs depend on the
fence of the pending load. The HuC version query waits for it too,
interruptibly and bounded by the load's own 10 s deadline; document that.

Signed-off-by: Arisa Snowbell <arisa.snowbell@gmail.com>
---
 drivers/gpu/drm/xe/xe_exec.c  | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_query.c |  5 +++++
 include/uapi/drm/xe_drm.h     |  5 +++++
 3 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index f9b0fdb96..65e445205 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -14,6 +14,8 @@
 
 #include "xe_device.h"
 #include "xe_exec_queue.h"
+#include "xe_gt_types.h"
+#include "xe_huc_mei.h"
 #include "xe_hw_engine_group.h"
 #include "xe_macros.h"
 #include "xe_pm.h"
@@ -317,6 +319,17 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (err)
 		goto err_put_job;
 
+	/* as on i915, video decode must not run before a pending HuC load */
+	if (q->class == XE_ENGINE_CLASS_VIDEO_DECODE) {
+		struct dma_fence *huc_load = xe_huc_mei_load_fence(&q->gt->uc.huc);
+
+		if (huc_load) {
+			err = drm_sched_job_add_dependency(&job->drm, huc_load);
+			if (err)
+				goto err_put_job;
+		}
+	}
+
 	if (!xe_vm_in_lr_mode(vm)) {
 		err = xe_svm_notifier_lock_interruptible(vm);
 		if (err)
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 9cc35fc83..696bae5ee 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -22,6 +22,7 @@
 #include "xe_gt.h"
 #include "xe_gt_topology.h"
 #include "xe_guc_hwconfig.h"
+#include "xe_huc_mei.h"
 #include "xe_macros.h"
 #include "xe_mmio.h"
 #include "xe_oa.h"
@@ -600,6 +601,7 @@ query_uc_fw_version(struct xe_device *xe, struct drm_xe_device_query *query)
 	case XE_QUERY_UC_TYPE_HUC: {
 		struct xe_gt *media_gt = NULL;
 		struct xe_huc *huc;
+		int ret;
 
 		if (MEDIA_VER(xe) >= 13) {
 			struct xe_tile *tile;
@@ -619,6 +621,9 @@ query_uc_fw_version(struct xe_device *xe, struct drm_xe_device_query *query)
 			break;
 
 		huc = &media_gt->uc.huc;
+		ret = xe_huc_mei_wait(huc);
+		if (ret)
+			return ret;
 		if (huc->fw.status == XE_UC_FIRMWARE_RUNNING)
 			version = &huc->fw.versions.found[XE_UC_FW_VER_RELEASE];
 		break;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 578f0c1eb..db893d041 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -628,6 +628,11 @@ struct drm_xe_query_engine_cycles {
  *
  * Given a uc_type this will return the branch, major, minor and patch version
  * of the micro-controller firmware.
+ *
+ * On platforms where the GSC loads the HuC (DG2), the load runs asynchronously
+ * after probe, reset and resume. A query of %XE_QUERY_UC_TYPE_HUC then waits
+ * (interruptibly, for at most 10 seconds) until a pending load settled, so
+ * that it does not report a HuC that is about to run as missing.
  */
 struct drm_xe_query_uc_fw_version {
 	/** @uc_type: The micro-controller type to query firmware version */
-- 
2.56.1

