Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFB33939B0
	for <linux-media@vger.kernel.org>; Sun, 19 Jul 2026 12:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784464202; cv=none; b=PWWhh30uQa2lWht83UEE/w5/jtHgFTiGNpEVjIpWvjYiRTOalnaP7DNZA80/LQkl16ZW1q8IBAgsfGkVPB8naqq0y1aoFghgvu7b89JGh3D9qQPbN3EIjcB/TNgv+UEz89apD6iQx4HyGZAQXO+2+CqXyt1JuhhxLPYqargeuAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784464202; c=relaxed/simple;
	bh=AC1MUPJeho28pBdVYrHItIRHxia1fJXAF7Xy5HQMoms=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E0uuZuZDG9Ksg2Nbgg8pu5Pof9tsvZEfwSUy6onIUMU3HS+ntVJFDtSJrdzsd2Z4uqBn7EIa+7jTS8FpBuvWj6PQR1r8O7Ndppff/1df9BofK8bX1V/azB6ZIZNPLUpqhDuTVlhxpU1lvGffA3o0FNJJ16W6VspTP2UKAfU7Rto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZDVmOKOG; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZDVmOKOG"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso8074045e9.3
        for <linux-media@vger.kernel.org>; Sun, 19 Jul 2026 05:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784464198; x=1785068998; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4XnV+FykkybVqG+qJ/ggN1ABFG87UERnEoUc/FfnJBw=;
        b=ZDVmOKOGG4eUAvLHh09oMqSzVaiSfAbm0L7b0vMxyjynb9VZgqPo4b0NVvn8YYNYxO
         ujldtt0HCH8eTYDEv9fW4gc8fJU7WE9agi1CR6vkAmU7Rf7lOoNwUlKbaC8it7uvXpUA
         GE+rtzKHZjSt5AKBJD+VMF8OwGdP9JgJerP97CDMZMhwHUZq3Zqteel4EsGMoOSrDeu6
         TfJJZhCSN3Jgi6+L8NjmaiCBnTBmmBf3cUDXImf3xyOCqWnh849JtVUJrKg8Rt3m6Y2c
         A6MqIZs1lcsoorp5W/4a8AMpRlZJDVO7iVxv0qAd9RLTJmp8yV/CdbDyio0/PF+t35se
         bslQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784464198; x=1785068998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4XnV+FykkybVqG+qJ/ggN1ABFG87UERnEoUc/FfnJBw=;
        b=lQpauh1+vKmmX3Rve+5V5j7gJenUqs4fuOJHfuElVbrdxmwjfcRbh/ei7owYsAxzN0
         H7L/N9Om7G78wTgYPWMAv0VkpE2WuwSXJCuZlUq66hv4WqFjxW+1cQNYcbGxeOzJX8rN
         FVEDanwqaF3eK29EzYcRKLA+a34A6FLqZloM2Ft73PNnC5rjrI9WgAOIESZCXcJ9bqVb
         Q2H92ARxulMt6unPwyKaaHF0F4PVHXw6rhcjfyU25hQcRMcwgrrrb2nZWRJy405dg0fb
         TFPhBh3ZPbd8f0tkUmUMpkTgyjia08rnxH57yl5p45YQxfb2WsY9nkqg1xpgrAf0uovD
         lhMw==
X-Forwarded-Encrypted: i=1; AHgh+RriBOX6hLLqK0lpc7DlVEUkI1lJke6fGjuzH997tVeDi7akxTymGOaC9LWF+LatrunyoZufTZ5BS4lndQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2If/90ok5wTkE37h7h0Eo9Rg5Tn2G+8Vv+3J2j0/Nk7aEud7I
	ke0nxJCgx33HJN/EbzJS5L7lwnK6SeTlfbxpxvxLscwrqEphiPKdVn/srJ5nMdl16Sg=
X-Gm-Gg: AfdE7cnJPeaI2kEYqZe8xE5pDRh1NEyWj3TSzUzTTl4Ixp+o0URupwjZ4V7jGtEQd9i
	/G//HcUcXU73915qCSrF9HEP51IG9b3m9ouvGHmdCTC5+/OuxK2NHYi9yFcZmapbHpBBHLMB/Qr
	ENnDAcGcpcTyc3LdiwyMj2isv6LrmwUtV9tGPXEls5arHjS8nokt2uxLIC5Fioet0YXg5aWYnBg
	aaTzqRtErRs+zctf4OWJyWSAwEVxwYxq+dh58vSeUxjS9u6L/ytdm0WeOLBW+OfYHu7VVVcH983
	vaVXI6kIzMd7MCqyQJhOJH1jrYp7DjravqEoUEAcmpB+CzggivGg3asD6HRMsJwv5/xUZk4Otjs
	RXcsIjYrs47KXzuCHQqALlzqHVzXEAMmhnJze0Q7CILlz2/vhT66G7UajeSfZVv795dGY6La2SI
	CparWYvaDgsp81
X-Received: by 2002:a05:600c:45d3:b0:495:503f:cf9a with SMTP id 5b1f17b1804b1-495503fd2a0mr61098335e9.9.1784464198117;
        Sun, 19 Jul 2026 05:29:58 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.79.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495499d1d4asm130446115e9.2.2026.07.19.05.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 05:29:56 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sun, 19 Jul 2026 13:29:48 +0100
Subject: [PATCH v11 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-x1e-csi2-phy-v11-1-9d0a1ed0632d@linaro.org>
References: <20260719-x1e-csi2-phy-v11-0-9d0a1ed0632d@linaro.org>
In-Reply-To: <20260719-x1e-csi2-phy-v11-0-9d0a1ed0632d@linaro.org>
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
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqXMNBITdQ3fpVqw95Hpzrd9pGlaJlza8gFmvsk
 fvnxJ+JBZaJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCalzDQQAKCRAicTuzoY3I
 Oj3YD/95Gdlkx/ttWuNHH1Zm4pjPyY2CGlclwJvbu0XTyuRaeKP6gXnP75QHjVc1p1m3pzrOa9Q
 VHGTm20ddXiyxc2M7XrgN79DDqzBQi3vNx/ALXTIJpps/Bgs8QqvCxWuL+0iMtZgXBXopCGn99u
 RMeMwsrAy2Y7J3vZZKWITz6XFns89zEnpxWqEO/TG0rWqxmjteCwW7jv2aYoJkNdjOxuw5Hmgvw
 WStaHTZ/k5tzn6fkYKcC4rRc353yNqguJ3HCKR4tJ3ahS104tI5omwkZc0AKZsaW2c7XwyXR6zv
 L1Phfx25RgC7FNHX9w6ZM289IVxCEjm39EXsd8SkXXNSeZzr210jryZ8ABoZ4SJCP7Wr1rk/mJi
 0kFRrbAbHkESFUi00q+QiZV4rHQ6s/VidFNjO5XA/hZ1bQAZytZdpIiRPsQgwMolWqilcE6QLY/
 137sgbyFETYK6RIRqXhZ6u7eDOqmqX7SCexeLqAdaMQmffOH0qsW9RXE9V2s5050ITNHDgnaEFN
 BAexDFNpEiZJzTB81sWrlcg3EeDdRhdy7l/D4FTOBy5AtX78PxvLzuUtaoqY/Ip+ogncBw14/cl
 V6B8zuNnO2HTPZ+amEHsZ9Ua3w0U3D+1av5ZrwCVHHLSYMj0mzf5/KE+GaprgxlX1qSYOQnV+VW
 3mcT4osOIeqd8hA==
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

