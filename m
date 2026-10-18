Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C097361965
	for <linux-media@vger.kernel.org>; Sun, 18 Oct 2026 02:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792291623; cv=none; b=osorMhy4Z5yvs+kur3dAbRWhXoVu3BY3aN9DW2GleLTTcvH5S/5whCsnkV1r7/p6VaPv959GxGoZuDZqxrY0MjEDjWUWh42ZX0nz+AWqe7nBagLUNEwMFkFVDZrtJTQ3pVQV5hikwjMNxBWKgflnqQylpPbTOL4QF4ilxsH+ecg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792291623; c=relaxed/simple;
	bh=V2vxO5K6ARMT6M9vAOXsNeWmHh7gJMCXeMXS6GzMn+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X6i7949GNJghSmoeajiyr8slQP30eg+ZxKPlH2AK73dGQnR+4wr+nbHOe77/9jEmXljbaVIZG2WHZnxc8aWlmgSHEn1Gc+lXSOHS5r/cqwxLRoLT/5PxJ55XhIL2q0rvLtOQmIYfQmjAY5GqGyFwB9BuTFTi0wqR5nrMD6N5BzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p3ZUDYmm; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p3ZUDYmm"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-917a6dccc60so14705436d6.0
        for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 19:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792291620; x=1792896420; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8XiEmUUGLcxWoBWH/WFW3dYywAFVVlMQFh79JSPvB1Q=;
        b=p3ZUDYmmKmxCe/5seqs+ayc8wYY+758GLRjLYsufSUMUADS6K6fOp+kvcyqlRGzwZv
         h1tzUDZBh9oOxAGihnqX3iUSSJAyDdvNSZe+cFRiuSDeGHov3zXfVklFgpAQJjYne/WE
         3xeknyWCe36pj2zWpVyUFE6F9KDd6GEyk3yHG1x8YDsmdtkvlyT0IvoYdXFju+tjCIY/
         M0ehjRUi9zj6gM2zaLVpwbY/RuzVRs77Ct5Gm+EtoYU5qMI9OsYO/OpS+zHH1IePf9W1
         YllUmyHQPpdanmHPEj70EVP+O+44p7NPcfiYi50j4vG4IGGcg6WUvnpUlCG6g8XfyGp5
         5/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792291620; x=1792896420;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8XiEmUUGLcxWoBWH/WFW3dYywAFVVlMQFh79JSPvB1Q=;
        b=xAr7fezW+z7qDxUB/7NwdSXuoszCbl0a1BZ1WzMY0WNgivl2E+Q9r4JyexopfwWxuv
         SujGehS+JGng9lMtV33xA+KqDRe9xw6RTBtvLy6jq6W/UEOuoR1WgyqRNfW7+wbwffkP
         IU6ybhCfol7+FdTvZgWkBeg5xhiIiRbt8DVnKMTxYXr227WHl5H8YYhii+HHlxOoWTbW
         NYmLi3p7Jpdijg64bF0aFaRNCFWsojBkdgsUIOzpwUQ3Zewuxqq+3UMuLEnaT43L+Jv4
         HlZYgZSqb8BAAgyTKiIAhYkWYa9uilAm1hSulD+yIkwvMchGQy9hwJRBSXOovM/aMFN2
         kStw==
X-Gm-Message-State: AFq9FYJBMZEAwRXNasrorGwM+exqxIVWMd4Kb+cO/spbmi5NiPQ8dtJT
	wK+QI9VLZugRaDNWj76gDpXmDIfY9SB42qDFMKis8eQWt0il6isQIZa6t20wBU8=
X-Gm-Gg: AYBFou25fvwKNPNmPe5ke+e3URq7o7R6EQYF1hqIwP5Ed6GeioDxtfSwtLnbaDU+cBe
	B38oeAUn8LKtOpxGCkJ5b4dvgEyyKHNT55dGiBctJNXxKeAuaRG09zrJQrJsF/Q5d4EEho5mses
	O/k0h1QlF9tSAlb4j3FfOrdm2xtd4UEqi+yTilMatukV0byA5/J7RLqEb3fLhgcI4Ru6kh8yCj5
	HF1tMxxlfuBymOyBrx0yDoR3mVJiSGw3+aEV2pzgdpRJ1wCL6ou6h6pV/5jDRF2ATRiWQLSHTqj
	e/B3B3xU1tPIRtoIwiE2lL8rBIZ5NWIZatXXBWVNRFSWdWXppSbXoQKDK30A8miYxE6OgYQuBvd
	QIkIvcmxyxHRaHOA406os48dFLjC62RA+X+V9tIm7D1NIQLPvnjjeYTaPzyrYqe7NFO5J2ktEdI
	YrENKTeQ9dP0UZSElNOxJNLCnwKQEwqKZzIhfV77NRPVLHOvsGRS+SKmlTgoC6YSj3fMgW6FrDQ
	PYOko9YB5uNdTO4rlvDUQCq55TvVhMHEpM8YXK0r6fw2FyLjYAvjOg987BS1xUbpqHz9gnF4+5s
	6VTTsJCLfJi+uVx5Q+HJGRw4jG+Y
X-Received: by 2002:a05:6214:2024:b0:91b:841c:488f with SMTP id 6a1803df08f44-91bdf0129c8mr74124096d6.11.1792291620208;
        Sat, 17 Oct 2026 19:47:00 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcba4b9f0sm62019456d6.10.2026.10.17.19.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 19:46:59 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Niklas =?UTF-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v3 2/2] media: rcar-isp: release the core interrupt before destroying RPPX1
Date: Sat, 17 Oct 2026 22:46:54 -0400
Message-ID: <20261018024654.3913088-3-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018024654.3913088-1-mhun512@gmail.com>
References: <20261018024654.3913088-1-mhun512@gmail.com>
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
Changes in v3:
- No code changes relative to v2.

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
index 373d9ca9374fe..78cbb549fd18f 100644
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
@@ -909,6 +913,7 @@ void risp_core_remove(struct rcar_isp_core *core)
 	for (unsigned int i = 0; i < RISP_CORE_NUM_PADS; i++)
 		risp_core_io_destroy(&core->io[i]);
 
+	devm_free_irq(core->dev, core->irq, core);
 	v4l2_device_unregister(&core->v4l2_dev);
 
 	mutex_destroy(&core->io_lock);
diff --git a/drivers/media/platform/renesas/rcar-isp/risp-core.h b/drivers/media/platform/renesas/rcar-isp/risp-core.h
index 627a762d6b192..70432cf4a88ca 100644
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
