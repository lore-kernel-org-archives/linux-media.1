Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7673D478E50
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 11:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115867; cv=none; b=ifR3AtBuo/NEO9+bVEtAx2D3cksc1n8GcnXMFxNnQG/rFLLzOurQZ37mxOXsWQjpMCM6cm04uV8jlI5MzXNHPxMKtmELLQIAzbkRELZ57W1OOduc8hQWapA0ThsVrv9mlAZ5VioUn+AaYStJTXKX1an8BGZT/M0KpK4S76LZZvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115867; c=relaxed/simple;
	bh=M5cgImqp1X6ATs2zX8UAJD/o0x6k2f4ZZAV3K3styBY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uTkBb/HcQm0o2J3bRL4Ms7Sdxkg1TV4jHQ3bFoy1RyxLXACtkCafNhGl/UjDoY/sEAmUW0N5jCQi0hs2ubZladMcBzM+mWYiTTcN2Q4Fnf8Qgw+pZKo0Hm62N+PT+ldJw4DH6dTXt5ZqBCwNk/ybCL2BqQCz1GbElpuY0oe1zeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=l/guKJlf; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="l/guKJlf"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4758b2a9e2aso3304724f8f.2
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 04:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1784115864; x=1784720664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m8WwpwzBvrJSugqb6BxcRR4O4z6rF0/Sty/g6S/wo/w=;
        b=l/guKJlfeRznmhQGz4zK2j3sXKEOnwGSxZN0nQF6PF7po62nMnErc+r5mEbQoVEHPc
         K/n5LEUbMGzBCj855WnnqDzMMs1Imt5OXzkJoxZsOpT6BqUUFSdvLuv0JOzXL1SFO4l1
         yKKRbOVqgxWMaAmRlZb2zoONRuNh/4Cl6Nhrn/FIRqwjFjniE6gcLxJliFs7eW8uEZFq
         1rxgcgXAvezCUNjj+QypV4e61AWhytgFakzagQEpyS/n4s6ysKc63nUCDVOaBhS2YnHB
         HD0RKPgpFDiqVB2GS/3haqRyfM5Zbs9/hjKoTNhPZt8AQFyHZae8KBzItDDYFZlxY/dO
         Gphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784115864; x=1784720664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m8WwpwzBvrJSugqb6BxcRR4O4z6rF0/Sty/g6S/wo/w=;
        b=Enpt3oA4/wgLPPZZS17QxHDjWkPmVxkxnwfRDzNJUMQp9loJdVSRmKbCQHoWCzvkYR
         czJCvpG9HGknD10+OiopWQE2MTRJBuM4VYfF+0aYVT7lJyjmPXnOZVefNIohltjO8lwi
         wnlujlttD8k9loasJK7blWgCWiEdM2z1GnnHBmAnsI61sSVzvgTdkeEOMVAeYF3aoU9U
         gNoBhEEP1lklrw261CQnR/Ug8jUYxPxUum1ZPMksyhhXoVK7f7xPaphNYnzXLV4/hgmy
         GvO6y4yj2TQZPyzyPHmaMKb/Ip0Wx+QTYM7uqNwqd1AIBSOdcLEVwAea6uuBU3SRHDa/
         FFZw==
X-Gm-Message-State: AOJu0Yzp0gQtV771yMqywU1y2DOnx5MzZyTm6ceaK3kQ3ZjBCKneSvdK
	JBpmg+XCuLwbPCZ+qYqq89VpkoAUhdcDu9eT08R+aQI7lwbdaZK154Q+vEPIBEpdpgc=
X-Gm-Gg: AfdE7clD7eZn6l5MEgYrILZewl2u2gr2XHLJGKDDeynTRyC+DuNG5f0MUSdZPJj8idR
	u8QpvjxkbpOlK9kSA6Tt/PzwLxRBdZ6IldnTi+9RGwwxkVfYeY/2QFI0QxXSDXiWYgdUXLtFgcB
	F1QtzIZn8MEBaXupsX01i88KsfMtBxz0PY+cB5Ji9y3bSOT+trrVUWEuz8z8wnZGT0nbkXiWT3n
	s8UzVjnwSCDzwcmL7HuekOYUJJEhse0r/Ym/DZ91dkL2MDW193oNflXOOJ0WustvO/f1dyuIjef
	TD9tuL3VcA9jYNDBNE7GftZdE5pHWnEYCCOTPd7fyfdaIEqKDz84DROczEhK4i2YL8xPVWLguKg
	7XNcLk0y3H7kDr3uCChfr3xml5Y+MzYz9XZdTt+9ko8V2UMjoITxAormfUbvHoKE84JGKkS5cI6
	17WDDvs4tAUSmOKuFc5o2AJ/AcFdimpqv3D1X5U5qDSvMMFZ/Y0Eu54Wurw5RCVHWb
X-Received: by 2002:adf:e186:0:b0:475:6c34:2120 with SMTP id ffacd0b85a97d-47f4887dd78mr7554369f8f.18.1784115863656;
        Wed, 15 Jul 2026 04:44:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f4829896asm14005425f8f.23.2026.07.15.04.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:44:22 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 15 Jul 2026 12:43:28 +0100
Subject: [PATCH v4 15/21] media: imx355: Set the colorspace in the format
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-media-imx355-v4-15-f7f966fb9ffd@raspberrypi.com>
References: <20260715-media-imx355-v4-0-f7f966fb9ffd@raspberrypi.com>
In-Reply-To: <20260715-media-imx355-v4-0-f7f966fb9ffd@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Acayan <mailingradian@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, devicetree@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

The colorspace fields were left set to 0 when they should be
set appropriately for a raw image sensor. Add those values.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 52bdfe636231..fa8a6851b44e 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -612,6 +612,10 @@ static int imx355_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	try_fmt->height = imx355->cur_mode->height;
 	try_fmt->code = imx355_get_format_code(imx355);
 	try_fmt->field = V4L2_FIELD_NONE;
+	try_fmt->colorspace = V4L2_COLORSPACE_RAW;
+	try_fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
+	try_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	try_fmt->xfer_func = V4L2_XFER_FUNC_NONE;
 
 	*crop = imx355->cur_mode->crop;
 
@@ -738,6 +742,10 @@ static void imx355_update_pad_format(struct imx355 *imx355,
 	fmt->format.height = mode->height;
 	fmt->format.code = imx355_get_format_code(imx355);
 	fmt->format.field = V4L2_FIELD_NONE;
+	fmt->format.colorspace = V4L2_COLORSPACE_RAW;
+	fmt->format.ycbcr_enc = V4L2_YCBCR_ENC_601;
+	fmt->format.quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
 }
 
 static int imx355_do_get_pad_format(struct imx355 *imx355,

-- 
2.34.1

