Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789686;
	b=QLdpPAV/7IlnsPdEBxZzwhtmtKK2ymF63dRPARZDpc/4V9uVu9FMwmzbEeWgSAzZVC9L
	 iLSr56yA0HXSzXv9rSkhRqo2I84iM7dl0nHvizO4ca+4FSuzu/IQKR0Suv5OrcGQPxWJI
	 9/6RGJipxcjHU7OS02Oir659f7o1NcJSKEcWUK6GVooqCCRLw661uNRdR4/79Ht/vtplM
	 737Om+3QdeCIwQIPwLK4nEctT1BGLxuektggusQab7MSH6PmSHmLllWYHRfl6tZsnok5t
	 /jmyaMfGqSJSm945HSzuXIwe2aHrtWmWIi/MMZ9yyoMpm7eN9f7OIRsAxwC9jPBZlZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789686;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=qtQGiGT3R9V7rm1WTzExgPL6NHrjFsY3wZC9a5k6mDQ=;
	b=XiePp/YVZjZY/hbLJPx0NcnqgO1iQcGJ5bywsLTOi70BPp0qVatPu7NQwF3EZMcXLEnj
	 sGNPqyzChcEffz1A8K9Dgl37BGYS2cZGQdgAZUiwcJucZHR0ZsftoI45rODGe82Ef0Dyl
	 8i4eWQlc/KWez1t5LFomWJhIOoO6r4ElAnLMkDRrXCXn1FywqgVO9zZlwKr3dhVrJghLG
	 1AUvzRwgVYRm2ZP/Pdzf4sit6wjJUkM+E73p3+gjIMG6I5LWvFDLH5e/+oRd4HhUxB/Rr
	 f1eC5/03OCTCk+JpaIxcgemQliRUue3MaZ/hq9v3Fwq28eDQwg2CwlZB0XdL9bFI5OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AnwUEZM3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65316072F2A;
	Fri, 27 Nov 2026 14:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AnwUEZM3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56EFA1F02826;
	Fri, 27 Nov 2026 14:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795789686;
	bh=qtQGiGT3R9V7rm1WTzExgPL6NHrjFsY3wZC9a5k6mDQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=AnwUEZM3zs2GFsUvENruhWyLTAfgx1NmJ3j6bMRHmb2GyA86ZpHhTyc0cTyQP6uRq
	 DMOO2R1LgsBBEngLjXsLjo365h7Uk8ON8ZDGb0s5TyU5MZH4HumTocXyabjLDHI1n1
	 Y5YVQL/5HZQtEMHcvcXFbwzwn1F+WBTwoxb2nzNLsRM3aY/tWjupl55xltsO2EiSb5
	 30fjhzSP9dJfTPLc/sBgNpubOz0Eg5ZkAyBdFBwQuBvZ+hcOZeTC5b03MB16vT2CQp
	 6F9KeA8N+J9XI2p7hj4K9t6M2yNz06IATf18dNWsEQ/rKF9GMZNG/aEgKOz45AjO8g
	 oullsrIDnqZrg==
From: bod@kernel.org
Date: Fri, 27 Nov 2026 15:27:27 +0100
Subject: [PATCH v8 08/10] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add l7b_2p8 voltage regulator for RGB camera
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
Message-Id: <20261127-x1e-camss-csi2-phy-dtsi-v8-8-2793b8e5138c@kernel.org>
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
 linux-media@vger.kernel.org, 
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, 
 Daniel J Blueman <daniel@quora.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1194; i=bod@kernel.org;
 h=from:subject:message-id; bh=ey3cdzZmdSMUaec0xY8Jge1IKS3EJP5ovfvGXvYrTiY=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBrCZNSB5hOWWPilOjiItDrzmPElvygo4TDLYhSB
 tAL1fZCPNSJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCawmTUgAKCRAicTuzoY3I
 OmBQD/4jkECf/A0KuJoU7er67/MU+P5e3tdKkvbl4D/xaK/aXjolCVev1dfc+setioN4v7uxFuu
 ZK68NownmjDvtwGo/6GbnfnjFfeb4vUpsGPKzr9R+X1NxdayDuMhjvBYiWf/VavBXgwbJHl2VTb
 6ntKWzwGmZKzxgKMGOfv61hWSqGMLPSYu9AjK3DtN8ZzGQSPtzOqecwbtrT3fG+UBPj2BmXP1Ck
 MhOEcPpXw/MxTO/E7KEwXKCtx9G63dMHqBi5AzbV5HAHFa/LnUjBcPYN+EANxKHiZSu43IoqmaE
 rHEWqFV9JmLHdWayEQNP2ws0MNy+MrD2LQO9PFqRNN59sgFRZ5ZcrtItfWR4MEKifaE403XdNzF
 kFQZUKbtq720tVLxii4j2F8TIgz3wvsiTykg0Xux+GGWXb8qqio/c4H/g7lyMcQuk9d9t8tVitl
 5jx+1safwAwEia4CCARdSRkCdiclg5AoEzWZtCXRg438IDG4oSMlbxdfj2VPsq9eHUPaMmDqTFT
 RaqmYL8+kTKBUSvvpZOcKgGHsAB70PhNyEOcBfxLUEOm20DpwTxi6CpmJxcTSRssXKQ9d9RnCyP
 MXytypqF88pkgNUSB7ZxywqqnjLxrq9IxTH4iUcdVOntOSb5gDkFubMNsWTxEex+AZcXTqGzCfm
 JzDq12lGXMxXvLw==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Some sleuthing work by Aleksandrs Vinarskis in the bowels of the ACPI
tables for this part shows we need l7b_2p8 for the avdd supply.

Suggested-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Tested-by: Daniel J Blueman <daniel@quora.org> # Lenovo Slim 7x X1E80100
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index 5ce1a7755c97b..a1629b0824e01 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -552,6 +552,13 @@ vreg_l2b_3p0: ldo2 {
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

-- 
2.55.0

