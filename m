Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795859319;
	b=iOH6QSyr0fl1O4uXSN5Ztow3EtJUsKW6C64FF2f72SMHcrwZZApmIx445l+khLDxsyHI
	 sbn9SQLD0IfA95EZouaiYpO+heowp0cYNMGKAuuM7JReHwnsWCy1TG9m2VhxH5vbC3TcB
	 vxFPoWVXnMTRgBmM1Vp6HcMc2xB6Jomo7WnLhwnEzZWWzvZRirDF72XhSdZr4uWr7j0r9
	 rH2FOSpWayzJBWmSIbokROVIQXbQZwNhjZGC3YM1tthPyfnG9/nMCxga8edpJMiro8Lvt
	 GIfcj7niySfxTcvxViMi7oKDIJwdQBVXoS+doXbRRhyytAoadClW9AMxzpZFVOXcYUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795859319;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=PXrmHye+tDdgWqP38C+uZH8bE6iMbpx1ha/N+xFtqIw=;
	b=AtCrFKlvb9ZvCz6XR2rWtCZVf4+5gNLONNP0pO7HniouBewxaRiHNBJroEf9tOSaVUDn
	 X1glnnunENJi+P8Cyp0/m9pOirlt4eVsA17S/pSDullhKDAe3KmcYsjb0citFJMiXMtcL
	 PypXQj/K2GLnf4DXuB9CMWCRyjMptoYMQdlwqJvNNtSMIhm+Kco7CFuVhnIq0f8AVkiYE
	 NTQlWQlO8fIPjhkUytbXr7qmN+1mF/48xqBTb7z4TukTFLWfCbdZ2oi7RvEdj+GX8RgUn
	 NMMHKIqcSHCNVSMBk/YNXVw3jrXGU6ATR/pnftCnauyDlpHkQOn4fGYUy2rpNyZH4ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=SUQyFhWE;
	arc=none smtp.remote-ip=45.254.49.197
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7FA606A333
	for <linux-media@vger.kernel.org>; Sat, 28 Nov 2026 09:48:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA7FA606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=SUQyFhWE
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5655b08c2;
	Sat, 28 Nov 2026 17:48:35 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: mchehab@kernel.org,
	mkaricheri@gmail.com,
	hvaibhav@ti.com,
	hverkuil@kernel.org
Cc: linux-media@vger.kernel.org
Subject: [PATCH] media: omap: vout: Fix potential video device leak on probe failure
Date: Sat, 28 Nov 2026 17:48:34 +0800
Message-ID: <20261128-f81b700d6c-u59-0@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
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
X-HM-Tid: 0aa2218e7bb703a1kunmef656146452312
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCT0JJVhhOSBlISU9PHUwZSVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=SUQyFhWEDDHHpFr/vEPf5nwSmvkDrVht0nzLOIDzrItcDb+QM130T9ZRqolZuN+rElYtiw5rVvbvHfyML2LpzgE1pja1m04p8h2Kqv7xH0fH92VE1VrIYU913JN4zliy87ssK1UGOQFFVsTgxYdNC+dI+CBERXgLwomT5MPxITY=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=PXrmHye+tDdgWqP38C+uZH8bE6iMbpx1ha/N+xFtqIw=;
	h=date:mime-version:subject:message-id:from;

If creating a later output fails, the earlier outputs remain registered
while probe frees their shared parent state.

Unwind the completed outputs before returning the error. Set vfd before
buffer setup so failure there releases the current output rather than
the preceding one.

This issue was found by our static analysis tool under development.

Fixes: 5c7ab6348e7b ("V4L/DVB: V4L2: Add support for OMAP2/3 V4L2 display driver on top of DSS2")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/media/platform/ti/omap/omap_vout.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti/omap/omap_vout.c b/drivers/media/platform/ti/omap/omap_vout.c
index 8d0319a37ba8..6106b02cd521 100644
--- a/drivers/media/platform/ti/omap/omap_vout.c
+++ b/drivers/media/platform/ti/omap/omap_vout.c
@@ -1436,6 +1436,8 @@ static int __init omap_vout_setup_video_bufs(struct platform_device *pdev,
 	return ret;
 }
 
+static void omap_vout_cleanup_device(struct omap_vout_device *vout);
+
 /* Create video out devices */
 static int __init omap_vout_create_video_devices(struct platform_device *pdev)
 {
@@ -1455,7 +1457,8 @@ static int __init omap_vout_create_video_devices(struct platform_device *pdev)
 		vout = kzalloc_obj(struct omap_vout_device);
 		if (!vout) {
 			dev_err(&pdev->dev, ": could not allocate memory\n");
-			return -ENOMEM;
+			ret = -ENOMEM;
+			goto error_previous;
 		}
 
 		vout->vid = k;
@@ -1490,6 +1493,8 @@ static int __init omap_vout_create_video_devices(struct platform_device *pdev)
 			goto error;
 		}
 
+		vfd = vout->vfd;
+
 		/* Allocate default number of buffers for the video streaming
 		 * and reserve the VRFB space for rotation
 		 */
@@ -1500,7 +1505,6 @@ static int __init omap_vout_create_video_devices(struct platform_device *pdev)
 
 		/* Register the Video device with V4L2
 		 */
-		vfd = vout->vfd;
 		if (video_register_device(vfd, VFL_TYPE_VIDEO, -1) < 0) {
 			dev_err(&pdev->dev,
 				": Could not register Video for Linux device\n");
@@ -1524,6 +1528,12 @@ static int __init omap_vout_create_video_devices(struct platform_device *pdev)
 		video_device_release(vfd);
 error:
 		kfree(vout);
+		vid_dev->vouts[k] = NULL;
+error_previous:
+		while (k--) {
+			omap_vout_cleanup_device(vid_dev->vouts[k]);
+			vid_dev->vouts[k] = NULL;
+		}
 		return ret;
 	}
 

base-commit: b7ac871daee981f1963f632586ff9b9d898ce5dd
