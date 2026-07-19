Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5D52727F3
	for <linux-media@vger.kernel.org>; Sun, 19 Jul 2026 13:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784468870; cv=none; b=lEJSCXGwQ0WpVwBHXCss9xI+eq8P5ofseAXC5Ne/PfwkRqD1MwVVfga05z+haeoyXthbUoiM5CxKfKs8SuxKcUnx3Od9wbRUctBTirB6rCpBUHMxmihWNjOK8E/RTERDqjnrmV1o7dmX/rcag+XIGZRjerSEopL6+06N5VD2jIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784468870; c=relaxed/simple;
	bh=AC1MUPJeho28pBdVYrHItIRHxia1fJXAF7Xy5HQMoms=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LGkvd3Tm/oEGDcEg4AG+BzT24wxxjLp+ZfHf68JNqN/9cjJBb8ymzaS6moPbEO2+Pw7RTxvxxJqVQvLJTBwqrrqnOyypItvg+3uiK0zj159MVB9Pc0I08xmVXK09Sh7RdbnZu4EpW64lcOyTyJJbNMCcZoCGj5EJJWB4y833hfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mGgAum+n; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mGgAum+n"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso6120292f8f.3
        for <linux-media@vger.kernel.org>; Sun, 19 Jul 2026 06:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784468866; x=1785073666; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4XnV+FykkybVqG+qJ/ggN1ABFG87UERnEoUc/FfnJBw=;
        b=mGgAum+nijmAjUbNnUbqDpSChCWusmIM4QSEZioO58O4EA69VXxFZhKwVrr/Ralz54
         g6LSnLPsMuzLMu2cDAA16jqX0nRJ+lklaj4A9VYica4zADpL260AbGic7xeOiKpl09Gh
         pU4MQethWodTV9gvZ1FvznB3VRAEpKAJDcpEVYAueomNXaWGaY1Rt5Nf2CQOjJ6fgI4m
         ByyqwLN0vja2H6I0gw7fEA4bnVLmpbM5d8WuSna0UgD1ZNC/gPjluMXT69Ar55K+aQHj
         V20xUkieEXKmRDVg97LTcUec+ATrImxyU3yhjiHek2kYeN0Fyq+gg/GZHtyOWnI1c8VI
         RWqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784468866; x=1785073666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4XnV+FykkybVqG+qJ/ggN1ABFG87UERnEoUc/FfnJBw=;
        b=mY/RCCXsBaMo7KFB6cATJbNzB+mRsRIj4Fwg10EhUv/D7jtRIIlLZjn8q/A4V0fHCA
         H0Ni3cFV5+PaKiU1lUDOjLB9aVCGdrkFaaW64s+JK6UapvjmstTY2p1jWBXgesWEQ1FG
         spsXhfnO705Dny8i7Cnhsa2tnGuaNx1DxlyiMgoH9v+T6KjdS6SKXSmrJL6chBq91DEq
         znsDlA//Mij7Y7Vl2zuYh2HRe/iE+PnI6VvuI0L6YbMfGAsknwHH6naD+8DzX1N3mcuy
         ZNJi0brolZZvprFLiuU/ahJwprsZ5MYHGqFrDTj20ic5Rz7fr55l+Bv2BOBTUh8Os+0i
         IrVA==
X-Forwarded-Encrypted: i=1; AHgh+RpsOXFz9IhNACYM6NVzQhhL7DY6NB5lY6BZppMSaGp5IhbIGvEElvSNgTv+Wh5zoxXg//XkIDwuOmBPVw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3wOK1E1LIqfCbLdOqha57tgHReE/MdR/sooXrcO5mPvlZ38u/
	s3FFW/A0MYaxo3NrI/z+xtreAbq7xFyNa/oFp/uJOyp5otRTz+jcFRgt1hdg91gQWtw=
X-Gm-Gg: AfdE7cmSZFaEBtxS/43rZB1Hwt9uMILY0qMluI+A3e37nkOZUPCrcZqNYF+ZrdJzuNV
	h7QrtRgdbnF41yHNDcCHi+ajGGgK53zx4RGE6K7Zm4JW6o2jTyQ/9mkEKhFc/LCY8gtgt2DXJf8
	AB1yPbGdda4+JxZ4XhKYYRUEk+oGFP2wSrJi94EeYuiZTUYLDVvMKPcYxBVXZ8KTegZarb2RVAe
	HWkFBYqS7aEt5iIWKA6oiHsVl8AJiRA2EHp1xtvZjWLSWXsJopc5h66PWTfIElZseYfZkGLi6Rr
	DhSTwgFLUZMM3IJJIC6og3HMQrnU3nDMGFoq3ShVYn/fDpNEXXlPDEKXw+h3poD+SRWNkLpe1to
	FgLxgNFXkIUNJQYk4zeSqyafyvS7g+u+4uD0hT0bARASUymF8bdprDeKpw7y0tTnjE7J/ixHc1b
	0llbkf9y57iW/0
X-Received: by 2002:a05:6000:29c3:b0:460:3233:beee with SMTP id ffacd0b85a97d-47f6232e402mr7551351f8f.42.1784468866196;
        Sun, 19 Jul 2026 06:47:46 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.79.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ed1911sm22345902f8f.22.2026.07.19.06.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 06:47:45 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sun, 19 Jul 2026 14:47:40 +0100
Subject: [PATCH v12 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-x1e-csi2-phy-v12-1-cc7311326d1b@linaro.org>
References: <20260719-x1e-csi2-phy-v12-0-cc7311326d1b@linaro.org>
In-Reply-To: <20260719-x1e-csi2-phy-v12-0-cc7311326d1b@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6235;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=AC1MUPJeho28pBdVYrHItIRHxia1fJXAF7Xy5HQMoms=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqXNV+sD+2HdNBVGJbrmz7Ftn1cKJQuBNo+KzVj
 ZykSc+USbCJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCalzVfgAKCRAicTuzoY3I
 OhyrEACyT5DLK7ogJQq65UBK/r/kVSsvJyZIetufSjelyZLyoTkVFiUDD1AKDxy9JgkgpRpCoAn
 uwvxw4AndHAJY1CEcUS/CBO0MCutBZCwnnnOKpABm92+a4a2jQCOTpHvQ782Ywsz7xcmt4tF7FQ
 dniETf2ylH61bgyEnP9AbULHVYfLBU3NbFtKuMgAlaR0O/LyieHDQL6N1D8XNyw/dhAPQumvLns
 miqdlg8xXji7dJ2/EK40hRtw8hsPGE7Pp2K2ojXGHIc3c8JpELtMO6MwJOBy7kmWZQs8o5jKpJo
 XDI4DPbbLLeecGkr2La6Rm06wsMxTBmdazh8ukK9Ucv1LRkfdMGdWycV59KAd5nU9p9GwlNp3XZ
 TrRGFigK/+Oe5XYMYjAuosyrZof8GD2YSVMJ88wbkf9fo4youbKzd1BEpovU4Ys33FCzDLC9+X/
 41AMfAGl/D7Wqvl28outJOJSvZKdoKRqcaw1mmMl0GGMrxBISgev5lxxa79REiwo6M1ZXopSzGA
 GQgz+2FPg1jP4n1amii1eBB+ceqoQ6jaf/Cm5TTHs1SQI8a936gVOr8kN5NJkJ6u6qRfhSkzvjw
 2tZQ3LLhT4Byb0rT8hI2bgNES8o/4uK/+/sD8NdwdnekRb2kYQMf0ZOF30iJJTTIQCJshDIpVkA
 A4YRmBT6Jau4lGA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add a base schema for the MIPI CSI2 PHYs on Qualcomm SoCs. This PHY
supports both DPHY and CPHY operation. A special mode of DPHY operation -
called variously split-mode or combo-mode also allows for two sensors to be
connected to one PHY.

The submitted binding here describes the DPHY modes of operation only. CPHY
is left to future work.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 195 +++++++++++++++++++++
 1 file changed, 195 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
new file mode 100644
index 0000000000000..880fe602945cb
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -0,0 +1,195 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,x1e80100-csi2-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm X1E80100 SoC CSI2 PHY
+
+maintainers:
+  - Bryan O'Donoghue <bod@kernel.org>
+
+description:
+  Qualcomm MIPI CSI2 C-PHY/D-PHY combination PHY. Connects MIPI CSI2 sensors
+  to Qualcomm's Camera CSI Decoder. The PHY supports both C-PHY and D-PHY
+  modes.
+
+properties:
+  compatible:
+    const: qcom,x1e80100-csi2-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 1
+    description:
+      The single cell specifies the PHY operating mode.
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: core
+      - const: timer
+      - const: ahb
+
+  interrupts:
+    maxItems: 1
+
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+  power-domains:
+    items:
+      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
+      - description: MMCX voltage rail
+      - description: MXC or MXA voltage rail
+
+  power-domain-names:
+    items:
+      - const: top
+      - const: mmcx
+      - const: mx
+
+  vdda-0p9-supply:
+    description: Phandle to a 0.9V regulator supply to a PHY.
+
+  vdda-1p2-supply:
+    description: Phandle to 1.2V regulator supply to a PHY.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description:
+          Sensor input. Always present. A single sensor is described by a
+          single endpoint with one to four data lanes. DPHY split mode,
+          where two independent sensors share the same PHY, is described
+          by two endpoints; endpoint@0 with exactly two data-lanes and
+          endpoint@1 with exactly one data-lane.
+        unevaluatedProperties: false
+
+        patternProperties:
+          "^endpoint(@[0-9a-f]+)?$":
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
+              - data-lanes
+              - remote-endpoint
+
+        allOf:
+          - if:
+              required:
+                - endpoint@1
+            then:
+              properties:
+                endpoint@0:
+                  properties:
+                    data-lanes:
+                      minItems: 2
+                      maxItems: 2
+                endpoint@1:
+                  properties:
+                    data-lanes:
+                      maxItems: 1
+              required:
+                - endpoint@0
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output to the CAMSS CSID controller.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - clocks
+  - clock-names
+  - interrupts
+  - operating-points-v2
+  - power-domains
+  - power-domain-names
+  - vdda-0p9-supply
+  - vdda-1p2-supply
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
+    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    phy@ace4000 {
+        compatible = "qcom,x1e80100-csi2-phy";
+        reg = <0x0ace4000 0x2000>;
+        #phy-cells = <1>;
+
+        clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
+                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+                 <&camcc CAM_CC_CORE_AHB_CLK>;
+        clock-names = "core",
+                      "timer",
+                      "ahb";
+
+        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
+
+        operating-points-v2 = <&csiphy_opp_table>;
+
+        power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+                        <&rpmhpd RPMHPD_MMCX>,
+                        <&rpmhpd RPMHPD_MX>;
+        power-domain-names = "top",
+                             "mmcx",
+                             "mx";
+
+        vdda-0p9-supply = <&vreg_l2c_0p9>;
+        vdda-1p2-supply = <&vreg_l1c_1p2>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                csiphy0_in: endpoint {
+                    data-lanes = <0 1 2 3>;
+                    remote-endpoint = <&sensor_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                csiphy0_out: endpoint {
+                    remote-endpoint = <&csid_in>;
+                };
+            };
+        };
+
+        csiphy_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-300000000 {
+                opp-hz = /bits/ 64 <300000000>;
+                required-opps = <&rpmhpd_opp_low_svs_d1>,
+                                <&rpmhpd_opp_low_svs_d1>;
+            };
+        };
+    };

-- 
2.54.0

