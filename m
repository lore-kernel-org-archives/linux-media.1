Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794537680;
	b=zDKEPAWc6ZMLfk3qAqno+r7Zus210W4WxmVlE3SbveN/SXtCw2BfcOZqlGs0GJGSIWFW
	 b44+5did3XQdfN2loeVRKBZYYKSMo2606rpfu+PIqI4z5ts6aeaEoyyiwJZOmGrNUCZpS
	 WU5oO3B3EAyzUEFiap9EhkoTGxfUc1CbldlEvpmyLrUEBljUD7tkL6gxMIOrZlKACO/oQ
	 eGHBkGK0vQp7O94X+HoEC9zCfizYcF+ZH6HOZk31mmk9s/aKosAnDQ8dni3daGNPrtxFB
	 RlKX0sfdsJ8MUgZzcXH+CfFMaqa5J2zwd3uOYMd0sSjPOkPrOliSyZ64N0B2ryYczCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794537680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4tT5hFpzZAr8Rid5tP1O0Sqf7A6ODSsu5SatFU1cn9o=;
	b=GY5xeaTQPo6ZUsoW6fYna8GRUmW/4HZhxaSz4J2OTy/7dk+HI2roVaN/KvT/e+dJphNC
	 DLV2EDrhH188VvrSYGAAAzX5Yaxca2gwaou10AAI6WwqZrNeRYeQc4zWeUufBavf/9Chl
	 /BO0gbOZmjNEJbrInz7v6KhoaI8cos2ksHf0ffVXAcpoKRYZBtYj+X/+/kw7DTtKpN76l
	 XySfW8E4U2WnItR1prIuJ6/yCSRjk1gRXix2jEITNxRztLiMJ1kBMmZpfl16f5JYcwp++
	 LX92IMCqeFnsbqf5mTDN44ugMORvjsecpOhJmbYLz3JKrwEPznbbY2aSua9LPTypysA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EeUaleQE;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5675D606A89A
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 02:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5675D606A89A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EeUaleQE
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33c10faf6easo68446eec.0
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 18:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794537679; x=1795142479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4tT5hFpzZAr8Rid5tP1O0Sqf7A6ODSsu5SatFU1cn9o=;
        b=EeUaleQEga7fpxbRgo28RXvo5vCKpzkxGoUsRH2DYUHMnsNYm7LaPG8m/oax6Di4ds
         RaArJAMT6xGYP6qran537lNL7jTjpXuEZOXRnBMzu+f9LBGVX12PSQZ0y2cG9hSpbUKX
         kpJT/FGZYt8tTahCaIBmLGqqKDznPoHVAB9Hi7MHW449A5sCsfYhp8Aaf9MO9RUgFQ8C
         uJiXC0EZDteyQ7W+PkKpr3HHguEfY+rTvIio5Gcf+lSGS35rqYoh8Ns5hS9MXJW543z4
         1I3F0rx7MmsayYhN1XicEC3dWJR+rzPwVcJ86VwVVlTZXCz0vXnTsgYY4V7BjBYvRdLL
         L7rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794537679; x=1795142479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4tT5hFpzZAr8Rid5tP1O0Sqf7A6ODSsu5SatFU1cn9o=;
        b=gNOkdXE5MIA4MtT6hmGvCANEAYnTnrXbGhYQ1+oOHepSDpW7qdWOznKu9ToPVeRXj8
         LeZ71/LMBCHDJR73yq87pTNfToZmKQSYdxfx5PCujDA8hThHqK3iePKVOVNXEWlzr4pv
         b78KR48wvyqrCkYWsjAACpuVkHJ3YNf+vuimBg+di2fz682qAVH1Xt6X4ockc4yKR0zA
         80dZJXXYjk2ihLSiJKAhN24c+dyX7Zof3EmdXBsGTlEicnEQbaq7sxePTYhPDdqGAzAG
         CQSmPyYBgEZm76n0PqXM/mH7SsKxpU7BA5fojQ5dEmrY3LKthhhY7t+dgjxCjCqKVwD/
         E67Q==
X-Gm-Message-State: APuU4Z/fsdqMW+HemS6Fk+T/+8y9t+8ElgdepVQ2ftQcSPXUJDO7hzF6
	EQn4fe4PpHZxPpaFjZS+XndCg5u4yqSc0vehbrhr08X1enOrA5/Jo1RFA1/D5PJBL6Q3IGaJ
X-Gm-Gg: AYBFou1ekNc23VagMtPUX6TOtbo1fLXgMe/Dn1LfIAZw/eirACM26Gx1sSRhwsqtwSL
	WH8d2QTMaM71CG8fCv8j5SwUVjjhKpMOi/zmhKQC0tKQ5xTmXz/hFVdhy6/00sN7XTqdkhRR5fi
	S0QDpNQYtcPlW/FXLca5FcKiV7rUjSi1wHDFIrfK7RGYwVewPbaigQDIbHJV39neEBzB++PfcNL
	q9qd15pamysvGyrYX86qTf9GplcKOTW5nrUxyPjUeByp4R8jbkZDZTrX6+PBbe9xaHPqgUhHyse
	kMeg7A02hxUcw/ClJguGQZ57oV9xCUvF8JDWuDBdgq5tXjCWO8KRHKgQlxdbjOyAtwOJwqfeJT+
	4Sp9+TknYqq28cON/qgCnlxfxRZYlS/TCgyaHPqj4rCjGeptRKylz4+ri4ZcLSnbd0c854SmlT8
	KiSH9CRzYHYfKhljILNN9jZuy7IrbR6AbbLpw3EXau9v+CWeL6BckFrPRgE8o7qWerm0I36KFWh
	BPAMfYmRnvre6N2Y+A0HrAxvrLPi8LQbMMphVtcRT9qlT2FaK6Yg63cwyGLPO3wHBbPXZBUS6lb
	qo1hySex72a7lgjJ4ZUcg7/upEWz41qUrytN1LZgXFzSPgbS+y8a/E3J1Zt6zsfDJLiR/Wy6vVy
	yajHWef42ShUQn89zOeVYKkCzU5Ys1upKnoKYd3k+zutnUvEbA3gWolEQmFU5/r/h3HFE5sIFSr
	i86DtSE9cgBA==
X-Received: by 2002:a05:693c:881c:10b0:36d:5fbc:8c8d with SMTP id 5a478bee46e88-379655d503emr1470847eec.2.1794537679252;
        Thu, 12 Nov 2026 18:41:19 -0800 (PST)
Received: from esteban.tail1178e6.ts.net ([240b:c020:623:52c6::44d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm2334704eec.22.2026.11.12.18.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:41:18 -0800 (PST)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	dan.scally@ideasonboard.com,
	djrscally@gmail.com,
	dmanresa@gmail.com,
	dave.stevenson@raspberrypi.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3 1/9] media: i2c: ov7251: Use in-range PLL1 dividers for the 319.2 MHz link
Date: Fri, 13 Nov 2026 11:40:51 +0900
Message-ID: <20261113024059.1087031-2-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113024059.1087031-1-antoine.pichot@gmail.com>
References: <20261113024059.1087031-1-antoine.pichot@gmail.com>
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

The 19.2 MHz PLL1 table for the 319.2 MHz link frequency puts a
pre-divider of 1 before the multiplier of 133 and a divider of 4 after
it, so the PLL1 multiplier output (the VCO) runs at 19.2 x 133 =
2553.6 MHz before being divided down to 638.4 MHz. The OV7750/OV7251
datasheet (rev 2.12, table 2-11) limits it to 300 to 800 MHz.

Use pre-divider 4 (register 0x30B4 = 0x04) and divider 1 (0x30B1 =
0x01). The multiplier output is then 4.8 x 133 = 638.4 MHz, inside the
range, and the MIPI clock stays 638.4 Mbps, so the link frequency does
not change. The Windows driver programs these values for the Surface
Book 2's Windows Hello mode.

On ACPI systems this table has been unreachable since it was added,
because ov7251_check_hwcfg() selects the wrong index. The next patch
fixes the index, so the two must go in together. With the index fix
alone, D. Manresa's Surface Pro 7+ (IPU6) had CSI-2 errors in 7 of 10
150-frame runs, 3 of them stalls; with this change 0 of 13. A Surface
Book 2 (IPU3) streams clean with either table. Dave Stevenson measured
on a 24 MHz Raspberry Pi board that the out-of-range tables miss their
nominal frequency and proposed the same values [1]. The 24 MHz tables
have problems of their own and are left to a separate change.

Fixes: ed9566ce1946 ("media: i2c: Add support for new frequencies to ov7251")
Cc: stable@vger.kernel.org
Reported-by: D. Manresa <dmanresa@gmail.com>
Closes: https://lore.kernel.org/linux-media/6ae0e944.b6db0abd.16b13d.d261@mx.google.com/
Link: https://lore.kernel.org/linux-media/CAPY8ntBFJJPg3y46gC=bNq_55QifC7mKmeq8+pAEDVN42fGUXw@mail.gmail.com/ [1]
Signed-off-by: Antoine Pichot <antoine.pichot@gmail.com>
---
 drivers/media/i2c/ov7251.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index fce6344b5120..f429de5f1f7c 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -174,9 +174,9 @@ static const struct ov7251_pll1_cfg ov7251_pll1_cfg_19_2_mhz_240_mhz = {
 };
 
 static const struct ov7251_pll1_cfg ov7251_pll1_cfg_19_2_mhz_319_2_mhz = {
-	.pre_div = 0x01,
+	.pre_div = 0x04,
 	.mult = 0x85,
-	.div = 0x04,
+	.div = 0x01,
 	.pix_div = 0x0a,
 	.mipi_div = 0x05,
 };
-- 
2.56.0

