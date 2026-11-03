Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736170;
	b=Gx+ztujDeE/JDSXt2NbrU/AjORj+bzCkL7I6cdVz1FotV1Ew4S1w57ov5MvfvIsVfhDy
	 yq2EVqRkBbARuBjDOFzm4aasAPr0eXKUVIs29GKcKvB+kr0OrQeheOrVOcK0GFZyKLjW/
	 umEReNa8b8nNupHdvW/JuRhcP3SQtzov5g9URkl5nRebFYa/sdU2nmwZ4mpJeV3g4C4Hh
	 TlEl9SpjBUrJeS6QajQEv1a+1glHEUBu6pDjFMgki70jlm9t1cz+fNhStayfv7O6i7lDq
	 gDLTHIu34OOUjtZBwcZ+mpI0bc9tKUND7Wu0R25vciYtCAxeY0wEo+x3kKNfvSWuIgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736170;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=W6MyHwL7B3SoONoncqtzm1bWHnLuer4VwDXGWEqRj0A=;
	b=kIct74gkKU+JgRgWc2zuLC4NTYrGOzWIiahfkssawAhmmXXEn6FcKFfVW7EJ0s+L5pG4
	 okTjNUPnLZlhxsWPyNkQZr8F1g36UiEMGsPlIO50CTxVvJWDNOodN+lovyfhQdE8zi6Ab
	 Z+ZdxsxmzumBbB72xaF10KhRgwm9taNnknxk7hyFbBLOsJEg0Cz9HVaYKxZg6FicGv8Rz
	 N8ZMfqAVJTTbSNGNwYW4+yb7JZf0NPuUtXwlWq0hrFP/WFu8e7N3npulUelclXD9OZrAd
	 SaCc0YmLxWNkTYaf7SxcTOYftK3HfvY3LuQ66xKR8cVcYPhIDedi65siB5NsjspWOMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IMIi0lcw;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E58606A326
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 20:02:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67E58606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IMIi0lcw
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so9195c88.1
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 12:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793736169; x=1794340969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W6MyHwL7B3SoONoncqtzm1bWHnLuer4VwDXGWEqRj0A=;
        b=IMIi0lcwaYilC5g2AlqhKWWjrMWQI4GWC1wHHyUcDpYA1VjjA4rZg3G+gu57oNMOCZ
         L23NEy0TVcXP4YI1f+xhLBvS8of/B9gD0ufgA4ol5QccJXY/IKAyxwxW0v1ZQYETWjiK
         ojoSDEtrxPvKTpqjodA3bCsDUGX8abgkkPcq81ePRT2sGTN4kvqA2Ua/M4SbUQnLJU13
         Z7rJNCZtrHSERcXqY4QGnwmQw7yD+02JcTAyDYA7N3y/yxwO8Uit/YpCSSyN1HOvd0Cg
         Cs86vphKnq5f+5fpNxuDZKqAalCt+UDoE53lGErEjhtsm8O2ltiV1Ze7Ww8LfDV9Jfn/
         sSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793736169; x=1794340969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W6MyHwL7B3SoONoncqtzm1bWHnLuer4VwDXGWEqRj0A=;
        b=ousbgrT5Lvvr5dG/KSE/jyygn0MvI0La1WpeTdYpo0Mz1qFwm0vKYXon6WHc2IGai9
         3JOer39uh1E+nwaVqFI0rP4OO60ylT32xXGclAx1DgXYH7DnaP8W+89quFVd24fmVXZT
         PzNvNsaxnGFPmPOdivJhrEXWdzwQDsWCR+z9SM224qb73nboxUh9rjc6YHOdQuOUs4gh
         sEggmNjY44L+T5QZgWkhoAZJlUMNctDtxbyLxqnRnETYn51EjZEZdLT1rC49BrTmzFy4
         nTEiG/9WrsAuqqRwbDN48FPEZu9iA+VeY1kP32zSGEhsNFdq5IJ5yzGEX7/WEpWaWpye
         mR1Q==
X-Forwarded-Encrypted: i=1; AKwUvBztglsUTiWbBnZFm/4PmU/hYCSU5Kcki+K9vrIVRnmQH283+9fA40jB/8uzttZle/dv7JNjP3ZqNcyU4g==@vger.kernel.org
X-Gm-Message-State: APuU4Z/D8FidfMgBY44U5frtWtVLlF0faGEEAtG4tT612tMQjKxtrqUg
	UwrSqKAH6KS3cgtkVvTYIsrOpqrVoZJacYXv7+TpG/bIfj5Yx3KLfn1H
X-Gm-Gg: AYBFou3BGSkx5S9+LrYF4wjzWWEf0uKNNRKAqhC1Qr+QiupSmbf15vzN3RWeWV8Wo58
	hKwWDN2Xj4uo9IIfb3AZ7zHDZt65HKmZe92i3/vW0RvjIInILqxdwI6nR46JCXtQ03ScvHKLvau
	YPkaARCoUzyXy0n0P1LOeez9Nyg0Pp0VclVyWtl5lwMogT7MYbUhZOxh6RrOS4HAd0MOB+YhRNH
	nDxyYrBLVLyjXtvxI16w3SRwFUZYX+nZki8VC8MO0vqwEai2TDn16Ajw85K6i7soYSLd68UEk8k
	M0wBiQ6xi7Xi7pgpJASy35wipLY2/ZDg7gXCNI0XMXGwKtvV6llBN2EjsSaT9n43UcuX6rJeiKW
	ru20MX889AU+leJxq5tCZq4yk+fhCPXHhUYTgjgFH4Oa1oUiQrJhPjDKLfzGeLgxg7P75i0/kHJ
	OpoRaaaAFnI4fyNOp91So0Gj3DqI22WYqjtIpI23MCApDKz5cCufiPMVm3JxH+Zk9xUmSZ4ee6j
	2CZraiPj0w1N5CDu/3dToOAGG1XuEZC52Xpvm17f3QMtzTNvEB8XmabTQXc7rbknmR6pUpkdPK9
	tD8neOxVovFOksX74cYdMOX25FXUD8Iib9bz94TkiTLQvpzWwgKRqCRQyryJJdHKFnA=
X-Received: by 2002:a05:7022:eb44:10b0:186:5b49:90d8 with SMTP id a92af1059eb24-1ac5782fd31mr22158852c88.4.1793736169213;
        Tue, 03 Nov 2026 12:02:49 -0800 (PST)
Received: from arpith-debian ([2402:3a80:449:13bc:6d9f:f092:24ee:20f6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4706bsm1395865c88.15.2026.11.03.12.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:02:42 -0800 (PST)
From: Arpith Alexander <arpith99@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Lixu Zhang <lixu.zhang@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Jake Steinman <j@metarealtyinc.ca>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arpith Alexander <arpith99@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: ivsc: csi: Add sensor node in bound callback
Date: Wed,  4 Nov 2026 01:32:26 +0530
Message-ID: <20261103200226.100989-1-arpith99@gmail.com>
X-Mailer: git-send-email 2.55.0
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

The IPU6 ISYS creates sub-device nodes in its bound and complete
callbacks. A sensor behind the IVSC is bound by the IVSC's own notifier,
after the ISYS's bound callback has already run for the IVSC, and
mei_csi_notify_bound() doesn't create a node. Unless another device
binds to the ISYS afterwards, the sensor's node is therefore only
created by the ISYS's complete callback, which runs once every sensor in
the graph is bound.

Commit 4fdb0342f05e ("media: ipu-bridge: Add Himax HM1092 IR sensor") added
the HM1092 to the ipu-bridge list. The HM1092 has no driver in mainline
yet, so it never binds and the complete callback never runs. The OV02C10
behind the IVSC therefore never gets a sub-device node.

On a Dell XPS 13 9340, libcamera then fails with:

'ov02c10 3-0036': Failed to open V4L2 device '': No such file or directory
No valid pipeline for sensor 'ov02c10 3-0036', skipping

Register the sub-device nodes in mei_csi_notify_bound() as well, so that
the sensor's node is created as soon as it binds. If the complete callback
runs later, v4l2_device_register_subdev_nodes() skips sub-devices that
already have a node.

Commit 7456b40bc992 ("media: i2c: cvs: Add sensor node in bound callback")
is the CVS equivalent of this IVSC fix.

Fixes: 29006e196a56 ("media: pci: intel: ivsc: Add CSI submodule")
Cc: stable@vger.kernel.org
Signed-off-by: Arpith Alexander <arpith99@gmail.com>
---
Tested on a Dell XPS 13 9340 (Meteor Lake IPU6, OV02C10 behind the
IVSC) with v7.4-rc1. ipu-bridge connects both sensors ("Connected 2
cameras"), the HM1092 has no driver and doesn't bind, and the OV02C10
now gets its sub-device node. libcamera finds the camera and streams at
30 fps (cam -c 1 -C10). The camera last worked on v7.2.

The test kernel also had my two other v7.4-rc1 fixes for this laptop:
https://lore.kernel.org/linux-spi/20261103131435.21838-1-arpith99@gmail.com/
https://lore.kernel.org/linux-media/20261103163814.96980-1-arpith99@gmail.com/

Unlike a revert of commit 4fdb0342f05e, this keeps the HM1092 entry for
the pending driver, and it also covers kernels built without that driver
once it is merged.

 drivers/media/pci/intel/ivsc/mei_csi.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c b/drivers/media/pci/intel/ivsc/mei_csi.c
index 005b1414a252..f9513cffaacd 100644
--- a/drivers/media/pci/intel/ivsc/mei_csi.c
+++ b/drivers/media/pci/intel/ivsc/mei_csi.c
@@ -29,6 +29,7 @@
 #include <media/ipu-bridge.h>
 #include <media/v4l2-async.h>
 #include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
@@ -513,7 +514,7 @@ static int mei_csi_notify_bound(struct v4l2_async_notifier *notifier,
 				struct v4l2_async_connection *asd)
 {
 	struct mei_csi *csi = notifier_to_csi(notifier);
-	int pad;
+	int pad, ret;
 
 	pad = media_entity_get_fwnode_pad(&subdev->entity, asd->match.fwnode,
 					  MEDIA_PAD_FL_SOURCE);
@@ -522,10 +523,14 @@ static int mei_csi_notify_bound(struct v4l2_async_notifier *notifier,
 
 	csi->remote = &subdev->entity.pads[pad];
 
-	return media_create_pad_link(&subdev->entity, pad,
-				     &csi->subdev.entity, CSI_PAD_SINK,
-				     MEDIA_LNK_FL_ENABLED |
-				     MEDIA_LNK_FL_IMMUTABLE);
+	ret = media_create_pad_link(&subdev->entity, pad,
+				    &csi->subdev.entity, CSI_PAD_SINK,
+				    MEDIA_LNK_FL_ENABLED |
+				    MEDIA_LNK_FL_IMMUTABLE);
+	if (ret)
+		return ret;
+
+	return v4l2_device_register_subdev_nodes(subdev->v4l2_dev);
 }
 
 static void mei_csi_notify_unbind(struct v4l2_async_notifier *notifier,

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.55.0

