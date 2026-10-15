Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83C22D12ED
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 00:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792024929; cv=none; b=RzUhtUso4qtTPx6TpTMol/iSa06BYq6G1WvInC9OMya5kbGBc5gfjKYrlhg+050WL6DhzCRnBbBzf+bBOW7PnOmohwoxwVaTAhMt63lSdplvCfsU0rQoD3XwnokwzselntXlVGZZ3VqFqxTRXNUTx35LeIydmV2dW2ct+TUvujo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792024929; c=relaxed/simple;
	bh=+a/OKUtIrEnquOjSF4TKvW8Wf2d4YlbORphsb2iVCy0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=psIjP/tIavw7xFlMhGWJor8VAhMWAOYTVK7zhYRZ1PGDeIo3qRjXvU61abeFkTQg0cj0qr5ZyGCLp1Lf++KNY0kDMIfYMgH/88PAmLZ3/SyV4W9Qq5V/WFP9y0gIhp4aHfSoif6o2Zl+LlSnD7DXBLbAz7Ek24ZHOTEDewaX520=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g7SlaTyF; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g7SlaTyF"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-9178d514951so8319436d6.0
        for <linux-media@vger.kernel.org>; Wed, 14 Oct 2026 17:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792024926; x=1792629726; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BEZUBFo8nRaoj8VHLSEwqMGAs0iozVKtPiCZ6gjjOMs=;
        b=g7SlaTyFWvzROrs/KuY05gjrqhTihvFZQVxa9FcgupWB49vqrdNDyyg7slqMeG/BZj
         OSVwcll3S2IIX64S0lIcPzVqORDUvlgVm5MOqfpGqZ4iCnT/sAStOcUYnsDXqnWcoC8o
         JRVrIunbuh7zrAJqNxC43MGxp26R1I/5P/kJQXKKPjtSIAs5bYh7rvoAOVgoWz9HuK22
         JahVxeQd6GqN39ncT3pWBeBsZbD05ysAe3DR4lZf+SSQuaqK0sMozixQ7zBuncBYkjAw
         pQcppXrL8rLRVBq0J0DmY07oQS9JLlmfi829W9bh1Pni3Fc5uH3H0QQ5GbNICXVg41tF
         eMtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792024926; x=1792629726;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BEZUBFo8nRaoj8VHLSEwqMGAs0iozVKtPiCZ6gjjOMs=;
        b=GpElTB8Q9BVYmusazkadvMN9UXuyL0SRUxdshNK/O8lQp9w7LeoCWBqAChqn13zVnI
         4Sv/n8kPn6iD/J5RyBipt6RH2kQtozT/S/38+mDI6hMVC0ES2MYnSN7gXIuyIqeJ9E5s
         dEajYDrGW2xuPsUEsMPXbupY9d9xL5aBEH/R45BZycwFLyAiV4roaUC8FqYwHN5awabs
         0QVIdGsZcGLdbDJgIMimzitcnxqq4easdrkP6PWmYiIBo5JobrynIhiDaAkfGVVMNF9p
         WAbKljHyVPK7GCIf2xb2js1xJLIXxEzPYOhWTtD3eZfe/1zGP9oWI/TNu+ovbe0AiIjS
         rTGg==
X-Gm-Message-State: AFq9FYIdOLdvG5GsNwPhVoggIooahVO+6D5VjOvi7DPQFTmvjxf0kA/k
	ioj7sp3AHQN+7DkaGFhGccFVWG7apnQcb9IHJreVzSt8cqmNMT+JJ5w=
X-Gm-Gg: AYBFou0aVodG3gPv+lLzNOtp2pfDEk9GBTibg3sXFR020byiGqOTD2GdRJT5Maipebq
	0DEG8QM3OOlDV/Pza+rANnwGIElr1qwb/kc8ZguZhB/qLqjdCUE4m8DhrZ8OyZ5s1qhw96YliFn
	SoAmnHBeRlutQVx5RBXO5bYbhrahOsBD+xMX2Idq6QfQtSb+uwOYDwVHzb44k6xLaLcq88jj3Jh
	A1p0DWHsf1Dfp/Wq26ILCYgvL7qGDzOMJLwYfsluvlt7MVZmw+VZKLJANwScQdn5QA8hFdR2nOv
	yzL3PNuHSRGcsnUb8M7lEOGqaaIqqJvIlLmPzbNGfiC/VIHnZAWOHRm7rXtTSzu2lH9WnEWedVM
	wqK95MdrwltOCPWitvrJjIp527eQUPAMZAUS3jY/wWnXUqr0Abgv3W/1WgErqW2l4cP7/L4UMHA
	GsvRdO0jTjrHGv6n5rtW8N+xxyMWpXSUsFXXMPiJ2G+aFUxncjQR9q3cy8VfVRNd1AUh7o3uGOQ
	pZjHCX2A0j5yRQsI+qeIqn3iCnijvlMFCQr8KJnJYouNL9/sMOd73R6MRL6YRnbbTOENEpZCz1+
	/2bnco3BIpFEoUzd
X-Received: by 2002:a05:6214:458b:b0:91b:8b44:d4be with SMTP id 6a1803df08f44-91b8b44da3bmr147327936d6.28.1792024925532;
        Wed, 14 Oct 2026 17:42:05 -0700 (PDT)
Received: from gmail.com ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b7b31esm66811476d6.26.2026.10.14.17.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 17:42:04 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: niklas.soderlund@ragnatech.se,
	mchehab@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ae878000@gmail.com,
	jacopo.mondi+renesas@ideasonboard.com,
	sakari.ailus@linux.intel.com
Subject: [PATCH v2 2/2] media: rcar-isp: release the core interrupt before destroying RPPX1
Date: Wed, 14 Oct 2026 20:41:59 -0400
Message-ID: <20261015004159.2202899-3-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015004159.2202899-1-mhun512@gmail.com>
References: <20261015004159.2202899-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

core->rpp is a separately allocated struct rppx1: rppx1_create()
allocates it with kzalloc_obj(), and rppx1_destroy() frees it with
kfree(). It is not part of the device-managed core allocation.

risp_core_irq() calls rppx1_interrupt(core->rpp, ...) before taking
core->lock. rppx1_interrupt() accesses rpp->base through rppx1_read()
and rppx1_write(), and can also use rpp->dev. An interrupt handler that
has passed the ISPCORE status check can still be using this object when
risp_core_remove() frees it. Stopping the video queues and taking
core->lock do not join that earlier part of the handler. The managed IRQ
is otherwise released only after remove returns.

Request the IRQ after the RPPX1 object, subdevice, locks and job list have
been initialized, so probe error paths cannot leave a handler using an
uninitialized or freed RPPX1 object. Release and synchronize the IRQ after
stopping the I/O nodes but before unregistering the V4L2 device and
destroying RPPX1.

This issue was identified during our ongoing research while reviewing
kernel code.

Fixes: 2151350f60d1 ("media: rcar-isp: Add support for ISPCORE")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v2:
- Identify the separately allocated RPPX1 object and the rpp->base/rpp->dev
  accesses in the interrupt handler, rather than the core lock lifetime.
- Move -ENODEV handling into a separate prerequisite patch.
- No code changes relative to the IRQ portion of v1.

Compile-tested with Clang 22.1.2, W=1 (arm64). No runtime testing.

 drivers/media/platform/renesas/rcar-isp/core.c      | 13 +++++++++----
 drivers/media/platform/renesas/rcar-isp/risp-core.h |  2 ++
 2 files changed, 11 insertions(+), 4 deletions(-)
diff --git a/drivers/media/platform/renesas/rcar-isp/core.c b/drivers/media/platform/renesas/rcar-isp/core.c
index 586a5adbedfa87025d4258fd75a312a9a7b05ae2..6bf1dd6504862a50299893270e68f06b0d6ed25d 100644
--- a/drivers/media/platform/renesas/rcar-isp/core.c
+++ b/drivers/media/platform/renesas/rcar-isp/core.c
@@ -802,10 +802,7 @@ static int risp_core_probe_resources(struct rcar_isp_core *core,
 	if (ret < 0)
 		return -ENODEV;
 
-	ret = devm_request_irq(&pdev->dev, ret, risp_core_irq, IRQF_SHARED,
-			       KBUILD_MODNAME, core);
-	if (ret)
-		return ret;
+	core->irq = ret;
 
 	core->clk = devm_clk_get(&pdev->dev, "core");
 	if (IS_ERR(core->clk))
@@ -887,8 +884,15 @@ int risp_core_probe(struct rcar_isp_core *core, struct platform_device *pdev,
 	spin_lock_init(&core->lock);
 	INIT_LIST_HEAD(&core->risp_jobs);
 
+	ret = devm_request_irq(core->dev, core->irq, risp_core_irq, IRQF_SHARED,
+			       KBUILD_MODNAME, core);
+	if (ret)
+		goto err_destroy_mutex;
+
 	return 0;
 
+err_destroy_mutex:
+	mutex_destroy(&core->io_lock);
 err_unregister_v4l2:
 	v4l2_device_unregister(&core->v4l2_dev);
 err_destroy_rpp:
@@ -908,6 +912,7 @@ void risp_core_remove(struct rcar_isp_core *core)
 	for (unsigned int i = 0; i < RISP_CORE_NUM_PADS; i++)
 		risp_core_io_destroy(&core->io[i]);
 
+	devm_free_irq(core->dev, core->irq, core);
 	v4l2_device_unregister(&core->v4l2_dev);
 
 	mutex_destroy(&core->io_lock);
diff --git a/drivers/media/platform/renesas/rcar-isp/risp-core.h b/drivers/media/platform/renesas/rcar-isp/risp-core.h
index 627a762d6b192c6cac454ba30cde708406f550ce..70432cf4a88ca97fa1c93cf4a42bf7454b7739e8 100644
--- a/drivers/media/platform/renesas/rcar-isp/risp-core.h
+++ b/drivers/media/platform/renesas/rcar-isp/risp-core.h
@@ -112,6 +112,7 @@ struct rcar_isp_vspx {
  * @dev:	(OF) device
  * @rppaddr:	Hardware address of the RPP ISP (from OF)
  * @clk:	The clock for the ISP CORE
+ * @irq:	Interrupt for the ISP CORE
  * @rstc:	The reset for the ISP Core
  * @csrstc:	The reset for the ISP Channel Selector
  *
@@ -138,6 +139,7 @@ struct rcar_isp_core {
 
 	u32 rppaddr;
 	struct clk *clk;
+	int irq;
 
 	struct reset_control *rstc;
 	struct reset_control *csrstc;
