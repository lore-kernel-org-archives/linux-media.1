Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795218119;
	b=4hW/PlMVgoh7CtfnREldspcEOswNvQT403TWWkSSilMxNEsoHC/r1EqTSvfP2naknD1Z
	 DSaeC3G/lPpzPE2lqWHPorWq+8W4efQFzU48c4tJBmiPZyV18nEtD+H5Owyu1tvrlXSYs
	 OTIvVdcsaKcavN9R/CXsk1DzYHBTa+Yofd4j3IHmUhs9d0J+3Gkf9dmjvwXHr+wj0WuDB
	 OCJDw9gyKO06Ela19U+8qu3fkUGKRO8I0lW2wq2KG8a18h8EI1izG1gkeKQdBV8wd8mVM
	 OvfLl5r9WZrpn5bg2w5iV16WQ4yLze8FST3+4o1WBJiTjKs/xK4BwFSTWAbO9+MbwAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795218119;
	h=DMARC-Filter:Received:Date:From:To:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=eQV0TtdjwA2l+DJGgyIwBU2JmOAWMeSkZF1hw7dK8hQ=;
	b=xPluZ3UhM0VLRnsmjW4DYc7rrPWxazJeaR6kpJH1SwkkvhP4b6w5asaXsJrMGV9t9MSf
	 EJWDjwWYs1nxNKwcfQMG8rW87oSbwR+jYWP5ZtFVv8OYn5EO69iBrpomlzgjk8dA0e7bD
	 x46V6Sa8NGg4FPq+cww/ddvgYx+k5z2wgEUt9UoL/rn4znAZ+sSgidMRkdinGTMWs62D2
	 xPqDA8craQ1q9eXXdc78wngUgm2xsPJUkWkEWzpfC3HxR2insNk49rrV2GU0aM1ws9d7J
	 dHe5j4vpdPA7dyPxgvTHQB3fTwo9zwgpmX0ao7CWk6EAGWScaFUY1dDub4acVJe2v2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70310606A33B;
	Fri, 20 Nov 2026 23:41:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70310606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xUYEp-000000002eL-2HrS;
	Fri, 20 Nov 2026 23:41:51 +0000
Date: Fri, 20 Nov 2026 23:41:43 +0000
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
Subject: [PATCH v2 2/7] media: rkvdec: vdpu383: complete refused HEVC requests
Message-ID: <ba10548c37e59b94e9f5ed5984eb48f7149a7628.1795217229.git.daniel@makrotopia.org>
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

When the RPS controls are missing, the VDPU383 HEVC back end fails the
job after the request was applied, but without completing the request's
controls. The request then never completes: userspace waits for it
forever and MEDIA_REQUEST_IOC_REINIT fails with -EBUSY.

Complete the controls before returning the error, as the VP9 code does.

Fixes: e3b5b77e3689 ("media: rkvdec: Add HEVC support for the VDPU383 variant")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
Changes since v1:
- Rewrite the commit message
- No code change

 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
index 3462d995d4cf0..e9d8b590f0d58 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
@@ -553,6 +553,7 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
 	if ((!ctx->has_sps_lt_rps && run.sps->num_long_term_ref_pics_sps) ||
 	    (!ctx->has_sps_st_rps && run.sps->num_short_term_ref_pic_sets)) {
 		dev_err_ratelimited(rkvdec->dev, "Long and short term RPS not set\n");
+		rkvdec_run_postamble(ctx, &run.base);
 		return -EINVAL;
 	}
 
-- 
2.56.1
