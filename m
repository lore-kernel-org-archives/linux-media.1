Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F373A8739
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 19:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784749044; cv=none; b=tCTSsa2E5530p3NV1qv4xrZr19Wzm2qIUrxu28ZaYsN9etaEE5RrjhBevBcXG5L+c09bgX62J6PEW3SO7Jso092xBBcT03Hv0FT0gVKilQGBliGscMRSpD8BQ9hB5x4LsomTje0z1jCFO86qc7/jcrL45v1Mko9R7UlZrLNdav4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784749044; c=relaxed/simple;
	bh=SdLw3jGnwqxER9MQB25ENOmjNqYOO1QJBZsLOcTXYoY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ghzBfG6cCS9tL1aH2GciXLN5cdHOrHGo6viiftC2RDivHdPtbUMEmFvQ9q0xoTxlexRJJXD5mu2B/+5cMhnrK3rYwPLWhUleOyTjeS7bzlMWPTeqEKdMqiItH0RHt+beMJLGObdAMmeRQ2WjeTjt+r3M3Wrc8DmjOa4oKtCMBsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EpEqApAx; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EpEqApAx"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-81e9d8f3289so106739027b3.1
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 12:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784749042; x=1785353842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6gJFEt2M+Nlar+eflQsqBPUZL3USmtVhd3t9VrQs5fw=;
        b=EpEqApAxXTRX+F8QrLNaLmTbMJx1L8qfZIbW5jhDHRH0HTJ+Fhkr7TWgibhhF7uwLJ
         UzUKEW5Lqas5Q51OL8SLEPJdPwe5f6Qs5p9riF8iVUEOIuKo+Xhvq3zrzT8f02/7B63n
         wnTCCz/K2B0FSuH0By7aAddE35B1+uUiBA5jkmUe6RZybrY0kYARKtHbv+DjaeMzT+HS
         zp7UhSx3GuuKHykQUmck0z+br1hP0bXgiE4HeDNYp76OyebBiom3Vq0rTBiwZ45JQmqG
         YqiKiz1QJTpU9RY5dOzt1jw+EJAWNVFOLRCRhaJIHfxWn/rIRoTJcPF0gb2PUeBrcjBg
         TMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784749042; x=1785353842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6gJFEt2M+Nlar+eflQsqBPUZL3USmtVhd3t9VrQs5fw=;
        b=iMSOVzhLtVDGvf3cq7N2teDLhaKszqciH7s3OT+veO/XPcwibKL5rad6zDdokGzWk4
         tOSEHA3Xped07NJAoVX6sZUcybQFAxmJguQa0hhQ/l2MuP40HEa9Wl6gTRcyHHCAbexO
         k8MUDIkYHUwoZOanmTBMvoU/dQggfPZLlc/yGL7j+iwwbxwmLFLtoGTdNbtDRlLhoBIK
         +4iWlMJgKZsjiCjnR+B1zF0OgsNx2swjM5Q0Dd25E1/DVPuV/rLo1sDLG1kRLCtVwXkt
         bhWdxGyaCDIqr+VX9vx4zErfid/5D4mSIFV03tdmLbTcTJGA4fPvKszxXTmaqshQpFf0
         yX7Q==
X-Forwarded-Encrypted: i=1; AHgh+RrSHjVBXRfYqIYnel4uPuVFEqNAvf49n73aHvu5bxlz1XZszT6e5QmjYMVUEv4UZQxrtdfAD4dqUM8cdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ+1q72ry4Nw8I2zF0uVLV2xrV1ksTC1fouGbJJACCnQrRSiCt
	KnamnXy81GmoSNsKZP71+sZB4w11cmwgiPWtlT7V1+RF+Jfg/GLhktiQ
X-Gm-Gg: AR+sD12D9cUibgOh/uFE4O4zR5zYkMJKyPFGfWtXSjgIUiigXO4DOROqsXSOCPpsA4W
	GsLhYNokCO28PwetUbLKAyrI3RJHNfpUDknetx7mp2Er7BVulD31dDSbda46OoWWXUz/NHht9aY
	tRK2CXJ/uDrFW0psrpbSl5K9hsjP1HxJ7GgoSBv4vI++uGFIriC6/hqXNdaPLIthdAmW1VM/Xy/
	eholcPXYsVv2Y6P1ZKOAP/1Eh6FJjo/TMqf0DI9RCyWxa2dv8fCQqvKwFHJ3sl0cr7sZmFRnBT3
	WPQX88h3JS+RpEaJgxxQv4NNO5RqUmqiMOW9dgR8w67DJ/pV3JhbwRKnwHJrRJ3cdzFIMyPg1s0
	RLENBhvYLYL+zghki9YrH3kXQmLHTgvOLgHrmRvaIupaDmC93e/macHVxsZbhkdtTf2wJZjODm4
	39qgfyfVyiGdGJ4TPSKh9VPKArwGPRY8wH3cSX0wJ6brvUYgcmIYESwF3up1Esqv+n2kPO
X-Received: by 2002:a05:690c:c0b:b0:7dc:e96a:26ed with SMTP id 00721157ae682-81f4c1a6540mr207b3.9.1784749042057;
        Wed, 22 Jul 2026 12:37:22 -0700 (PDT)
Received: from LAPTOP-83ECOPAB.f7a5e5c3-cab1-4810-bdbb-207cdd06de9e.globalsecureaccess.local ([2600:1700:37c0:9da0::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f33c6fa89sm18604857b3.22.2026.07.22.12.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 12:37:20 -0700 (PDT)
From: "Cen Zhang (Microsoft)" <blbllhy@gmail.com>
To: mchehab@kernel.org,
	hverkuil@kernel.org
Cc: kees@kernel.org,
	rongqianfeng@vivo.com,
	axboe@kernel.dk,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	AutonomousCodeSecurity@microsoft.com,
	tgopinath@linux.microsoft.com,
	kys@microsoft.com,
	blbllhy@gmail.com
Subject: [PATCH] media: dvb-core: add upper bound check in DMX_SET_BUFFER_SIZE ioctl
Date: Wed, 22 Jul 2026 15:37:19 -0400
Message-ID: <20260722193719.81157-1-blbllhy@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dvb_dvr_set_buffer_size() and dvb_dmxdev_set_buffer_size() pass the
user-supplied size argument directly to vmalloc() without any upper
bound check. This allows excessive kernel memory allocation via the
DMX_SET_BUFFER_SIZE ioctl, which can lead to system-wide OOM conditions.

  Kernel panic - not syncing: System is deadlocked on memory

  Call Trace:
   out_of_memory+0x12fd/0x1370
   __alloc_frozen_pages_noprof+0x2620/0x2fa0
   __vmalloc_node_range_noprof+0x7fa/0x1490
   dvb_dvr_do_ioctl+0x11e/0x260 (drivers/media/dvb-core/dmxdev.c:296)
   dvb_usercopy+0x15b/0x360

Fix by cap both functions at 64 MB and return -EINVAL for oversized
requests.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Fixes: a095be4b030c ("V4L/DVB (7659): dvb-core: Implement DMX_SET_BUFFER_SIZE for dvr")
Reported-by: AutonomousCodeSecurity@microsoft.com
Signed-off-by: Cen Zhang (Microsoft) <blbllhy@gmail.com>
---
 drivers/media/dvb-core/dmxdev.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/dvb-core/dmxdev.c b/drivers/media/dvb-core/dmxdev.c
index 3c8bc75e4d6c..b4dc87945be1 100644
--- a/drivers/media/dvb-core/dmxdev.c
+++ b/drivers/media/dvb-core/dmxdev.c
@@ -20,6 +20,9 @@
 #include <media/dmxdev.h>
 #include <media/dvb_vb2.h>
 
+/* 64 MB upper bound for DVB ring buffer allocations */
+#define DVB_BUFFER_SIZE_MAX (64 * 1024 * 1024)
+
 static int debug;
 
 module_param(debug, int, 0644);
@@ -292,6 +295,8 @@ static int dvb_dvr_set_buffer_size(struct dmxdev *dmxdev,
 		return 0;
 	if (!size)
 		return -EINVAL;
+	if (size > DVB_BUFFER_SIZE_MAX)
+		return -EINVAL;
 
 	newmem = vmalloc(size);
 	if (!newmem)
@@ -333,6 +338,8 @@ static int dvb_dmxdev_set_buffer_size(struct dmxdev_filter *dmxdevfilter,
 		return -EINVAL;
 	if (dmxdevfilter->state >= DMXDEV_STATE_GO)
 		return -EBUSY;
+	if (size > DVB_BUFFER_SIZE_MAX)
+		return -EINVAL;
 
 	newmem = vmalloc(size);
 	if (!newmem)
-- 
2.53.0

