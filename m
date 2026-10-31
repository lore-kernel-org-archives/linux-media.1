Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793445745;
	b=obgITXeSl8RYDyh5ZUZGRrjJkZx8a+cCzF7U6PXZvTXl4yWaGPcg/Aev+Y/4Bmnazv8N
	 YpL7lXpeldAzM5lG56bzdPwsUnRaAwAsrrvbanBtxmKIoffqVn1RhFGyl82WQNMTLnClW
	 Mae7GKgJIQ63nyxoO85NzIfgrudXKM1HukgKlE9P/xGWd/gMg9PxH/CiwMulvBhmRTWdH
	 k2C1afR/ER+Pn/CYmq0TDVCClGZtGaRw0gZqP7QdmC1qTUJW73NBpg30vugfbfh3xrkXj
	 YgnPbDTbPpS4XOE4GoEuP+pS0Oi594moQ6H1YeYkST8JWcCdL9ojk9WqHJe7CURNctQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793445745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vXKoZDKLDdWVmlXFNjXpDhryxciAWAH6YfrFxNCsiMs=;
	b=hxiKTwaOkVGwZOIQTnVzvt2ekTH0BxygDC2LNX5UIJnOE0bxREPu+TjXFoN1lAGDOfBp
	 CQlpUI1gWmPEDJgDKYZW7JBNOD8Atjr2w8RqeEhb13R37pUQaa0Hj6j8PtGcpXoX2VCl7
	 JQT3MEkv6Pa8vKIDXMSwaQYEHY7CJ48tTXQmbNNGxi1gwxXRN7PQS7kYtw8AsWenTJ641
	 XQFemA8S+DrrncJI+Sb7NNBn2q8FmNL8NWynsN3i/rjUhDO0FV/pB0Dal41cEKcid4f7h
	 ZMLj2WNe1qjwmXkg1Y8702oZBCZevgJeQKBJLkwcu/jK4Okulkx39mbyUeMO7pjCfOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AqOcTPdY;
	arc=none smtp.remote-ip=209.85.208.178
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E37606A32A
	for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 11:22:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00E37606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AqOcTPdY
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3ab3cb83f54so1924271fa.0
        for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 04:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793445743; x=1794050543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vXKoZDKLDdWVmlXFNjXpDhryxciAWAH6YfrFxNCsiMs=;
        b=AqOcTPdYZdma3eVNjAMT5wVBeHEVso2q9jo9OwECNfbZwWef4Faxk0Vs9eBR5D1J/z
         nLFPKfrbkgryICxai3SYb3R3tJBdFt9btFy258q3e0aw0epd9STu8m/LyT8ptdoXxiiD
         3Pa9vGqPRUCvRnjx6UCX/CkFNS9c5aZLV+Gh+LQArFv4BTclbED3Oojzvi5u1wkNzMoS
         9y3r0yBnaxHqSyGN4qL1dcP7m/sULP+ArmAIK6MJbRDwnFVgLD1Fu+LuSMKbEbYeZcJC
         jytEc+Y0cb2Ws6RentPhiZLKN50lAvtVWFEGmiqN+s1tYkshVYDoadV7mBnXKupwQ/bc
         nhHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793445743; x=1794050543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vXKoZDKLDdWVmlXFNjXpDhryxciAWAH6YfrFxNCsiMs=;
        b=EY7iuwYTiMsPxfw+UKKQBam6InKGA/WF2SHWdQtlZJTl01qGx2gS+6OVbkZ2QO359u
         YtYTU6dc8uysGsg9a97l+0B/eqKMbDB+Zzslr0bXVBGWKKmV10nN8zQoc4jIFy1MTD7u
         yHrjvx7Dnx45hGiBNdGhC7dRgiUXvltvImh74BhZqOOh34hG5zG9ShxRy4UA70i4tGoR
         tt39/afpqHuadaTnfcvWcyIX91mVbo5fz2OpPmC5ndnfxRUrtIeY29ikulBsiSh1ovdG
         rTWPRPmFQHHrEEL5jR0IGO0dToTxGS6MrOwxa1MpylykqpAxb4B6wXI+ZG+3zElpGTqv
         Gg8g==
X-Forwarded-Encrypted: i=1; AKwUvBzVpJcXwaWa+qKRKPtrisIyrmBTNoB49Or6Zou1ssmK5UUwlHUrhNh6rYzeXPgwCLtRGpsZ9riIT5ZnmQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYL9IEF5YMcoPsttv5a2PR2vMWxz6DCtjkroxXhW00PdQ2upIJVZ
	+TW51CuNUTwtrqIp1I1GHsLlh4BTmhKcdfO5CIHfY7A0jmzk7tsl6TBjc1V/GI9pQao=
X-Gm-Gg: AYBFou2twvk8Npl9ioNe9kxEh02ioYCUlprOBCicnEEMxg5bwHM/ziU5hiv86UkL9Vy
	tGkL+cSsPKSRaBaBcCixTdP8UTQqkm38kCMTHnL0Xc5x6IOYhmHYumM/NE6vIYw8Rf0Z76fuWDy
	88AOt7I8ZVvSJpb0JRoSWv9MZm4m5ehs4SEGGLGirQp76J7lJVSqxpCrjZsi48CObRYhMvIY287
	exyR3P4CzgF2ccXZChngkR/prKa+Xm0QwDlzYPqKC2cdqhLxDX/JTVx0EHS9QKLSTjABv2doadO
	iW/NW3OT8jkHHOu4yu6HSTNPfc37lawNX9TGeZ/JbqAf+dfAGOhCdFHq4kKXtKosEINu0TDY64z
	Ws0Kpc27nNShCVV1dSKS/UFXYlU91nVu/UiL2UaM9sCjjXB1I3yBmDTNUIwatJJ4dA6+prc6Dcl
	9Q0ry21EO1wDfyRyO8VXq6pINda3yM+Vt2qXGzD7wd8deycF5AouBEGXwnj6eiWi7m1lGHdkMAu
	RIRfM1y0UIiaQWTeJX5WZ7Fz20QNOPmYxhZhrK7EJnq0euSVK9t3ih5YJGlQKrCWvQ7Z2kpO471
	W+thxguKzNSUigF0zr7t6DIOD5x4S9sWJZ03F9iDI5SgKmAR8wag2G0mKt+eanWb2nBAFA==
X-Received: by 2002:ac2:4bd5:0:b0:5bf:e4e3:3df9 with SMTP id 2adb3069b0e04-5bfe4e342admr90635e87.2.1793445743107;
        Sat, 31 Oct 2026 04:22:23 -0700 (PDT)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe074aad9sm538469e87.75.2026.10.31.04.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 04:22:22 -0700 (PDT)
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
Subject: [PATCH 1/6] dt-bindings: media: qcom,sm8650-camss: Add test pattern generators
Date: Sat, 31 Oct 2026 13:21:58 +0200
Message-ID: <20261031112203.545319-2-vladimir.zapolskiy@linaro.org>
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

Qualcomm SM8650 CAMSS contains three test pattern generator (TPG) blocks.
Describe their register spaces and the non-real time CAMNOC AXI clock,
which is required to get TPG output frames passed to VFE.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../bindings/media/qcom,sm8650-camss.yaml     | 24 ++++++++++++++-----
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
index 9c8de722601e..50ae30cdcb82 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
@@ -17,7 +17,7 @@ properties:
     const: qcom,sm8650-camss
 
   reg:
-    maxItems: 17
+    maxItems: 20
 
   reg-names:
     items:
@@ -38,9 +38,12 @@ properties:
       - const: vfe2
       - const: vfe_lite0
       - const: vfe_lite1
+      - const: tpg0
+      - const: tpg1
+      - const: tpg2
 
   clocks:
-    maxItems: 33
+    maxItems: 34
 
   clock-names:
     items:
@@ -77,6 +80,7 @@ properties:
       - const: vfe_lite_ahb
       - const: vfe_lite_cphy_rx
       - const: vfe_lite_csid
+      - const: camnoc_nrt_axi
 
   interrupts:
     maxItems: 16
@@ -226,7 +230,10 @@ examples:
                   <0 0x0ac71000 0 0xf000>,
                   <0 0x0ac80000 0 0xf000>,
                   <0 0x0accc000 0 0x2000>,
-                  <0 0x0acd1000 0 0x2000>;
+                  <0 0x0acd1000 0 0x2000>,
+                  <0 0x0acf6000 0 0x400>,
+                  <0 0x0acf7000 0 0x400>,
+                  <0 0x0acf8000 0 0x400>;
             reg-names = "csid_wrapper",
                         "csid0",
                         "csid1",
@@ -243,7 +250,10 @@ examples:
                         "vfe1",
                         "vfe2",
                         "vfe_lite0",
-                        "vfe_lite1";
+                        "vfe_lite1",
+                        "tpg0",
+                        "tpg1",
+                        "tpg2";
             clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
                      <&camcc CAM_CC_CPAS_AHB_CLK>,
                      <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
@@ -276,7 +286,8 @@ examples:
                      <&camcc CAM_CC_IFE_LITE_CLK>,
                      <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
                      <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
-                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
+                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+                     <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>;
             clock-names = "camnoc_axi",
                           "cpas_ahb",
                           "cpas_fast_ahb",
@@ -309,7 +320,8 @@ examples:
                           "vfe_lite",
                           "vfe_lite_ahb",
                           "vfe_lite_cphy_rx",
-                          "vfe_lite_csid";
+                          "vfe_lite_csid",
+                          "camnoc_nrt_axi";
             interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
                          <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
                          <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
-- 
2.53.0

