Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795218233;
	b=auKoT93OG4K43yt7omQ8R0rMxrVLTlPMNKehEecB+FYUR1oAHBOjvYcw/FJ9SV38Itcn
	 FAgUo2SXLGEbqirRa2xx29ne0lWJSFWJcOcknkY8DCHh8k5xlBqqZ9CZ7ch/EEqhMs9rm
	 IWsaCQXheCx38moGAYBKVhKc5uC+qdlK0MS/2LfnP4XXOQ8eNoit24hBWYKhqs+lTjPYK
	 24IRHHhPAHWhUV8pxig8KIwrjse++TTIKX0LopTTSF6CYGPhf6KcmvwUsdcDXUdkl7P5N
	 otNFQ+/CAzcxv6wugRIQQj+b+/6Yyv9b3eKwDOKcfWSDE6Lflrg5vaXIoPibjO395Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795218233;
	h=DMARC-Filter:Received:Date:From:To:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=eLGEzNTcKoM/8jFUGygGBt6uX1lUc0G4SgecjM91zfI=;
	b=X6tWODkKHAgsb4Gr4LtA0tSJpVqzLLsou7RhF5lvy7omiqmNMO873jrHMBO4J3hpqZ0N
	 ND2Ssiz41FC0Yst/ROLhccQ6/bPSht03+bQZZJbChBqF+v5WK+kJs95WV8nv6iuDKx4vi
	 ezBWyzOefTrvO/ftKS//mHXQg1CZ3IjBhn0jdFfV6nm5McbE1zkvuppw6VPWuwcrs3pMQ
	 c+sbAGCp6ZWsxIW356R9eIX0YF4yAzkmOvZSSFooi0T5hiwXTtEsQRfh6KcZoEuBR7H/F
	 Hj3mHJUHeSyXxAsHpqKN/EqaF24Bq1goZn8gRmLz2Wp/NaLDeO8D2Seznuj0TrVEOnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01C1606A696;
	Fri, 20 Nov 2026 23:43:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F01C1606A696
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xUYGe-000000002fn-3iFT;
	Fri, 20 Nov 2026 23:43:44 +0000
Date: Fri, 20 Nov 2026 23:43:37 +0000
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
Subject: [PATCH v2 5/7] media: rkvdec: hevc: bound predicted short-term RPS
 sets
Message-ID: <5a7d297bc6dfc93495e16fa4b47eb9f9a31aebbb.1795217229.git.daniel@makrotopia.org>
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

A short-term reference picture set can be predicted from an earlier
set, and can then hold one entry more than that set. The control
validation allows 16 entries per set, which is also the size of the
arrays the driver calculates the sets in. A set predicted from a
16-entry set overflows them, on the stack and on the heap.

ITU-T H.265 7.4.8 limits a set to 15 entries, and the hardware table
has room for 15 entries per set as well. Skip the prediction when the
reference set has more than 15 entries, as is already done for an
invalid reference index.

Fixes: c9a59dc2acc7 ("media: rkvdec: Add HEVC support for the VDPU381 variant")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
Changes since v1:
- Was 4/7
- Rewrite the commit message
- No code change

 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
index 797a16517ed59..3b281c16a75ed 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
@@ -223,6 +223,8 @@ static void st_ref_pic_set_prediction(struct rkvdec_hevc_run *run, int idx,
 		   (rps_data->abs_delta_rps_minus1 + 1); /* 7-60 */
 
 	ref_rps = &calculated_rps_st_sets[ref_rps_idx];
+	if (ref_rps->num_delta_pocs >= ARRAY_SIZE(use_delta_flag))
+		return;
 
 	for (j = 0; j <= ref_rps->num_delta_pocs; j++) {
 		used_by_curr_pic_flag[j] = !!(rps_data->used_by_curr_pic & (1 << j));
-- 
2.56.1
