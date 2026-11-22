Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795324409;
	b=OAFEKsJ1Ya0BC8DeEQ0dfEswkN3/cmGd+M34xfvrt/3HJ+53AxBG4WUJhUBTuRo9AEON
	 U03GHLGR/Zm6AeqWSQpLV6yDtBFvYTGTHGMuE1xd9uz6mJ2yuC5cyhRtv+vzS6iv9S+cD
	 oS1Yig/AdZtjDbr4q1/2G/Adr423V1mxSwGwexb2GXW1UQrs3Zxpwzq2AwR4XSOsPU3xe
	 4ZXpANeqBBU6xH8H/JsoLwKsCbHIOZWnyKtRjg5d2lPEiLpX0Zwfjp8lA/j8th0psfOeU
	 Arh1+hGQ14OUrIHvUwBP+LRx/ptMDyG8gYnhBihtNQ3FZRpVAUuH+CMZZtiOFcSQa6w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795324409;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ABzajoCm5GzVHUgyMP+//rqW5DXkrevpJ0RZL1w9Xb4=;
	b=1ILazMw+44qlM/+GwiKbrEHRCzw3mWnEN+GwnX8iu4ltg8mvAF4qVvgajk8yIxUpOCH+
	 KF5FJuLY5Stk+knFQ2yLPXRpexHBAKDjNKFqahk4aP2KNJ49FS8pfwG8RUbdC6g5d8jBd
	 0I114slYNEM+rHq6j1KHRGaCDDQLPP0NiSrKQcLH+5GLBSPV1T8PDFSBG/hGAt+/Ffg/T
	 fEXcMUzgzXtWyIJPatIKtc76dHnV7rQbom+LW9+OQUp90pWZcrHavL7OE5R2TCzd8TX4T
	 doHqd2lnhCAshzW1FkC8mNvY4RJvrNeInZ+vqQweO9rXStdl7w4ArXm6Kip8JyjwBtw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IHxTHMvo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC783606A33B;
	Sun, 22 Nov 2026 05:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IHxTHMvo
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795324408;
	b=AbmIw9D4scjRRhnt0+pBr2BQ44vQ740cdLiATd1dvqS9OE1yd24szgZa570FNKXXpNjg
	 jet5jVck9iUp2WjxESDK8/TCz7uA3w+8ue2utszwTwmm/JT4O/szl73vhpEFzz6V3TRh+
	 yK4Rd2zYdLjJH/Pwf5shoZk4sTrWACWULuJXylTh1+mRz8+nSqo6Bq5ONLcNIjeTs8BU9
	 eZPNL5D/PzLWFInPr+cWgEDgk2TNw2fzhUvM7SMDLDP28EBzfMZnUvc3RgGXfmjg5G5o4
	 dA/XKkA+R2yi5eS/E1JPS84p1Zha7vCpFcMrvZjewgQGvIZPNTwYNvFXAG+CNsY0/xw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795324408;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ABzajoCm5GzVHUgyMP+//rqW5DXkrevpJ0RZL1w9Xb4=;
	b=W7hIdZy3WgqsnobwuIXiSIVLO4txKVpizTpNjhQXdDW88qRy5oyeiswcPNKOTpUvGFZ3
	 4gxGiYoz/Z+s+AiAXw+QXNJskkXUUmSi/ApsUE8edoqBQ5vIxg3OGEhHWtXdAPqoB0T0/
	 0ulbTMaiFWDs99f6BbyvTnMgTib7e2eWNmjKrfbdlRJEKCr9Xyv1kESkhxaygk14zuKsW
	 4RQ0qOaD9kXuCAGNscjCIP7H8CrZ7kXYNHlc4Ihy6cdPrFYfap5Nk/OFbZ0aWTxEVwZHG
	 n0kGkZacXz0PCF+w8UbM0mJEcYAi2ZZ0SlmnKeyZZN7rImGY0xDxqQBB83K1Jl60Ugg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1CCF01F000D0;
	Sun, 22 Nov 2026 05:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795324408;
	bh=ABzajoCm5GzVHUgyMP+//rqW5DXkrevpJ0RZL1w9Xb4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=IHxTHMvoH4T9kL79JTbZJ8Z/20nbsdrD5GBypB16MCzXGG2zVdTAgo0rsLoAWezPd
	 aUF4Sb+eJSD8O8Y8Am09nNrjsrH7QLg9Gcr7kA/pSNnktMx/9p630wTIA7fqqjE+uJ
	 v1111DjUaBaOCboptY/veUW8OSp3jJwjy9oSHU8WScVilhyjmWMFqrlcxri6JEJfxA
	 NA8JSSJrZddMIFr9njQ1OGKA5yXwnJ+/MGLIc7rr6TQMBYpmk0UFn7OwUI07DF34cV
	 EQRW0Jlevr+dxOplXDQQIC2kPlVb8hnEgtzwlivd9FKmbgAKKd6AnxJ/d5LQDnV0yK
	 20pUzKQL6yvSg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A24044BF46;
	Sun, 22 Nov 2026 05:13:27 +0000 (UTC)
From: EMCP333 via B4 Relay <devnull+emcp.enser.io@kernel.org>
Date: Sun, 22 Nov 2026 05:13:24 +0000
Subject: [PATCH 1/3] dt-bindings: media: qcom,sdm845-camss: Add
 interconnects
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
Message-Id: <20261122-b4-camss-sdm845-icc-v1-1-0671ef770fd0@enser.io>
References: <20261122-b4-camss-sdm845-icc-v1-0-0671ef770fd0@enser.io>
In-Reply-To: <20261122-b4-camss-sdm845-icc-v1-0-0671ef770fd0@enser.io>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 EMCP333 <emcp@enser.io>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795324405; l=2153;
 i=emcp@enser.io; s=ultron; h=from:subject:message-id;
 bh=LulMe8vMo++IKeIIAh8v8M3uKtAlXb13KLuNcRYJ0PQ=;
 b=v+A31bhfotuokwdDizd43svOLiboSnHvUQH/g4vvxlCFBFpkOb9zv8/7CTxMWPDod3R9TrjM6
 2oPkMrQelsaC2gnmqx1KhlVsUQPqC7WrmkHTIrYNs/MxWk0/KZtm3lm
X-Developer-Key: i=emcp@enser.io; a=ed25519;
 pk=5sG48Lul+Vn7OzXu3VZrCWk5uvEFPYMXYnAV0TZR/tY=
X-Endpoint-Received: by B4 Relay for emcp@enser.io/ultron with auth_id=1598
X-Original-From: EMCP333 <emcp@enser.io>
Reply-To: emcp@enser.io
Content-Transfer-Encoding: 7bit

From: EMCP333 <emcp@enser.io>

CAMSS on SDM845 reaches DDR through two camnoc HF ports and one SF
port, and its registers through the config NoC. Describe the four
paths, named as in the sm6150 binding, which has the same two HF ports.

They are optional, so existing device trees stay valid. The driver
votes on them where they are present.

The code and this changelog were prepared with the help of an AI coding
assistant. The submitter has reviewed both and takes responsibility for
them.

Signed-off-by: EMCP333 <emcp@enser.io>
---
 .../devicetree/bindings/media/qcom,sdm845-camss.yaml | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
index be09cf3a3b..8c87ecd406 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
@@ -76,6 +76,16 @@ properties:
       - const: vfe1
       - const: vfe_lite
 
+  interconnects:
+    maxItems: 4
+
+  interconnect-names:
+    items:
+      - const: ahb
+      - const: hf_0
+      - const: hf_1
+      - const: sf_mnoc
+
   iommus:
     maxItems: 4
 
@@ -233,6 +243,7 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/clock/qcom,camcc-sdm845.h>
     #include <dt-bindings/clock/qcom,gcc-sdm845.h>
+    #include <dt-bindings/interconnect/qcom,sdm845.h>
 
     soc {
       #address-cells = <2>;
@@ -337,6 +348,15 @@ examples:
           "vfe1",
           "vfe_lite";
 
+        interconnects = <&gladiator_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_CAMERA_CFG 0>,
+          <&mmss_noc MASTER_CAMNOC_HF0 0 &mem_noc SLAVE_EBI1 0>,
+          <&mmss_noc MASTER_CAMNOC_HF1 0 &mem_noc SLAVE_EBI1 0>,
+          <&mmss_noc MASTER_CAMNOC_SF 0 &mem_noc SLAVE_EBI1 0>;
+        interconnect-names = "ahb",
+          "hf_0",
+          "hf_1",
+          "sf_mnoc";
+
         iommus = <&apps_smmu 0x0808 0x0>,
           <&apps_smmu 0x0810 0x8>,
           <&apps_smmu 0x0c08 0x0>,

-- 
2.47.3


