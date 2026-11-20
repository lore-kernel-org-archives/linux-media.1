Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795218162;
	b=xBjU1Lz7FrsSWxPiPFf6/HJnP2V6RE1yx5nEkpcTmxPF7F17LybkoNxOJKXNntl7Zvzz
	 V/q03yLZD7diNwPfKEXXKz7vxHhj9wtYiffH7/szFEct0NptW6ZLhzgflAZTm+X7iNKYa
	 YbDkeE9EhzTIlU+ie06EZhCw5KTvktdq+76UdeZh3vPrTnRUV88cObSAO3bB5i5jpUx/7
	 38Zhr2vrTk8RH2uiu6kkfDm1kU5veEzWbfoXJ4QdCFa1+gZex6LfKbPI/VNFzYZkyM9wh
	 giwd/APRmVzDfupnLuwBhDz6goQiy5lilI6Ch5S0D2pEY6d7mv/mw6Gyx4zdb8hBaZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795218162;
	h=DMARC-Filter:Received:Date:From:To:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=EmTTjpiwcFOXJi4W2Zi3h/Yk6GAi9STPmCYXBs3Yfps=;
	b=tO1l+N+94pNijRyGn2aRGsxYJTuuU7xuib392+GsHPkS/TTajc9uJWdcTtvJcXvfTahI
	 LJYwrl4Wsl7n+Im574jpkwR5nBnp08iDZwxtnrknaNjRxndPsKlZJn3R5NbvaiExx93Mq
	 PWssfO7galYnHuT0OeAlH/iWltuTjp0QGciLBXxMfTBs5oV+xzaINlFMaF0Wa32QqsS5q
	 vrIDLXqMlTaNKd/3Hv/fHPUVjV+Ns0nDQ0eLFjldo9BjXVMKuGnEVbbmBLB/NpO7k5BK5
	 n5nKO9lhj7+qUFAq0OdwzWZ6u/OhuZ95dMI8vgAf9fJGXnxQHlUTpNEKMRZrQreV0tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C20606A6A9;
	Fri, 20 Nov 2026 23:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32C20606A6A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xUYFT-000000002f2-0gyc;
	Fri, 20 Nov 2026 23:42:31 +0000
Date: Fri, 20 Nov 2026 23:42:23 +0000
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
Subject: [PATCH v2 4/7] media: rkvdec: hevc: refuse RPS controls shorter than
 the SPS counts
Message-ID: <3244aca607a6714f92dd330d5f3fdfcff2d4a508.1795217229.git.daniel@makrotopia.org>
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

The SPS control tells how many short-term and long-term reference
picture sets a stream has. The sets themselves are passed in two
separate array controls, EXT_SPS_ST_RPS and EXT_SPS_LT_RPS. The driver
reads as many array elements as the SPS announces, without checking
that userspace passed that many. A larger count in the SPS makes it
read past the end of the array.

Compare the array size with the SPS count when a decode job is
prepared, and refuse the job if the array is too short. The controls
can be set independently, so this is the first point where both values
are known.

Fixes: c9a59dc2acc7 ("media: rkvdec: Add HEVC support for the VDPU381 variant")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
Changes since v1:
- Move after the VDPU381 refusal, was 3/7, so that a control which is
  too short fails the job in both back ends (Nicolas Dufresne)
- Change the subject, was "media: rkvdec: hevc: bound the RPS reads by
  the control size"
- Rewrite the commit message, and say why the size cannot be checked
  when the control is set (Nicolas Dufresne)
- The VDPU381 hunk now applies to the refusal instead of the warning,
  no other code change

 .../platform/rockchip/rkvdec/rkvdec-hevc-common.c    | 12 ++++++------
 .../platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c   |  4 ++--
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c   |  4 ++--
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
index c249e3f16f42c..797a16517ed59 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
@@ -448,18 +448,18 @@ void rkvdec_hevc_run_preamble(struct rkvdec_ctx *ctx,
 			      V4L2_CID_STATELESS_HEVC_SCALING_MATRIX);
 	run->scaling_matrix = ctrl ? ctrl->p_cur.p : NULL;
 
+	run->ext_sps_st_rps = NULL;
 	if (ctx->has_sps_st_rps) {
 		ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
 				      V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS);
-		run->ext_sps_st_rps = ctrl ? ctrl->p_cur.p : NULL;
-	} else {
-		run->ext_sps_st_rps = NULL;
+		if (ctrl && ctrl->elems >= run->sps->num_short_term_ref_pic_sets)
+			run->ext_sps_st_rps = ctrl->p_cur.p;
 	}
+	run->ext_sps_lt_rps = NULL;
 	if (ctx->has_sps_lt_rps) {
 		ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
 				      V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS);
-		run->ext_sps_lt_rps = ctrl ? ctrl->p_cur.p : NULL;
-	} else {
-		run->ext_sps_lt_rps = NULL;
+		if (ctrl && ctrl->elems >= run->sps->num_long_term_ref_pics_sps)
+			run->ext_sps_lt_rps = ctrl->p_cur.p;
 	}
 }
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
index 7627282c15f0a..db836536e601b 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
@@ -596,8 +596,8 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
 
 	rkvdec_hevc_run_preamble(ctx, &run);
 
-	if ((!ctx->has_sps_lt_rps && run.sps->num_long_term_ref_pics_sps) ||
-	    (!ctx->has_sps_st_rps && run.sps->num_short_term_ref_pic_sets)) {
+	if ((!run.ext_sps_lt_rps && run.sps->num_long_term_ref_pics_sps) ||
+	    (!run.ext_sps_st_rps && run.sps->num_short_term_ref_pic_sets)) {
 		dev_err_ratelimited(rkvdec->dev, "Long and short term RPS not set\n");
 		rkvdec_run_postamble(ctx, &run.base);
 		return -EINVAL;
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
index e9d8b590f0d58..c409d21c08598 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
@@ -550,8 +550,8 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
 	 * To be on the safe side for this new v4l2 control, write an error in the log and mark
 	 * the buffer as failed by returning an error here.
 	 */
-	if ((!ctx->has_sps_lt_rps && run.sps->num_long_term_ref_pics_sps) ||
-	    (!ctx->has_sps_st_rps && run.sps->num_short_term_ref_pic_sets)) {
+	if ((!run.ext_sps_lt_rps && run.sps->num_long_term_ref_pics_sps) ||
+	    (!run.ext_sps_st_rps && run.sps->num_short_term_ref_pic_sets)) {
 		dev_err_ratelimited(rkvdec->dev, "Long and short term RPS not set\n");
 		rkvdec_run_postamble(ctx, &run.base);
 		return -EINVAL;
-- 
2.56.1
