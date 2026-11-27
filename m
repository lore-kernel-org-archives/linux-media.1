Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789675;
	b=5tq4TqmDdAKEXq2DncBJEKJl35thD1VYD0G2AhGhRxXYkYNQgCAXvOmHRzvIw6NY/je1
	 p6gyb+jOuxOGz37OSXSadSaYLuPYY1RBnt5sRF8rBGyVcmizszktQU2/Zh5k96p31mUl6
	 anwkkrYF7GyJkuZj9yAYUe5+kYpNvdFjUvGx4gXNGgv0z+04h9KWW3pLVhiXULqOK4gdX
	 bTUlE7xEXCzE5fdqfacXqZUmuHNXGeErPI7Hvfu5OiCp29LBS13To9xvqhYQxUIJooJVo
	 VwETI6SY9jjIXIJBycMrGRWUrmV9NriJAllgXv4Jrys9vtgxtiSHf+SYQLPGNNIPhMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789675;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=0Ba9wbO5bzHDC5jnX0a8EWZ9R7NOk0MXIaEnoD33SII=;
	b=N+YFCdzwroT6UNdWUP73pe+JBDCKYDeAH/QAp0xbpq8kh79OOZlJ1aGzCLLZ16F2d79E
	 Dwurq/ScSctDntTYvEHac0nesqFT0wck0csbLbbojZzDK2EvvOJhOBaMHbxztm2UgpUke
	 YFKwlyLONGG5iBY5p+raIbFd0fmRal7QLMrw26GWyasAsRXlDi3lvvfp+rxiYdP2tzweJ
	 FoPr1bdtIMbdyXjygPKKTkusVSenyVY1uayALi4vou5lz9+RNCJjypgdr4PM0JbhJR2hE
	 xaXC6s/zqL7HuiZFzRfmzCQDZNrjgVyyhfR0s0UPENO9IzPrhawYCbio8ObF6eqRahg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LP6xSRX8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77881606E112;
	Fri, 27 Nov 2026 14:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LP6xSRX8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 437981F00923;
	Fri, 27 Nov 2026 14:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795789675;
	bh=0Ba9wbO5bzHDC5jnX0a8EWZ9R7NOk0MXIaEnoD33SII=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=LP6xSRX8eLDpNtcPUSazodGpYkTk4S+mO6UC9mdJ4GqngUdOrpbr3WYEoFNnIb9RZ
	 TeShllfmlBorJ2Q4KU+71pkU/1azzakUZAAXh2zQvoVkL5VIBvgbbEZgU+YXaHjJIM
	 /ICkhDq3givn9tABAtDR8Cg51AyPKHQ6Z8AHwRGwy3GVadonVOFKRhNGtY42bsQnMb
	 XiCwJRvhOKGXVAZe5D7qSMEzOLF1guipoO2l0aplbofowbCA0vz9+VjRtvNlJGmU7V
	 rOJoYPq5HsI8FOpuCsBZgBKAJz9LuIsIF8eKMXSuvNqYBbUL8fQlwlskBdXY1dQpBR
	 l62zc/vJFZtYQ==
From: bod@kernel.org
Date: Fri, 27 Nov 2026 15:27:24 +0100
Subject: [PATCH v8 05/10] arm64: dts: qcom: x1e80100-t14s: Add pm8010
 camera PMIC with voltage levels for IR and RGB camera
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
Message-Id: <20261127-x1e-camss-csi2-phy-dtsi-v8-5-2793b8e5138c@kernel.org>
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
 linux-media@vger.kernel.org, Daniel J Blueman <daniel@quora.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3012; i=bod@kernel.org;
 h=from:subject:message-id; bh=RpEwThJV4oka1u9oEpDuLyQaEpAuV8FB1QdyVd02E4E=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBrCZNRTBlVRIidvHM5eJ15b+RlypdIKVRLDagbX
 ++j5+7fW3WJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCawmTUQAKCRAicTuzoY3I
 Ooa0EACbPVvchLtsAbBOWSqp22t62zdJ+RuyWBiua4YMCnhr8ZJ3ugHR/bPN7Qz/dpkVixokuN8
 p7qh77nw6WKi7oHZOWPWuOU9twh9jUqOOHBv6LQ8weFdkgGHBHxzDlurVgtWybaANmx6Gn1r4ZP
 BZ+UOOm1Mq0ZhSr1keC05QftWfqmuGF5eXFeX62PK5UgHH37ooy0jFOrKDaaKQxfYOpBcYd+OyR
 2dgfYW9IeieOTgS3Tl2tOmm1m+Z0Ve0bFu6XzzFprg4XSGDSRsS20Iyuy/4eWn95fI6jsqql1Gl
 y2b96YsQ56HTKx11hfoDZCeIkNkz4e+pgVtyewPjVte1VEynvWP2gU15lTEN6B8Hqyi85/+OChW
 ozNKo+pmt3p7TraUfMKgGrANC3FaUss6IouQwE2WZBnelpUlR74l2oQi08/mFy03NBSyAYmDLrk
 xLMM5b9bd0IEUFu4DltOYJGgrqw5nv3USpELrbM27igwaSTL599BOOu+l8xNYeCV0i1kNEG4nCx
 O6QKnpQU5TAmsG91GZMaMVSg5M6WMdfwTImuut1GQAFq90J+gqTF4yW6wDpGTQtQIo7jYz9kxL0
 JiemKP282QPHlnhrX0/PlVl//OKGnPbsuWtQWKPvm96Vb1ukx9ditstosE6MXkenOgI0VrefbdE
 TwFF8ZRD4k/MCRg==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Add the PM8010 PMIC providing the following voltage rails:

vreg_l1m_r @ 1v2 IR sensor
vreg_l2m_r @ 1v2 RGB sensor
vreg_l3m_r @ 1v8 IR sensor
vreg_l4m_r @ 1v8 RGB sensor
vreg_l5m_r @ 2v8 IR sensor
vreg_l7m_r @ 2v8 RGB sensor

Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
Tested-by: Daniel J Blueman <daniel@quora.org> # Lenovo Slim 7x X1E80100
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 1536ad8d47933..e239ce1e3fdc3 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -644,6 +644,13 @@ vreg_l6b_1p8: ldo6 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		vreg_l7b_2p8: ldo7 {
+			regulator-name = "vreg_l7b_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
 		vreg_l8b_3p0: ldo8 {
 			regulator-name = "vreg_l8b_3p0";
 			regulator-min-microvolt = <3072000>;
@@ -887,6 +894,58 @@ vreg_l3j_0p8: ldo3 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 	};
+
+	regulators-8 {
+		compatible = "qcom,pm8010-rpmh-regulators";
+		qcom,pmic-id = "m";
+
+		vdd-l1-l2-supply = <&vreg_s5j_1p2>;
+		vdd-l3-l4-supply = <&vreg_s4c_1p8>;
+		vdd-l7-supply = <&vreg_bob1>;
+
+		vreg_l1m_1p2: ldo1 {
+			regulator-name = "vreg_l1m_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2m_1p2: ldo2 {
+			regulator-name = "vreg_l2m_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3m_1p8: ldo3 {
+			regulator-name = "vreg_l3m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4m_1p8: ldo4 {
+			regulator-name = "vreg_l4m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5m_2p8: ldo5 {
+			regulator-name = "vreg_l5m_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7m_2p8: ldo7 {
+			regulator-name = "vreg_l7m_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
 };
 
 &gpu {

-- 
2.55.0

