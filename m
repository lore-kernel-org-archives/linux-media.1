Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6776527FD5B
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 01:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790300295; cv=pass; b=rUBU55wzQFP5308LiKKtD0VII5v5YkhW8K9on71N3RSZ9Gb4N0ifUuISQRiNxoM1eFxTX+BHoGgJ/pICFU0HwCoWq2ukmcjUC4kCru6UdNq7MkusutX6MYQ7o+/w9COpOcve3sMIT700MsvxvIGcZH4fe7GtOqELc3H/dUc/Fdg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790300295; c=relaxed/simple;
	bh=IgE3L85VZNyjExRPWT1bFYaiSYz8t9f2npqm/uP/Qv0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=o85eHGj90PaCIR8UwqSDu26n4ZkdLsxZwRiQN1/V6fQ95HDhhAJSnuMK3p6oB8P5ESN+M5KMJqAQaMMbkHyTsUrSbVzf4gYPJV7UtAakrQBu1Sm/zVDuIZVDwMfFkosNM69I10/3kKD2G7uuIAGAcePp3dT6J4D3TGu683Wp4ts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ovviIemP; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ovviIemP"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a996c8adf3so782067a12.1
        for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 18:38:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790300293; cv=none;
        d=google.com; s=arc-20260327;
        b=Kx7zfo8c3dpprmJ1ocfAkniA3f+bORMytclY9OOP8ltpEMYBp1gN7crYMHI542yoAW
         D3LhmxiZwWuHoPVTy0CFeCbT7ULIJ/BhQ0IVb4tAFzwLVpGdebKWkQT0jbHfElIrR2zj
         gS7ZdT7tYHq2dmhm3IZwnHz3VGCA9xSuoxz/3v9QKlzdgiMe6GRJ7M68k31FgArWVB20
         FHsteHu/hvE700zy7iaJT0xoaUtzR43tqIYw26/gw01ExGdtgt4VkUxVjN7D1JinLtcJ
         CX0Ax3t6d3XDiqwyeOYRSOSmiyK6jx4MstlMisvHI4Rkq34MBY29exRXhXIPymCLtkld
         t5sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=dhVh9tOhQNfCYcfYyb8o4zaKlezGG/3H4K/sAYxFk2k=;
        fh=RWzbdFW/Q2qsw7QY/ILItt8jyDn/paP+8d/CfXoGPLs=;
        b=hcQzL1Pg2XAadJeZ3wpSOMhJpJ5AoUYZoJ0IT5Nwlw3K5Ee0/cJvp5wxtquyKAMuKe
         r4+JwxxNyMv1rkegGiKJEanulOpBB9oyGKj+sGX872jqwFs8bz1i40J46xnWSLLkiBvp
         UXueSKDP/BqO7dIxaDEGleKmjEIPkLBYlC5wcIwpWLxSUtV/XmvyVfmw5D0uhECakMbS
         PxUNBm7KZJbcwgHhJgpMPtt75w4FnNz2H4HsUCRp6Yuuw0jqnkwaWK+FXpV3az2JIjUo
         1SbKBzs5/yQJEraCK0ASsLBTMBUzuJnZt4KVHay9xJP9N9MzcGi/eGmNfzsxCcTQbM2J
         cbGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790300293; x=1790905093; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dhVh9tOhQNfCYcfYyb8o4zaKlezGG/3H4K/sAYxFk2k=;
        b=ovviIemPqNq2OEojxFDrde1fxj0FSgGwHV2XZyEzcDWdiaXLLPLowEwg5N6hAZMI/T
         EkMCzvD+U3JmA491Y1Dskj5G7W5ee/euuf5AdT8JYmOA2ix3z8HnoSe4zLmsvX90ABwB
         iIGuIo5yNuk3LXTUVyzguhvssmD88EbZsdjzvJyhA4TkG2+SDtxZKbe2tXxsesPUHvOW
         wnczr5U2UULGxVcFsAlENOTn4c0CsR82TxaAFawx62PhvoU+E2JPisYqYMNDKDbU5oAj
         XjrW7t7AXEsGj76iaQqOWMKvHVn94P/jjUH4WIrvB7WQFAf3efNLC9peuLsn1iiytlca
         K9EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790300293; x=1790905093;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dhVh9tOhQNfCYcfYyb8o4zaKlezGG/3H4K/sAYxFk2k=;
        b=NeVlgUIFS+WG3msS3XERgf6HE1k2v5tmFhiK39jGw5/ger/qzE1m3tv2tZUmvIdNzn
         4ZSXmGbbo1va6PBZByEm2p0TZbtHjV2tx4zcisgyvz+gFKKRuHaRJiPKOaUfGBETBwZX
         CvSNNPcmmZh9tlInWDNAuG9nyt+8PGKCdrNoUQpsBumk2u1Bl9kWlp+3PEuLVbfhAcnQ
         H/fjk7jOU1f1RdvPP7UE8huVF68EtPteIUS1uzoKxZx4hsNsLSDSs1Pnigqrdbgk38e4
         AIqDlZiE5vpzKeVaPiN7IQ/Cq6UOeyJQPejWXBJI7LLornaGiHNAzKAHvYkBtudeuf87
         Qg5w==
X-Forwarded-Encrypted: i=1; AKwUvBxM1QTciyyrf4DAh0NCHtDzPH4Z5Yk0AU/m6A138rpcJTO4XMZ/z7h83l9Z1T71d+D+kR2V3VDGkDx/RQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kFHMyc2dIcrHUBl8qeu8L1Rf3Ug5oJ64wq7kIQ0/K6plmlH0H9
	pLsIUSENa2BZGPDZHNZldJPF/peFwkODC1rYrs54LqiID5lZDHqqYDlQPpzE22VRgeF8BRJkyfe
	cXNdS0IzcYM3fj7i86Q8xs/EQdECRSQ==
X-Gm-Gg: AYBFou286TogwkYTZHdHO+alx6Ig6A07NlBtplyykGHof1Jw7nCAX1KSsD0cwX/XMyy
	KBHiyA9F7qWJI4bTP6jxnR2YZBheMS72oDyagdST/RKcI8SLuggaBEfIGu0/1TtLIUkqEeMfSMA
	QCkSQGJ9aVsAQie3kJATU2qtdgTOkALAaOqaMXztDrMXnGTlPwJbXCbqxzBu8HyJAeq8gfyYUYS
	rDz2bI8w/tt1XEHzu820Nw11hLtWtPCv5NP1pxLYp/dyNw3Zh/YbQUe0w0KBrUvtha0FfENiZiA
	QJ1mQzGOxLlNzttSoKUkEemaVUIs9T9Fp19cfucFp8Sos3JxtNENfFn74woB7IAHmWWXk5K+j4P
	MQzlXQ/A6QkFF93t6FnCDmT41zceCCkawRxPUDXMUVtYWOiv4bqXN9ex6yBbjOerf
X-Received: by 2002:a17:907:9303:b0:c25:6c9a:88bc with SMTP id
 a640c23a62f3a-c2ac2125234mr368494166b.19.1790300292506; Thu, 24 Sep 2026
 18:38:12 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 24 Sep 2026 20:38:11 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 24 Sep 2026 20:38:11 -0500
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: mhun512@gmail.com
Date: Thu, 24 Sep 2026 20:38:11 -0500
X-Gm-Features: AclHuK-Sp2E_5xMXFea2XkNaZh2_few1Y0jiFDEaO81xEPBstSz936VELv6-EK8
Message-ID: <CAGEsz8F9T3MTA5Tj8NuZ0KywR2ZGkNhum4wGmmBQiArfbx8B2w@mail.gmail.com>
Subject: [PATCH] media: ti: cal: drain WDMA IRQ before freeing contexts
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Myeonghun Pak <mhun512@gmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"

cal_remove() unregisters the video devices but does not release their vb2
queues. An active stream can therefore keep WDMA IRQs enabled while the
contexts are freed. The managed IRQ is released only after .remove()
returns, so a handler already in flight can access a freed context through
cal->ctx[i].

Use vb2_video_unregister_device() to release each queue and stop any active
stream while the IRQ is still available for DMA stop completion. Then
release the managed IRQ explicitly before destroying the contexts, which
synchronizes any in-flight handler before the context memory is freed.
Drain the IRQ on the probe error path before destroying partially created
contexts too.

Fixes: 343e89a792a5 ("[media] media: ti-vpe: Add CAL v4l2 camera
capture driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/platform/ti/cal/cal-video.c |  2 +-
 drivers/media/platform/ti/cal/cal.c       | 11 +++++++----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/ti/cal/cal-video.c
b/drivers/media/platform/ti/cal/cal-video.c
index d40e24ab1127..0310dba0c810 100644
--- a/drivers/media/platform/ti/cal/cal-video.c
+++ b/drivers/media/platform/ti/cal/cal-video.c
@@ -1036,7 +1036,7 @@ void cal_ctx_v4l2_unregister(struct cal_ctx *ctx)
 	ctx_dbg(1, ctx, "unregistering %s\n",
 		video_device_node_name(&ctx->vdev));

-	video_unregister_device(&ctx->vdev);
+	vb2_video_unregister_device(&ctx->vdev);
 }

 int cal_ctx_v4l2_init(struct cal_ctx *ctx)
diff --git a/drivers/media/platform/ti/cal/cal.c
b/drivers/media/platform/ti/cal/cal.c
index b7e77b6b8950..d332a05facce 100644
--- a/drivers/media/platform/ti/cal/cal.c
+++ b/drivers/media/platform/ti/cal/cal.c
@@ -1151,7 +1151,6 @@ static int cal_probe(struct platform_device *pdev)
 	bool connected = false;
 	unsigned int i;
 	int ret;
-	int irq;

 	cal = devm_kzalloc(&pdev->dev, sizeof(*cal), GFP_KERNEL);
 	if (!cal)
@@ -1186,9 +1185,9 @@ static int cal_probe(struct platform_device *pdev)
 	cal_dbg(1, cal, "ioresource %s at %pa - %pa\n",
 		cal->res->name, &cal->res->start, &cal->res->end);

-	irq = platform_get_irq(pdev, 0);
-	cal_dbg(1, cal, "got irq# %d\n", irq);
-	ret = devm_request_irq(&pdev->dev, irq, cal_irq, 0, CAL_MODULE_NAME,
+	cal->irq = platform_get_irq(pdev, 0);
+	cal_dbg(1, cal, "got irq# %d\n", cal->irq);
+	ret = devm_request_irq(&pdev->dev, cal->irq, cal_irq, 0, CAL_MODULE_NAME,
 			       cal);
 	if (ret)
 		return ret;
@@ -1268,6 +1267,8 @@ static int cal_probe(struct platform_device *pdev)
 	return 0;

 error_context:
+	devm_free_irq(&pdev->dev, cal->irq, cal);
+
 	for (i = 0; i < cal->num_contexts; i++)
 		cal_ctx_destroy(cal->ctx[i]);

@@ -1298,6 +1299,8 @@ static void cal_remove(struct platform_device *pdev)
 	for (i = 0; i < cal->data->num_csi2_phy; i++)
 		cal_camerarx_disable(cal->phy[i]);

+	devm_free_irq(&pdev->dev, cal->irq, cal);
+
 	for (i = 0; i < cal->num_contexts; i++)
 		cal_ctx_destroy(cal->ctx[i]);


-- 
2.53.0
