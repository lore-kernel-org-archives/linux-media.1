Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795752946;
	b=eZdX6DHaPbbXy4UsI3oA3XLqMtRIQZ3Xkw4LyNEi8F1vBeMV0sj8t/30ZIbEnRhi2Ewb
	 u4kdGLpQh1P7GclySI1Ih06S5AI1EmHA7REJYQ/yF16Wn8gAcLw11TQ0gSXeCBCIm5kcJ
	 IkRIsZLNEACoxDVC381VnK1FJHYSPnXqgLzUfxAQH0iLnFP9kh3LUCmwF12pBw57tL/pq
	 /sXgJ6siA87RTPaTy1HKR5kJOLBxPa35lME0uAVJ6GjG1m03f5rAzkq2rSZ1j0onKAe2e
	 eCxiY3cDTK1h9i1WetJVjAtGgGQr6zHD7bZfrSn7Wpwi5sISZHxa/R2XcDcEI6LsjWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795752946;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=vU4WXd1242fratlMxOP9LX0Y+fpiNIU1fLb8H+x9r9Y=;
	b=qYCJujwiuhY0U88RmEdpskot04s8iWMH+sZpY2kGqaSt3n74KVPR3AqpmrYib9mf8RKG
	 TkGZz6/JzyBspgc6Pe256sdmcXZjnSO9lBJbsbv3kJVMstoVup38IKrlXNahLZcjK6Bwd
	 A/MoFUF/oeflijs2TK7ffh15QVjIlF175lX2xgGojiF16UtPwcnltZu5UM3mmTeUQH/N3
	 JjVdvAHqM4oKdUxE26GOoLkTiSN15QFuc2y/WdrzNuALqfRwkhiCAAnzzFRIWN9XkK42A
	 mhMz1AStQ/T1N4OnONuOf3XBrPhywRaWo8uSL6hx942STWAH/kJxu3X4PhMPYmfnq7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zB6eC3Ya;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EC7606A33C
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 04:15:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58EC7606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zB6eC3Ya
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb9d8e8e90so47694285e9.3
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 20:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795752945; x=1796357745; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vU4WXd1242fratlMxOP9LX0Y+fpiNIU1fLb8H+x9r9Y=;
        b=zB6eC3YagXHocn+XsSBZH7eMHxV2MEu5BtR6+XSndywssf/GBfU5UhcLmIKecRWxm3
         SWamGWsSru5lHMfPJE4zoGbolDBB+tV3cVEwWASKmms1iuGDLQF+x5UDO/mknvMOvmXe
         O1xHc2NKZMnbs14UIMraaBzamo1bLWBNRotNngnULS+FJwVNChBMGH+SEu8Eln5O1bml
         Js0TxU7kRS2pe0S0V/OY6euD6X2MnlLhST/DxLs//y5QgzjhEUYooqiZCiLL4/4TqMvo
         sSLlTdULClt8vUXb+XmId7TWTGl3/qAMNC4ZOlxBVDJyellGy/aVv0kz99IxoeqdFSOe
         yiqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795752945; x=1796357745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vU4WXd1242fratlMxOP9LX0Y+fpiNIU1fLb8H+x9r9Y=;
        b=WataeO1uj8e96vJGk+RzYNw63r7+BuydjPWTtafE98Bwc1ieyQbdYTtvQU5b0munB2
         IOyQVxtdCm/tmtDemMm993MYAS1FTOuFbCYhP5mDHOetMQI6uIMIgijj90wSXimDs5ZA
         Q/VVOdnnPVAzRpnhixZlSftqhiNTJOslQfK6JUWP2Sj2irtRF8huasy44o761iXAM9FW
         aA3DUWnfJnx/z+F+Jei/5xuXM8A2TYOl+/LqEr8J8KW1gVm/Gu8E8g8Dx7A6FVDYKrrf
         Pc3plYtu9R+iPDYrQn/Kwzmq8qa7OnVxp1E8d+WLuxaNdVqwllZnVBmn2v3Xi6xuOn5H
         1d2A==
X-Gm-Message-State: APuU4Z/wIa4uqpf8rhzaPf1D59nPbdZju1/CrNCtamq8hf8BXgFbFWkI
	IKvrzOoZ116jk5ui8nrrr+GxZC6/xkMi3MXTz70XEn7fLu9Z9bAoxrm72AY9RDd8uBE=
X-Gm-Gg: AZFdTZeZ38uAl5ziORLckpf+BcfW6/uEyRDhEy4dDd+cR315YVGr+tzwUXStl/HH1J1
	Tzi9dr+8bBJZJOVvCetHy2NsWJQPb75Ib46IEp7LqpIhDCNEN8A2jhPKGBK/Jm4sGKkE59ZSWkQ
	F26pDxGIbs51OdF7Q6/TqA9zIk6NBrHNknbvICS5C/ysRLOnnRBv7Y6khIqWu9Fp2nYuRQwbcEO
	lmRnsYw5s6H6PRAIlLEkxpA0BENb4ffej6XN2QYN2cCtKV8yXVh/bSZHeYqzB99pQMTg/Gy8GaQ
	5z3UCr9JNzFpAYwDlxdObfSJlVab9g8q+Ni6p5Lnq5K6+sqpTyqMsyrRDdTc8gqzVPY8Un+DHzu
	BIq5Sva/3ed0xX3Dm9tOAnKr30suPLBtZSQQsLAcLsUjOXwSrgu/qhTbI6V1s8oryICd1wok9AU
	MamqcY4K+p/SQgfDGERTv7v5WL25JXJtRO1qn5RNyjiZNGlTAczjlGPdrHDhHciS2yZNaWLNW63
	EKWqK9iFi+dObdwv3ymor+RG6WQnH4UG2FkL4qfoW+llNWGNSGIgDtqZWo2DyYmKmkdAwArZ1rL
	cpwvQlH6Y1J2pzXHmR0=
X-Received: by 2002:a05:600c:638f:b0:4aa:2339:a375 with SMTP id 5b1f17b1804b1-4bb8880607cmr431259115e9.13.1795752944755;
        Thu, 26 Nov 2026 20:15:44 -0800 (PST)
Received: from [127.0.0.1] ([109.79.27.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442995sm686987465e9.2.2026.11.26.20.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:15:44 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Fri, 27 Nov 2026 04:15:32 +0000
Subject: [PATCH v2 3/3] media: qcom: camss: x1e80100: Fix CSID2 routing to
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
Message-Id: <20261127-camss-routing-fixes-v2-3-b7152f0af49a@kernel.org>
References: <20261127-camss-routing-fixes-v2-0-b7152f0af49a@kernel.org>
In-Reply-To: <20261127-camss-routing-fixes-v2-0-b7152f0af49a@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>, 
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1847; i=bod@kernel.org;
 h=from:subject:message-id; bh=jUjgq8L2jsVn7bHs6QQ0lJ9CXtV68QwT4B5NJ6rERdw=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBrCQPp0rzo2ASWG9yYggxffLSBFnl1HhrQXUrMc
 kfUizBlNC6JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCawkD6QAKCRAicTuzoY3I
 OtmJEACOpqIwgOqxSoOE/8kP6hPgRSGZuJ9y0ud9Z5HLs833JvdKvr3jY/CeoVtsERRUIyx9V7X
 t81iaaOy4vd8+ScdLqv41Bclxx/k3ETiyGvGBuAQOjb61IMPkRbRaUPzx2MkHI622dFobaoDKXN
 raFZen6ZvVaraZ10dGagmwlGOIYKjhV+MUvS2v4cUQKPHCxxTS2qiVFQPC/zBvtB+6n//sd7/L0
 j0NXIPe10fQaQYhwFg7SlI0V4K5Z/HGqJ3wjOtSKNF0ZEYCR76+0n5vUGktIdHwnnQWsuD5DsTk
 GBc/43sBM/vaADtNe/5Fh5IVRMciX0Fpv8HwEQ7fggxOJTaSO6DnUKMeq1jY4sgpSqAJVUtVbFq
 GgsMd/S1osiXNMEesqv61KQDkInIBhr8VuxuHb7S/RgMBEel8EaazYaC0zu6KELybmoFxFoI5fn
 1heTOCgszLt6s5+q/UtKxIKwmVr3GvjdtAp6AMVdaz+Qx0YX2FjQIBV/CaQv96q/btEQwGNHGYb
 3DXMw/3fTfPSYqfAKImCtkiqIjR6oh4rSnxjmN2aUZK+zu0AGishCirtLTAkClNsjzcq3ehvhVH
 Yb9l/8uPC3kxAPlyHhqsrWp13l/Jf11w86+NMXgFWIzEXHdeGn8lFZ720Bo34JcrlRLk6aK84hX
 4dlvtDl4E2aKABA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

CSID2 doesn't actually have a corresponding VFE it can receive CSIPHY input
and raise an interrupt but it can't drive any VFE write-master. This is
basically useless and not worth coding around in the upstream driver. If we
find a real use for this we can turn this back on. In the meantime drop the
definition, it only confuses things.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Link: https://patch.msgid.link/20261122-camss-routing-fixes-v1-1-0deeeaca2622@kernel.org
Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss.c | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 0a0af184bc9db..86bb1df811ea0 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4686,28 +4686,6 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
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
-			.id = 2,
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
2.56.1

