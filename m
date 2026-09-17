Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B5952B1DA
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 13:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651254; cv=none; b=L2R8eCLfIomzveeDqMOtxZN59divsn7m79fpEaj/sipw4N58J9ek4g/RllVoF7jtRaYVBDbHAt9ypeI2lxJRBulShrKn1OxLdrlE/SxfLw12bmKHpduwN83e11tPKv5+DVJH8t7ucXXSrHyFQSolIQHjbc6yM5TfqKHdSjfzB3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651254; c=relaxed/simple;
	bh=iHBPQ9YkAn6Z8GWpjCTNk1g0MokRmqXQABi16JYNcjk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WJSepgldkwaS7QNfXTZ+SVMRpjFMl7MZ7tAUxicQRDDe1NQzDJrhDLjvZZgqcunr74c40mfZVy+IbKa45eC5JIR2Li58wQ0bv2TLKA5tvxF2QnhVuzOBsGo67dwBCWAW1jEZKyihftAXCQwaDbMI4+brfZ4qUIRBG4vzHLvDUF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SkgF2Oju; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SkgF2Oju"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c264788fd58so132191466b.1
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 06:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789651247; x=1790256047; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YJOOEBoowSURD7njEIFc+li3yPh3EiytjgezbPj3cX4=;
        b=SkgF2OjuSs4d6G7zJvph3U1VuHue5WlDj+4gXc21016fFdl4XPrlp7CAcYZPK94Dwq
         4fpYZ6L/XepYsbxybf5GkFB/PyPcCJddpnCsDZr5kF9OJ3PkjMPsxFWef38J/XT/muvk
         VelgYZTjrszwvIFiZ/N1jmqqQp+EJYWVBgZSBvSLEX170me3sxrwSIANfDIAHn1KZf8L
         fJvhQBD50fQ0nppuChir4+v6jXJZZVmOouuqiz751zF8CAf8HRCHGowuZVEuJh76qycB
         FXaPNaRv3GqNNW8caG+mzRbDrpYmzz186NGB5BeHOMMgZt8m9UX1sI8/D5k9q1XJ24rD
         o0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789651247; x=1790256047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YJOOEBoowSURD7njEIFc+li3yPh3EiytjgezbPj3cX4=;
        b=FxD9ztGtP9xNcSyTBDbAzdY/uPSmiQrU++5YwxGC1UiCNETBZgencJ4ptm7TxTjxwu
         5UUkUpfglNm+PeybzZY1Tq0weCPWsC4oyd4mdi7Xl5p+//w/Z01rgY7+xp3W8hOSftTh
         zG56TXM1GcBs9vbdR4aUiySw9qJt+pD1qbls06mGXp/Kqu7RCrR8j8IiURSpVFReJfK6
         TuuCaWsYsaZ4mzI/ECFSZxJ4muiSLbSfl52WxZ62SDzTw7nc38sLz465eQGUEKHSanMW
         RdJBXr69uAI3B2ycWHG3VdT1SNAnx7Pl0qTnw3v50ZsVgRz0hBAZgNATqho3PQAdO1Q/
         rhkg==
X-Forwarded-Encrypted: i=1; AKwUvBwqaGPJuoAsOm8UOdWNXTKLZPiCvub6j8vzYtzC9itCnmTYDzt8qesQvshvUTJgIjWaEoY5mMEJyqguGQ==@vger.kernel.org
X-Gm-Message-State: AFuF++ldzJ3+5OUrK6FjXStMuuiqagLwTzLYN6rMbGH355l4VNT6rGBy
	0Xb6QiC/jdV2E2d+2+LZhoJEbpZwITA0/F+sJ6POP0B3w+fOe5n3z1EINWJaEE2pcy8=
X-Gm-Gg: AYBFou3xqwst4zeXZVtmud4KyrIC9v3FJQt/03FLAF/o9I7f4++Px4AN8C3/pGaQup7
	70ezjUTVipiU/f7Gw2zKAdivfUF20N6gTdeBi9FRKP0Ii96Y6Evoomvfk5aIRvEP1xtdhJ7Iv1X
	CGo3ASl4YLgXurJcd9c0Y9OqPk5iB2p6JJKIsB51KRSJMl3ffwfcSsHvT5gDp9pD55n6i0+E2hO
	TeNBQ6lkjbnR0aoTpdwCmgUu0cPBoZ+U4AYHQ/iBPZLSu0AeczhDjXxgjNWkvPt4b2Z5JKbVaQD
	+1aM4C1HeIZ2Gam5yqxHEt8minNY0CHq2kP6ly3O0WIMSAueMyXYH3/T2RTcUSrTD35ug0uZ+7E
	Hw+Je7E5UTPeORxN+cnAPeva3E1VWGnQsn4XrO5zX5vrHG/LV2VgLnFeE5dKWili7UouyA5EsuA
	bArFgZ3ucGWmQHYQpD5xWBtbCbFiqjLp3QUoOtcCQU255rAs+uOFIjtsGstSUe8asB6l/Iz1COX
	SkOY5tnT/1r0txt/ynN
X-Received: by 2002:a17:907:1ca2:b0:c26:19de:9acf with SMTP id a640c23a62f3a-c29e5308b5cmr497616966b.39.1789651247392;
        Thu, 17 Sep 2026 06:20:47 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.29.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de5e4ca9sm279681166b.42.2026.09.17.06.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 06:20:46 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 17 Sep 2026 14:20:34 +0100
Subject: [PATCH v7 09/12] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add pm8010 camera PMIC with voltage levels for IR and RGB camera
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-x1e-camss-csi2-phy-dtsi-v7-9-1a63eb35838b@linaro.org>
References: <20260917-x1e-camss-csi2-phy-dtsi-v7-0-1a63eb35838b@linaro.org>
In-Reply-To: <20260917-x1e-camss-csi2-phy-dtsi-v7-0-1a63eb35838b@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-media@vger.kernel.org, Daniel J Blueman <daniel@quora.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2299;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=iHBPQ9YkAn6Z8GWpjCTNk1g0MokRmqXQABi16JYNcjk=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqq+khmnaIFzC7JYVfCpVXkblyEiJr9Su3vzEqm
 zFXMP7iUgOJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaqvpIQAKCRAicTuzoY3I
 OsvkD/96KBliKUCsQGfaQgF0covieKNoRp4DwCAd7Poyo18hU6gXDYKIZFiYgnhho3LPGHSijwr
 nTFD0W+hMRAu3+9Tp4P9VSRh9LbUasQEq69PeWhZl/SpbROPR/36FzvIwJT9vv4S6I/jjmg8o8n
 WI9QlbpRfrpOcGQMMm5Kcr0jjcV3mT7rB541SWYLqSSz2l0Ec6gtdS80heHpU1u36CVfA4H60zo
 ra25Wux2DDTfkiUxqaNt9lN/7jE12/iwt/PaCaKrObOJN4sQM5wsZKBKh0Mf38379sHiNhjHwM7
 KbApFsMkVBBgXJI+HFDrZ6jFZHUFlX2dCeuFEnngbcFLbS+WPIAxec+mI+FecMtq3+JnfIiUaBt
 f8l8bkP3IHOPUNbJdL3Ra7N6mpCxUQH8Y67e2YYKY5DTRkLHNrBUUoXys5kMCVsNJP9xaxGsMql
 96+y3nR1wBOFSrQZ4KfghUCinUN0YeOMdEk07WSVnwR7hqSO+TcT5XHm8/kx9hAn9hGIdXUw2xP
 4YwJKxlU7GwYpAyke9FHYnE6NkabfhasqVfIytCT2xNQLA9l89OhgT5nkYx3nxph3APWuqvdIIq
 D5TLvnk95lImE506xUF0s4W3DHhCbi5mX0FkSL9SOg5Spu2m3A/sy9mnTSswFQB+b9jBBUQmoGE
 syKz542c9WgOTXw==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add voltage regulators-8 for Camera on slim7x including:

- vreg_l1m_1p2
- vreg_l3m_1p8

Tested-by: Daniel J Blueman <daniel@quora.org> # Lenovo Slim 7x X1E80100
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index 9eb2dfd99f20d..f4064e09d6231 100644
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

