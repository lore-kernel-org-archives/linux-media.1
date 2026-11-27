Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789668;
	b=oguG3QBKIfek99frFeLJJbckctUM3bJxNLFwYeeDiLUJgJIE+o8+cYk/Cd1fDHYWwo40
	 1m2WOP3B9XhXuyAMOVD2eT4hYSb+f7xvfmRDeM7ONUwOf+ib4L2Ivq6DrbJDh7qLuLL/v
	 ti4IvtLaCAQ51l5Dv8azLguyn6eXaLS8+9g/41GBiqXeYYK6GcLkuLWFPFKHWCEL7WXQP
	 +/YYW5huAU50tcQN3iOi2t0DR/CDrFTnLXlGxhvEJ4VZ9bC5J4fy/pLHfwMaUQJlGbVUW
	 0gia+QVuLai1yVkG/1iho/NxXerzG+TQ6D1RwU7ou77saJDKsudKBVKU4QYqJFbe5wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789668;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=VwXzym3R0m4GeTYyG7Jd134iPUZ0NoUve7zL6cn/Qpw=;
	b=X4hF+G0+nk1D7dsARo4wnJO5j+uIdhJUttIPYAn9aCzAjHZfqteZID1z2AjB6WuCeXCy
	 VZnE7hU85hRGp594zr8YhxPSmvL9dBloHFiwszBn7sw5urm6x/20KygF8u2ljvHNW0OJe
	 pOX68IVTXc+lWjAZPV3ELABVU26QDPC81sJrxXt1WgwovCqCXQCXUEN85CEZmWThI57hd
	 SLt99kN7PEXlhgDO4ZDQ/ddzaewU7jjpWUx04dwgdv1PXrXwfgjHm14VpwaPKCamnYmdr
	 7iJfR8DpSefRW7RkSytJSsFyOU0odcBt+75brDOlhgmK0gazxhqADNH9zp876J4InnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HUFxZ7xN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7276960A6F6E;
	Fri, 27 Nov 2026 14:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HUFxZ7xN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E3801F00926;
	Fri, 27 Nov 2026 14:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795789667;
	bh=VwXzym3R0m4GeTYyG7Jd134iPUZ0NoUve7zL6cn/Qpw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=HUFxZ7xNnrA4YMDDgW4gkzAFy0dgupfADQtRU7/Dz+jmm8XIZwgqG51XSUnHLSWYI
	 Ip3OOYeXBgNFXzPhnw72KfJoY6X0yEm5B/2rNl9nvzZyTWaJTxu+DbbGx6ZJlqnMC4
	 i6N1qoyfcELdYLebRG1QBRkxjjU5fQNomBNpg7igLoP6/wK+prx5oApzDQ6ma+OW5g
	 dQhxervHFx69a+FPlFGDGbh3wzpZTvhbtH4eNrI0rlzuVPVupGMoC/+SQupJmXEa9h
	 GQkmEQN/F6Wui4zXihZRYSjpn0qjiUJUi3jQcOY9p2WhoaYW6o2Fum0ogH2y/eXFci
	 RFBbavazwWlTA==
From: bod@kernel.org
Date: Fri, 27 Nov 2026 15:27:22 +0100
Subject: [PATCH v8 03/10] arm64: dts: qcom: x1e80100-crd: Add pm8010 CRD
 pmic,id=m regulators
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
Message-Id: <20261127-x1e-camss-csi2-phy-dtsi-v8-3-2793b8e5138c@kernel.org>
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
 Daniel J Blueman <daniel@quora.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1683; i=bod@kernel.org;
 h=from:subject:message-id; bh=m98zNi8pBrUL39OVAkKx28ff1PPR76JLLWS5tNuHtOg=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBrCZNRUzHbJEiXYo7gE8bVALmsMKdfvpH/CxQdM
 /GXxHc0JJuJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCawmTUQAKCRAicTuzoY3I
 Opm3EACJ0NYymTZ+Kv7kiTWS4bWm2BCQ5oe6PUwZOjNjQMUcDvpiMYHEQqnMLmjDVw2lMR74rA7
 y/PRkaGyrzqyvgxgl46Z9EPAzo7P/adHe7vAzoqXlL/nS+4pThMSkpbEyDtK5QLjFqMfg6LfmfN
 2NAOwzj6hcv4tHuy06aVQtcfLIu0ETxEqqD1RY1waBj+n+yrzaxVcOIy2C0q4wZ9DZsO0bHYFDx
 JEuZSYPw6GK26Tcrq8MgvHSin8iY6fjZRidyGje4VFVGDXW8Esd9hUgVvm/azmozfUhk39zuEnL
 yJpjntEblbABRUgKYcNgUbhYv7PM3tJKY+Pb5VUg3h8f1zFqLB1J0Wqt75dnTeij3i01y4DNFTK
 tHhiTunYCYip5HwcvCx3MkZr6Xj25KVcE0tfQvsU2gBLtvzQkhcyES7DT4ft4yk59s4WtLb4H21
 sStlIJwzyyYIG79SMAu9ZLRrezd70vl2xhTW1JI4EBZeDo4ORnqG6cV0wuZPYbOkCbNkciF0Ds5
 8+TX7+VfvDNaQQbgSh42KGFNj2iWJDR3Pmrvx1w1NWxP/AFXqWggxg8RsPEn7y6i4H5/pe/Vcq7
 dx3u8vXjccTIhBhEV7bUa6JLTzlIzP5bNlHDSmanf2nv/O5CWWDqdCrqXATZ9mHbze8tOVD3zlM
 0m84Dp6Gs35WUhA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Add pmic,id = m rpmh to regulator definitions. This regulator set provides
vreg_l3m_1p8 the regulator for the ov08x40 RGB sensor on the CRD.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Daniel J Blueman <daniel@quora.org> # Lenovo Slim 7x X1E80100
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index fcd7cef6660fd..71c819aa2d43c 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -897,6 +897,36 @@ vreg_l3j_0p8: ldo3 {
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
+		vreg_l3m_1p8: ldo3 {
+			regulator-name = "vreg_l3m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1808000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4m_1p8: ldo4 {
+			regulator-name = "vreg_l4m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1808000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7m_2p9: ldo7 {
+			regulator-name = "vreg_l7m_2p9";
+			regulator-min-microvolt = <2912000>;
+			regulator-max-microvolt = <2912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
 };
 
 &gpu {

-- 
2.55.0

