Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793055030;
	b=qT6sMUcRttAQIzmRbHVIRZeroQHScEKZMxI/D5bURNhTp45aA3cxA2Ak4lrV/HdF1dJx
	 I80O3Rj9CWMNqvYV5UqwrSXUxYqqIGEfXegEqPipJM9WlimauqtAVr6a/GqElvAR0WHPG
	 3XUBKpxD1xPxTX/LLQ37cOl8HMnwNM71iD80zXMbzsZEAHoJ/ulg3wuFVYYqrEBKdEjvm
	 qrwJJdR2PUSRRGth401wMetmUaIOC4gleSjtktdXnivYL34Kxs9ITZdqWqG1QdLy/bzCv
	 LVzeazfluY4gKyjhuuwObDo+oesk57DRpAiGVBoyd9wUXITf54nl+3Svv1YkKi0glHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793055030;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Yymwnu6zD+vpaCEhbkClPScnqg2Frrzq7tYxOW9Q5bM=;
	b=o7v0X6pG65hXpBGIuh3UR5LLTOonWJPXjyT8z8X5o4OjWyU28bpfP+HYUzigt/6pjCt6
	 awEoqG5KDx3jHzuMp6eF+eqnh3Uk2h/UhCQDWCOHPl9e93DL9jyh3tGzAQROj/69Dw2Ll
	 9AXFk5Tt42yK35vaNX2MWct2qiWdptMifWHnQyuuEUmkTgwEf3ii/6BjMDyDhyaGlEpvW
	 1BtKn6yuS9zsYvTELlyYhkv4n85B9ZuNETZubr1ZgMty6NzJkdNyreDfswmcck1rf+yfo
	 fHdSv9tg55Yo69RnArYDWYNNrWNVzrOlKTt9InRSxjdyJB+Zz1vF9fvgRFBlwrErjnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZvynyYdM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FC7606A328;
	Mon, 26 Oct 2026 22:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZvynyYdM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 127041F01828;
	Mon, 26 Oct 2026 22:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793055029;
	bh=Yymwnu6zD+vpaCEhbkClPScnqg2Frrzq7tYxOW9Q5bM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZvynyYdMCDALgwVEZCxDgJMmutrvexEy4mofrRT+G/sqGWK9LzLeBL729MGYzCwf7
	 1PddGBbjVAhsKkP1TFcZeTM25WoIlVrzTEbCLl16TfxWZy77spwrCGzRFLi3aHPRdj
	 /dBTYt2ShWbbx6BB3q1caZ5m1eRrmDOhIkXz4ixMhRE2CSl3yCj/f+L4V2hpnIbsQu
	 CZqbr2bqcbzmHoXx+ox58E7ZimIVK4AV8xoVSm8Dgy1CrT85NDmYprriZtEUImuFfY
	 N/FAlc34Ls87mJECO5g+fZb2/TWN+IMC4gL0EAzU78yvx17/uFiN/+z8HfIYy0wPLA
	 AKLqJf5v1MKMg==
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
Subject: [PATCH v2 6/7] arm64: dts: qcom: sm8450: Add CAMSS device tree node
Date: Tue, 27 Oct 2026 00:49:56 +0200
Message-ID: <20261026224957.1115370-7-vz@kernel.org>
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

Add Qualcomm SM8450 CAMSS device tree node to the platform dtsi file,
the CAMSS input ports are connected to output ports of CSIPHY devices.

Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 173 +++++++++++++++++++++++++++
 1 file changed, 173 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index f429dcaf1075..b4f7672cec94 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -3310,6 +3310,173 @@ cci1_i2c1: i2c-bus@1 {
 			};
 		};
 
+		camss: isp@acb6000 {
+			compatible = "qcom,sm8450-camss";
+
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
+
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
+
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
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC 0
+					 &config_noc SLAVE_CAMERA_CFG 0>,
+					<&mmss_noc MASTER_CAMNOC_HF 0
+					 &mc_virt SLAVE_EBI1 0>;
+			interconnect-names = "ahb",
+					     "hf_mnoc";
+
+			iommus = <&apps_smmu 0x800 0x460>;
+
+			power-domains = <&camcc IFE_0_GDSC>,
+					<&camcc IFE_1_GDSC>,
+					<&camcc IFE_2_GDSC>,
+					<&camcc TITAN_TOP_GDSC>;
+			power-domain-names = "ife0", "ife1", "ife2", "top";
+
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
 			compatible = "qcom,sm8450-csi2-phy", "qcom,x1e80100-csi2-phy";
 			reg = <0 0x0ace4000 0 0x2000>;
@@ -3349,6 +3516,7 @@ port@1 {
 					reg = <1>;
 
 					csiphy0_out_ep: endpoint {
+						remote-endpoint = <&camss_csiphy0_inep>;
 					};
 				};
 			};
@@ -3393,6 +3561,7 @@ port@1 {
 					reg = <1>;
 
 					csiphy1_out_ep: endpoint {
+						remote-endpoint = <&camss_csiphy1_inep>;
 					};
 				};
 			};
@@ -3437,6 +3606,7 @@ port@1 {
 					reg = <1>;
 
 					csiphy2_out_ep: endpoint {
+						remote-endpoint = <&camss_csiphy2_inep>;
 					};
 				};
 			};
@@ -3481,6 +3651,7 @@ port@1 {
 					reg = <1>;
 
 					csiphy3_out_ep: endpoint {
+						remote-endpoint = <&camss_csiphy3_inep>;
 					};
 				};
 			};
@@ -3525,6 +3696,7 @@ port@1 {
 					reg = <1>;
 
 					csiphy4_out_ep: endpoint {
+						remote-endpoint = <&camss_csiphy4_inep>;
 					};
 				};
 			};
@@ -3569,6 +3741,7 @@ port@1 {
 					reg = <1>;
 
 					csiphy5_out_ep: endpoint {
+						remote-endpoint = <&camss_csiphy5_inep>;
 					};
 				};
 			};
-- 
2.51.0

