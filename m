Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792773099;
	b=0AdcRHpjelUnajtlPbvEiej85Ii0Pcx72h47Y4fSaQpGB7ocedl4bM/l5FxiRKLwT4CF
	 3WN+9E3h/PRAEBcSBoyWAA7/Vd6vbUi7L3DJ2caafqODCcUX1ablx/G0kbWJfzuKYdfuX
	 w+CrK+z/NgXzZhdPc8BiIcMw1ockkGAEKoWtiItIv4sfPngOoI7J2evewPXHfuRAHbg8p
	 vO+wj5TzrbM2/nltdLShWLKlXoXq3dv3PsmMPba0c2/JBJNoWkIPAiDuoQBmMolZCdRNl
	 3tBPYZPAh6+RGi3Ub6UGbs7p3/ik2kYhXrEDpMNPGgAIUe2dRhGFQMQ6zdGs7lDg1tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792773099;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=iofrPs8QzOuyZoINDCa24ONB+FkRQk3eq1FNcSz/0YE=;
	b=h9gPcRjd1yONzsFRdmpUhZFtbYicCqIxykE8+3mQ2wMm6+PwDQTSo/oOoUWVbVBGD4rb
	 AtxXllwFZW6sGLA5R4eMq6q1+VVcYg/3rxi8VpqLXXVBRs/7WOfLiduIyAFthFwUjEOwA
	 mOsPLsxrFPsS32OK0P8zMGqi3kxDUbXCgypwK72R6UZRCqZzKP4V6hGhX//mF9kyz0B6O
	 AosnPjo5JN3FDqo1LgGKVrGsO5ayuKpgVTkBcaf4eBZSgY8/opuxmw+FBRkHdh9/kIe+i
	 xPbLEGx8bwjJIDRCBzbIGdIJ1T7/wiskj3TZFsC/C1n64OrSde+7G3yopSUbH5mqImA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aiCs+eb8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E01C606A31B;
	Fri, 23 Oct 2026 16:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aiCs+eb8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0793D1F01825;
	Fri, 23 Oct 2026 16:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792773098;
	bh=iofrPs8QzOuyZoINDCa24ONB+FkRQk3eq1FNcSz/0YE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aiCs+eb8XvY7hDRnrfHqWZpdQ8RUYlx6OzA/eJ4r8bcI0u0UM3b5ysJ32r+D7pdMl
	 AKG8GVTtmZcGdNYLa1f3Z5kstsIGB9Qffz6PUTMgZ+67vuR+IJIj2+HREV6xqyThK9
	 ch6yHhXOANUck5OpFFg9RhCv88bbUFJjGCxKT1DEKkb43vrYJ70TmOy9FXIMHgIZsQ
	 C8QdRWCdKLthFCJa/77X4uSYthRcSxV0fwsNweNTrmEC7S1g7Cf3DGSJLsPzO52sx8
	 pdUoWaWt/334h4crkdM5beD4FruTzAO6jkTdoOvDHfmPRr52ZOzbPhbH5nkNi9FcDV
	 e7fPVGgmr5tDw==
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
Subject: [PATCH 4/7] arm64: dts: qcom: sm8450: Add CAMSS device tree node
Date: Fri, 23 Oct 2026 19:30:54 +0300
Message-ID: <20261023163057.775917-5-vz@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261023163057.775917-1-vz@kernel.org>
References: <20261023163057.775917-1-vz@kernel.org>
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

Add Qualcomm Waipio CAMSS device tree node to the platform dtsi file,
the CAMSS input ports are connected to output ports of CSIPHY devices.

Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 167 +++++++++++++++++++++++++++
 1 file changed, 167 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index babf1a4196a1..7f5b0501a23e 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -3310,6 +3310,167 @@ cci1_i2c1: i2c-bus@1 {
 			};
 		};
 
+		camss: isp@acb6000 {
+			compatible = "qcom,waipio-camss";
+			reg = <0 0xacb6000 0 0x1000>,
+			      <0 0xacb7000 0 0x1000>,
+			      <0 0xacb9000 0 0x1000>,
+			      <0 0xacbb000 0 0x1000>,
+			      <0 0xacc6000 0 0x1000>,
+			      <0 0xacca000 0 0x1000>,
+			      <0 0xacf6000 0 0x1000>,
+			      <0 0xacf7000 0 0x1000>,
+			      <0 0xacf8000 0 0x1000>,
+			      <0 0xac62000 0 0x3000>,
+			      <0 0xac71000 0 0x3000>,
+			      <0 0xac80000 0 0x3000>,
+			      <0 0xacc7000 0 0x2000>,
+			      <0 0xaccb000 0 0x2000>;
+			reg-names = "csid_wrapper",
+				    "csid0",
+				    "csid1",
+				    "csid2",
+				    "csid_lite0",
+				    "csid_lite1",
+				    "tpg0",
+				    "tpg1",
+				    "tpg2",
+				    "vfe0",
+				    "vfe1",
+				    "vfe2",
+				    "vfe_lite0",
+				    "vfe_lite1";
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_0_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_1_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_2_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_CSID_CLK>,
+				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_0_CLK>,
+				 <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_1_CLK>,
+				 <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_2_CLK>,
+				 <&camcc CAM_CC_IFE_2_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
+			clock-names = "camnoc_axi",
+				      "core_ahb",
+				      "cpas_ahb",
+				      "cpas_fast_ahb",
+				      "cpas_vfe0",
+				      "cpas_vfe1",
+				      "cpas_vfe2",
+				      "cpas_vfe_lite",
+				      "csid",
+				      "csiphy_rx",
+				      "gcc_hf_axi",
+				      "vfe0",
+				      "vfe0_fast_ahb",
+				      "vfe1",
+				      "vfe1_fast_ahb",
+				      "vfe2",
+				      "vfe2_fast_ahb",
+				      "vfe_lite",
+				      "vfe_lite_ahb",
+				      "vfe_lite_cphy_rx",
+				      "vfe_lite_csid";
+			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 640 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 641 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid2",
+					  "csid_lite0",
+					  "csid_lite1",
+					  "vfe0",
+					  "vfe1",
+					  "vfe2",
+					  "vfe_lite0",
+					  "vfe_lite1";
+			interconnects = <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_CAMERA_CFG 0>,
+					<&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI1 0>;
+			interconnect-names = "ahb",
+					     "hf_mnoc";
+			iommus = <&apps_smmu 0x800 0x460>;
+			power-domains = <&camcc IFE_0_GDSC>,
+					<&camcc IFE_1_GDSC>,
+					<&camcc IFE_2_GDSC>,
+					<&camcc TITAN_TOP_GDSC>;
+			power-domain-names = "ife0",
+					     "ife1",
+					     "ife2",
+					     "top";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					camss_csiphy0_inep: endpoint {
+						remote-endpoint = <&csiphy0_out_ep>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					camss_csiphy1_inep: endpoint {
+						remote-endpoint = <&csiphy1_out_ep>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					camss_csiphy2_inep: endpoint {
+						remote-endpoint = <&csiphy2_out_ep>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					camss_csiphy3_inep: endpoint {
+						remote-endpoint = <&csiphy3_out_ep>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+
+					camss_csiphy4_inep: endpoint {
+						remote-endpoint = <&csiphy4_out_ep>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+
+					camss_csiphy5_inep: endpoint {
+						remote-endpoint = <&csiphy5_out_ep>;
+					};
+				};
+			};
+		};
+
 		csiphy0: phy@ace4000 {
 			compatible = "qcom,waipio-csi2-phy", "qcom,x1e80100-csi2-phy";
 			reg = <0 0x0ace4000 0 0x2000>;
@@ -3349,6 +3510,7 @@ port@1 {
 					reg = <1>;
 
 					csiphy0_out_ep: endpoint {
+						remote-endpoint = <&camss_csiphy0_inep>;
 					};
 				};
 			};
@@ -3393,6 +3555,7 @@ port@1 {
 					reg = <1>;
 
 					csiphy1_out_ep: endpoint {
+						remote-endpoint = <&camss_csiphy1_inep>;
 					};
 				};
 			};
@@ -3437,6 +3600,7 @@ port@1 {
 					reg = <1>;
 
 					csiphy2_out_ep: endpoint {
+						remote-endpoint = <&camss_csiphy2_inep>;
 					};
 				};
 			};
@@ -3481,6 +3645,7 @@ port@1 {
 					reg = <1>;
 
 					csiphy3_out_ep: endpoint {
+						remote-endpoint = <&camss_csiphy3_inep>;
 					};
 				};
 			};
@@ -3525,6 +3690,7 @@ port@1 {
 					reg = <1>;
 
 					csiphy4_out_ep: endpoint {
+						remote-endpoint = <&camss_csiphy4_inep>;
 					};
 				};
 			};
@@ -3569,6 +3735,7 @@ port@1 {
 					reg = <1>;
 
 					csiphy5_out_ep: endpoint {
+						remote-endpoint = <&camss_csiphy5_inep>;
 					};
 				};
 			};
-- 
2.53.0

