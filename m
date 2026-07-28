Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8243741E6D9
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 09:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785231354; cv=none; b=Ws2ww2hETcSTi9qlOjjendG0YJ17jFoamyS5DsYzjxietzljhXBeOA5w1SwnqtVNa0fVHg5ZNSIsUpH06UjDcnv3Dpr0Ix2BXyM5HkiAI5gsaQic9ilDrHVy64r5VfSfihZ5yuaPLwZk1zoQMVosgT9UYSFvKBwuDX1n18WQiBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785231354; c=relaxed/simple;
	bh=5wHZsmRZJkX36FzDROcwG3gCmz+4LTBOmCoFC9DNaFs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qU/Ekn1c3xif/DuP0ruscGytWY6rBJXqguIRt0RH9JSmcGla/e178XXnP+22ilS99IiTCa+vD3uwIMSmhKHAB+FkQDfbkBH8/4GKBMtYHH+Alf+LS++j2ioIQReg3NWudPtMP5pPPFKi3nr/bi8QuHokGNGQWcbqKjV0q3cQ5OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n8PkHBGT; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n8PkHBGT"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4955158f26aso23262085e9.3
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 02:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785231349; x=1785836149; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NJSm/JnxrKE81FhHQMmn4pN/cUcvRnDeftlQtOhibp4=;
        b=n8PkHBGTcybZOz9v1m62kvkR1jzg6M7BU7Zf63FjwcJPH7G76Ya/bBGmN13mSr5I6G
         p189/GhplhMQcmGHdx7k48LLOgTfz5s55xAbpLELPkPcdjo4CyUGmpIEr8XRIC9PvsGB
         JDJw8OOmShcsGrLcccSCjfY0gBE8fk4/Yrx0H520pGlexyWWkDSGs9EIb5DF6qXktQr5
         XIaVsqx7D6QPNmb1eQwOaCCbGpUOlcd7AhUM6xuJNQ1HnHRu03Ucre1KH9cqqg+2/wc6
         gcx48K+dq8gdyYpzBYw0O5FwDfm9nEUxwDmcG3cS6QD0MRmajPGAiBxlF/NLg4I/xVHz
         gnkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785231349; x=1785836149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NJSm/JnxrKE81FhHQMmn4pN/cUcvRnDeftlQtOhibp4=;
        b=Jit2/T74/He96BVrNj4YP143kO9gH647ZcTYGQJJkO8DtA0KvN6DEj3oyGKfO0tYqM
         2wBPxRVteJ7EHsSWqW8V3CgF+a/WAft8QoWys7VFLoqvdCeLe2ZWpttuBhU62lEiGu9I
         Ryq+7TcR45WFlLXO7gjI/gTrPrX995SOGgvA4fcKPaA/sjrFQM/ts+8yWv5tkBtgH3Xr
         xb6n0fLiWwC5MnrZlS3LJy41foU24yZWI12m9uA01hyHYpnEvRMM48Bn1zEQmjrZDFl/
         k4l/HNmKIYaB7eMJBSqDXEpGoAxjl7FiiN2VE3gzUwzI2usBWON8xFpE7KdP3L6x8J0/
         06Lw==
X-Forwarded-Encrypted: i=1; AHgh+Rq50a0eccSxVbz5jP+CLop7IiKGTNQydmdBUG4OM6qylnr28p4OtauFteFp9W+puUdFLMWtFAe1kr7sag==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKcsr3kpe5pMdz7D8/KTl3NlJAfU1apAZVyLQtaD7Ky6QVQGzL
	Vbqgmu6noqGeK5DthhwfrZTkC4oJ4oIzp7YvDAMw0lNKbVeuqXwDurrDWmYhL1iDXyg=
X-Gm-Gg: AR+sD11sB4XtexKz83Myr8Pb5KqWtxgA7vC0Wbvb7fEZkhBRJCTmyQSD9azpqMLqJ9o
	h+oOm2iTTBIiKrvz6Bx/sZiK3QpfHwgtt4kCzmKnJI69Lbbl5y9VKi5bclikYdZa+03PWEMQFNS
	Adsn5jFQXD+t73w/19kW4TFeOApFtgvR/43r6MioGLpvU1L2ORkbxx65/8NQCN6grPE4IYsweCo
	gptXPUpX2UrD+X+I/Zcu3+917yO9mT0A/HuDtnM/69HVAwUtNpy9X5lATf9PDvVWVokuyx0/R8N
	fs3wIvwD//HUea7tL2xJWe5te0i4Vs/4rwOppIpyMS/oOpvf/FrJLmELh5rNkE5TFo2e6b94WpW
	VmI+s4EUwZACuAhYYZ+XaZSb1M6PIrlDfi3D3TXuy2pKeiQ9IHMM/yw6EJPO7aB8CWytIqQeDPe
	Q58b2X9ui8fkHUugBHhOdlPXM=
X-Received: by 2002:a05:600c:3103:b0:493:f278:ba2f with SMTP id 5b1f17b1804b1-496c643219amr16527625e9.9.1785231349157;
        Tue, 28 Jul 2026 02:35:49 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.204.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c4632263sm68190825e9.15.2026.07.28.02.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:35:48 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Tue, 28 Jul 2026 10:35:35 +0100
Subject: [PATCH v13 4/5] dt-bindings: media: qcom,x1e80100-camss: Describe
 iommu entries
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-4-ae811e2f0799@linaro.org>
References: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org>
In-Reply-To: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2593;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=5wHZsmRZJkX36FzDROcwG3gCmz+4LTBOmCoFC9DNaFs=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqaHftKWpv80r/kd2OEz0SwpuOlD6R3IYkWLa1/
 UqMkdNx1TuJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCamh37QAKCRAicTuzoY3I
 Ou+qD/9XJ9Kr2dtNDMp3LaXCqRgLwCUXh9WHlrVvWg0IEUWaEpC+qyd6w4rm2xFbsJXMZ0Cv7LX
 uBtcCNSqIDgb98WTUHsRlOCIKcV+N7Zc0DDczm9A0RR1ui19cgMcKZaY0dl6Tk2E3NpgZaOTXoq
 MVcpByF+yJBRETBwq7kDhVMEqOIPiszmPlrWCgT+aoLZ3980RwZVrIy4d3wu3UlzoFGtYRyjFTu
 0irxHZfSOipWleivf/17UYZ/rkdb+ekKGdaQK0XAcuTlcirOXtmhrGOSw4EsRKFZtC6J4tTJh8w
 dSh0whpXzhKJLmPtKSpq/iCL0hE5/WX912Jaap7RUjVR3AANyTVyC+Ud+MMQNxBNRLzDJq1evau
 1gpGTKQifnZs8NYzWyAjUJTF6UIT427qD2F410/GfVYAFZE4dGhiR9uOQTqHO5a6PuSpdma0H8b
 fYW1wZY/ebjcEKGRxWa6w5FH20Ftd5WTjrf8sUc0ge1LCa28Cm/4wAKA7dJ5k/qheaEtp0/ttOd
 fOlP4yBr+2PQ1IERSdxYS+Bq9K7twWG2rJ8KX3bWx6aSJLqfgDvx0BzkUZjXIqc8DiO5Ds4uEO0
 Oifi1v9Xk2RNYux1Q0KT25uOybo2KDQExNIn6XaMDN9xM0cMfGuHQN8eaeCI0OlX1vPUPvezEt+
 5ShgyElMc0/0bHA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

The original iommus list included entries for ICP and BPS/IPE S1
contexts. Only the five S1 HLOS stream IDs are required by the CAMSS
ISP hardware: IFE/IFE_LITE read and write, SFE read and write, and
CDM IFE. The remaining entries serve other hardware blocks which will
be described in their own nodes as support is added.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/qcom,x1e80100-camss.yaml        | 26 ++++++++++++++++------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 2d1662ef522b7..126400772d028 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -104,7 +104,22 @@ properties:
       - const: sf_icp_mnoc
 
   iommus:
-    maxItems: 8
+    oneOf:
+      - items:
+          - description: S1 HLOS IFE and IFE_LITE non-protected read
+          - description: S1 HLOS IFE and IFE_LITE non-protected write
+          - description: S1 HLOS SFE non-protected read
+          - description: S1 HLOS SFE non-protected write
+          - description: S1 HLOS CDM IFE non-protected
+          - description: Legacy slot 0 - do not use
+          - description: Legacy slot 1 - do not use
+          - description: Legacy slot 2 - do not use
+      - items:
+          - description: S1 HLOS IFE and IFE_LITE non-protected read
+          - description: S1 HLOS IFE and IFE_LITE non-protected write
+          - description: S1 HLOS SFE non-protected read
+          - description: S1 HLOS SFE non-protected write
+          - description: S1 HLOS CDM IFE non-protected
 
   power-domains:
     items:
@@ -332,13 +347,10 @@ examples:
                                  "sf_icp_mnoc";
 
             iommus = <&apps_smmu 0x800 0x60>,
+                     <&apps_smmu 0x820 0x60>,
+                     <&apps_smmu 0x840 0x60>,
                      <&apps_smmu 0x860 0x60>,
-                     <&apps_smmu 0x1800 0x60>,
-                     <&apps_smmu 0x1860 0x60>,
-                     <&apps_smmu 0x18e0 0x00>,
-                     <&apps_smmu 0x1980 0x20>,
-                     <&apps_smmu 0x1900 0x00>,
-                     <&apps_smmu 0x19a0 0x20>;
+                     <&apps_smmu 0x18a0 0x0>;
 
             power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
                             <&camcc CAM_CC_IFE_1_GDSC>,

-- 
2.54.0

