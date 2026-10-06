Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59199330B09
	for <linux-media@vger.kernel.org>; Tue,  6 Oct 2026 06:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791269535; cv=none; b=Tc+VI1NmE85tVuQIp9+udN5WzBAtMu8UuBQJeU6N2g2E3V+qbEHYsGR81uShrFmcoeF2I6kZKZtsLKaRC8P7Hvyj4HfrJhkNvnnCnj4f+2ZdV4UnVANOAD7iC7r5UVgLdKnSl3lfY6W4G5dwUhk1qrVMHbynkFGYnNhYvF5qQ2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791269535; c=relaxed/simple;
	bh=sXEuhuPbydIc2hl07e1Bu/OzsVyrxTFy5iWRYniIZCs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lEjqJMGZi7QKQZZ8WhnE5CdWC9vnLSmYPVwHT1EUdwRfSISc0IRcCB+VkpN1d/pOJZ9evux5JYMoTRqVdqjnmLaX9ZjauW+gQD8FDQUJ5jTjxWmvhIoR971a1mwPGqtRIviJhrjm5x6H663DJYeL2DfKq7GiS9xTA3YZoPc1hrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=czHTelQx; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="czHTelQx"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33fb4680717so7217842eec.1
        for <linux-media@vger.kernel.org>; Mon, 05 Oct 2026 23:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791269533; x=1791874333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZzqvAx4iFT6Nq0wHCIP+vtsVoXt5n1py2cHhYmK9d5E=;
        b=czHTelQxxRj89cD+sGN0HyPiyWsQ/2imhVeuBcEQ/2d1oczYEgzdDytpW6NG9ra3pk
         3awn9TaB1JyL3W/tJ/JAZnwOxFjkWWfiG0f8RUx/saebjQ6qbsuTrWW34Cjs+NQ2Vp4R
         P/ToqI59vc7vAM7SVH9JBGp5LPK1Db7BEiCom0cxOuoH0wUr9WMpa4ypyK64TFcVlbxR
         oCcAP6HWeFH/uNi2GjrZLNoUT6vFv0weQVm5lwKTMLRATaHpmu+EvEgy2BCG7EDWpiZV
         01OtuDq6AvtsmOaD+GJQ+nnrxEOthcJcIL2A2Wvcl2HgngLS65p23ywwyBCJWI78QxVv
         h2Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791269533; x=1791874333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZzqvAx4iFT6Nq0wHCIP+vtsVoXt5n1py2cHhYmK9d5E=;
        b=li71PIYCnfGo2jbM2R96nCb/2JRkAPi8AoEaP/1rQI1k9+Qm3SBHZDxDFj/hK65rVV
         BbOH3+Tnx+L8keR7FJAAPOCk7DE1M1xyZJQXykBZFrfpiha4IZCCl9Y5pnRTZgLIsmWL
         qavmLQJCJfJyr4ArxO39+CL59cynIoffIuUm69YNClLHbhn1UT63FFNau2rWCNy4sU54
         t/UEfmcSHSgqtpQ1stWvuJijTPClGYZYpGtkKCznKyKt2xWi7WbVXhe0X+M4u+hDr8J0
         2smbjyN+Q9WKnCwuoa7ZDalXcSOICOSuUqHJyXwNuUAwUEsBUs0kwjgp/eZsrk5IKXk8
         tlZw==
X-Forwarded-Encrypted: i=1; AKwUvByObq5dN0XFXPPpzVhCkRw2kJ4z4hhw0rthvw+FQhztHsV5UbkIJ/9ERgOkw8lX0YroKcAmu6Js3Scrmg==@vger.kernel.org
X-Gm-Message-State: AFuF++mRmpFgrsVQPrwjXJP2+AWGVkN7UI99Ks/k+zmk1OGRz91dh3Xj
	pi41WAErrI3i/ub6+rzxn2VDW58pnohV9FH4YL4YY46k6BO1s339eCBU
X-Gm-Gg: AYBFou0TfgC3+7kNSc2hhVwYZ1tP0CjWRZ7H20vbcBL0oOKafW3yvNHUbhO8M4a9/Dp
	msbI8so2t/c/nn2p/RhWiRRs/UDSn7oElLJvPJ1+fIiMBUfLKCNm6Y2KZui3UVjZtEwA+hrhNQJ
	IUBqCrM8NpGJaxUiLirxAuvkfHbw6DI0Ml9MOVH2sYoSaE8Lm2pI3savq7Sje7V0KFZJ4uYf0Jh
	u5uuJPBMuRAXHfKp1jGXqShnJ75m6Fy+h9jJ4ysS3707LRw1Ue1jTs6dgffhR5IuAkgv4ONMGvf
	5Cr+GgWpx5q+eabl0z63kIgLWiMbKKKF167a0KyXN6rJoGafReuMcwqC7QbJG0XB31Ickh814ip
	lkRiFpnSFfijci3VIDHYVaTCqkQx4JGlgGwIG/RmR4XwXTpWsQ6nrIuiPaZgPvC3NdoSBOgM6Wj
	249g0/hsOwIlvrU7XE0pQwd96IIxmrpEsuhTnfuCPtMqGzMwUoubyxRCJgaHLDyQ==
X-Received: by 2002:a05:693c:20c8:10b0:351:4bff:6d6b with SMTP id 5a478bee46e88-3514bff6e22mr859281eec.16.1791269533292;
        Mon, 05 Oct 2026 23:52:13 -0700 (PDT)
Received: from gmail.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351468b2cfasm6306463eec.2.2026.10.05.23.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:52:13 -0700 (PDT)
From: pdsj2807@gmail.com
To: slongerbeam@gmail.com,
	p.zabel@pengutronix.de
Cc: Frank.Li@nxp.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Palak Raval <pdsj2807@gmail.com>
Subject: [PATCH] staging: media: imx: fix function call formatting
Date: Tue,  6 Oct 2026 12:22:00 +0530
Message-ID: <20261006065203.3645059-1-pdsj2807@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Palak Raval <pdsj2807@gmail.com>

Move the first argument of IMX_BUS_FMTS() to the same line as the
opening parenthesis to address the checkpatch warning.

Signed-off-by: Palak Raval <pdsj2807@gmail.com>
---
 drivers/staging/media/imx/imx-media-utils.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index f119477cac6b..978770cf3907 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -16,8 +16,7 @@ static const struct imx_media_pixfmt pixel_formats[] = {
 	/*** YUV formats start here ***/
 	{
 		.fourcc	= V4L2_PIX_FMT_UYVY,
-		.codes  = IMX_BUS_FMTS(
-			MEDIA_BUS_FMT_UYVY8_2X8,
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_UYVY8_2X8,
 			MEDIA_BUS_FMT_UYVY8_1X16
 		),
 		.cs     = IPUV3_COLORSPACE_YUV,
-- 
2.43.0

