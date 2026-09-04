Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E391D490C04
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 10:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519419; cv=none; b=VzU+lz33tZ2js4PPzkdBFXW9Cxk35EJk9lFe5kcYuLtdOak37kp9nMRUS38A7K2Id9AiRHt8kS94kCLBiEycPXVsZyCt1ipU7Vm7Uhm2RVBPVicw1h9ziqQSyEHsf+cvT3lBmL6ybLkKW8MMfD3pPWHOkxE0JDgACCWBI9+gQJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519419; c=relaxed/simple;
	bh=J15wYkkaPvz3mj4SZiySkrYCu6ZA/yLyqk4CWooobME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E3LyJGYzqKl503uoLl57k7x/aEehAkcXK2y28yDjyZLc6tzHKnWgHZ/FH/PZDWPTAljLwbc1Jw9lYePHw8gtfq2d92oj77hMbQ1OpUTuA5OqRqoU9n8sNhHhMiLe5JiGLMJdzjz9OuEdeXThby2JUw6lQW7ayGxTsR3Qtwmku0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ea89stJv; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ea89stJv"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso7183505e9.0
        for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 03:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788519414; x=1789124214; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eFtpIogOJLD8BDVMTcndjqzTghhPJgSIoBnISPNLIM8=;
        b=Ea89stJvTKxAKh0ZxNJ5anNeqPCNyOqqAPU/m4x21K+c6Rq+GHx71BUvN9+VAnabzm
         du/ltpxXWEfEqgBx7Y9MA+KG/Pj+B6uesRLSz1c9WkrKodj+UnmzeUV/5jVLFMT4yb+1
         AvtDBEQZobiABfV2sRFIWnX9C8Wku3upEUTr/jcR32ifaGl4ue+p9KthnbQbBTxY17ab
         H42sBZ+DfW5rDOtGH70OKLXwoa6zy1RrE0xq5IXHv9WYxaO9xPEmz/dneQ0fZacmKH3G
         ZTRaD1sRRJxnOCKMv1Sb28JNJWO2LoQcjEpiRPeau0to/QiA43Mo3xEHYzHZgu55Lq1b
         g49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519414; x=1789124214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eFtpIogOJLD8BDVMTcndjqzTghhPJgSIoBnISPNLIM8=;
        b=B/XJnV7KsCWpeykYwohBXpmZOSrIExTFolKJqa6794ZCRFawqcwTphryjT6GfCbFi6
         KViI6UdjaRJZAJWytZEo7hmceRVoD9eF/WkJ5fF/AZrxMGBLPERYINuQ/WkS1TXG9sza
         PHsQkgu4BaVjM2xQ00DJmytbBKDOycO9bYXgzbdWzi/zg44k9tKes8r3pATJKp5JKlcS
         nmVQv1tgXl2LncfM6zc3RekB7RiqfyZfdgReOIUkgTeiwaLAg7B60r1NzxwefEJKgZNp
         mvNhy8WWsaaIodm+JzmvvOGwA9DimKpt2gYv79b+EZasGrDLD4ueXmsOGVTxq/5hN6Gi
         fF7A==
X-Forwarded-Encrypted: i=1; AKwUvBzdgG/VTytkWbDrk1Sm34VbBqcz4N97Ubo1FS7AzGl3xqyQ5IuGxdWOyF8C1lnuIeGxUIwkqpfRFVrwsg==@vger.kernel.org
X-Gm-Message-State: AFuF++k7GnmD/6cw67Klv7oPyUY7gf4/zE0mTfDUH07qBrADl4elyhnG
	N4dgmxmLUtN/2GQrD2NJLDLKmbr7LCSQFuaYmeBVmGu1OKUNb+LmYpgpVKa+kwU8mdc=
X-Gm-Gg: AYBFou2wU+58FQc6pwOYHp8n/czzbv2NooBPsvk9JCqeWqVxDDYaFoY9mcetVEG6EsQ
	Pzq6iGKGMGwMDXCPyDn7vVPkXf2L1pWitLOxZnRSg/m9U9HO5UNNlTp8NuuLubWfkmYWTh9Zayf
	eTj7GLvr0jGVY/QpEMux5FaqLCy6uZQz1grWVSo7et5hMiTWH/s+0u9Kusn9/ZuzNeA3NyId4xj
	csKz4pNkTBBM9F30NIfeswowuJZwuSVz7LIWiDIpxhNzBTz/toHT3KzY1shfqFY6K4wsg+IOdkq
	KuuHcoOpkD2znHM2lP1vVOwlfCG7tfLMSSEdZh5iLlh0GABWBwUcQnBHV7Z0xNhg5zTWMRGL2xq
	s3NNLVtpxRfNk9qU/N6G5t0mulEMI+yuGAyFEz7wpsdDERK9Xp4IM1sGnptrTTge8jIA47U97Ww
	DMnYrzP/VgyGQros+aTRtAj4s4BtViReEGxwyNC/KQN9ao23G2VFMU0IL8yLHKTvtrPkn1G6NpA
	QCRCrFa/l8=
X-Received: by 2002:a05:600d:8649:10b0:49c:fa20:cc0a with SMTP id 5b1f17b1804b1-49cfa20cd58mr23313905e9.33.1788519414400;
        Fri, 04 Sep 2026 03:56:54 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.237.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm132110525e9.0.2026.09.04.03.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:56:53 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 04 Sep 2026 11:56:40 +0100
Subject: [PATCH v5 08/13] arm64: dts: qcom: x1e80100-t14s: Add pm8010
 camera PMIC with voltage levels for IR and RGB camera
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-x1e-camss-csi2-phy-dtsi-v5-8-dc81d85b599d@linaro.org>
References: <20260904-x1e-camss-csi2-phy-dtsi-v5-0-dc81d85b599d@linaro.org>
In-Reply-To: <20260904-x1e-camss-csi2-phy-dtsi-v5-0-dc81d85b599d@linaro.org>
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
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqmqPn3B/7abYAemVyp+lAV6hGp+kx0oMZ7gkBf
 3uTBRJwgH+JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCapqj5wAKCRAicTuzoY3I
 Oic8EACXd3wVUdOGzKCeRDI+btSwNbpr7yUNdStyVSzNxu2NmpKIrmWOYeBkFnx/U22cEnZcZVL
 GY64A+sCoIQy2VaOL085Xl53h+4vPsb1fKilIHfAxFU8byCe/fByysCZPasmJPwpUphNQV4RYX+
 Tu4nzHQWgFEGTB5YPGRp8Cl0X99ngErNV9gKODrArIutgx610Zn2H/6jcWT0d8A/Jb33Cs38DSv
 1rvVu1Bh98hq4OFUjTUN5wq67MOiXZurLbUGFWaMi3W8tMa4yHAePfU54K/Pnqs1QZRy7twR6gS
 9AuNDkZWa2y7T3lgbCtNvQSMMwjegnb40sqvryqHcWTxHGppYQ8i6ecUVa0ca7vmAsCzWzG99EK
 32iK8Dlqq5VlGB/TKWUIqc3E7ANuHNBxV09ds4+nDfo9ddy29lWis5klImfjE5mNwxf3fK1ma5x
 w6CLyxGav8hTKmj0lvEmEBu1gsbjzlv/zPPgmwMp7ZA91nu0fgq3QUaWwl+RrdM7+3o8QZPNhrM
 FroBDDNGaeVJ+awpKaBthhZloHj0uRh5X2x8uCYg6uX7r8jri5xeC15Ln0wThYnyyfVGD6QvRCf
 fEZGSFHs6gD5b7O7/epGhLCgS9SZ0FCctDPl5VCi1r0MWCOJDM52TEnlEYJGx7MMgyoWaWy+6Hh
 cnYc1Ic8fq4ylpg==
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

