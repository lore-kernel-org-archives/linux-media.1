Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD064A014E
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 10:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519427; cv=none; b=DDL0sLXN6uv/LthneArXyHFhuAQYyD7Mc19FcNjwCP1q063PEefrIrpn8+Sm8SxQk7hCf+uPEnhuuNjLMASXK6MId49v45Ll5nhONG9xFb7ESdBBdnj3pM3ArZidARzPVeiYNtOCFPTG2qFesi34xcv214z6aH00Jzbs7u7PtBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519427; c=relaxed/simple;
	bh=K9g1SPytudaQ80/4FyVWQl43Z2IGxbYxunNGayfA1VI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rClv1ECQTU4OUrbKAZBRD7tSiwpRTRug9ryr5LxgrEMyyV1n9UPOQnxuCuXdlVbdtKRapqvZWJ47LfEHJiIXsbVGY2UsMtzeD7YrCDBrPhPTQCHkE7BcYc9hYPGoyGHR55/Hoc9YRPx4OjhBcsJD/egnwCcQoMT7QiD159ctSxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SffWNdXl; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SffWNdXl"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b8eeb3ff2so7964045e9.2
        for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 03:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788519419; x=1789124219; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PwbqmAMM/ypUlaqINsrCHwxKGoX/kGgUWXbINf9VL+g=;
        b=SffWNdXlvHKg2g2NLLdW3E1uDHrhocGL+phLuw3X19l6IFxqCPPzVw0+/N2G3pTNXJ
         xxYYLCGFosCVCqbkM0Doj1w61eQ9AXmwfewYYlzeV5u8iXMM5P5c624P//IOnSmmGztR
         fT0jfQNmSYl5OA/kKkcEmaiYrvKdSKmDrOXFXivwmly0r9JHZ5Ih7+QDY8ETFDhvVQy8
         AGPoXPfdXzZ6G9zhirXsJA/jL2PAwnwxObn6CZqhlUfIp6BQVmckEi9devJSS3V/xaoa
         R2gwuN8xUd+RzacJQWH+4eRG2ZyyAX3n7H99Aig63IlgqyiKwM2ToEroKikAwO7ae7+c
         9XHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519419; x=1789124219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PwbqmAMM/ypUlaqINsrCHwxKGoX/kGgUWXbINf9VL+g=;
        b=p/74hHJ1eUw+cvIMpnjx8ivtk3Mzbbcn2TD8GpZ1PVoB044dC57xFJCNlZ+n+MVqIY
         34QvVo7AsNihVkTPphHwcw7riD5H3FOsL7UgbhtfoVWJjqMuDpNjLZ1C10Eta0vBlH5r
         XP4M8H9UbPZkeetmuG9zyZ6h9T91HA8Sk3wLyfCPIe26uJK7lTuiTLkHdLhaMlaEgeTD
         VvkRPGgLo3IGkm8WcACv4ezS5HrmQWlr20nbBvxWszfJb0XgKFGJgs+opYueRpObNkFp
         AEJu1hEZ6Jap2QPndAKv4JvrXivjgBeVIKphjypfPFFfJmJy3RTmIOG0C9NTavyurvpR
         D2lA==
X-Forwarded-Encrypted: i=1; AKwUvBwg/Yvg0dIpPp5fHIM0jWjq9FxaHp1e8NA8Ze5Vf1lOUGXkXuC8OO+vPfTREoZzF9+llj4T/IR0JOc2ng==@vger.kernel.org
X-Gm-Message-State: AFuF++npQYiQsV6m3r1NTW3vDcLTJsET89+T+EFwBmmSr0kwZeGRHBwO
	b40yrA7zpknU1CXKZcR6cLYCOlRfl+x+6oc9TbdTm9naBdRzfqLldKLf89ZiBnHgBZY=
X-Gm-Gg: AYBFou0mbYGXPyDjR10ldm01+mzZJ60Af36YHAkd9b9mSKqPwg4VkrQGaMdFdvn/I7W
	SfsoafEZNEsqtOahc1H03r/2wkGobCUucl+GVL5QnYvDDzPVmWzsFbgQPNIkzXbrMBk86ToscSN
	VpoI3oGsJ7lBfh5zhorffPj4cfIsCqfTlAKe9IoQudwMNi/c1dddPNfPVCyd9O0LTfUNTI9921Y
	oClbJDkQYF6GekA1Mg6k5qXv+TeWFDTdeE7r5hsji3btohJEE1bFcju0rL0Kww2U0am9NxWQhRk
	9vREMtPC6FQ7fxH0qBrE//MGfb2e2WoYpdQHlKNynXjJMKGS0gJfW/f6KwUOdHFB8hMgp0uhA/f
	rXbh8TRFP9Uz0YHxuKU2AIORUAsrH2ZK8qCigP6AnwFT72V1b+8fI+8Mgr1trNJFoqE+zUyEuKf
	j8mCpntIKeJMTilU7PN8fkyYukDUR5iNzA0Wq9NMivj08RNEcYEZvxt1F0+OtlnlBTvCs3L21jh
	Q9XB123gT0=
X-Received: by 2002:a05:600c:8b05:b0:499:9240:9a1c with SMTP id 5b1f17b1804b1-49cf82787camr51267055e9.15.1788519418566;
        Fri, 04 Sep 2026 03:56:58 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.237.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm132110525e9.0.2026.09.04.03.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:56:58 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 04 Sep 2026 11:56:43 +0100
Subject: [PATCH v5 11/13] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add l7b_2p8 voltage regulator for RGB camera
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-x1e-camss-csi2-phy-dtsi-v5-11-dc81d85b599d@linaro.org>
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
 linux-media@vger.kernel.org, 
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1120;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=K9g1SPytudaQ80/4FyVWQl43Z2IGxbYxunNGayfA1VI=;
 b=kA0DAAoBInE7s6GNyDoByyZiAGqao+ihk6hv/yTdGMBJ10FKmgm9lhb2NlJrAev9o5YDnzW+7
 YkCMwQAAQoAHRYhBOaT+yqro23hF6tvtCJxO7Ohjcg6BQJqmqPoAAoJECJxO7Ohjcg6IX0P/3CW
 F3TzFJng0ML4QMxe5rFn4ct4OpS8O3K/48tK0rOqPY7Pij8kXlZJd/eqNKHfTI5fmp9Wib0C0JE
 k0mfeHmAoAjZnLJ/SPtPVxdgkcL6rC2+UHEUcpxVdhPl8TSdg6u5uNgXpoWuN0HklN73erfZt/9
 0rauaYn/O0tt5EZ+8bnk17pxWsoVFo7KFNYbPGMHpbNjG4Trwnxqq+7RKdo0WGqCb2+ERaXZa+I
 /bsfTvOPL5sK8m7KEl7okzAS4h9ZwNe3JThVz9EuUzQgSovBgpRykBb2hVUsrOfKmOobjKd/bvC
 vn6KhMCJQSyVEHi86hNmCeDV1tvn3qLEUyET/Q2QW2vFrt6XBE+IwPcz9kMCpF1sng7RiFpcVhp
 7CjvHG0kA+sHdOcWf7M5INVriupz665gPsIFGUvYOFFmf8i0gsdoY/fuCtinJd24XBzzUnunMOI
 BI+m5bMAbFeHw8dbNfyvvoWR49USf7SugXV7qMhR6y1i4H7Bp4tBI3snXju3kvgf7WAL5TH9LKT
 vigN3kNqzCTWU8nzmpnR3ysJ38ifpVfg1gvhHZoSBLefKXHucVyDGFT9YFJtHwMw8gU0f+ATHEE
 4apm/Cx/OKp1v5MoXZ1QRfHb8yqFGUysxgCOSuKenNLp29Y9f70Yd3hQ4suOtOnoJ0DG1H5tCHI
 k4aBo
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Some sleuthing work by Aleksandrs Vinarskis in the bowels of the ACPI
tables for this part shows we need l7b_2p8 for the avdd supply.

Suggested-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index 0a8275d501f85..bcf3e2f610e66 100644
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

