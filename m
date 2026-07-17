Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139FD3F58DF;
	Fri, 17 Jul 2026 11:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784286097; cv=none; b=AMK0x8e9Bx1viKV67wwofnVVQfi/J2P7BK1+j0eOL3Aj4t8JoVwDM0KqUlMCcAIOaoB3ErJvKmm1CtHNc4DcVUvrNaov6mWJixp1t2lAA95m3v4+D8V4f+j/lcCRw6nC6K6IBOlpBN8txHTcS2zUMDhazOvd1wUMJ27s0KcndmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784286097; c=relaxed/simple;
	bh=qY/pVCWRGbq9bQaNQTdwMXlcpUHQOsPfWp8vzbymHAQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h0p5hH7Dpea3hfHR0i+cSnMiz28ALbpTUt8LbkIJ9/hTs0hTBk+cSIHtuW8VAzTydgSiuRvjFeeqfVqo+9A+ewkVF7n/yoB8s6HL8+vYHBO6geXqO4Cw6NJKnScqScmOl0xJXsbxS8i03TFjAA7mDNpNnheH1Bz0ck8s7ncTjN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SXTT4Gwk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SXTT4Gwk"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:66a6:48e1:9e1:50d5:c75c])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 082D8130E;
	Fri, 17 Jul 2026 13:00:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784286013;
	bh=qY/pVCWRGbq9bQaNQTdwMXlcpUHQOsPfWp8vzbymHAQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SXTT4Gwk6eATVFNTrxljg10zXpSpcF/yPJcN5N3Z0HWcJBlW4gfCdM/m8pvEEvulp
	 WNDJHJ4l7oSXlkl7xOVDa335WYfV0LL/zafjZ68cmTuLFl4QcUbhECUhoMEDe2E9cr
	 fYJ7tCTMko8587983zMu1lXXoSz77aH2Wpszk33Q=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 17 Jul 2026 16:30:13 +0530
Subject: [PATCH v3 2/6] platform/raspberrypi: vchiq: Store audio device in
 driver management struct
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-b4-vc-sm-cma-v3-2-6c4e77804e5d@ideasonboard.com>
References: <20260717-b4-vc-sm-cma-v3-0-6c4e77804e5d@ideasonboard.com>
In-Reply-To: <20260717-b4-vc-sm-cma-v3-0-6c4e77804e5d@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 bcm-kernel-feedback-list@broadcom.com, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Phil Elwell <phil@raspberrypi.com>
Cc: Stefan Wahren <wahrenst@gmx.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2827;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=qY/pVCWRGbq9bQaNQTdwMXlcpUHQOsPfWp8vzbymHAQ=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqWgtfw6PzAhE9nzcDPnZ9UlrYCAZMEIxNzYMXb
 6bfH2ngtt+JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaloLXwAKCRBD3pH5JJpx
 RRZnEACH34vCGg7bFyou/HQkhqnnYzBtVWXw1zmIhzU836kCghxOPwQ7vFUmexnvIEUXbZNCeQl
 fwu6hYMSg0jIR8AcQ+/KTjCMcjFgoCdRp48BKBGion7ap1bizlZknOso/34L7SOPcMpcY6CTIzz
 HmifJCbFqU/9xM0vmpfOLcpapZJqirdWMETUX65zCt3EuoGUo92gnxL7BmIC/FtuEr4gLJyUCTB
 SLW59Xg1njbz5UDhSDm4UGXQQ6SH3kHP3tRHCwkOQAgq0fVoG0X2Y2ifxz2UwjDB+0SwmbEkX9i
 WulrxvrduTzJ7lVfcwdNbGUD2n5h34LuQzBUESnEfUod+rn3yY5Ns7s+VBVfWn7rjZBo2g/8g9/
 uEcqsehQ8CYpHehMNmllNytsGGlRT0lbYpQ8ho2khQ7J+tAI74nzEVCShdDPCW1u7Iu77txD64c
 pDr+tWfQoflgZ435a8+wkB225d/yQwrnP5rFw/Y6JwZE30TvTvGvjOaZ1/UdQr+umUbfONFtU88
 iaIevgetVZk6uDRPdz8+ZKMpuNAfiDx5SPhFkFfh6XtKioC3AAgZJcbRxKHrbK5IQvSU4jABTP6
 6rfzQY7EzbT2rVzYtczedso6voO2oIB5vAXGp6q5dNJLvrUUaR54fXgsbZ9hYjUW5c2xyv/nHkD
 /I/tvOj+pllIQxg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

The VCHIQ firmware devices are not discoverable, so they must be tracked
manually by the driver. Previously, the bcm2835 audio device was stored
in a static global pointer.

Move the audio device pointer into struct vchiq_drv_mgmt instead, so it
is properly associated with the driver instance and lifecycle. This
avoids global state and makes device registration and removal follow the
platform device more cleanly.

No functional change intended.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c | 11 ++---------
 include/linux/raspberrypi/vchiq_arm.h                    |  8 ++++++++
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
index e78641703252..d5a25033a261 100644
--- a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
+++ b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
@@ -57,13 +57,6 @@
 #define KEEPALIVE_VER 1
 #define KEEPALIVE_VER_MIN KEEPALIVE_VER
 
-/*
- * The devices implemented in the VCHIQ firmware are not discoverable,
- * so we need to maintain a list of them in order to register them with
- * the interface.
- */
-static struct vchiq_device *bcm2835_audio;
-
 static const struct vchiq_platform_info bcm2835_info = {
 	.cache_line_size = 32,
 };
@@ -1420,7 +1413,7 @@ static int vchiq_probe(struct platform_device *pdev)
 
 	vchiq_debugfs_init(&mgmt->state);
 
-	bcm2835_audio = vchiq_device_register(&pdev->dev, "bcm2835-audio");
+	mgmt->audio_dev = vchiq_device_register(&pdev->dev, "bcm2835-audio");
 
 	return 0;
 }
@@ -1429,7 +1422,7 @@ static void vchiq_remove(struct platform_device *pdev)
 {
 	struct vchiq_drv_mgmt *mgmt = dev_get_drvdata(&pdev->dev);
 
-	vchiq_device_unregister(bcm2835_audio);
+	vchiq_device_unregister(mgmt->audio_dev);
 	vchiq_debugfs_deinit();
 	vchiq_deregister_chrdev();
 	vchiq_platform_uninit(mgmt);
diff --git a/include/linux/raspberrypi/vchiq_arm.h b/include/linux/raspberrypi/vchiq_arm.h
index e32b02f99024..541b4efd64d9 100644
--- a/include/linux/raspberrypi/vchiq_arm.h
+++ b/include/linux/raspberrypi/vchiq_arm.h
@@ -11,6 +11,7 @@
 #include <linux/platform_device.h>
 #include <linux/semaphore.h>
 #include <linux/atomic.h>
+#include "vchiq_bus.h"
 #include "vchiq_core.h"
 #include "vchiq_debugfs.h"
 
@@ -54,6 +55,13 @@ struct vchiq_drv_mgmt {
 	void __iomem *regs;
 
 	struct vchiq_state state;
+
+	/*
+	 * The devices implemented in the VCHIQ firmware are not discoverable,
+	 * so we need to maintain a list of them in order to register them with
+	 * the interface.
+	 */
+	struct vchiq_device *audio_dev;
 };
 
 struct user_service {

-- 
2.54.0

