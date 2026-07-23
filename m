Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563E9390C89
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 15:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784821026; cv=none; b=ot9kFyd/5UnysmpT6GcytJqYgZVfl29TspewPiH48dynQyysvbmQnH85KPquNdaW6+sq8ivZaR+RPk6AbuZ9a/CbcPhXUYmTM5w1ow0yyaFq7QUjiIWPYteGZijGNnt2IuP1lyUkxNm0M/27YfgwujYwBC5Qjr2Sbpf0EmrT4lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784821026; c=relaxed/simple;
	bh=N4kUSU4o8AKluWDZEqHZBA5NgJOPOPim6YXMd4c1hiU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LmMRIsRlPRIK6m95qM7WnqkvfWUHajwHPmsVvrQHBakztQholjjhR2jDW+9gkw0I3tgMi0LSx22Wmpf3K7mb/whlx09W2hi6E0WGpAzdmV51e+Kv53deWvkmfqUngczaZkeAPE5kNQ5OeRGK6yIL/rAcVM77BymrikwRHqYnifk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kFdiA1sR; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kFdiA1sR"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8485ef63b68so798287b3a.1
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 08:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784821025; x=1785425825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y/CrixQ3EkxP2WoSCLt7vnc1mcHljZIG3GR5HRF0Syc=;
        b=kFdiA1sR1E5l2apYZ0NX1kbLR9xRV8QjemwbDOggHl9U3wt+JkrdWn2oA+h5NQC4QE
         yG1dlYfe3ebjhjPgiBwPNZ4fPPINezMiJZ8yG6Fy8v9R7NoicVz6PxVzcVXiPYDsGhLM
         PVOw9x/e/9IPAqRc3SOShTmFhA5fj86COFC+iwCobkadFAaPkRFClsEzkPceG9XBgwtt
         4OSHBim4Vg/6dxQemW5CzWztEk6ZD3zP8LRZylPCClskxAae0BLmWq++6i9LjZt1wqE9
         Gnf9Ygac6pmR2qY+n/cXRFM3BKuP+zUUJ6WYdDycyI9fbh7TxtggDQNUmF6oKIyYnT5u
         mVzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784821025; x=1785425825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y/CrixQ3EkxP2WoSCLt7vnc1mcHljZIG3GR5HRF0Syc=;
        b=Uty2rGghsGUMcQXS+Ap+UTAF9h6Dcc3TVG99xYvMLETs8mB2aAfEj9lt2axgmM+iMj
         kBteCBhlfvzKgGPkAnXsrIRhcPfVHXjxj5mB4BfMWe/VeRqm8KkX0XYckiUWEYm9XbCM
         Aaan+whBv2rhk4YY1gVl3Pj5Ye5oKk+05eFJbCfpN8D72UuOc1gcQg5FcXQfHYIhFVZp
         pzZwrQcZFb+W0dvtertqPMJCBNBl/sPZYBrGD7dsZ42CcRiPyWhFj9IcZ54LKtVUQ8Nv
         ALkRSr40GmOm4U3wy4hEDaCk0LGpmhwpolO/fEWM9g5xSwzR3X92wasAkQgSw/sx63aI
         OEPw==
X-Forwarded-Encrypted: i=1; AHgh+RpyBbA/BgdAbY09W1f4IODaQtC+8JaYwJm69JCdqKnbteRkguEARYRRHjMjA2/44MSRyFPvhynBJGNWZg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1kIQ5WuuH6eSfTs1kCyTaLmkPYernikzUk1ySoq15qbeYJ8Ub
	4bMC5X9pJKcv/V20qKm99YiE7VwBh+mmH3WgK+2aU3v3vYSU6l10hiqi
X-Gm-Gg: AR+sD11yZjDQkSxqMmAuDvI55UMyIWjF3EoX+MpdnKOj6bycOAAwCVaDBtMbHtpTPY3
	6Y3v6Vf/laOOkRk+p9RpGy1/oK+4/BXhsRH/KfX5Hh4SiwNPa2kgOJVvaPuhfoJgIIWKrsPjz/d
	7m4gXekcbQ3QZkcZPReUyBaNEisGcT6EBdu21cO0MDLVplpFMJoaKMZY32FiNWgY4BDTI0jiohf
	OlhJmkofUiX0geyHCw/9BTVt8L3/NctA3IOpom4q2FgckHq7tv9E8vdeCeW/jt19cik3cJIjKbJ
	sjHScUaXECq78z/kax6BYbEkD+Lyiv5gKnT2R4iQtSExDDquNeuhvfWNWNPD90w0DZivhkSaXLh
	mH9Sv4uE/n+4NFndIRetc0gB2lCOEF9ebJd1VB+oGOi+xoZcscOCXWwtt9+83uyJ0M7i4X5dmqB
	SisUAmoYbW8bigrW/1pk2+1uorODHldCSzALo3ed+C+OforJcfKK9aspGBNgUG
X-Received: by 2002:a05:6a00:181d:b0:84c:4d9a:ae42 with SMTP id d2e1a72fcca58-84e2b8bf838mr4448206b3a.27.1784821024558;
        Thu, 23 Jul 2026 08:37:04 -0700 (PDT)
Received: from debian-rockchip-rock5b-rk3588.. ([184.22.136.124])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e1723643esm3212522b3a.3.2026.07.23.08.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:37:04 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcamplbell.com,
	jkoolstra@xs4all.nl,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH] media: verisilicon: vp9: do not arm watchdog on preparation failure
Date: Thu, 23 Jul 2026 15:36:56 +0000
Message-ID: <20260723153656.2167-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hantro_g2_vp9_dec_run() calls hantro_end_prepare_run() when
start_prepare_run() fails to find one of the required VP9 controls.

hantro_end_prepare_run() completes the control request, but also schedules
the hardware watchdog. Since the decode operation has not been started on
this error path, the watchdog should not be scheduled.

Factor the control-request completion out of hantro_end_prepare_run() and
call it directly from the VP9 preparation error path. This preserves the
pairing with hantro_start_prepare_run() without scheduling the watchdog.

Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
Testing:

- Built with the Verisilicon Hantro driver enabled.
- Not runtime-tested: the available RK3588 board does not expose a Hantro
  G2 VP9 decoder.

 drivers/media/platform/verisilicon/hantro_drv.c    | 13 +++++++++----
 .../media/platform/verisilicon/hantro_g2_vp9_dec.c | 14 +++++++++-----
 drivers/media/platform/verisilicon/hantro_hw.h     |  1 +
 3 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 2e81877f640f..04167e4be003 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -147,10 +147,17 @@ void hantro_start_prepare_run(struct hantro_ctx *ctx)
 	}
 }
 
-void hantro_end_prepare_run(struct hantro_ctx *ctx)
+void hantro_complete_ctrl_request(struct hantro_ctx *ctx)
 {
 	struct vb2_v4l2_buffer *src_buf;
 
+	src_buf = hantro_get_src_buf(ctx);
+	v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
+				   &ctx->ctrl_handler);
+}
+
+void hantro_end_prepare_run(struct hantro_ctx *ctx)
+{
 	if (!ctx->is_encoder && ctx->dev->variant->late_postproc) {
 		if (hantro_needs_postproc(ctx, ctx->vpu_dst_fmt))
 			hantro_postproc_enable(ctx);
@@ -158,9 +165,7 @@ void hantro_end_prepare_run(struct hantro_ctx *ctx)
 			hantro_postproc_disable(ctx);
 	}
 
-	src_buf = hantro_get_src_buf(ctx);
-	v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
-				   &ctx->ctrl_handler);
+	hantro_complete_ctrl_request(ctx);
 
 	/* Kick the watchdog. */
 	schedule_delayed_work(&ctx->dev->watchdog_work,
diff --git a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
index 56c79e339030..e08db6e3f6f9 100644
--- a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
+++ b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
@@ -36,12 +36,14 @@ static int start_prepare_run(struct hantro_ctx *ctx, const struct v4l2_ctrl_vp9_
 
 	ctrl = v4l2_ctrl_find(&ctx->ctrl_handler, V4L2_CID_STATELESS_VP9_FRAME);
 	if (WARN_ON(!ctrl))
-		return -EINVAL;
+		goto err_complete_request;
+
 	*dec_params = ctrl->p_cur.p;
 
 	ctrl = v4l2_ctrl_find(&ctx->ctrl_handler, V4L2_CID_STATELESS_VP9_COMPRESSED_HDR);
 	if (WARN_ON(!ctrl))
-		return -EINVAL;
+		goto err_complete_request;
+
 	prob_updates = ctrl->p_cur.p;
 	vp9_ctx->cur.tx_mode = prob_updates->tx_mode;
 
@@ -86,6 +88,10 @@ static int start_prepare_run(struct hantro_ctx *ctx, const struct v4l2_ctrl_vp9_
 	v4l2_vp9_fw_update_probs(&vp9_ctx->probability_tables, prob_updates, *dec_params);
 
 	return 0;
+
+err_complete_request:
+	hantro_complete_ctrl_request(ctx);
+	return -EINVAL;
 }
 
 static struct hantro_decoded_buffer *
@@ -894,10 +900,8 @@ int hantro_g2_vp9_dec_run(struct hantro_ctx *ctx)
 	int ret;
 
 	ret = start_prepare_run(ctx, &decode_params);
-	if (ret) {
-		hantro_end_prepare_run(ctx);
+	if (ret)
 		return ret;
-	}
 
 	src = hantro_get_src_buf(ctx);
 	dst = hantro_get_dst_buf(ctx);
diff --git a/drivers/media/platform/verisilicon/hantro_hw.h b/drivers/media/platform/verisilicon/hantro_hw.h
index 13e573f1f19d..9d4e858f17c7 100644
--- a/drivers/media/platform/verisilicon/hantro_hw.h
+++ b/drivers/media/platform/verisilicon/hantro_hw.h
@@ -430,6 +430,7 @@ void hantro_watchdog(struct work_struct *work);
 void hantro_irq_done(struct hantro_dev *vpu,
 		     enum vb2_buffer_state result);
 void hantro_start_prepare_run(struct hantro_ctx *ctx);
+void hantro_complete_ctrl_request(struct hantro_ctx *ctx);
 void hantro_end_prepare_run(struct hantro_ctx *ctx);
 
 irqreturn_t hantro_g1_irq(int irq, void *dev_id);

base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.47.3

