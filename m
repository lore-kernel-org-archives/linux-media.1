Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795218136;
	b=LiDtuu9bmvPHgkLCmnD39rkCaAubogAm9qqYr7dbA/TMQjZg3D/E2uytfInoKpOyJMFU
	 lPZK0rfALXnPnVkvlll5o8AvaytsniGCy3mOdRGDLTlyYcOEdYQjdy4BeSfaD4B3hX761
	 OscuvMu+AyQPorolYmKbK9Y1KPK9iCQdYucoRUSM9TolO/SWzcardIot8Zx86CmAEymww
	 03AEJQNaNrLcpXKgj14QXoO6bCae1TNd7hrilGue8at/YjGOXOSFmn8R9zAsNFYVDqQR+
	 2sQd2QGNLTbBLHHs1YzmpaAVU6gELYtuKEDKD5Ny1kImLzQNnQNNr5yDDzL3rRyYs5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795218136;
	h=DMARC-Filter:Received:Date:From:To:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=dfLaICCFFs23kF3QbDbJpGN/JagEIg84ZRjiNRLMMHI=;
	b=K57XFFh3Mh9oje1PjDrwryHq0TmwlZvHZ3Zz8Hj8z1mcZ0I+xzuiyhpxoZY+pLXHsHDa
	 OO4zk73Gavu/0VhdDLO/ZDfhdl8m/qqLfDQhHpcv6ndvtMqfI+wdXjRlNVqU5jaIF7tzB
	 RjFVI8Rzuz3YvG+j3n0afnu+Ivzj+VQkto9fbNgO8ppt8uzpwULIaW7XnPxFkoV1TCJWP
	 Ri4gV+4EbIFTt8JK74Hbi+r4Y1/sbEafFxfmESexRDWEO0/JcbSSNClJTgP0DjcguK3iJ
	 beXIDTuC+U0bpYI7K7/aN+n3V96LwG4wCDGbRuZDhRpB8oSV9RFNddRhvcte633R0Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDD1606A33D;
	Fri, 20 Nov 2026 23:42:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBDD1606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xUYF6-000000002eg-3IM4;
	Fri, 20 Nov 2026 23:42:08 +0000
Date: Fri, 20 Nov 2026 23:42:00 +0000
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
Subject: [PATCH v2 3/7] media: rkvdec: vdpu381: refuse HEVC jobs without RPS
 sets
Message-ID: <114caf6a80ded7185458027c729bbb4b4a4ba17b.1795217229.git.daniel@makrotopia.org>
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

When a stream uses reference picture sets and userspace never set the
EXT_SPS_ST_RPS or EXT_SPS_LT_RPS control, the VDPU381 HEVC back end
only logs a warning and starts the decoder anyway. The hardware then
uses an RPS table which does not belong to the stream and gives wrong
pictures at best. On the VDPU346 of the RK3568, which uses this back
end, such a decode ends in a failed IOMMU reset and the system stops
responding until the hardware watchdog resets it.

Fail the job with -EINVAL before the hardware is started, as the
VDPU383 back end does.

Fixes: c9a59dc2acc7 ("media: rkvdec: Add HEVC support for the VDPU381 variant")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
Changes since v1:
- Move before the check of the control size, was 5/7
- Test ctx->has_sps_st_rps and ctx->has_sps_lt_rps as a result of the
  new position, the next patch replaces them in both back ends
- Rewrite the commit message

 .../rockchip/rkvdec/rkvdec-vdpu381-hevc.c     | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
index e1936e87f45be..7627282c15f0a 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
@@ -596,21 +596,18 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
 
 	rkvdec_hevc_run_preamble(ctx, &run);
 
-	rkvdec_hevc_assemble_hw_scaling_list(ctx, &run, &tbl->scaling_list,
-					     &hevc_ctx->scaling_matrix_cache);
-	assemble_hw_pps(ctx, &run);
-
-	/*
-	 * On vdpu381, not setting the long and short term ref sets will just output wrong frames.
-	 * Let's just warn about it and let the decoder run anyway.
-	 */
 	if ((!ctx->has_sps_lt_rps && run.sps->num_long_term_ref_pics_sps) ||
 	    (!ctx->has_sps_st_rps && run.sps->num_short_term_ref_pic_sets)) {
-		dev_warn_ratelimited(rkvdec->dev, "Long and short term RPS not set\n");
-	} else {
-		rkvdec_hevc_assemble_hw_rps(&run, &tbl->rps, &hevc_ctx->st_cache);
+		dev_err_ratelimited(rkvdec->dev, "Long and short term RPS not set\n");
+		rkvdec_run_postamble(ctx, &run.base);
+		return -EINVAL;
 	}
 
+	rkvdec_hevc_assemble_hw_scaling_list(ctx, &run, &tbl->scaling_list,
+					     &hevc_ctx->scaling_matrix_cache);
+	assemble_hw_pps(ctx, &run);
+	rkvdec_hevc_assemble_hw_rps(&run, &tbl->rps, &hevc_ctx->st_cache);
+
 	config_registers(ctx, &run);
 
 	rkvdec_run_postamble(ctx, &run.base);
-- 
2.56.1
