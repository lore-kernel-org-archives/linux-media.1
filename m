Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793835959;
	b=WjJ3kw7dgxfxXy7WI+iEfrLygbX2mfwljS7GCOUmWvqc32EYcytggAKrczlyad/2Hzl8
	 TEH8EEBwd2xR5y2xEe+EzTY9cP/8B8w+GR6tIFF69A6ILqh03iggqSLw8QTZRpXrl1Hzc
	 sSyFYsD/tRzf5D7mU2AaHwMKpLp5XxlfE/6EEbL4QVUWDX24w0NIgAZFxHWYGC1pY37Ez
	 i3Sl3q2w5tOaeeWT76IjpS+b8pe1qpuuRSSLwQ0NVkZrNSOKRZTAlQ/0RiCrJgd1am2Xo
	 dU3r/xk6TZ7SzTBeGb7DVeM2ffh1grqw5BuJ1GNp5xs1F2uoGjX8F7A3GdqiW5SIKWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793835959;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=g79+tsqthwEF6pFFhq2sowBlUCWlJNutlTAPHXrY4P8=;
	b=YwFhgdZhyAJqxxfh8Xna+mZjwNXo/AZaRwRDu//nuZ7pT67UcDfAS0vuZhcfTAjrc9qo
	 bocZJ1Ud4H5+mbB8vkUolCw3KpbfxRKPGKg6+aH0VjkJ+uG8hASUuL/lYNF48GbPLZX4W
	 n7IoKlwIy8HedpmiZW5saqSwHIlvHdoFSExPNNqa2MMFGMcRE6Aq0k5WAQygD6CWLkNYi
	 FOq7u7YpNi4MRBLXGwNFY/6P2LUu930H32VMTShJraAOr/watfwdVy8NlPBgbIViecHEG
	 VwNvtBfHACzxqRFJczmaxhy+ibPe2aBqNMDzfXxQyhlVPxLhmIbEjiBCVg8TFABErog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=li8gzpoa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA800606A328;
	Wed,  4 Nov 2026 23:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=li8gzpoa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A98391F00919;
	Wed,  4 Nov 2026 23:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793835958;
	bh=g79+tsqthwEF6pFFhq2sowBlUCWlJNutlTAPHXrY4P8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=li8gzpoa9+2VTTk9T9rqQKkgK3aB0eIPLrFJvZXHfAXwa/qkoATQ5mBUZePfnJ1NB
	 uzxM8jRpvtoKTLwb9t1oE3r4du1/uqX8axXNUtaG2okAS6ywLRD59f21Bfwr5IYClJ
	 4ewHaKqg5PdDHwLQXYq7tV/Bl/nfOkrdEojx9M0MHiEKcqB54FvFUdRwVPsqJpic81
	 vRHPFqbl1JXhqTcWHAqUuqt879LQts+4tV1tv34hlEkmdFs14liUxF+PRUkvi5VM2F
	 LnpmnRnul6ilYkNiNZ9CesHFLXMovrlZn9Z2kIhUzgLob6s0utTTYq2RyQ43xqTD7s
	 Go6f/VhJTVvXQ==
From: Vladimir Zapolskiy <vz@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: media: Add Qualcomm SM8350 CAMSS
Date: Thu,  5 Nov 2026 01:45:30 +0200
Message-ID: <20261104234533.3044265-2-vz@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261104234533.3044265-1-vz@kernel.org>
References: <20261104234533.3044265-1-vz@kernel.org>
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

Add device tree bindings documentation of Qualcomm SM8350 camera
subsystem.

Qualcomm SM8350 CAMSS contains:
* three CSID and two CSID lite blocks,
* three VFE and two VFE lite blocks,
* six CSIPHY devices are described as separate CSI2 PHY devices.

The SM8350 CAMSS is very similar to the previous generation SM8250 CAMSS,
CSID register spaces are placed inside VFE register spaces.

Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
---
 .../bindings/media/qcom,sm8350-camss.yaml     | 262 ++++++++++++++++++
 1 file changed, 262 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8350-camss.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8350-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8350-camss.yaml
new file mode 100644
index 000000000000..89504ebdf773
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sm8350-camss.yaml
@@ -0,0 +1,262 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,sm8350-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SM8350 Camera Subsystem (CAMSS)
+
+maintainers:
+  - Vladimir Zapolskiy <vz@kernel.org>
+
+description:
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
+
+properties:
+  compatible:
+    const: qcom,sm8350-camss
+
+  reg:
+    maxItems: 5
+
+  reg-names:
+    items:
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  clocks:
+    maxItems: 26
+
+  clock-names:
+    items:
+      - const: camnoc_axi
+      - const: cpas_ahb
+      - const: gcc_hf_axi
+      - const: vfe0
+      - const: vfe0_ahb
+      - const: vfe0_areg
+      - const: vfe0_axi
+      - const: vfe0_cphy_rx
+      - const: vfe0_csid
+      - const: vfe1
+      - const: vfe1_ahb
+      - const: vfe1_areg
+      - const: vfe1_axi
+      - const: vfe1_cphy_rx
+      - const: vfe1_csid
+      - const: vfe2
+      - const: vfe2_ahb
+      - const: vfe2_areg
+      - const: vfe2_axi
+      - const: vfe2_cphy_rx
+      - const: vfe2_csid
+      - const: vfe_lite
+      - const: vfe_lite_ahb
+      - const: vfe_lite_axi
+      - const: vfe_lite_cphy_rx
+      - const: vfe_lite_csid
+
+  interrupts:
+    maxItems: 10
+
+  interrupt-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  iommus:
+    items:
+      - description: S1 HLOS IFE and IFE_LITE non-protected
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: ahb
+      - const: hf_mnoc
+
+  power-domains:
+    items:
+      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: IFE2 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: Titan GDSC - Titan ISP Block, Global Distributed Switch Controller.
+
+  power-domain-names:
+    items:
+      - const: ife0
+      - const: ife1
+      - const: ife2
+      - const: top
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    description:
+      CSI input ports.
+
+    patternProperties:
+      "^port@[0-5]$":
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+
+        description:
+          Input port for receiving CSI data from a CSIPHY device.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interconnects
+  - interconnect-names
+  - interrupts
+  - interrupt-names
+  - iommus
+  - power-domains
+  - power-domain-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-sm8350.h>
+    #include <dt-bindings/clock/qcom,sm8350-camcc.h>
+    #include <dt-bindings/interconnect/qcom,sm8350.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        isp@acb4000 {
+            compatible = "qcom,sm8350-camss";
+            reg = <0 0xacb4000 0 0xd000>,
+                  <0 0xacc3000 0 0xd000>,
+                  <0 0xacef000 0 0xd000>,
+                  <0 0xacd9000 0 0x2200>,
+                  <0 0xacdb200 0 0x2200>;
+            reg-names = "vfe0",
+                        "vfe1",
+                        "vfe2",
+                        "vfe_lite0",
+                        "vfe_lite1";
+            clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+                     <&camcc CAM_CC_CPAS_AHB_CLK>,
+                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
+                     <&camcc CAM_CC_IFE_0_CLK>,
+                     <&camcc CAM_CC_IFE_0_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_0_AREG_CLK>,
+                     <&camcc CAM_CC_IFE_0_AXI_CLK>,
+                     <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
+                     <&camcc CAM_CC_IFE_0_CSID_CLK>,
+                     <&camcc CAM_CC_IFE_1_CLK>,
+                     <&camcc CAM_CC_IFE_1_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_1_AREG_CLK>,
+                     <&camcc CAM_CC_IFE_1_AXI_CLK>,
+                     <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
+                     <&camcc CAM_CC_IFE_1_CSID_CLK>,
+                     <&camcc CAM_CC_IFE_2_CLK>,
+                     <&camcc CAM_CC_IFE_2_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_2_AREG_CLK>,
+                     <&camcc CAM_CC_IFE_2_AXI_CLK>,
+                     <&camcc CAM_CC_IFE_2_CPHY_RX_CLK>,
+                     <&camcc CAM_CC_IFE_2_CSID_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_AXI_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
+            clock-names = "camnoc_axi",
+                          "cpas_ahb",
+                          "gcc_hf_axi",
+                          "vfe0",
+                          "vfe0_ahb",
+                          "vfe0_areg",
+                          "vfe0_axi",
+                          "vfe0_cphy_rx",
+                          "vfe0_csid",
+                          "vfe1",
+                          "vfe1_ahb",
+                          "vfe1_areg",
+                          "vfe1_axi",
+                          "vfe1_cphy_rx",
+                          "vfe1_csid",
+                          "vfe2",
+                          "vfe2_ahb",
+                          "vfe2_areg",
+                          "vfe2_axi",
+                          "vfe2_cphy_rx",
+                          "vfe2_csid",
+                          "vfe_lite",
+                          "vfe_lite_ahb",
+                          "vfe_lite_axi",
+                          "vfe_lite_cphy_rx",
+                          "vfe_lite_csid";
+            interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 640 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 641 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "csid0",
+                              "csid1",
+                              "csid2",
+                              "csid_lite0",
+                              "csid_lite1",
+                              "vfe0",
+                              "vfe1",
+                              "vfe2",
+                              "vfe_lite0",
+                              "vfe_lite1";
+            interconnects = <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_CAMERA_CFG 0>,
+                            <&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI1 0>;
+            interconnect-names = "ahb", "hf_mnoc";
+            iommus = <&apps_smmu 0x800 0x440>;
+            power-domains = <&camcc IFE_0_GDSC>,
+                            <&camcc IFE_1_GDSC>,
+                            <&camcc IFE_2_GDSC>,
+                            <&camcc TITAN_TOP_GDSC>;
+            power-domain-names = "ife0", "ife1", "ife2", "top";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@1 {
+                    reg = <1>;
+
+                    camss_csiphy1_ep: endpoint {
+                        remote-endpoint = <&csiphy1_out>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.51.0

