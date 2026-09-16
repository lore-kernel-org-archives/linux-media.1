Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A354E2F3C
	for <linux-media@vger.kernel.org>; Wed, 16 Sep 2026 23:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789603130; cv=none; b=Qtixaw0PVsU/sal/rhrGsUnv91Sj1qjuUrRTdaXC9OIXFII2lLS3MxIU4fOSYKS4mSdRbhoqtJvPBQZEiggZQ/auJbxjNIW0Jbq9KP2TCWCh0I0WNKYsMelwPiUcczbcKpq3m3XVV5cK85UAE1FB0DOk2ak0GTZhaRQUoFJsAP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789603130; c=relaxed/simple;
	bh=NE7hWzCexAgX9RwKJyubG7DkTiJYxRaxYM7poqAcXcE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JR6Eo7UJpg9NKxDqpoQmNOhmaEns4PQeDHj5vthRq1boDFuwLyyoEpzK2zRtCFVSeT6aRBc489yl+V0g6fXTh2IrVLhoSBufwv85a06fXhB3FwB+DH6uM1aCFOdrnZYataEWTQK8ce/YXF1PEJx7wqMzTRnRkmVeqPZQG9LBUE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xTk64+RQ; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xTk64+RQ"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a6056ac81fso492901a12.2
        for <linux-media@vger.kernel.org>; Wed, 16 Sep 2026 16:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789603126; x=1790207926; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bn3uG/uVsJMnyAD108hyNP5Ygd/yS4P0lC6Y1NoRuNE=;
        b=xTk64+RQiG/RLbo4Qwd7qT6yZuwn4oIrNk5yyAT1wcgibREXOVqYViCq/yJbH4BUij
         satd1p0GSAVh4mk1CwyzFAvSyAsWWr2wLLwa7fR4sqUHuTU7yXt5YFlBm82xyH+4aNyR
         v9ub4nObIpWl8TFO1+uOkHY9MrdfDwPKjRIvGNYWSYbLL3HAqc2Um1vIaT5rkjjZCiL8
         LNh8IGVTelydZa7Wbe6gDAeCb1SsLux08bbCOx/V0pUq5SzzQtXseYa5EVEdRLwEUvV2
         TQ8oT121I4+qJhlTL2tJ4GF/7pur6zEBfgwhn4xtjaQakqw7eyF31tbbRtq7P5mbrmcT
         mbQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789603126; x=1790207926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bn3uG/uVsJMnyAD108hyNP5Ygd/yS4P0lC6Y1NoRuNE=;
        b=w2M76fWyK9ot767Z8mg8IiCSNEJBEUWXaG30wUHIyTl1gSmuCjN8X9+D2CuwQVeBq3
         S7fvVGwLqcqXEh1UcO7O0gJFBb+VVtg/MSiHW0J0pJfNud2cdNYhUIG/n7hebfv6iVWz
         oI4pU4AksjTRiq6EU073vcq94IYDn7MMlA1BXnWuPnAfaR5z4/8XDN+0LsJ6CTeGjvw6
         S0rOpOHRoWmreLRXKoNVsSlzRR74Zn8VVnu3A4F7FGphtcAGVWQbxjhUv97/GKFxt2yG
         H0KsUk6/BOqCMQAp5S+d4gOKKVWSGWsRpCeeRx5HVSKPjKuwJBql6TLkwRv07iF4rTfP
         gnFw==
X-Forwarded-Encrypted: i=1; AKwUvBwnAeEvzlT9Mc3amA9IypGbNkpx8uKxnsCHvKtIgRxysl0QKjt2k5QERNXQ0sHB90DGnarOfBWmmTZ8Zw==@vger.kernel.org
X-Gm-Message-State: AFuF++nYfQq1yUY81qKWDeq/zc1BP6KQfq5hD2R0tgsrUeAysbnIYOQ4
	mujiX+Z4CwbwCs9ZMdte0Z8FEZUKgpl5s/8ZcT2sJm5n/RfolcnhQNjZQMa5fVZk2j8e2j6Lfsw
	DKnWyaHw=
X-Gm-Gg: AYBFou2twPO9h1LncSYoHrgVXI5UOC0HWk001C7DOSOCD4kaRaKK9fQYbDTYU3zDiON
	S4XYBBN8V0qMcIfKh7VsMDCrJQpxny6VQsCmqdJ+T25r8HTvZCBVk3pyZRxoRTTBLcfXsTMc1gs
	lz8pOBQEK9R7Mw6siJCPmPtmrfk78ilITZiOWnGrA5Uf99CzFz6jd5KoW4f/ZPuFvvmHoXmr1WE
	she4XNjNLY2BIJ1Oq7rD07t2GxQaOuTKfCc1uRLFeyJiE1Oss2IHdSpndF36T6tS56d7MxaWpfX
	77tJugSK2mkh3cr2PkXQflAavy1U3ZfjwaIcCUY9U4WusCKCoqK4rkQYMvAXsZaJN2I9Ywgqdop
	YBm4BKz3pKN6GBpK3BW6lyZXD7Kn4yvpOk8l3N4SnhMA9+EQmCLziWvQ0B6zo+FXgvF84KWiaVG
	3ZRrdVH4R6c2CewzOrWxJwltUoC3QBVRIoTZLXNvos3Qin9zDc/OQWIhlSOMfQZyKru0KzWQF7p
	4Q/e2nb0uwGuMM56v6RCw==
X-Received: by 2002:a17:906:f59d:b0:c20:1c9d:8d4b with SMTP id a640c23a62f3a-c29e5290ca4mr314638666b.2.1789603125976;
        Wed, 16 Sep 2026 16:58:45 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.116.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de5e4ca9sm199450166b.42.2026.09.16.16.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 16:58:44 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 17 Sep 2026 00:58:38 +0100
Subject: [PATCH v18 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-x1e-csi2-phy-v18-1-6515b5255fa9@linaro.org>
References: <20260917-x1e-csi2-phy-v18-0-6515b5255fa9@linaro.org>
In-Reply-To: <20260917-x1e-csi2-phy-v18-0-6515b5255fa9@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6795;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=NE7hWzCexAgX9RwKJyubG7DkTiJYxRaxYM7poqAcXcE=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqqy0vFS1MnzZpwePLohwHAiW3cf5SV2wcHcc3e
 hr67kuERd+JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaqstLwAKCRAicTuzoY3I
 Ov7zEACH1xYRQCmmYcepPa/TrYIZ7UttIoSS/VVXvRvuUNVc4oxtOE8c3AFijwVw8NTX5bcxnKG
 /rzXATq2ZzuR5p0MhULgR4wqA43LFSAoriiYbawJRC08BtDhSehjWcbyt6tCMvJjkPyHZWkv6E7
 yUCjdGa86R6LtSnYy87MzNwh81fda4E6QM51KUgtUjoef+VGZlQPsF9MIFWumKmvjdnwaELBYDL
 eQz/Q81E3+SnOgEBatX/4z0AFC+m0mZS9kQ/7CtJOQtGdHx2Hx/vq9dXIWKo5PCyC41iGeYSrOq
 oBZpO3Wio2Vhbdg8KSMztpUorwT+Dd5fJF6/aUGp8XFIK47vpqP1S37Goph64Y27ZJl4C+xVY/r
 AF/Nt99lxWSykZmbpR7GrMj4ti9lKOlEHUUZa4/XliQCa9CJVbAvZH6WzbtyH+SXJk5xTg1S/6E
 7h057Kkz6nPZ3IyYvZGnI6hlcfKK6EJhb948vYuXMr6jpOGu2bh5OBuulhhDF7v9PIN3ww78N+p
 H3DwAMmuImrOfZ2uCFvK6hiAiHyQQix1Tu2QucVFJLdRYDACpFuYsrF1ZAkuuqATADaiFbCaHzD
 bEJ5TdkegC8QrwJoIuzDqLmWqwoFZ7R4CnZmFBbZ16h4z+8TEpgQM5JBzlcV4e4Eg6DT0VPoVCz
 vnhgN6pr+4k3AfQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add a base schema for the MIPI CSI2 PHYs on Qualcomm SoCs. This PHY
supports both DPHY and CPHY operation. A special mode of DPHY operation -
called variously split-mode or combo-mode also allows for two sensors to be
connected to one PHY.

The schema supports both the D-PHY and C-PHY bus types.

Suggested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 209 +++++++++++++++++++++
 1 file changed, 209 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
new file mode 100644
index 0000000000000..dc64af97da6c6
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -0,0 +1,209 @@
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
+          single endpoint with one to four data lanes, numbered 1-4. The
+          clock lane is position 0.
+
+          DPHY split mode, where two independent sensors share the PHY, is
+          described by two endpoints. endpoint@0 uses data lanes 1 or 1-2,
+          clock lane position 0; endpoint@1 uses data lane 3, clock lane
+          position 4.
+
+        unevaluatedProperties: false
+
+        patternProperties:
+          "^endpoint(@[01])?$":
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+            properties:
+              bus-type:
+                enum:
+                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
+                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
+                default: 4
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+                items:
+                  minimum: 1
+                  maximum: 4
+                description:
+                  Data lane positions following this endpoint's clock
+                  lane. Positions are a per-port logical numbering, not
+                  package pad or ball positions.
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
+                      maxItems: 2
+                      items:
+                        maximum: 2
+                endpoint@1:
+                  properties:
+                    data-lanes:
+                      items:
+                        - const: 3
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
+    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
+    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/media/video-interfaces.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    phy@ace4000 {
+        compatible = "qcom,x1e80100-csi2-phy";
+        reg = <0x0ace4000 0x2000>;
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
+                    bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+                    data-lanes = <1 2 3 4>;
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
2.55.0

