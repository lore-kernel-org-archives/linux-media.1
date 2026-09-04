Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EC448CD46
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 10:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519422; cv=none; b=msyyD83kScEdcDyi4yCS+lUJpgC+3culILPmyuGg7MwPlAZArqN/2aJiQ2wHByaIxvqWbFW1vWbwyc7M8/DT675SOMwdipRyObWPpiexyZqtehurwxqEekW+SgRqbkA92z+BZbxABe0L71yJi9UBGfelYKzP7Pi0y2d5Oz4Me80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519422; c=relaxed/simple;
	bh=Gr7Ug/iGIddFaJ022pOfuUZWZKw24+dtw5PShhZ/DTQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IXUlXJAnh67Hy51HwGINqEUPoW4X7zznMDU8DhiZ3DUf1/X7c3iyLiocf7jjH0AqPOE18DK2tgJmvuhJKZ4QKjbv5E48pudRyndEgP/7HANkZZle8J7Tbp/v9/eIz3KJ3pCGpc+a7Mfc13mjJC+C/nT6VljJBo6CakAgWKc/B9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N/lZK1q9; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N/lZK1q9"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49cf4f81d86so6130975e9.2
        for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 03:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788519417; x=1789124217; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uP/7+Kg0xCu41jRaTz/LYcoi/DaO3p7TigTWjK9hj9Y=;
        b=N/lZK1q9OmHfa4ysEryrl4/y5mHoYS9EUzKic05YuaIm0AIP9dWS1+bnVppuq+ynK3
         Q3mHX1eTzmK71RB1/QKD3MsZdJCuAilMlRaXexIfdgQ4FYeXSi7vbDEQ+yrfDTpIpY9p
         KqSRH7IdoJ161VM+l+i3WybH9ahKxjyOOVs8K3QO0uzyfp4cNmrVBD9elXXOsDf2XbVu
         tHc91k0NLEKKKwltXH25UXGHawElQAo7M3w/sGndsf0RiKi3VuPIFyqWJPw4Gpv7MUQa
         odiUG3tdW4D0E7H6vUHTr2hcvPPFH+YP2RTdYy9P/9lSPeWdJvVz6oYtZvLDmaplx7IS
         mw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519417; x=1789124217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uP/7+Kg0xCu41jRaTz/LYcoi/DaO3p7TigTWjK9hj9Y=;
        b=lsliqEZgrbBl/Gp6+Przbq6Az+DQhINOiYXzL/cyb3Vm64PB6f6Y9khYdmf9lLsioZ
         6KFJQSxq/5w98E0Z7UOpnSWkEfSK4oWJs8hp9wWr/mgVXVFgE2cuYon7Iax7MJkYyDVi
         HplUCBdGAwl5SPdJO/HbZN6EpaW11WSJYfDdSKelCYqIH8g5fsdnDNyprUvvwLnZnWi4
         08eB2laM8ST3U7fYYKnsS/bbL49ILr5Tv7daPJ/UR/KyvOYawfCizUvSGZzl7leWEzKE
         KBpb6SrW6xbkGHuMkCOhQPC6rdyVCp3Nk0/5e0TZ5VlC/u4iqK9ZRamPIpCPMZol9sow
         0QKg==
X-Forwarded-Encrypted: i=1; AKwUvBzv2IWvDvSOOdhspHrYlY2TLNuM0QYuxHpf67zEbUafW4T5uWizlf720SvmYNopMHxkExBbBUPat3zkRQ==@vger.kernel.org
X-Gm-Message-State: AFuF++l8elwZOVnd0ybiPNI05fymtIGKjkTM9nxlfmRYVAK6IjVnTPc0
	NqhhLFlglFgy8oPL/a/q2hyLyWCWV3mNuBBOQWKbcuhotgKe3uJvnOQIYGXqWs4Ll4o=
X-Gm-Gg: AYBFou1y5NKc+Qxp+QsH/IGuIDELh6Wy3qNkMgABT/RmUAXz4R5/TjqhuqNeiIFgxNM
	LvMTpUGicPN8YqrXZscOTX13EM+RXPPSqVbNCnbWcc28rAfH66nv7wrG7PWnOjLNZ3Z16u6D01e
	HWUt9YCwQgyH9N7ap91mTVltbPEZ667s9I1tMwRP8gtN3cpsi10N9ttSoVIWKASZ+vBQU2KtZbS
	Vlt7krEt9uMsb/2j9K6W+5HxWAM1LHKb9ipCk4nfgXI+vrO1S7Ko7+AF1fCaZtmrzOGpbJ0TpNH
	hh+vivSKhp1qwGU8l+mW8XJz0vsfJDrI1qIdgTii5IDDfV/zhmY8wlsEwRr1dgk3lwMXwqZqsDP
	Mrlon/406iMe43vvyTINCCjNE6Jr5iv+CyFPWzsIzxktYv7DpuOOOEK7/eLKnBYCioBP1/LkiQD
	NpqH/2Xrw9+PWI57wn5KNn2uFUambTqGmYLsz9hQaB0wA4G3Y8yyHepJxAOE57EErajTIhE79xv
	S4w8mr93xGW
X-Received: by 2002:a05:600c:4684:b0:49c:fc6c:be14 with SMTP id 5b1f17b1804b1-49cfc6cc10bmr25372025e9.26.1788519416721;
        Fri, 04 Sep 2026 03:56:56 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.237.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm132110525e9.0.2026.09.04.03.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:56:56 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 04 Sep 2026 11:56:42 +0100
Subject: [PATCH v5 10/13] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add pm8010 camera PMIC with voltage levels for IR and RGB camera
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-x1e-camss-csi2-phy-dtsi-v5-10-dc81d85b599d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2225;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=Gr7Ug/iGIddFaJ022pOfuUZWZKw24+dtw5PShhZ/DTQ=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqmqPoE0cE6p4BORYtCha5bWjNpzCh602M1AANR
 XWWidVA7gSJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCapqj6AAKCRAicTuzoY3I
 Og9kD/sEKrMOzjbBGk0bxfQR1ULKiY8KrueX0zUCGI60Ilk2fqKuPDpVdylZ1T6ydGqKCUpCDvH
 vQBs23R2fSnjKUWH1+KHOskbbUMjI6Qn5w2ONXKt6kRfMrQu0YlW4L8yM8v7radDI509mQ+5AmU
 iM0+zXbiKwB/jogHRMjZTvJZIfr4v89I2ESLeWhdz3NJdyW8ETYiNR7o1avtSgJmltyJWoSj3ES
 d1CRI5WJk0vUxUhZlVmveAglBosVnhpt65a4v8zzp6/zo5J0HO4qsZb+ENZbD2la+Lxge87rt7M
 MtKkqiTn20lmvzv+SgOakx5tZmSqwoqQVUEGNMi64y2sdYjMTRK3BkMyoGB7EuRzPVde7k9bQ+G
 rfaUaArMXTsn/4ja9trKG8HKU0r55a6LV2Z1mKBXH6hAX5j1dDxVorV8QjimFHihxW5sZwIyUau
 yVbOHjJQNKNUb3A24apgdFjymY8028CwBButnamq7qq92+yyro/wf5eLlDskZC3P0qBI6OYTVcc
 6nE0mF8LK5ZW+gQjkuchoLkJVr9c32FfL4e5JbYCkFw8xunMk5Ij40FYxNlr5ZboJbCwu+X+BXy
 EKn1antPCYdRxPD5ParmZdOFSU+igtTHdEFjren4G306juU9QznqITLNk4qMy6DWAye+2LyEg7n
 Y9edR0yBWf6xziw==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add voltage regulators-8 for Camera on slim7x including:

- vreg_l1m_1p2
- vreg_l3m_1p8

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index beb1475d7fa0c..0a8275d501f85 100644
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

