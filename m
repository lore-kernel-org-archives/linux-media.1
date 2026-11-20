Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795218267;
	b=WM1mcu43FA6i/gnW1gNVrZKLmBdajyPT/9Q4xQFXk5+EvnzcbbfeIOe16NbYpjcRT76Q
	 4BKWx7NqwGyIJ6C6bxHx2scgg1X23FDNY12Eg8yAeWbRilJxuf3k4G0FaFq7neCqOTezr
	 WyWNXVXoL1K+oy5EjlBQZWgJ7A2Bxck5Jq39wdSN6HsifZupIVtVa2VUfs78IjXtLQEF3
	 LF1OFGtW3q+XMSZRQ96avehJwGndXX8t5/2672S23bSCWKAJ6MPPYzIF7PCCTMwOTsdLd
	 Ach80PTgzMzWGuQBtPITmzdi5wIKT7b2GK/2CofhsvMJbkm2DiACS8GXw26p/0+aE1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795218267;
	h=DMARC-Filter:Received:Date:From:To:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=LJpIE8ztP+KbGnnCOb1LC8LShPiTmCttfBKwQc2Yr7s=;
	b=j56LdonZ8/gX8r6LGL1b1LKLTR3XxRp2YeD1RpcLYQBDjl44jfhH/oYzzmftgAO/W4gf
	 nJg4Qzd/0mEC6eNYAI6ysUc9QMaSCQrIG9ZvgJ1PdD1yNpcTCFUdSpX8ozp5H0AHFGbun
	 YwtFPdP5dsBJLZaMrXs7Ry79DPGrgSAMtl7nVeBx8NfGIwupcUvFqNmPsb0NWrBpgV64D
	 DLR2FnUU5mpRnFTwouIpBml6cOyn6VBDLJ+npOkLX2B34fkqrgOjevrr0+5zySSaZCMbj
	 l05Yv9WeeT1xzYaIUtAaNVVJiMRlfny2lilJzUavjjXK56JMq0pU3GJHhaUsxII+nNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA73606A687;
	Fri, 20 Nov 2026 23:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFA73606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xUYH8-000000002gK-0Biv;
	Fri, 20 Nov 2026 23:44:14 +0000
Date: Fri, 20 Nov 2026 23:44:05 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Alex Bee <knaerzche@gmail.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/7] media: rkvdec: hevc: check the RPS scratch allocation
Message-ID: <4644e528c71a780a238edb23e41f54f1359e1c3d.1795217229.git.daniel@makrotopia.org>
References: <cover.1795217229.git.daniel@makrotopia.org>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1795217229.git.daniel@makrotopia.org>

The buffer for the calculated short-term sets is used without checking
that its allocation succeeded. Return -ENOMEM and fail the decode job
in both back ends.

Fixes: c9a59dc2acc7 ("media: rkvdec: Add HEVC support for the VDPU381 variant")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
Changes since v1:
- Rewrite the commit message
- No code change

 .../rockchip/rkvdec/rkvdec-hevc-common.c      | 26 ++++++++++++++-----
 .../rockchip/rkvdec/rkvdec-hevc-common.h      |  4 +--
 .../rockchip/rkvdec/rkvdec-vdpu381-hevc.c     |  7 ++++-
 .../rockchip/rkvdec/rkvdec-vdpu383-hevc.c     |  7 ++++-
 4 files changed, 33 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
index e3449ab0d415b..80df05bacaeba 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
@@ -329,24 +329,27 @@ static void st_ref_pic_set_calculate(struct rkvdec_hevc_run *run, int idx,
 	st_rps->num_delta_pocs = st_rps->num_positive_pics + st_rps->num_negative_pics;
 }
 
-static void rkvdec_hevc_prepare_hw_st_rps(struct rkvdec_hevc_run *run, struct rkvdec_rps *rps,
-					  struct rkvdec_hevc_st_rps_cache *cache)
+static int rkvdec_hevc_prepare_hw_st_rps(struct rkvdec_hevc_run *run, struct rkvdec_rps *rps,
+					 struct rkvdec_hevc_st_rps_cache *cache)
 {
 	u8 num_sets = run->sps->num_short_term_ref_pic_sets;
 	size_t size;
 	int idx;
 
 	if (!run->ext_sps_st_rps)
-		return;
+		return 0;
 
 	size = num_sets * sizeof(*cache->sets);
 	if (cache->num_sets == num_sets && !memcmp(cache->sets, run->ext_sps_st_rps, size))
-		return;
+		return 0;
 
 	struct calculated_rps_st_set *calculated_rps_st_sets =
 		kzalloc(sizeof(struct calculated_rps_st_set) *
 			run->sps->num_short_term_ref_pic_sets, GFP_KERNEL);
 
+	if (!calculated_rps_st_sets)
+		return -ENOMEM;
+
 	for (idx = 0; idx < run->sps->num_short_term_ref_pic_sets; idx++) {
 		const struct v4l2_ctrl_hevc_ext_sps_st_rps *rps_data = &run->ext_sps_st_rps[idx];
 
@@ -362,13 +365,22 @@ static void rkvdec_hevc_prepare_hw_st_rps(struct rkvdec_hevc_run *run, struct rk
 
 	memcpy(cache->sets, run->ext_sps_st_rps, size);
 	cache->num_sets = num_sets;
+
+	return 0;
 }
 
-void rkvdec_hevc_assemble_hw_rps(struct rkvdec_hevc_run *run, struct rkvdec_rps *rps,
-				 struct rkvdec_hevc_st_rps_cache *st_cache)
+int rkvdec_hevc_assemble_hw_rps(struct rkvdec_hevc_run *run, struct rkvdec_rps *rps,
+				struct rkvdec_hevc_st_rps_cache *st_cache)
 {
-	rkvdec_hevc_prepare_hw_st_rps(run, rps, st_cache);
+	int ret;
+
+	ret = rkvdec_hevc_prepare_hw_st_rps(run, rps, st_cache);
+	if (ret)
+		return ret;
+
 	rkvdec_hevc_assemble_hw_lt_rps(run, rps);
+
+	return 0;
 }
 
 struct vb2_buffer *
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h
index f6a3dec6ff4ad..32f192743c8c8 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h
@@ -71,8 +71,8 @@ void compute_tiles_uniform(struct rkvdec_hevc_run *run, u16 log2_min_cb_size,
 void compute_tiles_non_uniform(struct rkvdec_hevc_run *run, u16 log2_min_cb_size,
 			       u16 width, u16 height, s32 pic_in_cts_width,
 			       s32 pic_in_cts_height, u16 *column_width, u16 *row_height);
-void rkvdec_hevc_assemble_hw_rps(struct rkvdec_hevc_run *run, struct rkvdec_rps *rps,
-				 struct rkvdec_hevc_st_rps_cache *st_cache);
+int rkvdec_hevc_assemble_hw_rps(struct rkvdec_hevc_run *run, struct rkvdec_rps *rps,
+				struct rkvdec_hevc_st_rps_cache *st_cache);
 void rkvdec_hevc_assemble_hw_scaling_list(struct rkvdec_ctx *ctx,
 					  struct rkvdec_hevc_run *run,
 					  struct scaling_factor *scaling_factor,
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
index 8388421a68a48..2a239114759a2 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
@@ -593,6 +593,7 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
 	struct rkvdec_hevc_run run;
 	struct rkvdec_hevc_ctx *hevc_ctx = ctx->priv;
 	struct rkvdec_hevc_priv_tbl *tbl = hevc_ctx->priv_tbl.cpu;
+	int ret;
 
 	rkvdec_hevc_run_preamble(ctx, &run);
 
@@ -606,7 +607,11 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
 	rkvdec_hevc_assemble_hw_scaling_list(ctx, &run, &tbl->scaling_list,
 					     &hevc_ctx->scaling_matrix_cache);
 	assemble_hw_pps(ctx, &run);
-	rkvdec_hevc_assemble_hw_rps(&run, &tbl->rps, &hevc_ctx->st_cache);
+	ret = rkvdec_hevc_assemble_hw_rps(&run, &tbl->rps, &hevc_ctx->st_cache);
+	if (ret) {
+		rkvdec_run_postamble(ctx, &run.base);
+		return ret;
+	}
 
 	config_registers(ctx, &run);
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
index 47f236295f1e5..52554c75f47f4 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
@@ -542,6 +542,7 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
 	struct rkvdec_hevc_ctx *hevc_ctx = ctx->priv;
 	struct rkvdec_hevc_priv_tbl *tbl = hevc_ctx->priv_tbl.cpu;
 	u32 timeout_threshold;
+	int ret;
 
 	rkvdec_hevc_run_preamble(ctx, &run);
 
@@ -560,7 +561,11 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
 	rkvdec_hevc_assemble_hw_scaling_list(ctx, &run, &tbl->scaling_list,
 					     &hevc_ctx->scaling_matrix_cache);
 	assemble_hw_pps(ctx, &run);
-	rkvdec_hevc_assemble_hw_rps(&run, &tbl->rps, &hevc_ctx->st_cache);
+	ret = rkvdec_hevc_assemble_hw_rps(&run, &tbl->rps, &hevc_ctx->st_cache);
+	if (ret) {
+		rkvdec_run_postamble(ctx, &run.base);
+		return ret;
+	}
 
 	config_registers(ctx, &run);
 
-- 
2.56.1
