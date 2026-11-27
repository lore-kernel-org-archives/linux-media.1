Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789683;
	b=xU0HJ7uB95CAqZROciQejZh6118LNPyr85iQR2Gs5WE1cbToRpLdwp5iZCz4aUSuMABP
	 Sl2qL4pHr91oPZqa66sEG0AMUYl264k80gADDlu1RQWH/sHv9vUaxNKpg/okGFapAC8c9
	 3h4/eHgbAf9VCgDNrMQFmVQYU+ZPRUbqdSfYrmC3B0iCdq/W7cvhTE/fBcoDnYj3CxdKZ
	 PcoudPJZWdZqRxtd63g0VrVjI6AIslTt1jRaMZiCziwCxQkmeR5FWFuasd9Uh79agtwcw
	 uSkqLfZfnWiW9cGnFPoKmOrE6oCO6WRna/W5o0k/zEOwh/kAwApZdaR7pOAL5IlDWyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789683;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=eo/GuDWg8eQutHT7KhO8Mc5tBQE75yofHAXAdbk1Gts=;
	b=r779p8uIMKvvULjd8EV4Ln8AwS8NCNG6jyiwzWuEhUGQs028lOfDEv5kIgkZcaoN8+GW
	 Rr2mzJDSSmmDU1rx60vyV4Pnu6gBo8NLj+QNPOspupI7aamEyxzP+sgS775w3tX6iXdSg
	 bh6XISrYZEPGgvuzLLaL8/ely5S3OX5sgeUOzAZACuYsBmee5tPjyl3SPrslNr4PnV1T6
	 4NBuCBnVguHwfzM+iPXgmiEyjINjATPscawM1F9uMKAAolCKroYjhax8C0oFlJAkxgq5B
	 IDuVyrnZRC6MjwJ8UxGRyWXuGMiL8j/r3FIMU+Wgm4EzbXBv0Qk3pgeY+RTzxZyQOqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dCmbGF0G;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4096072F01;
	Fri, 27 Nov 2026 14:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dCmbGF0G
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C43B1F0280A;
	Fri, 27 Nov 2026 14:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795789682;
	bh=eo/GuDWg8eQutHT7KhO8Mc5tBQE75yofHAXAdbk1Gts=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dCmbGF0GsGMyujnB/igeq9+tXLsfLEHEcbcTFgsX+YR0P5ezCErrBJ8MPYEJaI0xs
	 3Q+t9NduwobpeLLNtKw23exVaFMKT1T6hYGY8DHyFqSi7Wvhelj6UEDVbYzEK11/6a
	 ea4dUErGOlWwfKBfdgWuMj/KaPk8lvut2hQewwmNM244qvSnwekgO38as4vqD1gdPH
	 JqPQPCKOCTWLLdbQ6yJFv1xbPl4CIpSztdGtVYlFU76GSPplfuVeWxiWTGvXamh3/X
	 qd+wf5QHjbFYqQq9iMZnwJcs9bdMpsxZf+kC6MxBNV6P38UQTGoKAcCRE/68DKe0rT
	 +rcgfJXhxbYyA==
From: bod@kernel.org
Date: Fri, 27 Nov 2026 15:27:26 +0100
Subject: [PATCH v8 07/10] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add pm8010 camera PMIC with voltage levels for IR and RGB camera
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
Message-Id: <20261127-x1e-camss-csi2-phy-dtsi-v8-7-2793b8e5138c@kernel.org>
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
 linux-media@vger.kernel.org, Daniel J Blueman <daniel@quora.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2299; i=bod@kernel.org;
 h=from:subject:message-id; bh=v5YcOBGRZMQ235HPeo8gbxdnQRvcKx4Xoc01Wp7ucV8=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBrCZNSX8pdeKjHi4Q/gLRWlawOkzhFVfIQVi88H
 1UzwT0hhiOJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCawmTUgAKCRAicTuzoY3I
 OuL4D/95xsLVhYJXY+hk2IK3U/CgkQT0IEs+lfmRckvv/RfxM58dBgXGkoGyGvRa2JpjeXej824
 ngPORITXRPjeLFwdEcNk32bJTJ0/TTYYuBp4Gv1kVNvTBkY0/37m4OldSNNkcQ/+cEI0vtrBT+u
 iqd8Cxiu2Miya2AxBjz+OZ9dKcUZodmYPUgqTY7WOZDCSyaNaioeWxUqPeOsU4cCnWO+U/ziNDL
 U/QGdXIE0F1Avxn5cFCLwjWChThsKOuQVHHjDmhUOw8AOMVaHfpPWyAQ12sZu7qdI14vPGVe2A2
 meM+nYHqvP+VKt//+gd0zDieK1aK/5/Ptretx6qZ6qG8vEAvAaroVhMYsWpbyIv7ktz2yZbaBfe
 jw8LQ4iZPoBlVA1YjWSkZzmK2Ud8Nuq1tSd7RGFKFWKZMcGdPseWwAwaNEpljGJ5Q8yDxDxU5ax
 4aGE0ofiLS5lyfURScDN9qXiRyJueAolMzmaMK4SncOZ9xf3KbU9rXIXWH/RD2NGGvbbEufIRTs
 nSByIj1LeJ1ZxZvFXRnBFTSIyZx6Smb7imLetyE+IFtoJlfe+mYhLJUWDUmED8Jhmw6nC3kEgWk
 xF7gSWMU0TIS5TesaKJnrAPekgahVIf99S2DplTwiOvJnyQT8gjw9pAs5JMA06ypc/9V0n4tOm+
 SdWIxMpvPCs8AZw==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Add voltage regulators-8 for Camera on slim7x including:

- vreg_l1m_1p2
- vreg_l3m_1p8

Tested-by: Daniel J Blueman <daniel@quora.org> # Lenovo Slim 7x X1E80100
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index a807744d1750b..5ce1a7755c97b 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -795,6 +795,57 @@ vreg_l3j_0p8: ldo3 {
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
 };
 
 &gpu {

-- 
2.55.0

