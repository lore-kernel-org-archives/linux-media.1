Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793055013;
	b=aXPtMln1BBgfeQ9Daaqh+/POhp+kVRi6ySjAqS6qGLHpNf68fA3gM/iCqf9NGBZxDG6i
	 +7lPTrVCCifb2O7ZV1QfFRCiwsCeq6gXRPglqVpevHHXh5kjoXEKK1PcgicQmyrTuyXJ7
	 paaxPDUPSpDPSDihd+3C/ZOa4zdA5C9cC1BYdl3J4eAzjmrbVdveVDbGVWN+pPgCyDnoI
	 K9KPy7ssDZceQQ1DKq9u4/Vt6jxqAMq+A0VjRHjjxcpQ1goVcb6sQGLV/HEryBLlRc393
	 WAJtoEpLh36XrCIpUcyKGSW5KaKM8jLTi/bLx8V39U4Z2m0yREhr+6kug1OvdiT4tHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793055013;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=tekr8muv2CBzor1OY99VQ8xCGWGP9DOKiWcUK0HGbRs=;
	b=2MYDP7cMa58PAKdmYfRpzGhOisqdk4ntaNvedGS0bmwsyq8lahRJ5ZvaF4gb+5UsSKoJ
	 Z4w9HUeqsRd3fEGKfnLHYuZ+iCPfN791AEUxAXiR0rD0q9wXLf65hDxfxbLUZra2XY/RN
	 CnSzqe9Bftt9QvzmgcUJrd3IctKKjsWj9qsliuL7j4TP3/+pyBKrQRpdoxgIR0udDUKIA
	 ADmQU189d8X51fMc+NZYYJHCMdt4iZxB98eVfgNQ6E1Gikd3kKcxWypeEVDIRjHhDvQWq
	 lVlCXHgbWhbVFIR1wXQx75BkY6AprQgesl1EKvCQNGVaHdcLDVyODeb9azfCAGK/Zrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gTGdiAN1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5440606A31B;
	Mon, 26 Oct 2026 22:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gTGdiAN1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6BF31F01825;
	Mon, 26 Oct 2026 22:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793055012;
	bh=tekr8muv2CBzor1OY99VQ8xCGWGP9DOKiWcUK0HGbRs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gTGdiAN1t7OLrRMwT/zNWR+PdY3aw9jQfqOQlWcA7wIyMH0i7NneHocEz8F+aY9bf
	 c481XNlZF0MlaAgljSGdUaj+oAAyVmtbdLGlzrLn50G3nwP+MnOn50iG9FJOsSbSmv
	 QZJwu9DH5/As5KuDMiA7eW4wZ6nMFODgZxAiWB0bjzfHy3MTfYwyuzIq189Yks5jix
	 KOrglPW7iL5WZuF70dMXx5XCfAVaiP/ludEai9cbwgRdy8/5iqYdDVrkT1K26Le9ef
	 N8heKfaS0aYT/EZMi/hgfywMMTJp0yqNu+TDUCuuttL6ZFWbnZE0jrseugvZa843qf
	 iGPzsU1nkmk2w==
From: Vladimir Zapolskiy <vz@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-phy@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/7] dt-bindings: media: Add Qualcomm SM8450 CAMSS
Date: Tue, 27 Oct 2026 00:49:52 +0200
Message-ID: <20261026224957.1115370-3-vz@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261026224957.1115370-1-vz@kernel.org>
References: <20261026224957.1115370-1-vz@kernel.org>
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

Add Qualcomm SM8450 CAMSS device tree binding, it contains
* three CSID and two CSID lite blocks,
* three VFE and two VFE lite blocks,
* three CSI test pattern generators,

Six CSIPHY blocks are described as separate CSIPHY devices connected
to CAMSS input ports.

Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
---
 .../bindings/media/qcom,sm8450-camss.yaml     | 274 ++++++++++++++++++
 1 file changed, 274 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8450-camss.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8450-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8450-camss.yaml
new file mode 100644
index 000000000000..cf801435191a
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sm8450-camss.yaml
@@ -0,0 +1,274 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,sm8450-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SM8450 Camera Subsystem (CAMSS)
+
+maintainers:
+  - Vladimir Zapolskiy <vz@kernel.org>
+
+description:
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
+
+properties:
+  compatible:
+    const: qcom,sm8450-camss
+
+  reg:
+    maxItems: 14
+
+  reg-names:
+    items:
+      - const: csid_wrapper
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: tpg0
+      - const: tpg1
+      - const: tpg2
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  clocks:
+    maxItems: 21
+
+  clock-names:
+    items:
+      - const: camnoc_axi
+      - const: core_ahb
+      - const: cpas_ahb
+      - const: cpas_fast_ahb
+      - const: cpas_vfe0
+      - const: cpas_vfe1
+      - const: cpas_vfe2
+      - const: cpas_vfe_lite
+      - const: csid
+      - const: csiphy_rx
+      - const: gcc_hf_axi
+      - const: vfe0
+      - const: vfe0_fast_ahb
+      - const: vfe1
+      - const: vfe1_fast_ahb
+      - const: vfe2
+      - const: vfe2_fast_ahb
+      - const: vfe_lite
+      - const: vfe_lite_ahb
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
+    #include <dt-bindings/clock/qcom,gcc-sm8450.h>
+    #include <dt-bindings/clock/qcom,sm8450-camcc.h>
+    #include <dt-bindings/interconnect/qcom,sm8450.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        isp@acb6000 {
+            compatible = "qcom,sm8450-camss";
+            reg = <0 0xacb6000 0 0x1000>,
+                  <0 0xacb7000 0 0x1000>,
+                  <0 0xacb9000 0 0x1000>,
+                  <0 0xacbb000 0 0x1000>,
+                  <0 0xacc6000 0 0x1000>,
+                  <0 0xacca000 0 0x1000>,
+                  <0 0xacf6000 0 0x1000>,
+                  <0 0xacf7000 0 0x1000>,
+                  <0 0xacf8000 0 0x1000>,
+                  <0 0xac62000 0 0x3000>,
+                  <0 0xac71000 0 0x3000>,
+                  <0 0xac80000 0 0x3000>,
+                  <0 0xacc7000 0 0x2000>,
+                  <0 0xaccb000 0 0x2000>;
+            reg-names = "csid_wrapper",
+                        "csid0",
+                        "csid1",
+                        "csid2",
+                        "csid_lite0",
+                        "csid_lite1",
+                        "tpg0",
+                        "tpg1",
+                        "tpg2",
+                        "vfe0",
+                        "vfe1",
+                        "vfe2",
+                        "vfe_lite0",
+                        "vfe_lite1";
+            clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+                     <&camcc CAM_CC_CORE_AHB_CLK>,
+                     <&camcc CAM_CC_CPAS_AHB_CLK>,
+                     <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_CPAS_IFE_0_CLK>,
+                     <&camcc CAM_CC_CPAS_IFE_1_CLK>,
+                     <&camcc CAM_CC_CPAS_IFE_2_CLK>,
+                     <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_CSID_CLK>,
+                     <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
+                     <&camcc CAM_CC_IFE_0_CLK>,
+                     <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_1_CLK>,
+                     <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_2_CLK>,
+                     <&camcc CAM_CC_IFE_2_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
+            clock-names = "camnoc_axi",
+                          "core_ahb",
+                          "cpas_ahb",
+                          "cpas_fast_ahb",
+                          "cpas_vfe0",
+                          "cpas_vfe1",
+                          "cpas_vfe2",
+                          "cpas_vfe_lite",
+                          "csid",
+                          "csiphy_rx",
+                          "gcc_hf_axi",
+                          "vfe0",
+                          "vfe0_fast_ahb",
+                          "vfe1",
+                          "vfe1_fast_ahb",
+                          "vfe2",
+                          "vfe2_fast_ahb",
+                          "vfe_lite",
+                          "vfe_lite_ahb",
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
+            iommus = <&apps_smmu 0x800 0x460>;
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

