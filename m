Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC55425872
	for <linux-media@vger.kernel.org>; Sun,  6 Sep 2026 14:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704472; cv=none; b=LZW8afb9ly4zz2jkhb108kB5EV088RcNJXrwvIxTHNWH2apHiGRPrVaCrQ6wdO/LPn5dEjYf7u6nkZ/zXUcKgoPVIL9r+Yx2YREkK4IDV3pL2KbuaK1VTN7tm5pSL9Be9zLUVQJEl4LTKLTa6NOEEwl9v85TIAyV2fi1wrUG5t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704472; c=relaxed/simple;
	bh=+nZUv9j7gvSqxTj8ozUV/CguH9keLPj+8xmo9gBOgqY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kMfPFpN5GIJSdi7MIw/C/3uec4qxvF9SxO92+zIb4AysXpmXfMALIAFPeKB5LY0CRw0UoHmtjMFkb/Hap7WLy9iAgToAP0td3e4KJBfpL+SWBNn2XqARxXesVKN/T4p92KO3XrtW7aZ9YXcZHsMPJfHN+ZdegQy+5Cd7FbmxIyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vbaF8yHX; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vbaF8yHX"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-485843aeab8so2840473f8f.1
        for <linux-media@vger.kernel.org>; Sun, 06 Sep 2026 07:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788704461; x=1789309261; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AUQ3HpNgjBNNWehA6JijWgAwJZ0GFdarA/7qHDAqJ1U=;
        b=vbaF8yHXka7oWFTdVVBdDaDxUWo2SoF+jklW3wxWYqamaQSLk+3XiVA8l0TiC6gAgS
         59ts5mbsi4lxHoH0c7AwOjJ8TZHexot9fmPu7vjltn4xel0+6PlfUoA06SUETtd7X6pf
         /OwkgNRpC4ieyYbN5ECKq2gJ/yivn0FrSMdm8EebO62opxNw2dpJv4eq8Vm6roTlX2S+
         HWd+9s4iD9kYz/CIYTtZT7ep6pj+6UBGgSNk9vx0K6+1vqeJl5ixVV7JaVSj2HB6FO2c
         yAvrlVGeqHguvk3irxYQw+Zglq2S9U3X+1AORba+4gkfOVjIcEMTAqGO1aWQ93UTUh5n
         tdBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704461; x=1789309261;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AUQ3HpNgjBNNWehA6JijWgAwJZ0GFdarA/7qHDAqJ1U=;
        b=L0Zc/VbK8rEhKt/BnmSALkG4tepPxSCw7cgXmpfC97YMpglNAX6CWNRVy/oiuWSz7U
         RZaLxMuidKj9weFDdJ+eCwfIIwZKOCXn3UcOv+DLcZi2t5UMy2etM70KhIBRm3/9xdCW
         dm3nFhrdNX+3u+jeSZuVMZ2sj+zqmJpYqIC3Lu1g4WkIl6jD7IJGCR+YIzoq7cL74x0O
         5AbyERfR4suIcXBwEEZOML37BY2IZc00Mcg8a2PqIafnx59EpwdGzVN7GLvNHxhmkrRf
         g2rbLgypBX2ZLnYa3YGE35hIKkPf2CCpjnOYltTCsX+Kp68z5DaheBHg1+I5NiWI0ve4
         PKUg==
X-Forwarded-Encrypted: i=1; AKwUvBy4HZ46yRxIr6zJ5wwNxkcgu2Di9oHQhD5MYyao7F6wHE1jzMja80Rn6MWSLJWGHxE0ez0/spUHNn9McQ==@vger.kernel.org
X-Gm-Message-State: AFuF++m4N6ersxV8m0XEYbd2MPZ5PNlY94TqhPR+Gd53oMobRiqYaKK8
	KPX7rhNf+bsqxInvU54QyxkF6t9sHzf76JXJfmRSH5mrgcXnMu3cj55M42jSCPDa9Bk=
X-Gm-Gg: AYBFou0hsA5PWEZicrMg/cbmPwH7/NKidduG8lVd8P2ns5WZrAU5sHumHnvtnn2IKUN
	e9XwxzpgSQAZk5iEZNMNOfOGj3cWsHv0YBvGVPaAQMbXET2ZUKZk1KuEcEWhYwu7EA8XTiSVc9w
	TU4P3fHzdSJiI6ofTwM8GRyQIxCxZXxQlOsdVyzCi1BJYgoANTO1BapXgIWqt4ksS2GplLDRzzT
	0Q2Y9YB83IJLs41K36ZGHfur6HdDR+JtiF9hmYft8yHcCBil3yaU7IIpj6Z85TkEAvfs+25hh0T
	HIjhfrsN08Wiz/QFqoNbgRexGlO64VxDcMOsx5zyvrnod5PYsjmhjb1fE+G9PR/WGbksrxtqB0M
	fgO9/Y+qDfrT8WC7HA8TGR7ohXwgLHgquDCfytRp7fg1WwVPi6g/25XofLsBxPbJocjCyF5olYm
	nGMLmZibtnlTYHtNZ72DcrEU7eOwJKy6E87hW3Lk9bml44BSaCXKLcNyiwWpYGiOVpXzYyXDvUR
	82AUHZZPIo=
X-Received: by 2002:a05:6000:26d3:b0:47f:eac2:6f55 with SMTP id ffacd0b85a97d-4858708fab5mr32229953f8f.19.1788704461331;
        Sun, 06 Sep 2026 07:21:01 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.250.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883953cfsm18065125f8f.13.2026.09.06.07.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:21:00 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sun, 06 Sep 2026 15:20:51 +0100
Subject: [PATCH v6 06/13] arm64: dts: qcom: x1e80100-crd: Add pm8010 CRD
 pmic,id=m regulators
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-x1e-camss-csi2-phy-dtsi-v6-6-067f2ecc4630@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1548;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=+nZUv9j7gvSqxTj8ozUV/CguH9keLPj+8xmo9gBOgqY=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqnXbBkMlAOKG37fPyyCnRj02j5OG9Gbr7dOw72
 zSfX0N1ZsqJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCap12wQAKCRAicTuzoY3I
 OthLD/9azbIwhFmODqUPGJHbhqK3Oam4e9t2ztT6Q7f5m1ivrSWdk374o9+pcoG2szjZn/RiZw9
 GedDBWBpSHQRXyfsdhEsinL5cmZ4dCqJ8J1gYDeCxpidqXGk5EGLkogRjCGmgjshOFXcK/e8JPN
 TKUzxQmAF9GiWx4nV91PxCPN7GsY+IbI/hbi7Kqwub1cGWCwAId3ldR6O8I+TzdcATnp/YxUpHw
 zH+llSKKdx9EQNPsNFNP0fonqNO3BZ9/0veiOV300TPaPAUouftBVejnAEtJw6jiJSaKveHKibC
 V9+/MeuOF+FL54KIh43wyC8WxCYnrWtCG61hMn7M3AeQ7/OD+A17pqeZK9dZuApQztjRmmxCIMf
 YtYtKeali0lW7oAf6MOAVXvlSMT5icUgtP2LfF29NZwmdoTWDZpdM/Gzqrsw6V2BYTO0itkOI6H
 duC48ix9WB4SvpTsFCGxWQefbAoR2JEczLbgLomJE6UU9wKlOXeQmeOi4mEJd8bH/iLceVqYgnk
 kscKQkDLq2HK6/BeO38gy90iklYEfn7VcG6BE8lY/lXxg+f2Wus/8OuJROFVSmmZsICxjzPrwEH
 GpQdFDolUiRInFlOnQ/6CWqxeF41kMjb0QnlzEzboh/6DHhuN3i55OXXx8MbeIT7gblU92bYynz
 RqvDNUovSjK3y1g==
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

