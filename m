Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F4E49502F
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 10:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519417; cv=none; b=ilt9LJ4/WjJ0mrgwFPiPECD8kgdZid8wEyV1sA2QLqRjtzHlcIcsN9Ip6njy0w8/AOFLKSejhPV3OlXpSavoZQFdokiPeFPtjDvkt++SGQaitv0YRITMLmDH0wM39GmsxXBG2PP3fI1EHDW3QYdMUTBU0nIcokC1ZpuvJGPsIjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519417; c=relaxed/simple;
	bh=+nZUv9j7gvSqxTj8ozUV/CguH9keLPj+8xmo9gBOgqY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P7EBdIkIPsnO1EyBM0Y62dzoxxv70gT/3VOiMdItBh0E4RSmlaiWFlcXShXxSgmc83g4csfwN0yz7lrfCFug5UfLvOIHn+7VJ/2n5kTBTxcbv5Fd0vsEruYV9Re6R/iXQrSLrcbT7UBt64LCa3dcD75JNIyO0JHWG02UhmPSiM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OOFxE/mu; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OOFxE/mu"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so10022435e9.2
        for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 03:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788519412; x=1789124212; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AUQ3HpNgjBNNWehA6JijWgAwJZ0GFdarA/7qHDAqJ1U=;
        b=OOFxE/muRFuJSwnnezShIQSE+4rlDpG0JULF7McR3VvQdQJXt4K/6CvR3fmeeucyi+
         mL8qAfDiVN4gDxgA420PjIxnNWtM2qFBVCzlks8kcTJXbo0nXz7bxiN632wqq4JjqQ3Z
         IZaXSMZuL4rvQsgwsIo3eu6s0fFzm6CpvSoRlI+d7M0cWfsi228XNmwnQ43VRb8aiIyu
         nr3XERMBQlzc+EAUOOu1l1+UNsHwwQ+0Z6Fe4H0CiVSjbMRXY9xSTJjrAbow3NxIUW/e
         y3W/mga/fhcLr1mgWaZ/v1+h1R7rVHzK0pP78pftk8M02bh9b+wgMbzTsWMh5pwObcBB
         epBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519412; x=1789124212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AUQ3HpNgjBNNWehA6JijWgAwJZ0GFdarA/7qHDAqJ1U=;
        b=daQVTl3LGq3zUMo67rqlxXHCAZLhu8V2QOFS/82oakCPGzMDqyyl0lapFtNWOJTpCC
         qIWl+vnfZGPQB11Cu/MZ5eHpwEFX2FqdEWMSAjMxOp67jOHrvfwpypbXMxcklP64jcd4
         UZg1gapVxWMR9YRFy5pvKYNoy7L8phNItcwNfijka0PCxLOoEjBuPeSJ3gBVehxpCCBK
         Hvtkn9WG5585kdPV/QedEfzORgDCr17+lYyegT1a12T5CoeG5cx470Y9+xLEfG6tetrn
         0ykN4RrbtalBUNxkJ93hJz2kns4z+d4wUfiKYoU3xb7WmAkIA1v3RDX+DEDB9e+A/Qyx
         1n0Q==
X-Forwarded-Encrypted: i=1; AKwUvByqWu6YGfiBZS7Cmod9uEx/m8BwasaadiramGWEO32wVACib7m8UBiDV/hMyOfAFN+CW+AazbLMM0Rk8A==@vger.kernel.org
X-Gm-Message-State: AFuF++kCiCpec0LQKViY6ZRud39XZ8Xth42yLY237LIWbodmn/X+VSQu
	x1KT0172LWg2x8Vfhe1ptKKacGsICJ/0rKeItqBFNueMqkcKHpHl9xqkJBiCvAjqQAs=
X-Gm-Gg: AYBFou32+d52mFBH00olFx73ehjf0Z4hdLp/jMQbNngsiMQovuYIWeiDV73NRsyfJEM
	nXv3G1P2TqoE1IVWFuJqbEtCHHqaScdofIw6JzgCFEMeMFxlJRVpAU81fXacR5z+H/QGmbZmWlv
	yHJy2hM62q/SU7NlKh26dqsjw3oIC897DQ9m4YvJXDE/OckLIjPlV3/c/brEyPDEsWCbhehm8Ys
	WefMuAdzl3pFCO5vZnEWZw2QjHpYROSfLa7OOii/c47L68TP2tiiRrcWaJL7XAiaCJaeIEBUV0C
	rvg24WlBgiQYDKTUcx7lEY7VJlpgPQEPZVjgPTc153Ri6xQ1zrzQp/9HKs3PfhI5SMgg0UjHJeA
	bseOAeaNBF5K+C6F9htCPwsynfYKYzMJOkAs/CIszJ4MzUKdRmhrcv3R1oSa09ZoVx4UxyFEAze
	O96fnnYtBsrsnVJsQ3ON4wAFdZYTv1Z6AxnSq5U/h6ctThlZiDkiLqt/o3Zh3s6NAI7le2g3UM
X-Received: by 2002:a05:600c:34c9:b0:49c:f729:d757 with SMTP id 5b1f17b1804b1-49cf824f757mr58561115e9.11.1788519412030;
        Fri, 04 Sep 2026 03:56:52 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.237.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm132110525e9.0.2026.09.04.03.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:56:50 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 04 Sep 2026 11:56:38 +0100
Subject: [PATCH v5 06/13] arm64: dts: qcom: x1e80100-crd: Add pm8010 CRD
 pmic,id=m regulators
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-x1e-camss-csi2-phy-dtsi-v5-6-dc81d85b599d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1548;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=+nZUv9j7gvSqxTj8ozUV/CguH9keLPj+8xmo9gBOgqY=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqmqPmKaHmP7GoZQcfd1lGlGlpLs2pvD9zUd5Hg
 7w+SdgV7rSJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCapqj5gAKCRAicTuzoY3I
 OlGqD/93UA+8mblBo0epY5NpJvGW9BHqPTHq3xr9fpgADlpUwW47XivI+2uqn0oS4PJd5yFNxGV
 Yu4rVU2Qhd6eEuCX1jLAG4biktl3XV8epQ24rNs5kd3S+1+2jNjlR2pBhkD/3DhgYIdrQ/z+4uj
 WgVIN3HMW8bd207OQs/9m5Lo72f2GKxOTTbZI6T3glDsBP1rmrBV39mbXPTCnRSy4Rbmzmbz2jU
 nqQwN8tRT/ioyqBNTWR6yqLTF6GRD0ph/9lnEEPgVw5HAJYBOD4l0x2jK3K5UCyMiuy2hSG8oeQ
 AT5GLgftI6xrpdfjM5tY+todxWfcCJ46Btci8y+CZLbIZB39gWmvfk1U8AzEXIcm7la6jKs3dCI
 t6+l3IWWop7FRzDH8MlXDgtrZgHeqhmTybAyNIVWxihu/2K4hPh/dUg8o4eZ8wPJNL/e/rXTQgA
 cbzCF31OwatXNeqgQvWzCzfE0BMim/yBy1E8JG99i064cGYuzkJzxgl86+HRvVVIEmQnPYZephs
 WFzbBR5LOWzOA50KSEv7jyAOQex1h72mCkxrwjaefB+X6TzeNgWuq6G/c5pb8ZIrLGHOI19LJYD
 vssJ9wi9eUyMpfMU7fPOtd0+crgnfr5bEK2WooUf3CDPMO4/fAUjxdrpdMs0WzY/4PTsikHXeJn
 C7dzwN/9xzuBymw==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add pmic,id = m rpmh to regulator definitions. This regulator set provides
vreg_l3m_1p8 the regulator for the ov08x40 RGB sensor on the CRD.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index a9c5c523575ee..7b9a40a7b9a95 100644
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

