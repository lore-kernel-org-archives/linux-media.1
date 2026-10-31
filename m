Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793445750;
	b=nU2qmDV7/B4dzgBisc733m3YVN4y3TlodAGjpUe7nYqY9iSkPV9m9P4KuszxkpBKUab6
	 BD8iuOdn7yZdwnCz6yCVexFpVse7R5GFyGwkPiMTRS+lRWQ/FXxUpbc9DdQxResFl5tX+
	 shPXlMQoQbUWdrAykYhqSjGlVKgFujrzt51oAQD8zdLRi0Nk+SBbbgLbNP5C2n7Mlpeb+
	 lzBmDqGQ6OgPvZQ8k20XlU9c3UCFJp3yVAlCK0+PiC+tTWWAm90kVo5ek+YT8w2WMDWk6
	 Mzib4W/hbr+veno/+uc55bzYfJfDYw1lug59EikG1YfcGH5tfpKacQ5WEratoshG+ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793445750;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8JBgjbAiNKzEfjsqgd6C6n3aL2nG6tu2D9Z/SOgJ6U8=;
	b=FpoFSnZAiFgwRyYBPyigTgRfe6ulkV37zCnjGo7Hk68CWO7IKC1vx4/6pHVmHTnWubZ/
	 KTsSLgD/QM44J0qnMREO6H2pNu8xPKSnUvVejhS30NFnGb7GI7d5+hMwAkyRHvspEum9t
	 MGQYH0gHP9jTNQ1CvPB2X9ZfKbDq72MaoTcC3IXu6pMF2g6qDQTjVMPYU1ef++J6MzFV2
	 q5UYTyf3EJEF37Z0hZflBdu/2/zNWtdOTuEHvdfTqMtf1tBXOUciELFxGiU6Y+ABT8dyR
	 BiLPava2K1prtSGdM6jLXxMD9v4OlBW0OGHZMg9fPH3QZWPhgt/4nc2R/Q60/OTYVBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QdjuGpm3;
	arc=none smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065D0606A337
	for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 11:22:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 065D0606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QdjuGpm3
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ab1a37faaeso2228361fa.0
        for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 04:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793445748; x=1794050548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8JBgjbAiNKzEfjsqgd6C6n3aL2nG6tu2D9Z/SOgJ6U8=;
        b=QdjuGpm3AtA2n9CkeDY/hf9+Jwq8FSHcJT+66e3eOkqgvFOTaBpTPdjI/nkVoST2wO
         EJCtdZ0b0r2ESLmAIUPNC2BbvqrkU7gbWQ6B8gvkVZQzUpMQRaY2fK4OwOvhCG9+j/ys
         MGs1OYTlHq2P7XcUVbWPfva///1Z1MA/p6+Uy5JedhF+2uXbzNVXf8FEK2WbuwuXwBFc
         y1JnNpwFjt8ngU2rkEKTHqcmk+0X6jTdQyWUu96N0XVekjYlV9/nBN55oBKrEdD1aNw0
         eCnlH9zos6U4I3D59NDa1Q55ts/6mNBPre1Eg0UILOOojVFmSaWBUsJXq2DifWfZzPvy
         ePQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793445748; x=1794050548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8JBgjbAiNKzEfjsqgd6C6n3aL2nG6tu2D9Z/SOgJ6U8=;
        b=1v8sEIJe0lDQx756sBpgz26KLrQWhVjNFS+JRvIsetfZ+6E2//OA41vyW/NT/wAE1X
         JH0MqaNfC8oTFCIuE5M5jk6Gkj4TGzrl1dTqkzAgGCeb1xgfffeLoWuy0LQoYVzZQnaX
         fQfBThyeOWb/FoxTK0erHRDlPXbCIqInI8E83uV3TPS51Idg5GFPmNj0P9H1dVL0+cFk
         y0yrf4B/o9xH/rP3vFv8g9/X8TlBGRTlRjcnQ/GnEbz2Hf2QwaVpYJHItmXwXTZV9CwF
         Y5vmKPdahe8BT1i1teL+r9xHxFGMYSUR91DKosGYLvUzhgy2GUU57fBaF7cUEWhl9B86
         Fw4A==
X-Forwarded-Encrypted: i=1; AKwUvBzWpiSwoMji6hkidrSxy0YxfPNyiU4laJ760i0mkW/qSi5beGd3vLP6wmq4AK4R2gw34Hbh2S4P3Exxmw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKQiqSTQtmC4jY0pdTBTBIa+eri9s0JvnPCwPmUkmEkiFHTG7aV
	b0yVz3bek+M5eY4O95NEhfmsqYTEFoOQql+cvXO2Q0Kp25KH4ZJn1XuVHxOmZCk5SXk=
X-Gm-Gg: AYBFou0wR8vG7q4xQJ9dLVe6sWbzRmKN8raijB4ATNHDBA1OUurTGqRnjU1cRXvtzfy
	n5I1SSeU8+f4qFWZAzWa8DhpCgSeS8+XLNPGeNKSapN3G3HNJ1OXBTCrmIWtf4zR3dKvHwwgOgH
	qJrzy+J+Ey5y4Bh+jyKeuDiUugF/WgTVE6igYxaEtu/LJDF/x5bf+mZEAbopGh9Xua0dho/p1bi
	DMJypL2/jrUgQ8oCJc7+Qsc7mhEKwyoeKb6NNXWigacQro/wjhowdpb0lvLllaoQBHx4T1jWKne
	2UxR80Gn2vtCiUWUHa/jjH3TiY3OQG95ZMfIdgYxMEBcP+laQo0+NyRcd/RtvFRDZfFo/G+8yLW
	rZ0k2LyKjQ2qgSIQ67/NEWAGDya+om7yFhAu+/7UuhYcxx8SxEUWMwAigDmMaTWmtvzYczgB0bY
	a4vWKbC1sRM4cn/0EKXzLA5rRmhXcvsxOWFhwzUA9Bgo70h6RPIJ4HBtm4mJWlZh/KfOc4CFcBp
	kYnFIFPTeKg8Bi3aDvzczwzq85zpYqiyiYrvUgVobRUpdf2BC1PueMBZ2NbrfHdpbAIilsyOGnO
	jcqtRUuHpAZ2ekXdl+LJUHdxfwApHV4yfrSsq0tr7QZt1Zg9i1pxVzXAGLQHhiEUEceMMQ==
X-Received: by 2002:a05:6512:3a8d:b0:5be:4d62:4e65 with SMTP id 2adb3069b0e04-5bfd9566ff6mr1862293e87.6.1793445748364;
        Sat, 31 Oct 2026 04:22:28 -0700 (PDT)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe074aad9sm538469e87.75.2026.10.31.04.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 04:22:28 -0700 (PDT)
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
Subject: [PATCH 6/6] arm64: dts: qcom: sm8650: Add CAMSS test pattern generators
Date: Sat, 31 Oct 2026 13:22:03 +0200
Message-ID: <20261031112203.545319-7-vladimir.zapolskiy@linaro.org>
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

Describe register spaces of three test pattern generator (TPG) blocks
found in Qualcomm SM8650 CAMSS and the non-real time CAMNOC AXI clock,
which is needed to get TPG output written to VFE.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 86fbb0fd6472..f40ba0880c90 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5463,7 +5463,10 @@ camss: isp@acb6000 {
 			      <0 0x0ac71000 0 0xf000>,
 			      <0 0x0ac80000 0 0xf000>,
 			      <0 0x0accc000 0 0x2000>,
-			      <0 0x0acd1000 0 0x2000>;
+			      <0 0x0acd1000 0 0x2000>,
+			      <0 0x0acf6000 0 0x400>,
+			      <0 0x0acf7000 0 0x400>,
+			      <0 0x0acf8000 0 0x400>;
 			reg-names = "csid_wrapper",
 				    "csid0",
 				    "csid1",
@@ -5480,7 +5483,10 @@ camss: isp@acb6000 {
 				    "vfe1",
 				    "vfe2",
 				    "vfe_lite0",
-				    "vfe_lite1";
+				    "vfe_lite1",
+				    "tpg0",
+				    "tpg1",
+				    "tpg2";
 
 			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
 				 <&camcc CAM_CC_CPAS_AHB_CLK>,
@@ -5514,7 +5520,8 @@ camss: isp@acb6000 {
 				 <&camcc CAM_CC_IFE_LITE_CLK>,
 				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
 				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
-				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
+				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>;
 			clock-names = "camnoc_axi",
 				      "cpas_ahb",
 				      "cpas_fast_ahb",
@@ -5547,7 +5554,8 @@ camss: isp@acb6000 {
 				      "vfe_lite",
 				      "vfe_lite_ahb",
 				      "vfe_lite_cphy_rx",
-				      "vfe_lite_csid";
+				      "vfe_lite_csid",
+				      "camnoc_nrt_axi";
 
 			interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING 0>,
 				     <GIC_SPI 603 IRQ_TYPE_EDGE_RISING 0>,
-- 
2.53.0

