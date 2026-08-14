Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137DE476CD4
	for <linux-media@vger.kernel.org>; Fri, 14 Aug 2026 13:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786714873; cv=none; b=euaKgrbmAc9MsIS0pxKB+Hi+RnoeIz9dC3HW//68jEsXVC3RadTgB6ZpRvmTErmNK1Ls+3ZVvWBQo6AafmqCH2jpffHmKCoekElOIQaFqypInyc+Y/qOani2tmwLff90IRzFgsvfdcrx24xs7B+lpQVzmPWknkL85athOGdA8Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786714873; c=relaxed/simple;
	bh=Zs3qq8nZ9iq/Ua310mm7kdVlhyBdkLgBtMEYQXg0wmE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qwa6t7/71QANrjp850TdWS0zpk54UZSna9jQYBrhmOmBkh66uj2fNjiOM8Jp2MRXy/P7IBo7alXouTD0u0LdwoiZ1CmBfykQzLZqLJA2j49bWECaYOJIbx4d3ohyIT1BsqmyLJdPxCdc9UIOAjeHEY6BubLmU5KsmBdts3LpGUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XaHlH57S; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XaHlH57S"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cf452def93so17440975ad.1
        for <linux-media@vger.kernel.org>; Fri, 14 Aug 2026 06:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786714871; x=1787319671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AbuKvj4W+YXhwTeR+EPxopLpAn5mAXQN8Q4JWVhztYQ=;
        b=XaHlH57SqJTTv/+9LFXpLF9xoyvU0aQVBaoJaMYz5U+tX+jwgS1ftM/qs93+wBPydu
         DtCZmPm4EewXBPLLh1KbcC64trylSx9O05j5dFWOVh7gx6tDSZUezkzO0lQcBaQ2YV8r
         JbGlR6b3yPFf+laLAzV6xa4lNbZMFQ0W9+OmdkD/QalFnEAt+0tneisK0SgCvIUKhR0+
         I6LIcDt6hsIftcozTaSCQB200JVM0yGTeETNp2URnubZFM3w/UgObs/kJX2lbGZrJhLv
         Tj5OirFX3LOj3aXLVDo5ffARLNIJeGMdXIZwtQFz5gvoDOHOD9veUJ96sGHHrlsifT6k
         XALA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786714871; x=1787319671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AbuKvj4W+YXhwTeR+EPxopLpAn5mAXQN8Q4JWVhztYQ=;
        b=lSzcO8lKTv3TGvBv7V/zOTtNNmF5H3r1/5/i9YhVeNP33g2JvRCCWpaE/9M+6W0hFf
         O9DgXeyd+yyRGnplUBF45C5abJ/kxo/a1zypytIwDpkUUNqEmrzvcDfMq1fdAJ2QBWYp
         1944FRmLg6F8SUYQCG2J512DBW+rkSbhSV2bVluxnxoYe/SCtksGrKZiRbz4mZZKzUKF
         7ct9Xg/7gk9l6i/X/xZArlUGOaG58t36kGYBlcPBMb2z/vPCrHCW2rf3qpHFTVnbK4IR
         iPvBlkU1Svu0jRC54Kof7VmM4fCo+1TEbw/gXgYv2avkztHoMFKfIWQofp9ABft4Zzwq
         7zNw==
X-Gm-Message-State: AOJu0YxpCE9ePPBaoDBisIE54K3fc71YWziFWLABNwAbnmir54pxF1bz
	JPvbAviSlcnohhfgqIpZn7SG6JDiH3rbuSJbHweNJ1VhCgCTnzpQQWtC
X-Gm-Gg: AR+sD12aEOcQaYsMqz8KYGCK1AFt+/Lf9J6Lc/yS5sRl4ig0p02pFHwsCQjwJt7SGHz
	tWYVOo+kk60xEcUALprBlZXF/MYniyCeYLx7L8PJ5k8f62YvJmY8n6CFXK+o5vgjoUJLJ2wfWpM
	K1HidhWoA3pQMsqToQdJYHNjF+f1gyd0dT4TmRwfvqrcWWUOIIZ6ApyyjXysUuH2WYmRQkUAjfk
	99VEQowz+vYPmtHcHVdYYfT3ElKCYvSrQd/hRvuUX/zD+9J50xpBGiQWsjATJpsxAWFBhPNqSMA
	t4csk4xvPlLFqvB6YKqgjs8vAgEeeJPpSdzes8si9tfBl1vt97y2u/pbN1PLHljsO6s3VEbcO0M
	FwCAj8SIHiP1ceOfmN0yGKIAk3+aZD1L9+Z8+vooIP0Xo1NYXjjipD8awgh5GlZkRBsQnWDmGKu
	aVFoDrVON/njBe5xeKMu4mCKJGPtsqnjoEvjM4g0KOYxJKpZSWUVQX0poQCLMcb7/8HSp8/enK2
	y0qKv/S
X-Received: by 2002:a17:903:22cb:b0:2ca:53f7:3c69 with SMTP id d9443c01a7336-2d37f72fad4mr143515685ad.9.1786714871119;
        Fri, 14 Aug 2026 06:41:11 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:e9af:7c0e:be31:2c3f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3aebf1ba7sm9810265ad.78.2026.08.14.06.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 06:41:10 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH] media: adv748x: Fix endpoint reference leaks on probe failure
Date: Fri, 14 Aug 2026 21:41:06 +0800
Message-ID: <20260814134106.1387486-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

adv748x_parse_dt() takes an extra reference for every endpoint saved in
state->endpoints. If parsing later fails, adv748x_probe() skips
adv748x_dt_cleanup(), so the saved references remain held. A CSI-2 lane
parsing error also returns from for_each_endpoint_of_node() without
dropping the iterator's reference.

Drop the iterator reference before returning a lane parsing error and
route all parse failures through the endpoint cleanup path. This balances
both reference classes while retaining the endpoints for a successful
probe.

This issue was found by a static analysis checker and confirmed by
manual source review.

Fixes: 6a18865da8e3 ("media: i2c: adv748x: store number of CSI-2 lanes described in device tree")
Fixes: eccf442ce156 ("media: i2c: adv748x: Support probing a single output")
Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 drivers/media/i2c/adv748x/adv748x-core.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
index 3eb6d5e8f0826..010a4c55b4002 100644
--- a/drivers/media/i2c/adv748x/adv748x-core.c
+++ b/drivers/media/i2c/adv748x/adv748x-core.c
@@ -689,8 +689,10 @@ static int adv748x_parse_dt(struct adv748x_state *state)
 
 		/* Store number of CSI-2 lanes used for TXA and TXB. */
 		ret = adv748x_parse_csi2_lanes(state, ep.port, ep_np);
-		if (ret)
+		if (ret) {
+			of_node_put(ep_np);
 			return ret;
+		}
 	}
 
 	return in_found && out_found ? 0 : -ENODEV;
@@ -739,7 +741,7 @@ static int adv748x_probe(struct i2c_client *client)
 	ret = adv748x_parse_dt(state);
 	if (ret) {
 		adv_err(state, "Failed to parse device tree");
-		goto err_free_mutex;
+		goto err_cleanup_dt;
 	}
 
 	/* Configure IO Regmap region */
@@ -809,7 +811,6 @@ static int adv748x_probe(struct i2c_client *client)
 	adv748x_unregister_clients(state);
 err_cleanup_dt:
 	adv748x_dt_cleanup(state);
-err_free_mutex:
 	mutex_destroy(&state->mutex);
 
 	return ret;
-- 
2.51.0

