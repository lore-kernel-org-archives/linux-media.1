Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793445756;
	b=oBEX2WoPLgCqAMnpJ8i/naYzrtmYGhy95T2LCxgBIIA4eL45gQaONND20P/aVjuj1DjP
	 W4iWTTldO5vz8/SBWnuVWQLlMe8NUYtPRJ39murjJMmXCR6HtInCMccT0HQTsQ5F85Skz
	 BsmPWFkqKRPmhUsnf1fMHO+oHyth8VvUkvdQTeSCj+h9HC+xbJeRw5TU4aE0a6GykAPYs
	 7b75IRT5y2mOd3ePB7hj9W0GK1nVz9E5c/WGfkNj0TKreDu0Uj1TJQANlkzKgv2poM9lE
	 9zq9TdlGzTJy3Uy/dSfDzvyyokaUaOAydy348HPSZm4/BSZ9QzThLt3VSP1tEvzMlHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793445756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oz6HnaVkQNp0wlnmYBqQmR1f2nmsjZ3gtDQXQzDwKzQ=;
	b=pAiEf12hMqHhlIXwo6AiLHtqrZTJr9aps3LKtqm1vPFpcMKdu8AofceoD1jGnc4m4uZp
	 LiIsKa6T+zooFCZ1flQE6D3KZwxs5SmQssXPogA02qBKmtY46gTVCWZHiU7tufkJg3IzF
	 ee5fbST8Zd+26iHVHJXyiIklsgAfZc6ilQAcvK5P4RFTa1WC63ujbUJKTjoNgQicbwDpF
	 GElasQpwjAV41ZuAzcvmUS2m7lguEOPTpvxve0oUKj2c3XQfvIJ9ijWAmXvLwhoA3RCwI
	 an/Hk7Ye+OvyO3Wxpfsd4JW+ZwGYqp8BtPJcrQtWrnZodzAgI7o5xJdYsFjHBWt7C2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oo29KnUP;
	arc=none smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA88E606A322
	for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 11:22:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA88E606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oo29KnUP
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3ab12c074f1so4082121fa.0
        for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 04:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793445746; x=1794050546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oz6HnaVkQNp0wlnmYBqQmR1f2nmsjZ3gtDQXQzDwKzQ=;
        b=oo29KnUPaZOU4KVt+d0y6XBTsr0pOWuWjB0K/xrOk2rMsFzRHKI+fkVoPOROmsk+Kg
         tTKq6IgFyCeCbErfG1rBiqrxdJP6wHcE1fFNJo7Y9fSBBnn8tRl06vjmrPZI9DtCaxdO
         Y58hZ/wx4em1g7rrdPI1p9oYDTYgW8kqsvXvFFAYboQu5QGd0PgBXd8oiNF4jLtse82q
         8HvTm9SsN957LsRUrdW4QDgv3aFl2IFp17Kz4xPzT3Gy37HsCaItmvdorXxcOIyucHcg
         gzG4Azl8SJ9EcVphQrXJFcza0de1ZetjOC3jPTEEWaRPfjDH0s/qRLIGbaN1aje3QDYp
         +08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793445746; x=1794050546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oz6HnaVkQNp0wlnmYBqQmR1f2nmsjZ3gtDQXQzDwKzQ=;
        b=Suv2KWyb55dLP6ftPXBwOHGAq4PtwOBmBgH3EpeDIYMXx+k7k8NDjmL1nx8kdUVIN1
         aLOef9rSEhJd76fM6vfxpoKMIM35j5YHmkRSieZZEdHKpNkg99IVqXo7XftasgDO2Yw+
         3298ampysBY8OZ7Uwv9/clClmKmo4oa8cWLlKKjhUHWShjqno1vAsAmhuW3LtD2vCeDR
         bhR7tG9Pfdkqt1aFZTQJIPWtG60o6wzZzRrjfj+7NRK5NOtZ3LwC8z2QjvjQ2Ggpn0KG
         qsiVAosAKocY3y8SV/fBNJCi+mXnUJyXMS/MThU7qUxEegSXxnA/XkEE2xeZ1Sp+gUVQ
         SRUQ==
X-Forwarded-Encrypted: i=1; AKwUvBxAQsWZk6qb6S+IY7VPeA1uHWuJSdhvI1L+So72HMotxQ2C5Uy8oE2EuqgEQT5F5xPwgUukwgi0uUokDw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLBOMgCuIZ8365AhNIpOm1cpWhD3UqllyccKrcDxW3K9ahCwb2f
	fSiiCyNSOxAPc4LFcU7r5T+cMyoZ8c7zfTdYCw1lW0+fxl1MXCf7lGb8adCF5NaMdQM=
X-Gm-Gg: AYBFou2EQe3j2sNlbCuZsu2P0hLdYwP5QFP7UJVjQc8Dczn1id05LYelB3b1AiX5eTc
	lbEyAblrkfwMb9Dh32H9V56Y4c97lTiSu3vePtxZwm1CA7SVrpRCQlXLvExwC1LsP27XevLSoDP
	DwFPhBTvoqbUvPyl6QVV94q0dvbZoToBmsfZXheFUTReJ36rpOMOJeZ60GtiSThWW648ESjKu/s
	Y1/N1C3iNkqPi6tBgQYz4jT+9ysl4tXMAOUjdKRiiWvM4ipO1nmhTYQPcJcRmNls0UgfIqPGDfP
	ckp33qfnA1Z+ShjzJb0Nddv3vy2/vyTmUBPsZTRabVEAu0Uj4HHOWSWu8oOmAg1gI5zHIqM2hT5
	tJLvLhuTQppeIyRUnKK/0oyYD7pJVuDWzKenHyobspzcbBJxT5PM2hr6GEAkVN+BD+tTkgJFhmr
	4Y7tIdinN7aKNGOLFvqqxCTnd4QSce2175rJkNtdOi62L1KNu9e47M7mmJg1VfmfK9DCc8x8EMG
	k7xIHeo1OXzXi8IGWwkehslcUfzmccOpo3mBjZzwFYiJ4CjLssTMRRJmgHGghTB/YV0xL0u9347
	P+WQVewGtDYCxNcLYBZbMqytlenXa2Q1CDtdku5ec86EDEQoI7BrXzMjuuiSCT1PgOz7mA==
X-Received: by 2002:a05:6512:3341:b0:5bf:b963:7167 with SMTP id 2adb3069b0e04-5bfd97a7157mr1898007e87.6.1793445746192;
        Sat, 31 Oct 2026 04:22:26 -0700 (PDT)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe074aad9sm538469e87.75.2026.10.31.04.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 04:22:25 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 4/6] media: qcom: camss: tpg: Support TPG hardware version 2.2.0
Date: Sat, 31 Oct 2026 13:22:01 +0200
Message-ID: <20261031112203.545319-5-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
References: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
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

Qualcomm SM8650 CAMSS TPG blocks version 2.2.0 have no test enable bit in
TPG_CTRL register, test pattern generation is started by a test enable
command written to TPG_CTRL_CMD register, which is also used to reset
the TPG. This is the same programming model as the one of TPG hardware
version 2.3.0 and 2.4.0, hence lower the hardware version down to 2.2.0.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
index cabbb2638cf3..a83f9a80c2b6 100644
--- a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
+++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
@@ -22,6 +22,7 @@
 
 #define TPG_HW_VER_2_0_0                TPG_HW_VER(2, 0, 0)
 #define TPG_HW_VER_2_1_0                TPG_HW_VER(2, 1, 0)
+#define TPG_HW_VER_2_2_0                TPG_HW_VER(2, 2, 0)
 #define TPG_HW_VER_2_4_0                TPG_HW_VER(2, 4, 0)
 
 #define TPG_HW_STATUS		0x4
@@ -170,7 +171,7 @@ static int tpg_stream_on(struct tpg_device *tpg)
 	val = FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
 	      FIELD_PREP(TPG_CTRL_NUM_ACTIVE_VC, last_vc);
 
-	if (tpg->hw_version < TPG_HW_VER_2_4_0) {
+	if (tpg->hw_version < TPG_HW_VER_2_2_0) {
 		val |= FIELD_PREP(TPG_CTRL_TEST_EN, 1);
 		writel(val, tpg->base + TPG_CTRL);
 	} else {
@@ -183,7 +184,7 @@ static int tpg_stream_on(struct tpg_device *tpg)
 
 static int tpg_reset(struct tpg_device *tpg)
 {
-	if (tpg->hw_version < TPG_HW_VER_2_4_0)
+	if (tpg->hw_version < TPG_HW_VER_2_2_0)
 		writel(0, tpg->base + TPG_CTRL);
 
 	writel(TPG_CTRL_CMD_HW_RESET, tpg->base + TPG_CTRL_CMD);
-- 
2.53.0

