Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BEC43FD0B
	for <linux-media@vger.kernel.org>; Sun,  6 Sep 2026 14:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704478; cv=none; b=C9liCEz+O4ylH3e8RjjVjdLuP6dEAvss8tsGWaIidZyHjbNoxl6JzK81G629rhf+PRcFoNZyaB/9gXZ1NDm6FRrso6VI/3phayRTXmNCLryx7NjLTggHHUZiFgn5KgTYUBQauRl+UzQzq+Pdwrbc8hQdG3auPLP7NumqlhmpfYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704478; c=relaxed/simple;
	bh=J15wYkkaPvz3mj4SZiySkrYCu6ZA/yLyqk4CWooobME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rr/bK6UoDhe0Ei2GCG3iH9tPQj5pP1o7oxMcqQ6MqkZO3f3s1cZi7rKbpjKFSSDubu0r/zUKedcXWAQwbNJc/kyxGEmD9GxU/7XxnGJX62yHo8fswzVVSltRIqGCO4YRhIh5iJSpvSssGYYdSlDDm8MtlnWYBqlTOKCKKpDrv/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yLW/9z4a; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yLW/9z4a"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-482e4998d28so1971180f8f.2
        for <linux-media@vger.kernel.org>; Sun, 06 Sep 2026 07:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788704464; x=1789309264; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eFtpIogOJLD8BDVMTcndjqzTghhPJgSIoBnISPNLIM8=;
        b=yLW/9z4a80jIrP9Yp/Sc6YizP/Bw7KboVly1g1SnC3Jvn703QCKEfF01+PHWN4+dKi
         CLct8ieS/vDr1f6asje3HqRajPF836zm6gqPWv5PIXKkKI//qZwkhZekTZeWrHhftRXM
         YKp7WGDEBBt6kySlVHnIubIY4bLmv0Y9bTdmC6x/10uXgYbOEz5acFNuku7t0HV81k/D
         YiFusqPMoo5Y54TdKtQ7+7Qm5NmIybOX6hdmgmrh7GXCwBqCCxDaycFx/8ZsiSCwTxX+
         xkyxTSBbIsa3q1paGrrSNEb/RpP6PnxRQLqos56C8mME5XeRTVsJoR7ZaaLYgjb8kXuz
         KhmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704464; x=1789309264;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eFtpIogOJLD8BDVMTcndjqzTghhPJgSIoBnISPNLIM8=;
        b=gu0gL2Sz7PBcZzmhE7YP5ZSBBxjormKSFbcfPPdp72JJroXxWDab0EbgchM8dR7v0F
         29GyTL7FYanFaQq6A2tzaMYfZa5svxIRSoN12gSN39HBahZSb3M4peqsApkyt8EiJJ+g
         i/gvdcT9SjPI26f1+Uo9x5lzDSIH851tI23QevyI/WXG6JPa8Ww6HsStWZYnrlAULCFa
         w/rnnwqqNxp3GRbRxR2QiWcjx/wBAooJiBLzrQre9lb4/yNtULMVhoPryI5baBmGA3Di
         x6+t9V0YSIKhg3+1TSsGv8YCtPQEshrub/ij0jqAhll75qtWxQv2+BpyDsdu4S61mErc
         1uTQ==
X-Forwarded-Encrypted: i=1; AKwUvBwhrtTXs/z6qRX0XdBZAmopURf5vGKASpK2hUBEeFr4kuKGeb/4BXtQjtkJuFu5lOKGhL6FYDpxmBYdnA==@vger.kernel.org
X-Gm-Message-State: AFuF++nKIRV2kBtvHF8xGNS8RYLHgzixy3GAlB+Nx+vdWLRwSTpmM678
	sL1XlpSbb0V5hvzv16CmPvlEquVbfyUiYRms5jt906DZsSyi7cl35adZa58HkpxeuC8=
X-Gm-Gg: AYBFou1dGhIJgOsLueArUQkXI4dhd/GTudBPSaX5xjsAJ6Ri7w8C9MePmyVtKEtCy8J
	EjCT+cr5M6cW4koQruSRMVjrTsq01Pn3GnPPGZcbvVJong60T+Z18frMCVD+KX5izf8J9l/c7/h
	OmG9kF1sOesywwIxNoE4+NrGobUaC/3Doo6iTdhtgMzQdSEN/HRPM8d5LtJAQsm9evvt95+Oosb
	DlxPQcHqFFZ8ct4wFSDmLN2wunXi+s9s8xkN95qA7ei0OAX26PXhEnmbBVNviIlV2lvC/9Fy+4L
	zlsu0HJvMuxTm5e2taPFsh1zW4XpuEXr7p3v2prpDAg/e09EpY8GemyOSx+VAA6H6ugetMx3qIZ
	pDNFkNkgMlevrOuYxC98gJ452IVJua94axgoI5i390W5li25Bp38Wji2vSooKz6LHXwBK5RG72J
	Wq9x+J6fy0EYgUBCBdnhzMwRigD4olzqGl64cV1rzHTMuDOQNYCeN/aG2z/LeL14gX4Nmr4gqIQ
	g==
X-Received: by 2002:a5d:5290:0:b0:485:d61:65b1 with SMTP id ffacd0b85a97d-485872dbbdamr16682244f8f.19.1788704463913;
        Sun, 06 Sep 2026 07:21:03 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.250.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883953cfsm18065125f8f.13.2026.09.06.07.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:21:03 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sun, 06 Sep 2026 15:20:53 +0100
Subject: [PATCH v6 08/13] arm64: dts: qcom: x1e80100-t14s: Add pm8010
 camera PMIC with voltage levels for IR and RGB camera
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-x1e-camss-csi2-phy-dtsi-v6-8-067f2ecc4630@linaro.org>
References: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
In-Reply-To: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-media@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2810;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=J15wYkkaPvz3mj4SZiySkrYCu6ZA/yLyqk4CWooobME=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqnXbCx2FI7Z5jVz7Tu899Hnjn5+/CP5ulcAvzZ
 P7gBDpXST6JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCap12wgAKCRAicTuzoY3I
 OkWsD/0faERWpCvkXQsRGwxRnuPskYd6jFZ65QIGWy1bzzgFH21MSWw4IRhs62YD8z3ABypm0q1
 Hh2PGMEmOMg5zV+G9ptxSDL2trxI0M3scTS4nUafOJ5/4qf7dLGKsaq/OI7mvI/WffJ73FwbfQQ
 GcXcV7kSGNEX7LTbfJqlhYvDBct4VQdgTJ66I/jU3UqkaLR4NL+P+NqdyRqEdjaDD6a17JVQnqL
 KH8sw96NPOL74aIUSALOPYBqvwT2Hl5uRjdGdHlj2l1j3Q0kSw43XxW5H6waBH3D7Dju97/AI6f
 KBnUByXlVMFU9tkWgTceULLRyvuS4uYfgnWtNKFJiuG+qNh8Qv9ZG3N9Be99As2D60vi3s9TBpp
 YK5a52OnL9zmALzbjPjPxfx/ureiauAA2BD9y4thIF96Mt1Q13ckX/dMu/cH5SuJ0RiQNW7soFw
 T5P5AQ41iB+PYYU8aGpUol8Y8G1QZL9POIJ8xZVKB646jD0w/F3qmZE5pxWJUk3F9BmStx87R2u
 eMZFz6zaggGO2YplMYeYiMbGWDcYSoJqkNXyTjSqqOPyQ/98bpUWyvvKiMn9uonG4SIkd6hec4d
 SNgZiazYWjQUdVo+Xu/7EW4jmLKLjwcEnsoer+vgBrZ284znSxfrnKgdYeZfzNavzU/R5S9ZLZC
 ZpXPRrR9FqQY/iA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add the PM8010 PMIC providing the following voltage rails:

vreg_l1m_r @ 1v2 IR sensor
vreg_l2m_r @ 1v2 RGB sensor
vreg_l3m_r @ 1v8 IR sensor
vreg_l4m_r @ 1v8 RGB sensor
vreg_l5m_r @ 2v8 IR sensor
vreg_l7m_r @ 2v8 RGB sensor

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 5d49df41be02a..70e50ccf67677 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -562,6 +562,13 @@ vreg_l6b_1p8: ldo6 {
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
@@ -805,6 +812,58 @@ vreg_l3j_0p8: ldo3 {
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

