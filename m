Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246679;
	b=XZcgup46dOKPI6FTW8nePMcEKxVDQSzaRUYUVv05A5DlxrI+Cnrl6GEJwp096RXbWRAB
	 ShmYmuxQbCZ/QeC/20LznjnjW3otG0S7vvvovp7pVEh+HO6e3xt0J1jahr7iRoch7T3W1
	 0vKQFeQuTt5GipmAkaiJlRawgDVtBenY6/SmuzFYytvc5bTSy2hewvofLGTj5hiHgfWTk
	 bxh2RxTaFpa1+CQ4cdOa7rUTxFSo5u0ehSmUIpsc6fUz3z69Fhzc7akAYAnG3yaakwqQF
	 3yrI05SbQfskyhVPkdiphadQeFEWNQsjb3qc1oHwMVtfZvGDERQCPietteCPdAogAfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246679;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6lQZd1bM6K+vPoeN+FFObtB7PVIN9WoNQwEnxWfTQwg=;
	b=43dbXBbQ6xs0SKBxS6Mdq1VUptEHKlh6aIZ6XzcjrUJ/gfDRpHBH1DjFQ8SNioo251QS
	 RRbsJi0Pl17QXteX6zoA+Dm5S10kKydbwY4qOD5CJaF45ljDbmUR21aGA0kZ7f1FU2Zsa
	 cWcHUB56KqK3czXhoh/sBA7N+1lMIyOTFL8dVpQi3u0TpdEzW8r7PfQeVWq2lpqJriJ6D
	 DacSlrHSgnonCV/LYhrFnvxEeYwrVJBOeISTsl1GWgcG2tSyo2Y/Q7as7GXsxAfUTdqwM
	 iMG6GORERsHIMdkyY/nXyeUuNxu03rOmxqCJVNVRsx9ZFDq74o4olan3NQIUeH6ZF2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DqxDxWVm;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF48460A2613
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 17:51:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF48460A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DqxDxWVm
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso11478565e9.1
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 09:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246677; x=1794851477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6lQZd1bM6K+vPoeN+FFObtB7PVIN9WoNQwEnxWfTQwg=;
        b=DqxDxWVm2jDxmK4udNQYVIWf5RIMEf21R+orE7szvtO0MXuyxYTUGjhckc+tPkSj9K
         YOlAg31NZnuT9kcPSFyh2AEpIhLXXuqviBFBgrZ2K23132Q+SojVEMmARzdvDd/TRvr7
         Aavdrw9iwZHihHLsXe9hVnsiaqdl5cLP19WOyEjgt2CcY+H+B1NExryRWBRoVXgwE+Re
         LwVlxW9yj505iJ4NvEUmKmhYfkt+80m9Ixbp3KbghbduWpo0Z2XDN5VIlVmHBU4klubV
         AIlg3hl7JbZOzUNzdDnRaKkxgQrbL8c29EqOquqUjTnJKEjdtD8aicBYlXS2fz2yQX6y
         K0OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246677; x=1794851477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6lQZd1bM6K+vPoeN+FFObtB7PVIN9WoNQwEnxWfTQwg=;
        b=FdPYDAjgWSsj2VkV0VQ8eROGSPhXoooDDt6TQUf8I+4xJBfX661YKSwjCYiLy8qIJn
         NLUtAFE53ixoxul3oduwBS8cghZS3Oql4BOv3Pc2eaZ4jBjfm0w0pFlSbIQmU8XkxpAm
         LWbb8JJkcEVHll2kgCpMiRp9AyWpyxs2pi7nFdK7p4xTI3RdIgQocsbtAobbp8OKn912
         8uljDh2Xt9ZAgA5NW2jqQOt0Q1wkcSk9AgulpsWMQYGI3KGnjhrInYxWpOBbi+XIblIZ
         y7IJcjH6WavjFVqjX+XYHkwziTMFOThV/d3fu6JZNBrQPz2eZaLBhZINAXUjcqVlgIYr
         3xng==
X-Forwarded-Encrypted: i=1; AL+hErFUBjKfGirVDkZB2yp9LMt1mP3JdzMNWqjLKS58CYCrxKhEmxnT/00eqXJfYp7BOyDD3AhTGBwRGf1y6Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z+nEE3831Yju87dwUQuhSMVUuSyXNhcFo20l38xN3gAlgvnKwS8
	In3pQbyvZrhrxa6uEZSu3p0LjZccAPxeegRabMGerSsd/66RciNjb1AH
X-Gm-Gg: AYBFou3ln5AVUHARMuanV2/tHQgUsg8nLH4IBJAWy7rQYiVss0tqY+6i7BptcLaLJAc
	YQ4owrYkVHIk6aN2JxDbMzn1nB/N/LBmX0nHRkX+U/YT1b7Wln+aFkUZ7pczRneskRcGOkucWhv
	Pq57FP2qXZRLrR5xCPdczZ6Yi5NNd5sawNZmAuqn/r47w8HHrYTPl7XLrb5YJd5Y6u2vsfIwvjO
	VN17e8Tyvgw404eUhQ8JkQqh91sRKX8Ey2gUFAuVp5dScBnDi+pBmZViLWAh9Yu7Nf/c2uA8qOg
	Rp6jcu15OPWcBx1/RuB9zSElfo0ubCfL5uRHlSRicgHKnzGTbRwF9M+qr72wF+6QSSFlqdimsDv
	P91H3f5IXqIprvF+01SL8mogpp9wN2bqS4PCkJYBbwO8QHOpA2HuSkI6DKh+g+YSr1LLxYo6eao
	5GeAmPiusE6GlkVtBzJqNM0m9klqSvvDrKFQZVIIXt+M1MmLnJelpn5HZD1HP4W+si91N+FiNqS
	+av2Mn9RHjZgGHzdKR0/joWpd6LdUxBPWKP1GoNgz5TaCQYm2xfOj5HEmlbuuA92xBgD612YFnI
	NWgxvszQ0U/cNQvWHYEVz3Es/4Pv+Bn9rl2zrSuBUbVz+ArrL7KgQCxN0nyNu+vMwZrVpmqyi0C
	MyJ+Cl0iyUc0AaKRGIAUyUJI30dAxPz/EvMESH8CAO0dIIoy7dtrNLMdRnBxWhOioWQLcDTrKZ2
	yPcTIifVy+R2yIBHp37nXOliiaeWYXtKPZpTKdRk0H2yWtbeyuT2OInSMxtxFZfEcba3VKBHQ6g
	u3aco3SSANha84BEiiSdvb8kfNOqN4/Z1aszUvyjM6e5VFPe+A=
X-Received: by 2002:a05:600c:3e88:b0:4b0:bc65:b9b5 with SMTP id 5b1f17b1804b1-4b963c8809emr85435405e9.35.1794246677280;
        Mon, 09 Nov 2026 09:51:17 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:16 -0800 (PST)
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
Subject: [PATCH v2 09/11] staging: media: cedrus: h616: use the 256-bit DDR mode
Date: Mon,  9 Nov 2026 18:50:14 +0100
Message-ID: <20261109175016.42061-10-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109175016.42061-1-jernej.skrabec@gmail.com>
References: <20261109175016.42061-1-jernej.skrabec@gmail.com>
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
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c    | 14 +++++++++++++-
 drivers/staging/media/sunxi/cedrus/cedrus.h    |  2 ++
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c | 14 ++++++++++----
 3 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 6c6aa45f5f96..09b789640646 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -27,6 +27,7 @@
 #include "cedrus_video.h"
 #include "cedrus_dec.h"
 #include "cedrus_hw.h"
+#include "cedrus_regs.h"
 
 #define CEDRUS_VP8_MAX_WIDTH	4080U
 
@@ -679,6 +680,17 @@ static const struct cedrus_variant sun50i_h6_cedrus_variant = {
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
@@ -726,7 +738,7 @@ static const struct of_device_id cedrus_dt_match[] = {
 	},
 	{
 		.compatible = "allwinner,sun50i-h616-video-engine",
-		.data = &sun50i_h6_cedrus_variant,
+		.data = &sun50i_h616_cedrus_variant,
 	},
 	{ /* sentinel */ }
 };
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index 572e70a94b3f..78efd3938c77 100644
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

