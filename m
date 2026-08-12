Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75B842C502
	for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 10:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786532011; cv=none; b=q1TeFwYAj0ZEElxPfypXJNeei6YbZyEaWalCuPNkP1gfHB9SMTVBbAkxoRdqx3jqykyI7cvCjSCU4ZNfeKeFwO0rfE57QojiG4Oa7/QrN4uraMT10yc1xwbW27fSkHQnq6A8oU9wNPQuUqxCTrrDUMgmoaQbtR+IoD9wVY/f2fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786532011; c=relaxed/simple;
	bh=3U8yTqWdcMedAAD5xD43DIh+6Q0rTvKIilQ/8WcxKkU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lV9S6Zz2t9LP2zUDhUoWrRb2pv7UMuw2NIYFrXRxq1Kb53fAM3/9aR0kIt86OVycNAusm4Vd0uwEnpWreUvdo1Dq9uY2+rlPoZgdXQ7OUGIocvr8H2CqBKSERiEj9u8Me/E+SpXeP99W6L1TiO0Z/vniCda+dugCx7CkXRa16/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PCBlv+S5; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PCBlv+S5"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so9086435e9.2
        for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 03:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786532007; x=1787136807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5jgs5U43ai39YOGkWm4gKlSWagxfcI4VO/2d/d10obI=;
        b=PCBlv+S5FOSLRU5xEEOaFkB0btHalZykHD1VvV2qoYkPxoGFBPqU0iuHHFgxuVH2mp
         ZqM7lAGjCSJrCBu6XHLaiFgGLZtn8ky0WAB71WFNR5kbymzJ8Eh/UfWoVNA+u1JY8uc+
         A5mhNBrDeO6SwqNU3S7aCwnt1fbcxBNK+1kLMIV82LVzM+zFg5c67cFwEy4La8tdAsiE
         YojGxzeErnnhIkrlT4aIl4uG/aWOpOdBc1jPJniTvTmgvD5Z+Sv33H78gw7ODkroC2n9
         Jr74W2K9vzpJhp1dAXlUyfCiI/NTYfMgrjgLr1z/Wg5Du2yqMj9GOLMvQqqxP31iOqaN
         lBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786532007; x=1787136807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5jgs5U43ai39YOGkWm4gKlSWagxfcI4VO/2d/d10obI=;
        b=BTV6C+ESgEZM2OrHrdnzi1RAgi+t1g6HdDBvmaKLpsOay6ntcP/A9ZKoJKbn4z9DYz
         6w+OUSgBuM/hX6rLn2dVH8O8sV3cThOCSOLi60U8X7dV0Uwd9pmsrP+wy+ygMczTbFln
         9ZcaziLrhD6VVT7Vs2hqiVOAdVOcfWjBSlm0v8lnpzMY7nNsGFI1ysTm2Ts48Smm1Azx
         36+oIX7UZSoMtJAGlCTElgGbh4xyfddvlADfRjBABZqfgZO7UjV3Fw9PO6j5KpRJJihM
         dQeDRGIfifPojS5fQDUSXTCWW2AxJGtjXQSL2+WG1Y/oY80wqrnZv5N4lOX6j+KZlHDx
         BI+g==
X-Gm-Message-State: AOJu0YxEJqxch6h5+h54sl7eRA4fPT38vq4JsZhTeVMhJWCzm+aTRwzw
	cAzwGzvYQZV7pCfbtGhs3hNDtBbc6piTL4tgM36X84kbdz5wkP74Ntvw6OUnE0zR
X-Gm-Gg: AR+sD13FvoH1Jl6lR6ssWR3gg77Z06sW1IrAPrhCAxqnVK5Z0lt8Xw/OcBGNV0D9W/H
	WKbN+NelGq72dWNULGt89bGCWnhuPrNQwt3urakb3UGBQEO/ERm5wcCkEkXXzJo0R7cR/JvtEpn
	dOwaY3XHIAHRiqusF4uu+17LahOm5Oi1KFZsSG3fVNUNXA2hvSOlIPX9cvJe3/RIxDfMiPGnumH
	+Bt9rTbyo+gKXarAvZpRxYAN6F3fGyg753mZSyWHdXxIahj//+PLnHzuW+zGrGIZOmUhQ1c/6SY
	TzBSQTXTkfXubTqMTdUuNAw81FlNP2SogcmZ4cuKH1vih7c1DwfEwHPA4tG1JAu2AZesC2Oi2bC
	pmkIw/9lJc52ey7DiWwc7RAYev6NkRGD4To0w/tdWSIaDtzSzphvQhKXRZ8d+ye6Xc4qjhG9gGj
	lDGJDtm1AMg66Gs0KOZmwZyJ6q0xpxNfXKcWln1K/7krOe9ODP5PF6/+I0aDO7p+34amqYh4k4Y
	j94dYJPd2pPT9hAPOE5gN+n29aAaBrRqVbsgR9H6zpE/8dSauIh5lUHB1xISKNhcjS4djgmMciJ
	qcixgZD8PQzyBP5dsdCCHT1S4rJwT5JNKG+Da3NQHDiDlOUwvkQAPSRvQOAubJ9P8GMgwH6qwU6
	Z5dabzg9fINd/SFiqeB7kr67JLCVGCdmyzvXnmOLDfHfmjQ==
X-Received: by 2002:a05:600c:8209:b0:496:bbce:fc with SMTP id 5b1f17b1804b1-4997c126dbemr59720255e9.12.1786532007084;
        Wed, 12 Aug 2026 03:53:27 -0700 (PDT)
Received: from localhost.localdomain (host-213-45-168-79.pool21345.interbusiness.it. [213.45.168.79])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997c939574sm37352315e9.1.2026.08.12.03.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:53:26 -0700 (PDT)
From: Nicola Fiorillo <nicfio@gmail.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	bingbu.cao@intel.com,
	tian.shu.qiu@intel.com,
	linux-kernel@vger.kernel.org,
	Nicola Fiorillo <nicfio@gmail.com>
Subject: [PATCH 3/3] media: ipu6: Signal the video queues when a sensor is unbound
Date: Wed, 12 Aug 2026 12:53:05 +0200
Message-ID: <20260812105305.32447-4-nicfio@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260812105305.32447-1-nicfio@gmail.com>
References: <20260812105305.32447-1-nicfio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

isys_async_ops implements .bound() and .complete() but not .unbind(), so
nothing tells the ISYS video nodes that the sensor feeding them has gone
away. A capture that is streaming when the sensor is unbound stays
blocked in vb2_core_dqbuf() forever, waiting for a frame that can no
longer arrive:

  [<0>] vb2_core_dqbuf+0x362/0x1190 [videobuf2_common]
  [<0>] vb2_dqbuf+0xb4/0x210 [videobuf2_v4l2]
  [<0>] __video_do_ioctl+0x894/0xb30
  [<0>] video_usercopy+0x479/0xde0
  [<0>] v4l2_ioctl+0x198/0x220
  [<0>] __x64_sys_ioctl+0x134/0x1c0

The wait in __vb2_wait_for_done_vb() ends on a new buffer, on
!q->streaming, or on q->error. Tearing the sensor down sets none of the
three. The sleep is interruptible, so DETECT_HUNG_TASK stays quiet as
well and the process is simply stuck until something kills it.

Add the missing .unbind() and mark the queues of the CSI-2 receiver the
departing sensor was attached to, which is enough for DQBUF to return
-EIO. Only streaming queues are flagged: q->error is cleared by
__vb2_queue_cancel(), so flagging an idle queue would leave it in error
until the next VIDIOC_STREAMOFF.

Reproduced on a CHUWI Hi10 X1 (Alder Lake-N, IPU6) by unbinding the
sensor while v4l2-ctl was streaming, with both sensors of the machine.
Without this patch 3 attempts out of 3 hang; with it, 10 out of 10 wake
up, report "VIDIOC_DQBUF: failed: Input/output error" and exit. The same
run under KASAN reports nothing.

Fixes: f50c4ca0a820 ("media: intel/ipu6: add the main input system driver")
Signed-off-by: Nicola Fiorillo <nicfio@gmail.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys.c | 41 ++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index c9cdeb705..8055ae169 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -31,6 +31,7 @@
 #include <media/v4l2-async.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
+#include <media/videobuf2-core.h>
 
 #include "ipu6-bus.h"
 #include "ipu6-cpd.h"
@@ -700,6 +701,45 @@ static int isys_notifier_bound(struct v4l2_async_notifier *notifier,
 	return v4l2_device_register_subdev_nodes(&isys->v4l2_dev);
 }
 
+/* The .unbind() notifier callback when a sub-device goes away */
+static void isys_notifier_unbind(struct v4l2_async_notifier *notifier,
+				 struct v4l2_subdev *sd,
+				 struct v4l2_async_connection *asc)
+{
+	struct ipu6_isys *isys =
+		container_of(notifier, struct ipu6_isys, notifier);
+	struct sensor_async_sd *s_asd =
+		container_of(asc, struct sensor_async_sd, asc);
+	struct ipu6_isys_csi2 *csi2;
+	unsigned int i;
+
+	if (s_asd->csi2.port >= isys->pdata->ipdata->csi2.nports)
+		return;
+
+	/*
+	 * The sensor is gone, so no more frames will ever arrive on the video
+	 * nodes fed by it. Tell videobuf2, or a DQBUF already blocked in
+	 * vb2_core_dqbuf() would sleep forever: nothing else in the teardown
+	 * path wakes that queue up.
+	 *
+	 * Only queues that are actually streaming are marked. The error flag
+	 * is only cleared by __vb2_queue_cancel(), so flagging an idle queue
+	 * would leave it poisoned until the next STREAMOFF.
+	 */
+	csi2 = &isys->csi2[s_asd->csi2.port];
+	for (i = 0; i < NR_OF_CSI2_SRC_PADS; i++) {
+		struct vb2_queue *q = &csi2->av[i].aq.vbq;
+
+		if (!vb2_is_streaming(q))
+			continue;
+
+		dev_dbg(&isys->adev->auxdev.dev,
+			"%s went away while streaming on %s\n", sd->name,
+			csi2->av[i].vdev.name);
+		vb2_queue_error(q);
+	}
+}
+
 static int isys_notifier_complete(struct v4l2_async_notifier *notifier)
 {
 	struct ipu6_isys *isys =
@@ -710,6 +750,7 @@ static int isys_notifier_complete(struct v4l2_async_notifier *notifier)
 
 static const struct v4l2_async_notifier_operations isys_async_ops = {
 	.bound = isys_notifier_bound,
+	.unbind = isys_notifier_unbind,
 	.complete = isys_notifier_complete,
 };
 
-- 
2.47.3

