Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E07313E2B
	for <linux-media@vger.kernel.org>; Wed, 17 Jun 2026 02:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781662780; cv=none; b=OkSU2IO+eJCNf4NXefFYWjCjDhZ60LH/6A7a+D6ZJHErqI0wak31HKFKUIACl5es42icBkQjkgZstgiJtPrUMRclu6PY6wRAJ9pXPByXo8U1PYeoNM7FW1SAyr6zHpvxRFmTw6goO72QgjpuwQt6d0XYAz2tC2XpPCNOsjrcMHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781662780; c=relaxed/simple;
	bh=vCllFM1Fo/bvhnj01XGlT+a0eqAc2wyiMI/avAaDyiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bydnNKDnqn0Ilk+D60gLK5bZbphx8H1Q7RzdgnVSEKyvHtJmkRXE9IAwHNnYFPV/xJ5CoF7SVJuk5re5i5BaC9zsNJuT+vPuF83YDyJp/0mZ72+7on89yHQ19PtFTaGhC980oPNScxnWmMPX2cK4x1sr9smxTW+UY5qCsU7+JY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NoK/LVOI; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NoK/LVOI"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-91587626a3eso553053085a.2
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 19:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781662778; x=1782267578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zAFF71eki3qKxbhz4XlFm/p6BTZ2JlYFibYSDXzDbeQ=;
        b=NoK/LVOIRwcAk52PftGgI+3NQB1gVhTmqFp9h+PlkYA4rybcSYr3RlOb0pZGjyQUMa
         uzHGpIGz1BM8jizjcxOjwpUPKA1D/WT8MJm6cG0XouayWWs6u9KdL6sb/26Dl3Q9HVOT
         IUjuWr20AL6ESmNSE4mRLR4ftm28SRWWRnYfjfuJb3brsvX6yeEZlzY0T5kol0P4LJyW
         mC7ss5Vxn3ub7eSzkegw5APb57XqHTu7LkYKpyUEjlwdcSQfGqu3h7H4sVGoR/1hIXQu
         T6fsxmRgiDKcR1Zer97YrfwOAtMa+sPPsl0XKPyBc9JgNU4v5kxfZGjy7zvmDXfH6g8e
         8W+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781662778; x=1782267578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zAFF71eki3qKxbhz4XlFm/p6BTZ2JlYFibYSDXzDbeQ=;
        b=BJ3In4BsfK/8KiXlEx1EAfBd55l8Vkbv5+sd0eDvevtqU33p5x3nv9Px+ZjMk59K8F
         19bV7PsL6cfRMDFjh0lRHoGl/j26DFgnnwAwTILeqZoIpZTbHS15lO6SLuYSv1Dvbx01
         KcZJf53kihWEiTyDSLE2Il7Kq9FinimfmxnqtmgO6YtWUp+J56mQZWzDh+WzuYY/dwY5
         Hw6cyjmkSZ+db25WbUGnEmQ49Y3UxB+0y67oaLXJQJ4ukmJq9HMq9fN9a8/dsFZqZFbp
         sr266LJZ7VA4kcKS4dfH9MvLbLm2oGNDlVTodFGplkdgRPGKQOIOtt103i2tvTq9Ay+x
         3jXw==
X-Forwarded-Encrypted: i=1; AFNElJ8eEs9wvNEOsLXHcaOP7PN5NGYcYoXue3YL7NGv7mDvcB9V5e3R0061GZcKAe0CZX6r8cM1kc6r8Y648Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAQcLAFFMROJ8Kzbz5JBK4kHk/OS79zYrnZGBd/j6BNswqtbCN
	bX7tam/7LXEfJQjZo+VANSo2x/XAkfbz5H4M/ggftqmsYG+lV5eKD47q
X-Gm-Gg: Acq92OH1v3bQXiV2maKdWIPgzGZA+iqHM/12S0j6eor1wo4C+yE99iwgy7pCoHVt36q
	PF4ISLiaMR5u49tPvzT1iZaUpWGRj3VcfvFTQjLfUJQuIkBYbq93GVPkJGpury7xo6bdWI4+wyS
	URjsZpYogmC2a0sxrzDsafOyFQg+TfcHKsaQbefv2x00YPpqiAPqrXhsA+HrmVN4BqdoEJCAnd1
	5HAkoZUENG1DGLjVuRQWGv0SgD76RWv+Zkcey7Q2daJ4SI4j/FBEtBI/J7355YZ90678lrbs82t
	uKS9Bn/YGwNdQpcipx8GoBB2TqexNr6pxZuqeyDeA6+g5CwojtPWOqOBHBkwk8aXIALtfnl5f4k
	1SWa4XNe03pJDvqkPkOd2nEfeDSWUvEUhr7bRekSNm+APuT1mN3DotBtYeLhMx1clwraEswV/Nk
	L5xU60NU8S8JLPXxGgogja9N7cOzEG/9cLKRwG/4IyzQEM2WeV6bIdKmNgHr96pI9hMmRu+uVPn
	QfmE8GMkaROuuadLtsKIssze1S+DpLJ
X-Received: by 2002:a05:620a:f0c:b0:915:aad5:e941 with SMTP id af79cd13be357-91dba766e8cmr259685285a.17.1781662778188;
        Tue, 16 Jun 2026 19:19:38 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a006e35sm1657646285a.28.2026.06.16.19.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 19:19:37 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Heiko Stuebner <heiko@sntech.de>,
	Kees Cook <kees@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/9] media: verisilicon: rockchip: reject AV1 frames exceeding the tile capacity
Date: Tue, 16 Jun 2026 22:19:04 -0400
Message-ID: <20260617021906.2746743-8-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260617021906.2746743-1-michael.bommarito@gmail.com>
References: <20260617021906.2746743-1-michael.bommarito@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

rockchip_vpu981_av1_dec_set_tile_info() indexes the tile group entry
array by tile1 * tile_cols + tile0, reading up to tile_cols * tile_rows
entries, lays out one descriptor per tile in the AV1_MAX_TILES tile_info
buffer, and programs the real tile_cols / tile_rows into the hardware.

The tile group entry control is a dynamic array sized to the number of
entries userspace submitted, independent of tile_cols / tile_rows, so a
frame that claims more tiles than entries reads past the array. A frame
that claims more than AV1_MAX_TILES tiles also leaves the hardware
programmed for more tiles than the descriptor buffer holds.

Reject both in prepare_run(): tile_cols * tile_rows must not exceed the
submitted entry count or AV1_MAX_TILES. The entry count is read via
v4l2_ctrl_find() (ctrl->elems). This mirrors the bound the mediatek AV1
decoder already enforces.

Fixes: 727a400686a2 ("media: verisilicon: Add Rockchip AV1 decoder")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c  | 25 ++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
index fd00dbd79fe46..00aa566a4ccdb 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
@@ -431,20 +431,39 @@ static int rockchip_vpu981_av1_dec_prepare_run(struct hantro_ctx *ctx)
 {
 	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
 	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
+	const struct v4l2_av1_tile_info *tile_info;
+	struct v4l2_ctrl *tge;
+	u32 num_tiles;
 
 	ctrls->sequence = hantro_get_ctrl(ctx, V4L2_CID_STATELESS_AV1_SEQUENCE);
 	if (WARN_ON(!ctrls->sequence))
 		return -EINVAL;
 
-	ctrls->tile_group_entry =
-	    hantro_get_ctrl(ctx, V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY);
-	if (WARN_ON(!ctrls->tile_group_entry))
+	tge = v4l2_ctrl_find(&ctx->ctrl_handler,
+			     V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY);
+	if (WARN_ON(!tge))
 		return -EINVAL;
+	ctrls->tile_group_entry = tge->p_cur.p;
 
 	ctrls->frame = hantro_get_ctrl(ctx, V4L2_CID_STATELESS_AV1_FRAME);
 	if (WARN_ON(!ctrls->frame))
 		return -EINVAL;
 
+	/*
+	 * rockchip_vpu981_av1_dec_set_tile_info() indexes the tile group
+	 * entry array by tile1 * tile_cols + tile0, so it reads up to
+	 * tile_cols * tile_rows entries, and lays out one descriptor per tile
+	 * in the AV1_MAX_TILES tile_info buffer while programming the real
+	 * tile geometry into the hardware. Reject a frame that claims more
+	 * tiles than userspace submitted, or more than the hardware tile
+	 * buffer holds, so the read stays in bounds and the programmed
+	 * geometry matches the descriptors written.
+	 */
+	tile_info = &ctrls->frame->tile_info;
+	num_tiles = (u32)tile_info->tile_cols * tile_info->tile_rows;
+	if (num_tiles > tge->elems || num_tiles > AV1_MAX_TILES)
+		return -EINVAL;
+
 	ctrls->film_grain =
 	    hantro_get_ctrl(ctx, V4L2_CID_STATELESS_AV1_FILM_GRAIN);
 
-- 
2.53.0

