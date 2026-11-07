Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794013323;
	b=4PkICdYrixeEAz5JF9iJ4oykcEoh8boadvho7C9LzuTDOrFQ39OtHgsNWUXNCgTHUzFD
	 +9omhrCfhr/C3B1pOYsA+GLj9Lmyup477i1FzOlYYvBaxsLi9gQFclaokpDnm2jzB4OwM
	 e0kO4heabNgzu3hnh/SU5YEgAQEH/Tf71WnNWdbO69DJ8+T6fW+znHfgG6oHN5vDffgvN
	 pb81YUsALCpJhOgWTvaJYNBoO3o4jQHkQec8CGYkOi6NCzSIkZzWHoCrj92TEqubMTTHZ
	 HFm33VG2tm41La9x0+qetoppRmXZJJSZXbTBH8SrjRC+1CPljFW+NXX+v/CivWRqo8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794013323;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=4Xtby2iwtdM7w8huluO87CMAeIwNmFMuDoqn42+0sbY=;
	b=pOXgqKaiLfPDfQ36srqoyIoj5muGtL5xXRmLgyRmdW9JX7qJTOUyJj4QQhmg4FPtF0J3
	 KZwiYBx8Gi2gVm9Al7/aGljUT8uQ4+cK1/YrVAq74qkJb/Ms3eiUSn8oFYtbWZDiauztH
	 YlBMQllrdXbFqcoHTYIMA3ycsEeRRoRGVbWt+QHXctDmukbQSuDsHDq8x7/DYnArrBE9C
	 Z5lT19/v8QO8R8eNvNmYR8U3m3sK95zc6JwZSwQ/loYwJ4gyGXW/r918MjtRVP4FgLi1X
	 kFZcElFpiBVfpVYNGaNU5kga0mRubCjqxqGC/pxTKQ04gAaFl4UVAErbw7d0x5NAJvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=woUi0yP+;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77604606EE90
	for <linux-media@vger.kernel.org>; Sat,  7 Nov 2026 01:02:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77604606EE90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=woUi0yP+
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso2238065e9.1
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 17:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794013322; x=1794618122; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Xtby2iwtdM7w8huluO87CMAeIwNmFMuDoqn42+0sbY=;
        b=woUi0yP+YhA+krjTqBw2atOkgEf9nWG3Y98Yrt/2ObjS+4xl6Z7EBziXR98fvfDRdE
         y+aQMXYyKDZD2bDG1T4g0k+3VOFlBaPSaPOSXwnMgXvXpGo0cnJzoOBVEvqhsvWEtF1n
         P6BE7DM60WmhZt6GvgI0HoDgyzWWp3yeMTVbVRvgrYccC1VKs9588S6O0OMCzeiADCb1
         BBcxXPtJrk99g5Ct/lNNIshY8xYX/2TLhMOvC5IFmD1Sq3HTT8h1+0GhoGHJYr2FOsyL
         dazxRd93pgSCvlKLwiO+YzUJmK4Si16h8dNBlvwEjyfDZeoLSnfajMu/scFyXMs1rS1l
         Ekiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794013322; x=1794618122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Xtby2iwtdM7w8huluO87CMAeIwNmFMuDoqn42+0sbY=;
        b=0olMCC4nXMpJYksEBW8yX14jNhpOnErVRDbUfDQqcrjHW28Y1RbNoCb+r4LCumij4U
         h2mwh8+rr46xp3SWjvTSfe/1hWisS+LKxTgH5G0p2BXgQPaIg3xvZNK8My/nSJiDTlEH
         wJKHFNEBOoCh2AVPf+3Cl6+NAvYrMDksVbV3BCtJe+hxUU2e5GRU/B4OgQ15YtIyR+P2
         ccX+QGa23I9B9JJsGrpMy224RvYcUuGoNNrSGb5lvm9JDfWiim2bsXdcN7mqRvBXtCAg
         RzH2tyLYTDIu9Ogc+V6uelgh/iMq8LXFZjWomCFDJyFHnHN2qwPYKb52Ngn3Gn3OQjYl
         7xCQ==
X-Gm-Message-State: APuU4Z++D1O3jiKdoehxzKWHhiRtM44S9k/xwY/+DPw3E+d2DNHw7kUh
	fK4CJoNXCNWWhN7B42v+84ia9ep4SczeGiQ53pZ5kjvuvEjyQrvP3XK1yFeN536Jae9Stf6atLs
	FyWGQ
X-Gm-Gg: AYBFou0P8ribhNUG3OUqyR4RxnsYCETVZr5lVzMlyqLDajAPXlMzOZk4P3pzH05BeUg
	Bvz9HfM/CK9I4LCYIyzFp8oBOkjIu48TAdDuO/A7v7FgpRuh+mVB5gkNfH7uEM/FW3ODvbZYce1
	631I+HeuAILzIOBlQjuyId2gya0mKVIRPR2s2vsajr068sSatbvbbEjPuolALC7aJUuUb1KML2S
	OeWBEqVw6ZHg1VO9h7H//OJasdrzxgWdltdSqzdiS9z9NUcVCOddske/GU+yM7hwEETtQdRj4gp
	TWY1c0RC+jxoJtl/1s1C8ltaYn51ukk3xQWu309ZELZ0KoXuI3ytSWgAvwz+BWBg41Jcg7QMxy2
	OqHvdcXPvpAm3lJIncQEJxBWbjq0dOISCv5yY8qxaqR+ThWcws8SP9iJYnFaIx0MdI1gNM/ISgr
	nIYnVuXEOpd6PU934yPf/S80hF96umwr8fNsyKavMXpxgGMcwQ5rVGcqHqFLEwXZ6W3vFL+v2HR
	E/9c7d5knD4NvHOMFz9dzvjqH4vWMbeU0gcylQzPcFOS/KWHZ52vV9lHaPHdAMxG6NSVvIPqvVw
	S3jEMT4J9dPYSxqmKEkbJQ==
X-Received: by 2002:a05:600c:a104:b0:4b7:6942:39bd with SMTP id 5b1f17b1804b1-4b769423bc1mr40187265e9.26.1794013321862;
        Fri, 06 Nov 2026 17:02:01 -0800 (PST)
Received: from [127.0.0.1] ([109.77.115.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e3291531sm24526375e9.15.2026.11.06.17.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 17:02:01 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Sat, 07 Nov 2026 01:01:49 +0000
Subject: [PATCH v3 06/11] media: qcom: camss: csid-gen2: Enable RDI SOF
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
Message-Id: <20261107-v4l2-frame-sync-v3-6-e5bf7073a35d@kernel.org>
References: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
In-Reply-To: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2397; i=bod@kernel.org;
 h=from:subject:message-id; bh=zXHpn97qDAAuDWkXYIdAKJudy7uZdWNvtHMg7SVpKBw=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq7nh+Gp+vh9EWng+buQdn9NyX2osN5RB43FptE
 s8x6xyve66JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCau54fgAKCRAicTuzoY3I
 Osm3D/sFXj8UIGTzDkTA/uhNIGoBSS30rpxWP6NDKp876nleKk2SPja1SLI1l0bw5yb0+kCDFMn
 4FFt+BT7GZ5GOYxTCscLBaiix/b2hUsfJUABms5yX9svEG4pGFl7uyS5TedtbkWhE+4qijut8+j
 cz69hPrEwLuexzax5gadT+khXWokt3yZBd+w5jOtBPLpUTdXhBPDCF/nYDln+ua+0WdvMggdzCZ
 h5I+2nCoVg/aUcTzTwhjxaTRZd4+wHZn3xC8c8IP1farTVHegcjOsB9wJyTnBcXP4EY8apuBDqQ
 webYWONamWqr7mvuqYemhjQZS1X/fM97YuisTMjZugsaVUfKWxKRLPusK8WyRd+oiwtNQjV+9rD
 bp6pDD9Ifai4KDz79SwyOh84qfulL+fC5a0Caq2h2updKcNllS+gDaRPU8tMPE9qCFOFGIxazBT
 KJS6krcPBRorY3xS4K7JOknCQApHjUkooM2iN9lmdRWDnPDU7NscS1a9jaA02tYL1Lch89NjF/C
 NUoSTqy0qRVRUIhnVUVq93mF2XX35NYvdsOkIXT7IHQuC4RMHwgY+IkuMbRtCl1tX88OGkoHbOz
 iUlCv0xiURMwD6z7LUnaa88QEG5jpuNijomApkwIdRX7fZOGTw2AuVKQzFuRityhUivv6B5BgdK
 3WRk4iplzEQGhOQ==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Add silicon specific changes to get SOF triggering V4L2_EVENT_FRAME_SYNC
'gen2' CSID. Covers SDM845, SDM670, SM6150, SM6350, SC7280, SC8280XP,
SM8250.

Tested thoroughly on sm8250 only for now. An additional patch is required
in camss.c to enable this functionality on a per-SoC basis.

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # sm8250
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss-csid-gen2.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index eadcb2f7e3aaa..a351ac4b91728 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -38,6 +38,8 @@
 #define CSID_CSI2_RDIN_IRQ_SET(rdi)		((csid_is_lite(csid) ? 0x3C : 0x4C) \
 						 + 0x10 * (rdi))
 
+#define		RDIN_IRQ_INFO_INPUT_SOF		BIT(12)
+
 #define CSID_TOP_IRQ_STATUS	0x70
 #define		TOP_IRQ_STATUS_RESET_DONE 0
 #define CSID_TOP_IRQ_MASK	0x74
@@ -322,6 +324,16 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	writel_relaxed(val, csid->base + CSID_RDI_CFG0(port));
 }
 
+static void __csid_configure_rdi_irq(struct csid_device *csid, u8 enable, u8 rdi)
+{
+	u32 val = 0;
+
+	if (enable)
+		val = RDIN_IRQ_INFO_INPUT_SOF;
+
+	writel_relaxed(val, csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
+}
+
 static void csid_configure_stream(struct csid_device *csid, u8 enable)
 {
 	struct csid_testgen_config *tg = &csid->testgen;
@@ -335,6 +347,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 
 			__csid_configure_rdi_stream(csid, enable, i, 0);
 			__csid_configure_rx(csid, &csid->phy, 0);
+			__csid_configure_rdi_irq(csid, enable, i);
 			__csid_ctrl_rdi(csid, enable, i);
 		}
 }
@@ -373,6 +386,8 @@ static irqreturn_t csid_isr(int irq, void *dev)
 		if (csid->phy.en_vc & BIT(i)) {
 			val = readl_relaxed(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
 			writel_relaxed(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
+			if (val & RDIN_IRQ_INFO_INPUT_SOF)
+				csid_sof_event(csid, i);
 		}
 
 	val = 1 << IRQ_CMD_CLEAR;

-- 
2.56.0

