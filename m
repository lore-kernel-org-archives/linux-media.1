Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF37F3CB91F;
	Fri, 22 May 2026 10:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445091; cv=none; b=n6Pn4LoiPgIqSAAz8jsS9arTwcwnfLLoBZr8ZLEXOnANxZYBh3uQXRMi8eZGK8foIcxw5IahCSF6qsVLGR4SKWlSKmMkCnudADTQw/Ly8cDThOtPWzoiYNCNNZfyF69sbDTED4IBUZqOId805ZTgiG5zSmSNTV7NNrrMALJcna0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445091; c=relaxed/simple;
	bh=Z3jSTgq8kGJqr3f6aTOr6knMDHQ2oEZCMMp98VApAns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ulaYE/CV0FkeU1SSOJ9BM7XplDqbf49Xd/Dk0sj/qiEnGNIwx63Wniwiryvk5xmgTXoSKESIiPP/hJ/E5jhE73QrB6DDJgikAuxOc4e3u7q8pndmsd3+UQr7cImOG0bk6FrzJXQZW/hynhmUSSj63AIKDpRGNyd9U99hl1ZGyN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id D0B023700299;
	Fri, 22 May 2026 10:17:53 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 462FDB408D9; Fri, 22 May 2026 10:17:53 +0000 (UTC)
X-Spam-Level: **
Received: from shepard (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id 34E72B408D0;
	Fri, 22 May 2026 10:17:08 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH 08/14] media: verisilicon: Report default pixel coding for non-JPEG and fix JPEG case
Date: Fri, 22 May 2026 12:16:47 +0200
Message-ID: <20260522101653.2565125-9-paulk@sys-base.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522101653.2565125-1-paulk@sys-base.io>
References: <20260522101653.2565125-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The JPEG colorspace is very specific to the JPEG coded format and is
not relevant as a default for other types of coded (or non-coded) formats.
These would typically use ITU-R Rec. BT.709 but it could be a number of other
ones as well so reporting the default value is best.

Furthermore other pixel coding attributes are best set accordingly instead
of keeping default values in the JPEG case.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 .../media/platform/verisilicon/hantro_v4l2.c   | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index fcf3bd9bcda2..1001feee5c07 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -415,10 +415,20 @@ hantro_reset_fmt(struct v4l2_pix_format_mplane *fmt,
 
 	fmt->pixelformat = vpu_fmt->fourcc;
 	fmt->field = V4L2_FIELD_NONE;
-	fmt->colorspace = V4L2_COLORSPACE_JPEG;
-	fmt->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
-	fmt->quantization = V4L2_QUANTIZATION_DEFAULT;
-	fmt->xfer_func = V4L2_XFER_FUNC_DEFAULT;
+
+	if (fmt->pixelformat == V4L2_PIX_FMT_JPEG) {
+		fmt->colorspace = V4L2_COLORSPACE_JPEG;
+		fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt->colorspace);
+		fmt->quantization =
+			V4L2_MAP_QUANTIZATION_DEFAULT(false, fmt->colorspace,
+						      fmt->ycbcr_enc);
+		fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(fmt->colorspace);
+	} else {
+		fmt->colorspace = V4L2_COLORSPACE_DEFAULT;
+		fmt->ycbcr_enc = V4L2_XFER_FUNC_DEFAULT;
+		fmt->quantization = V4L2_QUANTIZATION_DEFAULT;
+		fmt->xfer_func = V4L2_XFER_FUNC_DEFAULT;
+	}
 }
 
 static void
-- 
2.53.0

