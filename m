Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3AF3E7621
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 23:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790206969; cv=none; b=Ql9wk3TB40vgQOaFpKhls/TckD5X59JRIJsMA+ncZJHd/AyDXwC/0+f8sKz/zXCCjKO4ei8VIfK9gvcEn677iwfVW14PrE86rz3KlSFdVDDAUOMi6G0Mt81nnCv6CaGNvbdkXYE3w0p+6c4vedoAw1sv9wIyx2QrBBU7wi8whoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790206969; c=relaxed/simple;
	bh=uflvYHIp0CZCGULSPkFw++aiEt8uJY1nRxYvfR7lPmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zw1p2i2Esvuk6+UKpDfvr1d2QBp3mt8+o8Du5Vxxn2FYrATWpXvHfVJi1k0m/NuJuJjV1TmV42BRfsael9d8D7ODpDEGHOFWgZlHlJT1RVOT3rpJbvOQWSnzYadDO9L2+ZSM6/Q6u9cBYSvTNA52HM2n0r/FFfD7+0J682cgcU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=om50hVJe; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="om50hVJe"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-142dd025d07so1277491c88.2
        for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 16:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790206967; x=1790811767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XLfwo4y4R0vmCrnrfTBSoXmDYXNUSOGgS3Hjd3uog28=;
        b=om50hVJeCm9+19MkiovuzAVDv4aOhmZ2b2hPEepnA6GJjfR6E6Nn1BPsjocfFM2TFB
         29TclM/Qr+UvmirH6vYJBpXVZohIQAHteOQZEHrpUveyzf50Bf/IydrCih8b/chaft4h
         a+m7mZyoGBa9AsylWToQoFpaaPvHzur7KRTphr2Rqcs1QB7nJSzmYLX1NkCRxtDkHboo
         k27Sk59lFwKsp9iBUcP8jObLo8v0/28L8bY2umHUqvrBKliiQ7y28iaUBVjZDhZMYSnp
         a5k7KW0H5yJ9wgh+SNrVaBI3HvVSPpZ9aUobnekBNYh/ZuG1P+3U4F0LB+weVelaoaDJ
         nQhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790206967; x=1790811767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XLfwo4y4R0vmCrnrfTBSoXmDYXNUSOGgS3Hjd3uog28=;
        b=hJvOjSiuii7yMhhFQ6NeSYHgQPbDXQ1cA8qSoiba1MD9OFYzsepYHeuhygUdA8MNXi
         2OqnU8JDy4mRkYqatKNOj+CqH8N/hRFm8nFxAbt2judog2EmI12F6QCPCmLmb1OdZab7
         YUkHtdSaSRyVIK51rIpxjNwgZKuXnbPju+lQHW10Checmp/WGx8lipIWJWmm2S2Q91jV
         BRY17gPAqY9Fx2q6qxyoeiu3mox3q8TjKP0N7eQttBcsIln26A0QYLd65jpi1RQmnkGR
         OQwzVbcxyk6IzXIbK6RvmUwLtJ0icPYmmgBIef33OIDRHjE9N4kjUlpgc2tte+A/CH/g
         ktjw==
X-Gm-Message-State: AFuF++mV5xbeR3Td3IeDr3Ao18TfYC/sIeWHTD8+Eue5C29r3cdDmdW2
	BdWmJQ3pLZFovmsKZY/OooAg5Kx48R+OrtDP+0PDZjNVzYThQ21wImjyCb952T1Y
X-Gm-Gg: AYBFou1MSRG6ndGYax3j9KzceYpEszkeszzYw+TnLR8bse7dNQSUE8dUELRYK/4BLWa
	tI5SWzaKjYXPNnV4FN5Xt0M+vPnkirvH+NU0BxrpNbp1jBjZqeRQk5xvVbVOJTX5YDla59o2Bq/
	ngSGFlvOwNP4xR26klr3hbRP/pPOn22QRy3RpYo09lK9hFBI+88wDJgAUhSuV9o6hYZrgmwqNpN
	cP1Wf8xAovc/HOe/OKqwSrflrcpTmtCFKheKJk/JMxAC0ZHvtcBX8Fx6NUkz2Dv+AXEIXckPx9J
	d4nfDk1AC4FkBzZCsr84qyaOuvEK2fkGY0bUdUzkK/T10faX42oQZz2eY5hE2JfMa9SPWpERy3i
	5HDG2o8c6i5j6rFQM1Cpnt+wRFN5eKE3t1RM1kki0yscqJDrXStnxzSZxZlW2Sbw3xiqvWJen5M
	fkudg/SlbVbsxNB2Sb8/D/oVvMEVDEPRDJlz18pGGZIYhrDPx0eZxrJnkuQ6s9NgspPGMYmwWrk
	5Zhjo8MPWI09EUAr5EyK8jyDfDFSOtBvY1Y
X-Received: by 2002:a05:7301:6199:20b0:33b:e74c:e43e with SMTP id 5a478bee46e88-34004b8cd97mr452859eec.19.1790206967392;
        Wed, 23 Sep 2026 16:42:47 -0700 (PDT)
Received: from archsung (186-244-17-112.user3p.vtal.net.br. [186.244.17.112])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e90ec54d8sm9088502eec.0.2026.09.23.16.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 16:42:46 -0700 (PDT)
From: Felipe Calliari <calliarifelipe@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	"Sapre, Sarang" <sarang.sapre@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomas Moro <tmorolias@gmail.com>,
	linux-kernel@vger.kernel.org,
	Felipe Calliari <calliarifelipe@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] media: ipu6: Clear the isys ISR hooks when the isys driver goes away
Date: Wed, 23 Sep 2026 20:42:23 -0300
Message-ID: <20260923234224.325504-2-calliarifelipe@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923234224.325504-1-calliarifelipe@gmail.com>
References: <20260923234224.325504-1-calliarifelipe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

isys_probe() points adev->auxdrv and adev->auxdrv_data at data in the
isys module, and the buttress interrupt handler calls the isys ISR
through them. Neither isys_remove() nor the probe error path clears
them. Once intel_ipu6_isys is unloaded, any buttress interrupt
dereferences memory of the unloaded module.

One way to hit this: the IRQ is shared, so with CONFIG_DEBUG_SHIRQ
free_irq() runs the handler once more. If a buttress interrupt status
bit is pending at that point, "rmmod intel_ipu6" after
"rmmod intel_ipu6_isys" oopses:

  BUG: unable to handle page fault for address: ffffffffc8a00560
  RIP: 0010:ipu6_buttress_isr+0x19b/0x370 [intel_ipu6]
  Call Trace:
   free_irq+0x16b/0x360
   devres_release+0x37/0x80
   devm_free_irq+0x42/0x70
   ipu6_pci_remove+0x52/0xd0 [intel_ipu6]

This happened on a Samsung Galaxy Book3 Ultra. A module notifier added
for testing confirmed that after "rmmod intel_ipu6_isys" the hook still
points into the unloaded module, and that it is NULL with this change.

Set the hooks only after the last early return of isys_probe(). Clear
them on the probe error path and at the end of isys_remove(), then
synchronize_irq(). In the buttress handlers, read auxdrv_data once, so
that a hook cleared concurrently is seen as NULL rather than
dereferenced.

Fixes: f50c4ca0a820 ("media: intel/ipu6: add the main input system driver")
Cc: stable@vger.kernel.org
Signed-off-by: Felipe Calliari <calliarifelipe@gmail.com>
---
 drivers/media/pci/intel/ipu6/ipu6-buttress.c | 15 ++++++++-----
 drivers/media/pci/intel/ipu6/ipu6-isys.c     | 23 +++++++++++++++++---
 2 files changed, 30 insertions(+), 8 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.c b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
index 105de1744..63197f746 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-buttress.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
@@ -315,15 +315,20 @@ ipu6_buttress_ipc_send(struct ipu6_device *isp,
 
 static irqreturn_t ipu6_buttress_call_isr(struct ipu6_bus_device *adev)
 {
+	const struct ipu6_auxdrv_data *drv_data;
 	irqreturn_t ret = IRQ_WAKE_THREAD;
 
-	if (!adev || !adev->auxdrv || !adev->auxdrv_data)
+	if (!adev || !READ_ONCE(adev->auxdrv))
 		return IRQ_NONE;
 
-	if (adev->auxdrv_data->isr)
-		ret = adev->auxdrv_data->isr(adev);
+	drv_data = READ_ONCE(adev->auxdrv_data);
+	if (!drv_data)
+		return IRQ_NONE;
+
+	if (drv_data->isr)
+		ret = drv_data->isr(adev);
 
-	if (ret == IRQ_WAKE_THREAD && !adev->auxdrv_data->isr_threaded)
+	if (ret == IRQ_WAKE_THREAD && !drv_data->isr_threaded)
 		ret = IRQ_NONE;
 
 	return ret;
@@ -436,7 +441,7 @@ irqreturn_t ipu6_buttress_isr_threaded(int irq, void *isp_ptr)
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(adev) && adev[i]; i++) {
-		drv_data = adev[i]->auxdrv_data;
+		drv_data = READ_ONCE(adev[i]->auxdrv_data);
 		if (!drv_data)
 			continue;
 
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index 08f29b678..15254e3e3 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -13,6 +13,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/firmware.h>
+#include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/irqreturn.h>
 #include <linux/list.h>
@@ -989,6 +990,18 @@ void ipu6_put_fw_msg_buf(struct ipu6_isys *isys, struct isys_fw_msgs *msg)
 static const struct ipu6_auxdrv_data ipu6_isys_auxdrv_data;
 static const struct ipu6_auxdrv_data ipu7_isys_auxdrv_data;
 
+/*
+ * The buttress interrupt handler calls into this driver through
+ * adev->auxdrv_data, which points into this module. Clear it once the
+ * device is torn down, and wait for a running handler to finish.
+ */
+static void isys_unset_auxdrv(struct ipu6_bus_device *adev)
+{
+	WRITE_ONCE(adev->auxdrv, NULL);
+	WRITE_ONCE(adev->auxdrv_data, NULL);
+	synchronize_irq(adev->isp->pdev->irq);
+}
+
 static int isys_probe(struct auxiliary_device *auxdev,
 		      const struct auxiliary_device_id *auxdev_id)
 {
@@ -1006,9 +1019,6 @@ static int isys_probe(struct auxiliary_device *auxdev,
 	if (!isys)
 		return -ENOMEM;
 
-	adev->auxdrv_data = IS_IPU7(isp) ? &ipu7_isys_auxdrv_data :
-					   &ipu6_isys_auxdrv_data;
-	adev->auxdrv = to_auxiliary_drv(auxdev->dev.driver);
 	isys->adev = adev;
 	isys->pdata = adev->pdata;
 	csi2_pdata = &isys->pdata->ipdata->csi2;
@@ -1037,6 +1047,10 @@ static int isys_probe(struct auxiliary_device *auxdev,
 
 	dev_set_drvdata(&auxdev->dev, isys);
 
+	adev->auxdrv_data = IS_IPU7(isp) ? &ipu7_isys_auxdrv_data :
+					   &ipu6_isys_auxdrv_data;
+	adev->auxdrv = to_auxiliary_drv(auxdev->dev.driver);
+
 	isys_stream_init(isys);
 
 	cpu_latency_qos_add_request(&isys->pm_qos, PM_QOS_DEFAULT_VALUE);
@@ -1065,6 +1079,7 @@ static int isys_probe(struct auxiliary_device *auxdev,
 free_fw_msg_bufs:
 	free_fw_msg_bufs(isys);
 out_remove_pkg_dir_shared_buffer:
+	isys_unset_auxdrv(adev);
 	cpu_latency_qos_remove_request(&isys->pm_qos);
 
 	for (i = 0; i < IPU6_ISYS_MAX_STREAMS; i++)
@@ -1094,6 +1109,8 @@ static void isys_remove(struct auxiliary_device *auxdev)
 	isys_iwake_watermark_cleanup(isys);
 	mutex_destroy(&isys->stream_mutex);
 	mutex_destroy(&isys->mutex);
+
+	isys_unset_auxdrv(auxdev_to_adev(auxdev));
 }
 
 static const struct ipu6_auxdrv_data ipu6_isys_auxdrv_data = {
-- 
2.55.0

