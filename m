Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639013;
	b=F0r73OiWD5GWcd8eZpwDc6RLN538O8ONXj87D8NjyqoCWJdyEjjKTKNMZkusBnAC317N
	 tonMo3Xrvq4V87AGs6YWyMjND9xjjFVC/pz2HyO2vyT/6jlIcLSjzZV9q9KXGS6hrkF/M
	 jLCJRt+qxHMz8iNjFSLEgoswXlKtHcqBKOD7Ij96FoO5V1z429OcEncCJQ6Q5oIkLXaPu
	 ZQQqXMpUs+pWFM0QeR/gBu6qEapdntXKGTwkjjmeAoQWTEwcTbid1AMFn+mk2WPOqG8eB
	 lnCl8aeFdyBuRb9SX+Rl2l/eJEZE5RSvV7Irda9b58r+hXpb4ZrFHz631iAWe7sK/Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639013;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7l4WHkBsRffNtc4OtCTnEYHsuGJTmWCjGilEK4Yq4Nc=;
	b=PyTQX2fnzUR0U8pZ0n65ajnUYLe1HOZIZwpzTZpKvm9d31m2idujedEKN1BaM7pXTXWj
	 /D2oiIcSUt2fFqiE8EVp6yqBwDFpa59Lk16Gea3GuRbn8jvmvS5INlqiWxHg8InjymeOg
	 IoRhTwYhQTa3xaoyplLtgOB3vpiZVRBxy0Mq34xQwJ0ea87fHK3m2iKFIBJzLE1+murSQ
	 V90mVEqPYvvhESIkdtMQrr3mBPUsqaDVdRRrfSmVimFuwQYRPO2rTSjVdWoh2sqapCaVV
	 /sdO9/UCrrsLyg6mvAnpmutu59VVPLFvnW7ePkW9piLjXUlFQKdhv1sFh6rTr0GSdUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BpcRDTV1;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30098607BDE8
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 17:03:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30098607BDE8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BpcRDTV1
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso2255639f8f.1
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 09:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639012; x=1794243812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7l4WHkBsRffNtc4OtCTnEYHsuGJTmWCjGilEK4Yq4Nc=;
        b=BpcRDTV1/2941/X1lUeaSwkOB2dtOwKU/DvAhZtlwOa+AGP9u4Nm/lu3MwfW11dNDa
         l4lC6cunfJBFW+mC998rQ1WLqR4nEYOOjOs/o7wjkWKPLJZF/g+13sovPjtfIfEfVW3g
         mFR0HFLwPpB3wdY4Nfdo3aas2YB6j5b7lSprh/QnSL8HTF1Fu+RcwhFyYbLrrQ7/YWY1
         ss4LIkaBFE9NOzwKi56k8tr78o2hwH8dHKobkscCHX8pFtSUkfXEBbu+0yw5tmqDZfwt
         DECc/SW1cdh2jizu3Ooz867Cjx+ic6zOZoAqYcxd9X06rlRJRcj+zz9RNbyd4tEQFYUP
         OQGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639012; x=1794243812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7l4WHkBsRffNtc4OtCTnEYHsuGJTmWCjGilEK4Yq4Nc=;
        b=psFatUihXLtKnZPA3h6lFHJlTOFs/LPoak+r9CBvEV1eZ6JC9MRsscV/qLfm0BFprk
         Ut5CdGp7CbHQmmfLUi9bB2uPFolM7DPAXy3/MCFM0BmNnZcQMBycouepBHnbpGtJa8sn
         JsqwHoU710uE8vQLtqyQOUIa2RRw1iCmi9fs2lNTQzNV+CV72Ufy7OKB5Dj4ZQsWOEHD
         PW6TVoexazAxfztkSrK65YiEDEudFrzdLeazbk3blB1IGutJPCyos1iNXpiS9p1Hu3vX
         vtdL/gRjsHPPjt6b28DJqGa5JrwmSBIC9NiGc5nTV8f6xdJxEuwTxBtWilr6fpYP/NiP
         bt/A==
X-Forwarded-Encrypted: i=1; AKwUvByDnhtmdkNT371/gMFa7nho8xdx48JJgXgErAGYl9Ky6YvWXejScRnDg7WZyt1NH7rpvHjsKEsZ1ifeCw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+GmatF5EovWaXPbZ1WZLz9B207h93Cs5dOqBB0QBTP5/fcwgfD
	p8QLOd5k26MjKiAZIdWzsL8Ri4VeFa3sL4hn8k6wQWZuCBEd1HJb1mgN
X-Gm-Gg: AYBFou38YLupNJ/wx+NL+CZTPSk3mx+EOPNxietKcoqwSCc9RjjKMNba0qbeDJtaMI/
	IjHsbs7erXeJO3Qa/vQM4LruBFtOTuOx2c3DEduzffqmtc5MBk1ZXIswghzVXn9UzmHVB8q5Shp
	NDuD/HGK1XSZSthBWmjdJhgesPwjpQeJcVdYA3yXsU7brQlS3L/kT3tQrS9hlAxh+D8l9ucMWjk
	UimPKItf/5s261O04Zb8QTUs2qUWucVAFNDWuC79MTfSBtXDly7o9VWRjLIq9e8aKhy+yCAsK/P
	fgKPCfxbjpBUZRKNZuTNq7JlU8lQYNp/O5EolWnzpeKvlpnmQDkBk4PDqORJruzuECtLxi2txGx
	kpjpMHB9JEGxtN8U+eHsedobDyLVYy948gKzfklOWmPD1it4CGMKUOk1sBmHK51yS1oRIk8SkPu
	fC/mYEqpaehqw/9TaXxfe7XsgRi1gPmwE/tsBg+NBGbPxSCiW5mACN283uXm4eWv0bfol7J+BVd
	vU5hfC43z8uiwTJXxF1vymLNvOquU+1YAR9i0heSiXjz2sJP1oyIOd/1Lwe6ydaoqZot23FOjXq
	97Bwi9Fny0cWiL5GAhl3LtQQCWbIjWhCO+xkU/JzMj3OGXVu+zBIB3IKLohBmB86dLaqWYfH3ip
	7yceZODVoEMaKErgvsgpgE45gSxKdmkLab1UfQbM6latmVXVNTmzlUhaDzPJi9HhdQkTVQDlVc4
	ne2ek77Wmfytqopk5iX5qlXJRVSnzwzEoVUNRLZKbkI9I895UQOhmo+mQ/wAgCzPbO95pKOJP67
	GumpzANNwzDOafE5LbkG3wuhtGiGa7OExYkucG6TRWVo8tvHZQ=
X-Received: by 2002:a5d:5388:0:b0:48e:666d:c96d with SMTP id ffacd0b85a97d-48e6e50c8d4mr17255148f8f.51.1793639011436;
        Mon, 02 Nov 2026 09:03:31 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:30 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 09/10] staging: media: cedrus: h616: use the 256-bit DDR mode
Date: Mon,  2 Nov 2026 18:03:02 +0100
Message-ID: <20261102170303.1973892-10-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the DDR mode in VE_MODE set to 128-bit, which the driver uses on
all SoCs, the H616 H.264 engine reads corrupted reference chroma, while
luma is fine. H.264 and VP8 P frames come out with bit-exact luma, but
with about 22 dB PSNR chroma. H.265 and MPEG-2 are unaffected.

The vendor library selects the DDR mode based on the VE IC version. It
uses the 256-bit mode without the 2 MiB reconstruction write mode on
the H616, and keeps the 128-bit mode with the 2 MiB reconstruction
write mode on older SoCs, like the H6. Doing the same on the H616 makes
all codecs bit-exact (tested with BA_MW_D, CABA2_Sony_E,
vp80-00-comprehensive-002, AMP_A_Samsung_7 and MEI.stream16).

Make the VE_MODE DDR settings a variant property and add an H616
variant, which uses the 256-bit mode. Replace the FIXME about the
DDR mode with a description of what the vendor library does.

Fixes: 1f24d4307515 ("staging: media: sunxi: cedrus: add H616 variant")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c    | 14 +++++++++++++-
 drivers/staging/media/sunxi/cedrus/cedrus.h    |  2 ++
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c | 14 ++++++++++----
 3 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 756243795de8..2bbc79b44f99 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -27,6 +27,7 @@
 #include "cedrus_video.h"
 #include "cedrus_dec.h"
 #include "cedrus_hw.h"
+#include "cedrus_regs.h"
 
 /*
  * The hardware decodes whatever picture size the bitstream headers describe.
@@ -697,6 +698,17 @@ static const struct cedrus_variant sun50i_h6_cedrus_variant = {
 	.mod_rate	= 600000000,
 };
 
+static const struct cedrus_variant sun50i_h616_cedrus_variant = {
+	.capabilities	= CEDRUS_CAPABILITY_UNTILED |
+			  CEDRUS_CAPABILITY_MPEG2_DEC |
+			  CEDRUS_CAPABILITY_H264_DEC |
+			  CEDRUS_CAPABILITY_H265_DEC |
+			  CEDRUS_CAPABILITY_H265_10_DEC |
+			  CEDRUS_CAPABILITY_VP8_DEC,
+	.mod_rate	= 600000000,
+	.ve_mode_ddr	= VE_MODE_DDR_MODE_BW_256,
+};
+
 static const struct of_device_id cedrus_dt_match[] = {
 	{
 		.compatible = "allwinner,sun4i-a10-video-engine",
@@ -744,7 +756,7 @@ static const struct of_device_id cedrus_dt_match[] = {
 	},
 	{
 		.compatible = "allwinner,sun50i-h616-video-engine",
-		.data = &sun50i_h6_cedrus_variant,
+		.data = &sun50i_h616_cedrus_variant,
 	},
 	{ /* sentinel */ }
 };
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index a523b56a9b8c..d28fe91562d1 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -181,6 +181,7 @@ struct cedrus_dec_ops {
 struct cedrus_variant {
 	unsigned int	capabilities;
 	unsigned int	mod_rate;
+	u32		ve_mode_ddr;
 };
 
 struct cedrus_dev {
@@ -204,6 +205,7 @@ struct cedrus_dev {
 	struct reset_control	*rstc;
 
 	unsigned int		capabilities;
+	u32			ve_mode_ddr;
 
 	struct delayed_work	watchdog_work;
 };
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
index 444fb53878d1..b66d855daaf8 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
@@ -36,11 +36,16 @@ int cedrus_engine_enable(struct cedrus_ctx *ctx)
 	u32 reg = 0;
 
 	/*
-	 * FIXME: This is only valid on 32-bits DDR's, we should test
-	 * it on the A13/A33.
+	 * The DDR mode depends on the SoC. Like the vendor library, use the
+	 * 128-bit mode with the 2 MiB reconstruction write mode, unless the
+	 * variant says otherwise.
 	 */
-	reg |= VE_MODE_REC_WR_MODE_2MB;
-	reg |= VE_MODE_DDR_MODE_BW_128;
+	if (ctx->dev->ve_mode_ddr) {
+		reg |= ctx->dev->ve_mode_ddr;
+	} else {
+		reg |= VE_MODE_REC_WR_MODE_2MB;
+		reg |= VE_MODE_DDR_MODE_BW_128;
+	}
 
 	switch (ctx->src_fmt.pixelformat) {
 	case V4L2_PIX_FMT_MPEG2_SLICE:
@@ -254,6 +259,7 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
 		return -EINVAL;
 
 	dev->capabilities = variant->capabilities;
+	dev->ve_mode_ddr = variant->ve_mode_ddr;
 
 	irq_dec = platform_get_irq(dev->pdev, 0);
 	if (irq_dec <= 0)
-- 
2.43.0

