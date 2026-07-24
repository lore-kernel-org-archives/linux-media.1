Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB2233D6F9
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 11:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784891764; cv=none; b=eHw4XD/CT/fOGW04WHveR3v5f/cqhkyDdl8786xko9cKXE/RKXcVf6mVE5BcW0Tpzey8NgSp637yze18PcDUlEzjCr2YNomh9S9a2W0x8a0DAVV8PynWbr/O7vHerGeSR7LKparnEdhDZZIpDagYmj7cL6884kND5UpiCXl29tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784891764; c=relaxed/simple;
	bh=/+UuceguC9yXU3f5M46mFFc4fdT9Z6jZUm6WXImCwBA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sosK2WQe7Ak0FHUGpS24JlW2dNwZ7fMMjgse2sKSIDYedMY7MHPsDvKxzoPbeqNdPZdHHR/e4717OynoT+uxrA9BQ3b+wrUl1X+jnnMBrXZGQvs7z0JI+tFrMAQVe4GAmCVJKfaUENmGKxHKr8IrhvOmWNSwDAYzApjgL6fhGiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jT02C8OG; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jT02C8OG"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso197333a91.3
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 04:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784891761; x=1785496561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7h17JbhLU+77sg51wrzjO1vG3T/1lQHWX6olvED5GMA=;
        b=jT02C8OG9s+FfLwfOM6sxRhQ7hgc5dSpMmLwo+IIzg8snE8VmQQOnpiBfo8mFCaW2x
         Mq/FOjxBZDV/8+rZ53SgUxgQ3hwatL6As/itMeuWnA0YXbOvim9c0EcbaBYLZ6hCsT4j
         ShqFaXEd6tsBXzphD6z79iXfIYUfGFeIppHEtxBQDCbMaNGYTHxUItGwsJp/ZcrSQL5X
         fRce2nXOosvYnnV9G1niareA1IBH1eFEg2w/+l+KG55fSrol8tEvEx1mPzk//lP3jr5a
         cq2IjANILKXCfiNqzhLxl1Dj+62Ezcog+sHM2ijqbVNspLKW+NKPrB9pJ6b5YYFT3HU3
         158Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784891761; x=1785496561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7h17JbhLU+77sg51wrzjO1vG3T/1lQHWX6olvED5GMA=;
        b=SZH7CLq/y2l/5Z/VS9I+MoTeVbx8xnvC5KcAb1YqRSCML4+oI6kayBzEO+7zwmWm8n
         S/wujoiv0TzBEz6YU0D79SQbxhmGVbY7v9P4O2CT2PdRwz0pWmgGt/WOTvdoTthlbszj
         SVbmMb89RYhARmRba9hDmS5PZRimoWalg+W3lX9ai/heBoQzMcYMuUFSF54IOZu8nAp4
         Mw60ugE3KTkSnXKuMCoqZFdBfPnkPUflkbEqjZRN7e5b8/bd7tE+Xh4M13keC0dhoq06
         /ZzKoGrOWMrzkg6rjRpWBO53GHIC3kGSjlexWVcVTZ+7B5pBxIeu0UXSTbSLBCua+NB6
         7jsg==
X-Forwarded-Encrypted: i=1; AHgh+RpvMA6xZT8RnOP7hM+6YqAVOFIGbeB9KoMQgwU6Aos2+z8rlmKwoSOkIRyToxxoxYGG0T2wlEhEI4ekdw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8PbemekFuJAaFmh1pOJX1W7rz6C77GP/HPeqri/0GfRzyRs9g
	1+UAg4JTi85Akss4vVnE0GGq//lU9GTi3QmeZdZ3ybKG02mx4/v0vHBR
X-Gm-Gg: AR+sD12KkuA9NGbVigtaTf+YjnU0newNAGiMqvIgRAzSwi3Bp2kbTFQRKZlHZVK3T7X
	Zyi9YylEs7aYAJCnWT4hHzY3iaqyQMw4A7SK68/tPDpLWX4sByzNO5nh6DWD9AhA/cLXyMgqmeq
	QQVboyiEce4K83pJQzmcuAwJnqUYIjgWGVvmPNQ595QUpdQDfGpQStgBNP5BRfin1712Dvo4zgZ
	tQe8fHJUFD30g7kfEAPEq5Pcz5e/7+JGx9Ew8l7FQBY9qq3C6IjsXd86bERA1MTl/a6cim++tSe
	C5j2pdjkElNARyvRK5WJ1TlhK26vas0RVMn8G1vR+Ozj72lRSgogT9Hg67whEFiw7b8/F/rXXtV
	Atdusq6ne5pGB82yRks7wg0q71vA09zCiDsISChR1GVv2UIf8BXUVFDphFzdEZrZb+oxk+2Sce2
	AxwC1jZDp+aump6E92KgnKy+BCWgT2R9YRlIs0qJngmdJ/dzCluaQc1kYb3gBf
X-Received: by 2002:a17:90b:4c8c:b0:38e:47e0:3ddd with SMTP id 98e67ed59e1d1-38ec65da07emr7051136a91.34.1784891761291;
        Fri, 24 Jul 2026 04:16:01 -0700 (PDT)
Received: from debian-rockchip-rock5b-rk3588.. ([49.228.106.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03c4580csm1316850a91.15.2026.07.24.04.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 04:16:00 -0700 (PDT)
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
Subject: [PATCH] media: hantro: release runtime resources when device_run fails
Date: Fri, 24 Jul 2026 11:15:48 +0000
Message-ID: <20260724111548.2109-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.47.3
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
Tested on a Rockchip RK3588 (Rock 5B) board with Fluster:
  H.264 (JVT-AVC_V1):	     129/135, unchanged
  MPEG-2 (MPEG2_VIDEO-MAIN): 23/43, unchanged
  VP8 (VP8-TEST-VECTORS):    61/61, unchanged

 drivers/media/platform/verisilicon/hantro_drv.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 2e81877f640f..9daaf129211d 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -170,6 +170,7 @@ void hantro_end_prepare_run(struct hantro_ctx *ctx)
 static void device_run(void *priv)
 {
 	struct hantro_ctx *ctx = priv;
+	struct hantro_dev *vpu = ctx->dev;
 	struct vb2_v4l2_buffer *src, *dst;
 	int ret;
 
@@ -178,11 +179,11 @@ static void device_run(void *priv)
 
 	ret = pm_runtime_resume_and_get(ctx->dev->dev);
 	if (ret < 0)
-		goto err_cancel_job;
+		goto err_disable_clock;
 
 	ret = clk_bulk_enable(ctx->dev->variant->num_clocks, ctx->dev->clocks);
 	if (ret)
-		goto err_cancel_job;
+		goto err_pm_put_autosuspend;
 
 	v4l2_m2m_buf_copy_metadata(src, dst);
 
@@ -191,8 +192,12 @@ static void device_run(void *priv)
 
 	return;
 
+err_disable_clock:
+	clk_bulk_disable(vpu->variant->num_clocks, ctx->dev->clocks);
+err_pm_put_autosuspend:
+	pm_runtime_put_autosuspend(vpu->dev);
 err_cancel_job:
-	hantro_job_finish_no_pm(ctx->dev, ctx, VB2_BUF_STATE_ERROR);
+	hantro_job_finish_no_pm(vpu, ctx, VB2_BUF_STATE_ERROR);
 }
 
 static const struct v4l2_m2m_ops vpu_m2m_ops = {

base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.47.3

