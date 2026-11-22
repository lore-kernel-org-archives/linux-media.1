Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795313457;
	b=Zxl2k0nmVyvR2Ap7R03rM3QLC8ASSHS6yfnKweTsFjdGf3IicLfWaz2dg1/0ZO3/YRuf
	 hLfnuYyRj1IeRfxYeHfypxH2wH2rM3jeWFxwLlRtw+W27PLU/sBCR+rEm2Nf+fkWPYKw6
	 UCX0ePZWPoew5YUvSAPUk0ZDWiZrACqpyv9qS0gHE3PfBfPcUijD7tOmQJOqQAPy6jr1v
	 D3OtPy/T16IZjG5Y28wcQ0WrEtM4e070OPOlUwjM3+IelrtAZGDe/uWR4MJZ/SKFSQU9D
	 PUxm9vTFmxBZGOckClPYXK0Y/Ohn9Ym5UEjesqptHzJaR60+an2WOnRLox8rDwsMvjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795313457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=lKpylqXu9Uw52OCo1aOFe+RE5mVfsZxA83eEzOJV0H4=;
	b=WWTVJvalMG6N1w81kIYCDHxubc1s97us0DcfT6160Xq7plxxY5O59ZfxSg8Y4MDey1qv
	 aclgkd//jR9VXnJjWGtVUJIv0gG6veOIwv71TMGX4c+10nwQ19nU9QoeUEMSojdbqENpq
	 ZpAelvgNADVI0TEZO6RwOPFG1NukYVUg1DHfMJyr7N4/wE+0GKMTF73HfL3TqIOEBrFMk
	 x3aWiaIfsQ+I+edZtkpl0SPyW9a2XveurXWzAAgiSaMbqLEQyGRsWOCKFl/0Ik0u3RVCG
	 kOXaF5FOBI8udpb7dbgwUnxUjFNeDQP+h5Dl5sBxNZhUJUZ1fFAqbMnWoD+bn9XJ3Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XToMcOLF;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B98606A682
	for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 02:10:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02B98606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XToMcOLF
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4a5024b3c28so1952718f8f.0
        for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 18:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795313455; x=1795918255; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lKpylqXu9Uw52OCo1aOFe+RE5mVfsZxA83eEzOJV0H4=;
        b=XToMcOLFOH728bCI6bsvUC8u23sqcwRPfaiXYmbrdWxa1JM8wR7NfO08U2GH/tXpJc
         K5hXKSxqwSGVw58ymqxjAjM+Dg5srkwmznHewK+nu7Lqk7tTcQggW4Rc8cQwSBNuwjZR
         y8OwBrM2QnITs7IrlsmMNNHJDhARmIpZdsEQk/FKml4ibj3RRVhIiVDoq6ST1soTCOkk
         4tTBvEv7Pzt5IuVV7m9QDfIvTuV+UaEIsFNSBwgxQuX230zcwNfSn/RIhc+EXLn0rto/
         rJhHrWR71vJz50aPlKiS2HyPkDLGtLSl9p37xyfZzctnsNedI+4Hr4OiWAI/kVb+OcMU
         p8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795313455; x=1795918255;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lKpylqXu9Uw52OCo1aOFe+RE5mVfsZxA83eEzOJV0H4=;
        b=LipDqu2dMuz38PFl1bcqKu2w9VZwJtB9L81aMxutRkDo5rsYnd5M/ilMS2D2qyjHNe
         zYoagmmYUgZCneBEeo7AFhYsCApkxxgMK9MRJYCR0AFNJYKolVEpC1nwW3VY6sz1jzPx
         R77DtIG9IcWVU5mHQGefWSMYM8XUGar51kcH4B0t+O3Z5rZaTqMGhfxIvT/OsPe8HJcf
         /b+jg7BCanKJVjAb5OWaycBt3knqHGDhFHm8XXHLkJ+Rv8qVIvJrbMpnTI+a60baN6R3
         oaam9nYwD87rRgIRNBE0w13t3cx7RAx5uwIy6G8hFf4Tujf9ZdwTas94j8JXSwAWUsn1
         ZEHg==
X-Gm-Message-State: APuU4Z9HvUtCIRHykqeSNOBiK+fx88dg0JVnq3+sKDFRmurw2Xn3xuzU
	3WXROI/qNnjGadzPXkl3OPX33l5nQs+ahPnEu0yOACIRTOPu9uqWrnZrYsozELMAFFo=
X-Gm-Gg: AZFdTZeT0c89rJB8O7D74msyMrWozjWYnMYG6hlL3b62o+PR49dVeB2ZxmlgNq7YSdR
	qV4FWf6cve5m2BqhQtNmzW3UuHp2yG2XVsyJbVsHATsZChy2rON0RfZhQlau7B19Ab7STqSWUnc
	R8DinWcxRTcso9aRnLApNaYBkQIsZi16Te5O/iOVS7GSLEcr8wUYf1EYJDLT0LZxk1tTka1oMb6
	x3UD38Y0wJSFHtxBA85s2jxI/NfuLXStFLz6NEOpQ+r5NVXaO7gY4CyPagVdl/+8Pcqo1wflarO
	UxVe7XHgbfRni0zXjPUJKf9hTpk9DX3beRmoJ8EDh16TwtqB04ofWq5jSloXgJBpl6Oz5DOz9+u
	NM0JwdiPJgpRhLQFJp1jhLglN+E1nFkcTcriejv9/HDoLH/cB+6ROQYTuVcyp6Q7k7AXtRZ756p
	ykXM/L5296YceMtsVaD1eYwhvKCka1lmwkx2Vquntt8BTe+v8VXeehBWjErH0DuPixi7SZoGiPV
	x2Bi9Vb/x7tdR1I0lGK1kCF5fFzdYO4dHoSSFU6a+Rs6rlCucLdLj3k9g11NG3tH1WcudJg3StO
	rBcQqpi1LLBMalqmy7ek
X-Received: by 2002:a05:6000:4012:b0:4a8:f1a5:efb3 with SMTP id ffacd0b85a97d-4aa550796b2mr20839619f8f.11.1795313455355;
        Sat, 21 Nov 2026 18:10:55 -0800 (PST)
Received: from [127.0.0.1] ([109.76.78.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm14822085f8f.2.2026.11.21.18.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 18:10:54 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Sun, 22 Nov 2026 02:10:48 +0000
Subject: [PATCH 1/3] media: qcom: camss: x1e80100: Fix CSID2 routing to
 nowhere
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
Message-Id: <20261122-camss-routing-fixes-v1-1-0deeeaca2622@kernel.org>
References: <20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org>
In-Reply-To: <20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1635; i=bod@kernel.org;
 h=from:subject:message-id; bh=92IHekfTyjvBbs8tT8DKzGarLMgWEdLE770DO+618EA=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBrAk8q0bMyIBH26m3izyE+H7P0FtGu9HCkK61dB
 OOYKhXUzSaJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCawJPKgAKCRAicTuzoY3I
 Ok9CD/4iKkZnRVSqZAY0XVdyEfKn6tvIN1E/c2yJvgWSMbkO7ZVdSVXXq8trUTgXvUYAceFMYEb
 EjVI5F/fP/uJEGmXFphVfV8RIxqbvwSVyW/C+3o+o/iF1LbVfpHPhloTY57T8ZoBFkNBbqU4+6i
 0HjXKZEC+5LIzQfX5yfpH1hCpI2/HI0ghX8GCCzYAqEvtCot1SOPAMKcRFAfZR+8ihSE0toilHD
 jc+gOaFTLarjP6pM9HkhEXXSmwXcw/Uetzlu+wHFJTiACXhHWrKHu7Wnbn0sm/XShwhS8yyprTv
 e0OuA8Qbi2aGnKyAH+JJTV4D+X913PWbS+aolF5myG3aeiteSv2z7Vjz28IQkidcc1Gn6cDaQzX
 8u+YQ9hafaoStVQzzvvooo+MWi31jeNsJCXUEv7JJjOKVyEMVItsBlLn7O8+NnTKI9j/KJdTpI7
 6vkPA0Oy441yHS+9IMxQbVNayOj65QJ2zA7BaQH6oN5crnV1+VG05sGtIiLkJT/j1mAGIla8y9g
 L+PbENIHVq1lox4BAP2iB50N0GQ8o0mxxhObS6ulvrkpeJDW2O4Vx+9wFmigOJNllk01PIrl7c5
 rKp9MDXv0GjTgueGCGwoxzVwiFHlEYhTRPEOdV62z5LfApXxwUa7qx8aafYibGrZddKlgNss3BC
 oSd9IiXjopuZ2qg==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

CSID2 doesn't actually have a corresponding VFE it can receive CSIPHY input
and raise an interrupt but it can't drive any VFE write-master. This is
basically useless and not worth coding around in the upstream driver. If we
find a real use for this we can turn this back on. In the meantime drop the
definition, it only confuses things.

Fixes: 1830cf0f56c3 ("media: qcom: camss: Add x1e80100 specific support")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 26e3f2aa3ef24..aa6d01d8fcb2a 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4515,27 +4515,6 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 			.formats = &csid_formats_gen2
 		},
 	},
-	/* CSID2 */
-	{
-		.regulators = {},
-		.clock = { "gcc_axi_hf", "gcc_axi_sf", "cpas_ahb",
-			   "cpas_fast_ahb", "csid", "csid_csiphy_rx" },
-		.clock_rate = { { 0 },
-				{ 0 },
-				{ 64000000, 80000000 },
-				{ 80000000,  100000000, 200000000,
-				  300000000, 400000000 },
-				{ 300000000, 400000000, 480000000 },
-				{ 300000000, 400000000, 480000000 }, },
-		.reg = { "csid2" },
-		.interrupt = { "csid2" },
-		.csid = {
-			.frame_sync_en = true,
-			.hw_ops = &csid_ops_680,
-			.parent_dev_ops = &vfe_parent_dev_ops,
-			.formats = &csid_formats_gen2
-		},
-	},
 	/* CSID_LITE0 */
 	{
 		.regulators = {},

-- 
2.56.0

