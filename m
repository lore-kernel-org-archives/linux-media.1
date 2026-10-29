Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267739;
	b=F9593kYqkg0a7R3T1/5dSo4QFpSnmst7OAWPM0VibQPgMMoV3UkCE2vBnpnsbbrwP+kz
	 x7JoC7TzKd9EJEJsoQ4naAgZ/zfWmBEwNTeZcMlwjLqDGL+9Iqd6jEO3q8G9Erb8TpM9+
	 DMVRH5dsygJgcfcBXDGpZ1/ewtSrsMQgJMdECt+g4AxGF4bUbbreoAlXltK5k6hVAdjGp
	 MLysKNrNaYfgZGlU5uf+sHeKbrsIJeqFnSZ5X7WzDO4BtgHJ/Gv9FAtjDDEkTGuWr0++Y
	 1JQ7bodnyiUUITBg9W/CgjIosufI7sb8PZHjdQ2JegX1GYMeaddcABIo45ie87iEcDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=0CCqQOpJ0Fw5aJTyhWOhah978CPl64JySHMQmrcB/Fk=;
	b=qdgs3MazRMEXVTEwXaK7eIftCyUf6mK1qUTikC0I3dFgifdrv16dcwMsVyEmPdf3P3aT
	 NXhlu+ZVTT3GTrKrraYdlN6hvEn/YVZgC62Mt/fZ7HcJuspqckf6thXTolFhMcT9Uwsw0
	 xVZDfyjkAKjZJU4+K/FzpE5g297bhG4+94z0gAcoP95qvFGTSq0bHEDzCTPBDw2J2EHwS
	 omMYsWbdQr+Zzgl7Li8cbslCxAnPYnNyid1n4Dc8nizu6Yxo3oKLaoU30NF0pVZVmOac3
	 R5QRTmWtwYgervMz14Ug2UkgRdD/MzLAUe0pRpnGeEi2yfWGfsdYstxwPGfBWkpEB0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oEQYQoi6;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDD160A5BD4
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 09:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDDD160A5BD4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oEQYQoi6
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48c45111bebso879132f8f.0
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 02:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793267737; x=1793872537; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0CCqQOpJ0Fw5aJTyhWOhah978CPl64JySHMQmrcB/Fk=;
        b=oEQYQoi6O5OkmaVCImNttcNnUdvVKpb0O7KkvNejGJ+I/Fu4G5NZNmSQ5M7D0bbXHs
         LlXR9gm4qKWXqFAEg0pocyGjYF9o2EYKHvVNlycPS4yDoUynvYGr4k6UgrKZkVQp8QYI
         rTKHenqSu8uu/AJtE7gE5H+c8BCc1jG8pdGHKBfgCz3oWu+ADAtFpWadj7JlH5MUs+j+
         wiLDr2hi+sS041vH7Uz859v2xpYlu4Fa16AppE731ja+Go6IuRIe1rPF1Uc050QDseu/
         cLDxGnzojwXgsQTW8yR4PqOGHWaD4gilAhruMcu8mztXfgVHyk4h849p/ReKvM6R/aOD
         Keug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793267737; x=1793872537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0CCqQOpJ0Fw5aJTyhWOhah978CPl64JySHMQmrcB/Fk=;
        b=kVSCwldhQbg9u0PpExontWdyBHXeUwExn9FVG9PDx2+jSqq4ZJtOtPUm3zrBTU9wxZ
         53QLDezzZpa8EGa4YmWEcDs2V92h9drfPgxp5pCtXMecGvQS/A/9S4ylsP/YIAPXSXv5
         8L3anVBNZms5MI324buFzP/HImSfER1PcWn3t+Xl5oiX2sNmEzKUSFUArkvhBz3kwAZa
         ktpAnzPEhq/UA8USnTRWUoyaOFyZ557oU2Txu2DS1xu/mDWUt6oAnHEIICEV8XFHLqVz
         YlOwnA5U1DJQLKHvqz4OuE+ux+usrWE8mFa53yUnwoJBj3v32IiiZAm9B+zBXatN2gWW
         MHkQ==
X-Gm-Message-State: AFq9FYJuUJy9mRL4xWqTHqFrJyNWE4RQNEmEtAAvTx0+9uyoHji43MON
	qHoDgmOUvgE2PTXFigyvmH9CFCBFEgbviiuLOmBv9aqgzugrzXOjxkKiX/v9Z0EM7O8=
X-Gm-Gg: AYBFou1o8HNPs4jTPMQj4VUuwDAA2DcE+VLmbn9g7mVoMqxVFkxccIGI4AGPRAAHBGf
	8Yce7fIVA+lCQGDSVKRJm7f3TMn0vKHzo3ViBWRxe/dwplIrLwcv6kKdpYpH9eOWMoHxSC+wv9h
	Eei4tek1vUVsNjSjPKdpM4v40z0XQp5r7VBGcfPyXwV9wy+q0Il+PiYPHVYmRFP9SRjVmjaylkt
	IVOQruWGIPjgat0TkWXonqONAx7glx5sYTHFYsfGP1egxpNbl64UEp7Fq0fTmUCx9S4hmgvH/j7
	/sjrC0Zu1ko85DAjanx6zXwqHizn5F9gQHx3Aml6TmaVH70z0dXMgNGzlghjRTDWJ7/em0Bgn3l
	cWB5oJFHIB6hcGBLtqVf4hTTuSFDbgrwrlH04Ye6gHmQIFn3TzIP4HgyL1AyzbEfrUVD4xOefLH
	nKcC4Co7h4Nxo3Ndr/1Fh2U8UxVu7TbQlxH6Lp/AsWqGki6hJsP8/YFPyZZvzE6ujjoO8rBz9JM
	vOmG+UGuDtM1F/UgpnKIZDxiNt7vklL69o9B9XkGfW4qt1o4dBOfHTId7vPrjbTH2zDTtpgrkk0
	oiXUnArU02UGCgQLpuE=
X-Received: by 2002:a05:6000:2c08:b0:48d:bafc:a409 with SMTP id ffacd0b85a97d-48e5d2f07femr11643816f8f.26.1793267737081;
        Thu, 29 Oct 2026 02:55:37 -0700 (PDT)
Received: from [127.0.0.1] ([64.43.45.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd37f4sm40437160f8f.44.2026.10.29.02.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:55:36 -0700 (PDT)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Thu, 29 Oct 2026 09:55:19 +0000
Subject: [PATCH 10/14] media: qcom: camss: csid-gen2: Enable RDI EOF
 tracking
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-v4l2-frame-sync-v1-10-d37992559c58@kernel.org>
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
In-Reply-To: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1399; i=bod@kernel.org;
 h=from:subject:message-id; bh=r3fC5w8imskVkr9dtc563HKXDPLCXa7nuklJaaLzUsU=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq4xgN/CQhAZC2zGVuf79kAiEOlROA2O29IaYdX
 +Uz6AaWj4mJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCauMYDQAKCRAicTuzoY3I
 OiibD/93UUs7BiNVc62lHKHfrHTWjqeNTuytUGxRwyB12d61SfMssCzrFjbWCl7sZup6b7NNa6L
 rwslL2n3zAnacn6iiEMXp3nTQPhhMz8RLlNtG3uz3aM1ITjLp+bctsYWqoLkGo03VfHpJzpIWTb
 AOOBn3gb9F+b489dz8NZ1mAau/Ark+ru5i73k5nKJqtwDpag1HKTCKzNC2NaMW+Jbj0kIUSxLce
 KX9j8Vq5YQgIAWo8Cvbe5PF7HlZ/9fhKLR7Cn5jOL41ndzcPZiWf2iJhylSWs0cXldMyoBhjFXF
 2d3VwOInug2JP3GTYxtX4IQA4CACRtqHNbjMeCOzsLvVXQ+u4sv5KYs9Tiwv15hYpciNVoIyetV
 LzFIMZlpK90yYl+5VWooufOIkSsU9mgfTstw9jprJcevKnjZSV7Vzk3099SbARPWCzIC6VDG2Hr
 3G8v22fPq4bsjuQCaJE0v+BJhXoIvKfinsw3vK4e0U4nK/orvY8Q6lpwIck2IUSIMXi1rUI90Rj
 R5bHMfUsOYIsrUCQunt/96L3S/v4/ub5gUvZ5K63/6VXCBUrjGQyJ7M6iT9tiZkdrbYpILqMcWS
 lRaTzT75RJkFdLqqap6owSmFrUEVRYMcU1bTen6gTXu84zWCqnUJh5Cnua91krDGodncnclxsPI
 qebnZVIn63N+7xA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Enable the EOF interrupt and notify csid_eof_event() to drive the
vb.sequence.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-gen2.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index a351ac4b91728..44f437c3f1ace 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -39,6 +39,7 @@
 						 + 0x10 * (rdi))
 
 #define		RDIN_IRQ_INFO_INPUT_SOF		BIT(12)
+#define		RDIN_IRQ_INFO_INPUT_EOF		BIT(9)
 
 #define CSID_TOP_IRQ_STATUS	0x70
 #define		TOP_IRQ_STATUS_RESET_DONE 0
@@ -329,7 +330,7 @@ static void __csid_configure_rdi_irq(struct csid_device *csid, u8 enable, u8 rdi
 	u32 val = 0;
 
 	if (enable)
-		val = RDIN_IRQ_INFO_INPUT_SOF;
+		val = RDIN_IRQ_INFO_INPUT_SOF | RDIN_IRQ_INFO_INPUT_EOF;
 
 	writel_relaxed(val, csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
 }
@@ -388,6 +389,9 @@ static irqreturn_t csid_isr(int irq, void *dev)
 			writel_relaxed(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
 			if (val & RDIN_IRQ_INFO_INPUT_SOF)
 				csid_sof_event(csid, i);
+
+			if (val & RDIN_IRQ_INFO_INPUT_EOF)
+				csid_eof_event(csid, i);
 		}
 
 	val = 1 << IRQ_CMD_CLEAR;

-- 
2.56.0

