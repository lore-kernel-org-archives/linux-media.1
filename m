Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BC8371877
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 13:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784898744; cv=none; b=BxDf8F/7fwEQFQweekI3sAWGoW2Ur6KvAHdO4sEkuWdzGtjv5/pQBrb2wc2EzpLUHVPewkWCSa11gyPRuxI4Z3n2XMclIk5L0h4DlTk9w5xEd7rvVNUlyFMl9iXFIxXF06PdFYOVSXrKV4x9ajwk0lqg6rdI2skkhxIsRC5vaZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784898744; c=relaxed/simple;
	bh=S7Y8t4dcIthKykzBNL2s+eXrDh6GtFtLucUjWpYDR94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QnL12vg3OzxXZPxVpnNQ2nZ+vXTDymil5V/GBpzMvBlgEFOGEbPbOelxJ3bo/ArkEaCKeMWgxX1KLsI0gGjgSafs9JsHD38FldyHEPTmuqz8B9t8Z7/jAE+PmWjfPoSim4MJP6Ou0I8sD/UiS0OoCSqTIXR6Yp3cPB2Scs+AHKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ICqWoo/5; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ICqWoo/5"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-848d21bbaffso415332b3a.0
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 06:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784898742; x=1785503542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sFKNVa2uScHavigTP/Jv9UBdhKrx9CJ9eCeBI3gBJk4=;
        b=ICqWoo/5041SzBHquvqNjV5fCmetXkdgRMuA+qUFy+94R0qymSeVtm3EAN1MxTyn6p
         VptsxD0jscFh5XxO1CunRaR69aTHiJxwGW6dnyg3lD4xzQPrxuhwn8I1Ava/YhDxgkOX
         +kRIx6YiAmoynRumoeXAe8rqfzzuxGPo3i9tnK3sx0blNax1em9uUAEFrW145OjHkkaT
         tvTyRKIP6S8Tnr3Bfey3W3bkmHZdu7dfg2EU+GxYP33xraCn7cNlE0JuIbBhwr9l43CF
         UcoxWNA0falNxVDbBfoJAwGCIsF808GDhYE1W+uMA1XugBlOj3BT+TBJ6/XNZwi2DLAf
         9rxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784898742; x=1785503542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sFKNVa2uScHavigTP/Jv9UBdhKrx9CJ9eCeBI3gBJk4=;
        b=AbBKccL8xaaBxZ4E/zQZotut5iFCDQb+TFJBZ76X7zouTOdwVPF+MGmXON+IH9ZDl3
         /K9DOs3e2Y46fx81iO4+eRkkAwtPzouT+JPpWNCdxckibFHtCQ1jUx4O4JolMnwGdr2b
         lu0uvnrq1TI25L5exy63hVEMXwqgi0Y/04F854ju1IOo396euWy9s7fDayV/FY8P2vgt
         e8gotOv/QUwat9CpDlQWdFUNDyZz6W3O8nXxMyvONNmf0uLtQN4zpjL/pR1FOwzl0eyJ
         PgOGzQ8vn9mnMSNs0qW7AF2UpX5SC4PzjF9SrlmA/81B/OdQPIVgRiELX+4mcR1sh3va
         ZVdA==
X-Forwarded-Encrypted: i=1; AHgh+RqrspZp3X4/Zs48/iDBKzyYgPAO+4URqkLWGRpf5jGv/YaAOCjo1H0OraB49i7+/ca40JJMcnISQ4zE+g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yym/Dot0KFdDYwTc6we4XMl3BW/hgOURvTDtbqmRDV5Dfplf0k4
	2VR2LmnKDFJFp5TEGRnxxsyCrJEXDtt9WXj/v6TcRL2VO0AAZ6H0C5fG
X-Gm-Gg: AR+sD12IeL+L0VOGkldvPmum1hNZVzY3SD9Y/2CFYC5qRGByeH1DtlGM7h83zwHJUog
	a3qdBc3dqPbbRPRaBuYl0aggzfLf2eT0HOJU1vcjPm1l5zAtAwbRXqR4zO/EVzBKDGYyrgtGUi3
	fZWxS/ESTYEY+OiAONgM2O8FvE2rDgmPYbHlmKD/4kuHHahqNcAW7/Avqn3fVjW62s3yMXDMJYX
	K1N9O+aDfbKUGDkkSNA+sgUeOOvxRpKvwFGkHk0dojWawtBeoCmWNFogFrEYUVC+vnJJCkWvaF2
	dOXmayYgD8dWnTxPzRvoIgUSLnlIaQejRucf7MX887+VX4Cgm+WegJiXwfhEpsIRHiYjKMsi91P
	q7vZEN24zMhftEoxqQbl3sS4Eo93Qjamo7o9WwrmDN1GVVF9DKSLTUQfURmj1wCieXBrgmJYYjp
	4WyAwd42hKTnezRFPV5Re3TzBiVDWMT6WDVYZRFX1vlhJ1/F7XMheKdhcGEVyX
X-Received: by 2002:a05:6a00:139c:b0:848:4c3d:659f with SMTP id d2e1a72fcca58-84e2c29b83fmr8147681b3a.75.1784898742361;
        Fri, 24 Jul 2026 06:12:22 -0700 (PDT)
Received: from debian-rockchip-rock5b-rk3588.. ([184.22.139.118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e175ce455sm4666968b3a.48.2026.07.24.06.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 06:12:21 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH v2] media: hantro: release runtime resources when device_run fails
Date: Fri, 24 Jul 2026 13:12:08 +0000
Message-ID: <20260724131208.2315-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <CACak8wN-Y=oDbEVbou+RetS9X-Lca_MZHSY2NJFaGWR3LoVBKQ@mail.gmail.com>
References: <CACak8wN-Y=oDbEVbou+RetS9X-Lca_MZHSY2NJFaGWR3LoVBKQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

device_run() acquires a runtime PM reference and enables the VPU clocks
before invoking the codec-specific run callback.

If clk_bulk_enable() fails, the runtime PM reference is left held. If
the codec-specific run callback fails, both the enabled clocks and the
runtime PM reference are left held.

Add separate error paths to release the resources acquired by
device_run(). Disable the clocks when the codec run callback fails, and
drop the runtime PM reference when either clock enabling or the codec
run callback fails.

Fixes: 775fec69008d ("media: add Rockchip VPU JPEG encoder driver")
Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
Changes in v2:
	- Fix the codec run failure path to disable the clocks before dropping
	  the runtime PM reference.
	- Use a local vpu variable in device_run().

Tested on a Rockchip RK3588 (Rock 5B) board with Fluster:
  H.264 (JVT-AVC_V1):	     129/135, unchanged
  MPEG-2 (MPEG2_VIDEO-MAIN): 23/43, unchanged
  VP8 (VP8-TEST-VECTORS):    61/61, unchanged

 drivers/media/platform/verisilicon/hantro_drv.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 2e81877f640f..72250bb56872 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -170,29 +170,34 @@ void hantro_end_prepare_run(struct hantro_ctx *ctx)
 static void device_run(void *priv)
 {
 	struct hantro_ctx *ctx = priv;
+	struct hantro_dev *vpu = ctx->dev;
 	struct vb2_v4l2_buffer *src, *dst;
 	int ret;
 
 	src = hantro_get_src_buf(ctx);
 	dst = hantro_get_dst_buf(ctx);
 
-	ret = pm_runtime_resume_and_get(ctx->dev->dev);
+	ret = pm_runtime_resume_and_get(vpu->dev);
 	if (ret < 0)
 		goto err_cancel_job;
 
-	ret = clk_bulk_enable(ctx->dev->variant->num_clocks, ctx->dev->clocks);
+	ret = clk_bulk_enable(vpu->variant->num_clocks, vpu->clocks);
 	if (ret)
-		goto err_cancel_job;
+		goto err_pm_put_autosuspend;
 
 	v4l2_m2m_buf_copy_metadata(src, dst);
 
 	if (ctx->codec_ops->run(ctx))
-		goto err_cancel_job;
+		goto err_disable_clock;
 
 	return;
 
+err_disable_clock:
+	clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
+err_pm_put_autosuspend:
+	pm_runtime_put_autosuspend(vpu->dev);
 err_cancel_job:
-	hantro_job_finish_no_pm(ctx->dev, ctx, VB2_BUF_STATE_ERROR);
+	hantro_job_finish_no_pm(vpu, ctx, VB2_BUF_STATE_ERROR);
 }
 
 static const struct v4l2_m2m_ops vpu_m2m_ops = {
-- 
2.47.3

