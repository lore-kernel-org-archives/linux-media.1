Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793835969;
	b=pTV18t3oX6CBVMAtCBVy3sNJG73V6pRywE+i2FSOP8eef34BQFfp8Je0dK2qD9rufuim
	 dQJz3pfDWrvnMiua3Fs8WsB0gZyDeC1LB4scfdSNbjxFlLMkfkc7wVZTyRnAsLnq614eY
	 BvC39B1CY0gvU5oy3or757W+3MIGO1W784pN0g2KhXP/l94FpBvPWw1zak3xuVLtHFsgs
	 QSsjtd+JTVg+cJIVp1WZrSE5Z46KTAMJFYyDbyTo3a8PSdg0WRqQ9nchO+tTacOZL+LCK
	 noWNKwrRGtFnVnV0UZqpOM+wekYaILj6OuyKmr+iuCW/HNw505fUWmP0ykRJRsc3SAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793835969;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=F9BR1IePBFIhGkUp6WFQckspU6bfiYxwaxwbXCOP+p4=;
	b=XIFvDB2hKU244Il4DOAq/znq8bNxNpM07vO0p7/1gReBVdTDl6wJB+MP5gU2AJmAHbST
	 My92ojyM7odPVBwxrhAkHuYRGuEo33x3VWJgyATf/GeOANCky/p594eBkjANfM6z9JrD2
	 W/RWeCDGP+/2jAB12D5rJLZiFxMejb/xWa8r/WTMAvuhUYVQxEYkXq7jvUybds4LyMoDj
	 1/OWRJHwjRCjEA9x6+LI9Ruk4h4SPYCrGPsj1P6QZdltjwlpTsLoWS45Dzl3MjKwIsg0U
	 glZNWiPkWZvTiYZkgANG3wmcHWCt8A5MWpZrwlKrVVzbzUPUal+Jjpms0gTQS4m4Z3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EAH+6JHM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA88D606A32C;
	Wed,  4 Nov 2026 23:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EAH+6JHM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2D0C1F00A15;
	Wed,  4 Nov 2026 23:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793835968;
	bh=F9BR1IePBFIhGkUp6WFQckspU6bfiYxwaxwbXCOP+p4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EAH+6JHMiknSNKFwHO9Xv+a8OYeEsh89ILlyJFdYJ/K9WzH3WYO9iW3NNMQGu5zyA
	 E1vzTqGV4Y2hH74gK8i4LFy6VmH8YehTUzMNGsGI85czNLXw/TqB2RaALgIKHi87Nl
	 JyKDpTTGneANvhtLUFtUew9RhWsg/AH92TTcTwDNM5vS3i6U5VkuB9BiLgs/bheRfw
	 eCIf+987DaIPvFSg7qL7YF+y56wCvjw7PlrJePNTaNckh23SkN243Q7Qlr8+Y6xTLv
	 TtiJrG/9W8HRAHI+Yek8rqMa2ROvCIel8lmAywaXzqOcpmCBB32JvbKp8AjVhYLDil
	 QRPS4w8GZw6kw==
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
Subject: [PATCH 4/4] arm64: dts: qcom: sm8350: Add CAMSS device tree node
Date: Thu,  5 Nov 2026 01:45:33 +0200
Message-ID: <20261104234533.3044265-5-vz@kernel.org>
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

Add Qualcomm SM8350 CAMSS device tree node to the platform dtsi file.

The CAMSS input ports will be described along with adding CSIPHY
device tree nodes, which are connected to them.

Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 110 +++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index a51942c99f8a..9488b8578359 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/clock/qcom,gcc-sm8350.h>
 #include <dt-bindings/clock/qcom,gpucc-sm8350.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/clock/qcom,sm8350-camcc.h>
 #include <dt-bindings/clock/qcom,sm8350-videocc.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/firmware/qcom,scm.h>
@@ -2830,6 +2831,115 @@ videocc: clock-controller@abf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		camss: isp@acb4000 {
+			compatible = "qcom,sm8350-camss";
+
+			reg = <0 0x0acb4000 0 0xd000>,
+			      <0 0x0acc3000 0 0xd000>,
+			      <0 0x0acef000 0 0xd000>,
+			      <0 0x0acd9000 0 0x2200>,
+			      <0 0x0acdb200 0 0x2200>;
+			reg-names = "vfe0",
+				    "vfe1",
+				    "vfe2",
+				    "vfe_lite0",
+				    "vfe_lite1";
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_0_CLK>,
+				 <&camcc CAM_CC_IFE_0_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_0_AREG_CLK>,
+				 <&camcc CAM_CC_IFE_0_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_0_CSID_CLK>,
+				 <&camcc CAM_CC_IFE_1_CLK>,
+				 <&camcc CAM_CC_IFE_1_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_1_AREG_CLK>,
+				 <&camcc CAM_CC_IFE_1_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_1_CSID_CLK>,
+				 <&camcc CAM_CC_IFE_2_CLK>,
+				 <&camcc CAM_CC_IFE_2_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_2_AREG_CLK>,
+				 <&camcc CAM_CC_IFE_2_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_2_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_2_CSID_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "gcc_hf_axi",
+				      "vfe0",
+				      "vfe0_ahb",
+				      "vfe0_areg",
+				      "vfe0_axi",
+				      "vfe0_cphy_rx",
+				      "vfe0_csid",
+				      "vfe1",
+				      "vfe1_ahb",
+				      "vfe1_areg",
+				      "vfe1_axi",
+				      "vfe1_cphy_rx",
+				      "vfe1_csid",
+				      "vfe2",
+				      "vfe2_ahb",
+				      "vfe2_areg",
+				      "vfe2_axi",
+				      "vfe2_cphy_rx",
+				      "vfe2_csid",
+				      "vfe_lite",
+				      "vfe_lite_ahb",
+				      "vfe_lite_axi",
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
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "ahb",
+					     "hf_mnoc";
+
+			iommus = <&apps_smmu 0x800 0x440>;
+
+			power-domains = <&camcc IFE_0_GDSC>,
+					<&camcc IFE_1_GDSC>,
+					<&camcc IFE_2_GDSC>,
+					<&camcc TITAN_TOP_GDSC>;
+			power-domain-names = "ife0",
+					     "ife1",
+					     "ife2",
+					     "top";
+
+			status = "disabled";
+		};
+
 		camcc: clock-controller@ad00000 {
 			compatible = "qcom,sm8350-camcc";
 			reg = <0 0x0ad00000 0 0x10000>;
-- 
2.51.0

