Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789660;
	b=VINQM2seZ1SDsAvwu3WhzCzkf5TH8R7nFOAfB+M0q5pIWDxNNFUbB2AMIfgK2olNh5u/
	 ehC84y25fre0nSm8BHL6AtUYND+1rLbC4Gup2UXDKdSl8FdSBM5/eddrY68NYQH/sP9jN
	 AANLKHb2r01AMpga3gDZyrYViYQ3GTHUz1gn1YefSsPQOORgf0ERqttvPA1bVDsMFiSO3
	 vTO+27UAVdCJb3RTfcPcDKyWrybc00DAbQDK/GGi7yJWLeRYLufj9Qz05Fv0R3I4RfGme
	 TjQN9CHyafMkBn0ScHgkW97GiZWziqJxxHX9zmdCVvBcqHb8dxl96WWCEwWmaw5oiuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789660;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=yQ9sYHqFxRJ+gS6aazrlY25MKQroskpch8/6ptoLqZI=;
	b=LmJ9Ib9nUFAONhilUFd1EfPoUE039H14Y/lt80vTMWgUzdM4qQJdjeAIlcJyT25uQGL8
	 J9qMTp2PO8X8gUDMr+0gfToUDrSN6rhjrZD8zYf76z4JohTwqqNmCBJ3PPj9WLy8u7amo
	 dpYmI19CLyIDmMgTaJEFCTMkWxEoV8nuBC7DWadqLhb59ObAPTzmmyBeAGkjiUnu9ppnu
	 bSNYeMDDvf48Sv4w3PaOj0fNwhZmxnRYjHpg+NBmK9lJjc0nqPso985abTk1qCWW0aaTz
	 /Th1WMEQx4AivemWEGrw5tpzsVsClOD6a9ZJQwdLv2/uqQ59g8VVFi2fjUrrWGvVmbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eVjk2wE1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0653F606C2CA;
	Fri, 27 Nov 2026 14:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eVjk2wE1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B4A11F00A02;
	Fri, 27 Nov 2026 14:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795789659;
	bh=yQ9sYHqFxRJ+gS6aazrlY25MKQroskpch8/6ptoLqZI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=eVjk2wE1/frb/lkrnIHXc3DesJ8p7EXjXZvsZQA/zjtTdFz0O3tSRcmx0P9Rvy9ji
	 SLPDqgQ2/2+BUXt34uIo6J6t9yCjfvEXlJ+dVHnMUcom8iID+6eQfJgbkRwWacWzhZ
	 lDWV96gEhDZPYMy0ZTCqcxv1xJnEm1Js8mHJSsGIK5A+yVJUkr2iaC4Fxob7KIGyLL
	 VlBkpFqora/VUcGfragk2mz7IVRnYfcQbvK+xKIrIdBoATmD4ESyByD0SUMiDMUDew
	 Of70r865/QEIj7XP3PY7PPRETHCuqvcMCQASfm1+ItpN0DUpZj4p3P+IXmbL5UgosL
	 TCgvby+cleciA==
From: bod@kernel.org
Date: Fri, 27 Nov 2026 15:27:20 +0100
Subject: [PATCH v8 01/10] arm64: dts: qcom: x1e80100: Add CCI definitions
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-x1e-camss-csi2-phy-dtsi-v8-1-2793b8e5138c@kernel.org>
References: <20261127-x1e-camss-csi2-phy-dtsi-v8-0-2793b8e5138c@kernel.org>
In-Reply-To: <20261127-x1e-camss-csi2-phy-dtsi-v8-0-2793b8e5138c@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-media@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Lloyd Hazlett <lloyd.hazlett@gmail.com>, 
 Liviu Nicoara <lnicoara@thinkoid.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5198; i=bod@kernel.org;
 h=from:subject:message-id; bh=R0AT8lbeMkn/nTKEi/z+kREy7lthefPeF938wJ+ltdI=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBrCZNQFaN0UjZR6sl35448w/n4ehc48gT07LhUT
 d4MP6wGSNOJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCawmTUAAKCRAicTuzoY3I
 Om71D/9kJ0yGlOe2f4nEsur6hjb+KRXyHjUHRYbMuj1dXOBUAaGTDenuaAaqIY1xYRxb2s5ejQf
 bKnY2GNu6Nsvh/2Xzch+36umwNSnlaVg2/ewGIIUaL8cHrfn97z66AsgyZl1KUh1wgwDLrcdhCK
 9f1eB1L2pJpvqvgOl+scOi7mIsnKy0/YcBU8NYHiJ2WhtlyxmH1UAGhQ7H8UBayMnfi3GfOg3V6
 3r/b/pIkv7LtMek4cEpDsdlq76pWWd7fKfVbYldf54MXJs50uraqYsmYF26QSC/9nUQBP3L88TZ
 qTyiOrd1w/LTGbkjKxCwomrfeQqcPARxcZbXEGaRXC5oG24kOA1cwEzm6NeSyxny8li9PppFlIa
 jxWleKeLTltZvVsxWM93Gd1Y8juSsuYA6f1JbZmpx5XF2Ebe3bkelP6JKjpdRJb7R5U+rO06qtw
 LQquYTQZqcUO6XvuzEyHnWH2gNhkq4QUkiZKVxEaUX7WZmIaXkkXgM5Dnm2Gq6CMYrQNjOf67qd
 Lc4N/qMeNvPp26FBSBXDlNMvajZMyxI8BENPKXWjfhrw3Ms9S8jrWcP9S7zXBVxaMYETHagxrDf
 oAKJMU/xWXVw0kt7OQOPAE1jhkgBnfh8rwJYdJE69RxZgbvGsvB3X3C1T8sPtJwIXB3lO7gRfWf
 q+xO9F3jBplxlMg==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Add in two CCI buses.

One bus has two CCI bus master pinouts:
cci_i2c_sda0 = gpio101
cci_i2c_scl0 = gpio102

cci_i2c_sda1 = gpio103
cci_i2c_scl1 = gpio104

The second bus has two CCI bus master pinouts:
cci_i2c_sda2 = gpio105
cci_i2c_scl2 = gpio106

aon_cci_i2c_sda3 = gpio235
aon_cci_i2c_scl3 = gpio236

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Tested-by: Lloyd Hazlett <lloyd.hazlett@gmail.com>
Tested-by: Liviu Nicoara <lnicoara@thinkoid.org> # Dell XPS 13 9345
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 150 ++++++++++++++++++++++++++++++++++++
 1 file changed, 150 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 443c1a5c212d9..08ec53d01b802 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -5548,6 +5548,84 @@ videocc: clock-controller@aaf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		cci0: cci@ac15000 {
+			compatible = "qcom,x1e80100-cci", "qcom,msm8996-cci";
+			reg = <0 0x0ac15000 0 0x1000>;
+
+			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci0_default>;
+			pinctrl-1 = <&cci0_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@ac16000 {
+			compatible = "qcom,x1e80100-cci", "qcom,msm8996-cci";
+			reg = <0 0x0ac16000 0 0x1000>;
+
+			interrupts = <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci1_default>;
+			pinctrl-1 = <&cci1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci1_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camcc: clock-controller@ade0000 {
 			compatible = "qcom,x1e80100-camcc";
 			reg = <0x0 0x0ade0000 0x0 0x20000>;
@@ -6145,6 +6223,78 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 239>;
 			wakeup-parent = <&pdc>;
 
+			cci0_default: cci0-default-state {
+				cci0_i2c0_default: cci0-i2c0-default-pins {
+					/* cci_i2c_sda0, cci_i2c_scl0 */
+					pins = "gpio101", "gpio102";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				cci0_i2c1_default: cci0-i2c1-default-pins {
+					/* cci_i2c_sda1, cci_i2c_scl1 */
+					pins = "gpio103", "gpio104";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci0_sleep: cci0-sleep-state {
+				cci0_i2c0_sleep: cci0-i2c0-sleep-pins {
+					/* cci_i2c_sda0, cci_i2c_scl0 */
+					pins = "gpio101", "gpio102";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				cci0_i2c1_sleep: cci0-i2c1-sleep-pins {
+					/* cci_i2c_sda1, cci_i2c_scl1 */
+					pins = "gpio103", "gpio104";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_default: cci1-default-state {
+				cci1_i2c0_default: cci1-i2c0-default-pins {
+					/* cci_i2c_sda2, cci_i2c_scl2 */
+					pins = "gpio105", "gpio106";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				cci1_i2c1_default: cci1-i2c1-default-pins {
+					/* aon_cci_i2c_sda3, aon_cci_i2c_scl3 */
+					pins = "gpio235", "gpio236";
+					function = "aon_cci";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci1_sleep: cci1-sleep-state {
+				cci1_i2c0_sleep: cci1-i2c0-sleep-pins {
+					/* cci_i2c_sda2, cci_i2c_scl2 */
+					pins = "gpio105", "gpio106";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				cci1_i2c1_sleep: cci1-i2c1-sleep-pins {
+					/* aon_cci_i2c_sda3, aon_cci_i2c_scl3 */
+					pins = "gpio235", "gpio236";
+					function = "aon_cci";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
 			edp0_hpd_default: edp0-hpd-default-state {
 				pins = "gpio119";
 				function = "edp0_hot";

-- 
2.55.0

