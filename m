Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795218107;
	b=rlNtx4Kl3Xl5ypbzAw9lOw1X/L8xo0EyXrfSve8f8dolXqoV1xn5ExML7n7hT1STRvYI
	 ZifUA3B7SLyxMZeq1FQQRCTrwxlNG2fNsk5KuhBsVlfZL1VPAcaRCLukKJj4JM91fomgV
	 iXROLxrRrbTSKg8P8k3YqLWpe3BTSHyUbCwIgD73V3gBUO8hfIcky0rqRkx8I9D/EUe2C
	 0xFPlbJx9YZw7ubJQ+cNWEWMudfoKWwgWepBJPk4bjse2G9eApjSssK7hdyEk0M0ZhQUg
	 GV5IaybePv8B/8tSVnmE4e+JHILUl7Bqp6hI3B4J1M85R/1jMC04nwY9b9ksQLWtNow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795218107;
	h=DMARC-Filter:Received:Date:From:To:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=v4jJEf6TgVkfG24sVas66atrbl+rzDNqobzHTACKDUU=;
	b=surufOklbL0vKCbK4WE4HeHZ+UIlzjPuwU7iYrGIbEORZFeE/Tsw+gIpuDa+lG0D99dO
	 3hfByE2mxsYZ460RiOa+QMtVI9kirC52mLx2II9tevsYInq5Oi7j+C0xIEAK+J+P6lbuK
	 v9ItQhb65oVqbzWezHOSjxjYXNatOv9V+ft+eYpWMDqI+TVVrUXxI/FWZVxm7E0bW/R3p
	 btOsCHwfQok/fUl32g1SnV6wGI6QEUrihUR7AHzStALX/D/vZiPfJA30LdwR7d0fxKpU1
	 UWLRPFVkRRR7P6G9PDmrb4/8BR4UhbGHW1O7Cw9nXtWrzbc/yFro9+4ZXOpq5kHoSLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71709606A335;
	Fri, 20 Nov 2026 23:41:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71709606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xUYEb-000000002eA-2Mzf;
	Fri, 20 Nov 2026 23:41:37 +0000
Date: Fri, 20 Nov 2026 23:41:29 +0000
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
Subject: [PATCH v2 1/7] media: rkvdec: hevc: apply request controls first
Message-ID: <e98082d31607d7474788fa9c76b525ac285b1590.1795217229.git.daniel@makrotopia.org>
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

The HEVC run preamble looks up the control values before the request is
applied. Applying a request can reallocate the array of a dynamic array
control, so the pointers taken before may point to freed memory. The
slice count and the information whether the RPS controls were set are
also those of the previous request.

Userspace can trigger the reallocation by passing more elements of such
a control than in any earlier request.

Apply the request first and look up the controls afterwards, as the VP9
code does.

Fixes: 3595375c2301 ("media: rkvdec: Add HEVC backend")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
Changes since v1:
- Rewrite the commit message
- No code change

 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
index 2b8e04dd15727..c249e3f16f42c 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
@@ -429,6 +429,8 @@ void rkvdec_hevc_run_preamble(struct rkvdec_ctx *ctx,
 {
 	struct v4l2_ctrl *ctrl;
 
+	rkvdec_run_preamble(ctx, &run->base);
+
 	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
 			      V4L2_CID_STATELESS_HEVC_DECODE_PARAMS);
 	run->decode_params = ctrl ? ctrl->p_cur.p : NULL;
@@ -460,6 +462,4 @@ void rkvdec_hevc_run_preamble(struct rkvdec_ctx *ctx,
 	} else {
 		run->ext_sps_lt_rps = NULL;
 	}
-
-	rkvdec_run_preamble(ctx, &run->base);
 }
-- 
2.56.1
