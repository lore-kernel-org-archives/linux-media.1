Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792773091;
	b=uBz0geHdwwhwLjhOhWk8SgzDGY8lrM+KWomg0CIwAlvrkb/5pyuSb+tD4H2m7U/axLBZ
	 FK1M7q5Tx6EiXL1d6ZgbN1qCF2PNXwyTvNUI8Zkpt6HNztvS1QTAQjKEzX3Bla7SfKtoC
	 YIDnxb1W+sbIGtyfcETCI6T+psQdV6gKIYEnZ6+/Ub3Tsz3Q1e0GCJgFKvSkkkiPMM82Y
	 BnBAg7IvF/D8SmWaIdhsr/DD7ln6JyxSL58hhGlHMUsiRxNjzaGeMsDgRKEB0irRpgWtP
	 zzSC0y5vy99j9DO+JwR8z1erdafMMlyk1TT2CKtUI3FnaWDKqDH3M2LpOdtXDTOAuqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792773091;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=9OBLysERVKI0mTP1gmUyg2K+fopZDSSLSHMaqGKKL5A=;
	b=QofFY3nxr0QoAwxrzyhRrlIktJjZ5B7kbvdWcGhCuSGO8CtDY1ToDnVpQu5Wyc2gzx7e
	 +lYS9AVnh3Di/MJqSk4l6DmmVFyoUIKeEL+z7KUCphw3/UMdzZYvWFt5s+TJw/8BagXSn
	 L75rgTBVTDtIK4jmuKmlu0wp6C4Iff68hZDPmi9iczxtiUZN0dg+vNzTRAf5fk9+uHAcT
	 mNo1bY9lfRPYzW2kfqXCO/6babSBubggbkaKSh4hY8mlXkrmt89/RhEQb9CXAqhTRkzcS
	 RziG59oDbWJt+GK7KxV78IsKQKa9VJy6hCt5Trlczj+h8TYF7Cr0P+6Gg1yPgaNJAtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=enVU13qq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D660A606A31F;
	Fri, 23 Oct 2026 16:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=enVU13qq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC1DE1F01825;
	Fri, 23 Oct 2026 16:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792773090;
	bh=9OBLysERVKI0mTP1gmUyg2K+fopZDSSLSHMaqGKKL5A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=enVU13qqaj0s3F5XthfcwP1po2ykbmNy6OWMzuXZP0Dc5WgBcG4pNCKz9V4GS3HNL
	 ckWBApoPq+vLwPhnkgrZgm5vqAG8ftdkFpDj6DW/UHF6zmz7JFVkIuN7smd9ek8/2T
	 Gw9BbcpuYeUDxt7zYIz7cJMsoWPz5xwD2vjWaW9Hjx0Lvg3HnQlwrkNybKDBAn1A2C
	 s+RTazNjdDsrTLJB70tSvqmDWWl+DsIZUJmQEFy3J6pAKl3LZlYnU3l4lhgk0IQ7yc
	 rtSHKYTUSyD6WNBX2OBQSfRtQtx0vg+jysE3M6ckqEy72TPoomQkGCOGYPv+/uC5U1
	 K0SZlTOZyaTOw==
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
Subject: [PATCH 2/7] arm64: dts: qcom: sm8450: Add CSI2 PHY device tree nodes
Date: Fri, 23 Oct 2026 19:30:52 +0300
Message-ID: <20261023163057.775917-3-vz@kernel.org>
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

Add device tree nodes of six CAMSS CSIPHYs found on Qualcomm Waipio SoC,
and a shared CSIPHY OPP table for them.

Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 280 +++++++++++++++++++++++++++
 1 file changed, 280 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 05417cb5c4e5..babf1a4196a1 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -564,6 +564,22 @@ cluster_pd: power-domain-cpu-cluster0 {
 		};
 	};
 
+	csiphy_opp_table: opp-table-csiphy {
+		compatible = "operating-points-v2";
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+		};
+
+		opp-480000000 {
+			opp-hz = /bits/ 64 <480000000>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+		};
+	};
+
 	qup_opp_table_100mhz: opp-table-qup {
 		compatible = "operating-points-v2";
 
@@ -3294,6 +3310,270 @@ cci1_i2c1: i2c-bus@1 {
 			};
 		};
 
+		csiphy0: phy@ace4000 {
+			compatible = "qcom,waipio-csi2-phy", "qcom,x1e80100-csi2-phy";
+			reg = <0 0x0ace4000 0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "ahb";
+
+			interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			power-domain-names = "top",
+					     "mmcx",
+					     "mx";
+
+			operating-points-v2 = <&csiphy_opp_table>;
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
+					csiphy0_in_ep: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					csiphy0_out_ep: endpoint {
+					};
+				};
+			};
+		};
+
+		csiphy1: phy@ace6000 {
+			compatible = "qcom,waipio-csi2-phy", "qcom,x1e80100-csi2-phy";
+			reg = <0 0x0ace6000 0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "ahb";
+
+			interrupts = <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			power-domain-names = "top",
+					     "mmcx",
+					     "mx";
+
+			operating-points-v2 = <&csiphy_opp_table>;
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
+					csiphy1_in_ep: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					csiphy1_out_ep: endpoint {
+					};
+				};
+			};
+		};
+
+		csiphy2: phy@ace8000 {
+			compatible = "qcom,waipio-csi2-phy", "qcom,x1e80100-csi2-phy";
+			reg = <0 0x0ace8000 0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "ahb";
+
+			interrupts = <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			power-domain-names = "top",
+					     "mmcx",
+					     "mx";
+
+			operating-points-v2 = <&csiphy_opp_table>;
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
+					csiphy2_in_ep: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					csiphy2_out_ep: endpoint {
+					};
+				};
+			};
+		};
+
+		csiphy3: phy@acea000 {
+			compatible = "qcom,waipio-csi2-phy", "qcom,x1e80100-csi2-phy";
+			reg = <0 0x0acea000 0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY3_CLK>,
+				 <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "ahb";
+
+			interrupts = <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			power-domain-names = "top",
+					     "mmcx",
+					     "mx";
+
+			operating-points-v2 = <&csiphy_opp_table>;
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
+					csiphy3_in_ep: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					csiphy3_out_ep: endpoint {
+					};
+				};
+			};
+		};
+
+		csiphy4: phy@acec000 {
+			compatible = "qcom,waipio-csi2-phy", "qcom,x1e80100-csi2-phy";
+			reg = <0 0x0acec000 0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY4_CLK>,
+				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "ahb";
+
+			interrupts = <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			power-domain-names = "top",
+					     "mmcx",
+					     "mx";
+
+			operating-points-v2 = <&csiphy_opp_table>;
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
+					csiphy4_in_ep: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					csiphy4_out_ep: endpoint {
+					};
+				};
+			};
+		};
+
+		csiphy5: phy@acee000 {
+			compatible = "qcom,waipio-csi2-phy", "qcom,x1e80100-csi2-phy";
+			reg = <0 0x0acee000 0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY5_CLK>,
+				 <&camcc CAM_CC_CSI5PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "ahb";
+
+			interrupts = <GIC_SPI 89 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			power-domain-names = "top",
+					     "mmcx",
+					     "mx";
+
+			operating-points-v2 = <&csiphy_opp_table>;
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
+					csiphy5_in_ep: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					csiphy5_out_ep: endpoint {
+					};
+				};
+			};
+		};
+
 		camcc: clock-controller@ade0000 {
 			compatible = "qcom,sm8450-camcc";
 			reg = <0 0x0ade0000 0 0x20000>;
-- 
2.53.0

