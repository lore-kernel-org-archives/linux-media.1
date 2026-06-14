Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B663C9438
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 15:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781452581; cv=none; b=H30MG/sTtjILuPFZILA+ah9a16zAvIj5mgRyii+SBhIuwrpIQqJkjsi+zUW9I52al42HVKz3lJzEaZHIZ8N9gAlqA6eqBlVkMPYGYiN2xp2SergHZSFT7CfWG0DGVP6ugrJ1Z49HWbaBYx3Kpl1tePBL6FLL0QjA9D3FwGQklEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781452581; c=relaxed/simple;
	bh=jN3xEJ7Rxg/6noRqgHG+JcKV+C8ZZKWm6rrIBuoHO2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kd7ykOjIybtyW6sZgVeJSTUGjcXOXBYBrTDXX0g2QautC3FCLOQwx3HVabDSTCYseFpLsOTXlIi0UvW1XyPviboLIB1bMwmcl8MUH5lWRFS3koLhvE+6XT3NYA79AzUkmAHNou55U5qtl4J8ESoN6PmoUCtnHhO8+52oHWBAboU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WP1EvDa8; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WP1EvDa8"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8ce9d444173so33375136d6.2
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 08:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781452579; x=1782057379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cUP9Gv/A+Fvu6KFm5rkfbHWBhQLayglfD2AoltKeA+s=;
        b=WP1EvDa8bnMcAvZFmEnx/Trux8cNNG0TqzyzeFA18Vm9pDAYA5Gg1KRVxlcBvRtzEi
         D/heYmWUsJ3uCLEbnEGX+YTc5gdjQcMBayzCp3DWKaLurUIodkI0oQsa/Bod3bsgRi1f
         vHTtUVDplVDdt+zWJ5xB08p+Ggx1OO22JVsC7oLtZsnopFKYlfj0gjVK5K9aLmHgqxUe
         3foEtgeAzH9TnaWksky5xILfTLDOj5YeaYwNA4VlJPLkabSaR66bsxw7jpHMSEy449q4
         AES0NIcNX9QVj6ZobeKN4BQBn3Pyf7YLB3J7HORllM5BZrpaRrGmTfhMcmtY62RQq0EI
         Br6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781452579; x=1782057379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cUP9Gv/A+Fvu6KFm5rkfbHWBhQLayglfD2AoltKeA+s=;
        b=Hd5yzdPjtWUYE/J5lwyqR7jiTdF/NLPBaFWzuLDU+aZl2wIHsZPZAQlWsY1s3/nUZd
         uTRMnZ2yGM8oikThhH+FROcLz3584SuSoRdPT+5oD+Jkp2q80wpMcL4iPv4gWqnETDRW
         iftNKFi6J7L/T8uCx2rKKKmmH4jDiwcmHoiXkhzPWiFzGn6vOWEzPnext/d4WuHZXiai
         3XLxy4g0Qc+CTUx/RLoSfK53S4fa2H0x3JrE5J3Tnso+3zEE6rvOW1KTLQGNVD0Y4obj
         sAY1XafqjJGsYf6rEzrNX9u9++hDLD1u4lQK0Gopn1FnAPJYChSlSH87ZzgxumnqamwS
         03Jw==
X-Forwarded-Encrypted: i=1; AFNElJ8/lShaw80WlsUfcJ/QMB8IEXugWTuY7ysEVmk8I17EetjvFjeuY89Lxe/hftS1ERg9EHrTAWJ0PM0mVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkUr0irys6K8pigp4Tk/GruoH8ruJkdMEAwE6D2fwwTC1H46bq
	Jmj9oPix4UNnO3oPYXx+Zr6gFOACd3Wk4We90qq2bp2yLNd1BLelKSRC
X-Gm-Gg: Acq92OEa44qNE9qY/NT2S/1KKiTH2ZcwwaZTCfC9uRGfavZE58epAEDPzzJn+DxVgRZ
	/3g6pQ9lzK4ZieP1uDDRk3CvCByacPkLkXNXkkqbb39VnIhU6maGq0rbRnl9+pQs97WrcsHdjJG
	Qtht36o+9/bfzX9FCzzzkPobUVwWO4pEeYa77bSQnrGm4Oj09HGoOC28L3MGtHRM7wTQJhhqyjg
	hk44SYThd+Prl3Uuw/E4rlwiBCWs7ePNSE8XgSXCppcsPV20H7lipyQNcYQ8er4Ia8fCThFhsqa
	3nvHm6gWJsI28/KAGExdlffIwokf9ZTPnYcx2tRZcPnBkZAL7vrwCvYQlG4q1Dov9JSEW6raZyA
	xX2sN7r7kt5p3YsUkxD81m5p2LDIJtUNIHDnXOZQERF2IMP8DqXrvpcIwTdY2/txvJtWn7dn1UQ
	7/eGTZ1Er2AT/Y7U1GGJVHIgg0eBgnbtxKhsVvYGD2x2dbRT6KkkHLF8fmzDi6bkVdrut09AWRV
	oW/TuDkxnLc/3wHwqq+611vtNEx5eFG55m5FqPLcVc=
X-Received: by 2002:a05:6214:621:b0:8d1:5830:6666 with SMTP id 6a1803df08f44-8d32b47a72bmr192789676d6.1.1781452579404;
        Sun, 14 Jun 2026 08:56:19 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d30522cbeasm82008446d6.44.2026.06.14.08.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 08:56:18 -0700 (PDT)
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
Subject: [PATCH v2 4/6] media: verisilicon: rockchip: bound VPU981 AV1 tile loop and guard divisor
Date: Sun, 14 Jun 2026 11:56:06 -0400
Message-ID: <20260614155609.3107600-5-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614155609.3107600-1-michael.bommarito@gmail.com>
References: <20260614155609.3107600-1-michael.bommarito@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

rockchip_vpu981_av1_dec_set_tile_info() divides context_update_tile_id by
tile_info->tile_cols and writes one descriptor per tile into the tile_info
DMA buffer, sized for AV1_MAX_TILES. tile_cols / tile_rows come straight
from the bitstream; reject a zero column or row count and bound the grid to
AV1_MAX_TILES so the division is safe and the writes stay in the buffer.

Fixes: 727a400686a2 ("media: verisilicon: Add Rockchip AV1 decoder")
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
Assisted-by: Claude:claude-opus-4-8
---
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c  | 29 +++++++++++++------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
index e4e21ad373233..71d2ef72c4402 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
@@ -578,21 +578,32 @@ static void rockchip_vpu981_av1_dec_set_tile_info(struct hantro_ctx *ctx)
 	const struct v4l2_av1_tile_info *tile_info = &ctrls->frame->tile_info;
 	const struct v4l2_ctrl_av1_tile_group_entry *group_entry =
 	    ctrls->tile_group_entry;
-	int context_update_y =
-	    tile_info->context_update_tile_id / tile_info->tile_cols;
-	int context_update_x =
-	    tile_info->context_update_tile_id % tile_info->tile_cols;
-	int context_update_tile_id =
-	    context_update_x * tile_info->tile_rows + context_update_y;
+	unsigned int tile_cols, tile_rows;
+	int context_update_y, context_update_x, context_update_tile_id;
 	u8 *dst = av1_dec->tile_info.cpu;
 	struct hantro_dev *vpu = ctx->dev;
 	int tile0, tile1;
 
+	/* Guard the divisor and bound the grid to the tile_info buffer. */
+	tile_cols = tile_info->tile_cols;
+	tile_rows = tile_info->tile_rows;
+	if (!tile_cols || !tile_rows)
+		return;
+	if (tile_cols * tile_rows > AV1_MAX_TILES) {
+		tile_cols = min_t(unsigned int, tile_cols, AV1_MAX_TILES);
+		tile_rows = min_t(unsigned int, tile_rows,
+				  AV1_MAX_TILES / tile_cols);
+	}
+
+	context_update_y = tile_info->context_update_tile_id / tile_cols;
+	context_update_x = tile_info->context_update_tile_id % tile_cols;
+	context_update_tile_id = context_update_x * tile_rows + context_update_y;
+
 	memset(dst, 0, av1_dec->tile_info.size);
 
-	for (tile0 = 0; tile0 < tile_info->tile_cols; tile0++) {
-		for (tile1 = 0; tile1 < tile_info->tile_rows; tile1++) {
-			int tile_id = tile1 * tile_info->tile_cols + tile0;
+	for (tile0 = 0; tile0 < tile_cols; tile0++) {
+		for (tile1 = 0; tile1 < tile_rows; tile1++) {
+			int tile_id = tile1 * tile_cols + tile0;
 			u32 start, end;
 			u32 y0 =
 			    tile_info->height_in_sbs_minus_1[tile1] + 1;
-- 
2.53.0

