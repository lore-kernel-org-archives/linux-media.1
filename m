Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094425237A5
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 13:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651255; cv=none; b=jqfKfD9txLz5nwr6y0R6P/OD2/C8puDhYbAaS8i3CRDN/KJhYbdHd2aJNRnHzhgHHDapX/GBXn58jUkwkvMLVQsiM0rbasJ+PzQZljP6PQTko89kFJYU6M42ltsQNGZW/6w87rFay15+Y1jcanvHksk2v8cXuAZnoqqITAzrOz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651255; c=relaxed/simple;
	bh=FnhBHziDuSpvQ7tZpRwbFfPtfB+z/OltOMxBsjosUQc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KKf8w0tCuGR+uiaUqWukOZg2gb3xDvAUZkqJekU7SXwPr5OTSOgBmuupIBPD2hk9pRLmQtDdsgTl26sOCGJ+ojK604+ohj0wl9D2C7LGc2BntjZx5b1SjpZiuvmqjOyzl2zKL/476iQSv6BPlaa6hEHWqZHDGtsI9JqDRRtl+Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KgaGxyYv; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KgaGxyYv"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c294496989aso128570266b.3
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 06:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789651249; x=1790256049; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1bKfHi33AeyuqNqHE/0XkI5JeWItjztyday3mg8XCH4=;
        b=KgaGxyYv4Uu6CC8X5Weq2AxCGb2fjrx2FrgdoRj46vEnA8GUGGYa7nVfUDjwmuwKgE
         obSgjJtiJfiPsP2ihK/EQ03BWqHIA8s1U88OA9npAphorCYyHrjcyIdEBamwiL904tAP
         FCOCo7w0HUDnJ76q3vP2myglCTQRsmkLZG63nW+UahbsiYG4iptCmj60zo0ltqCW2UPA
         IFAL+0ataTr2dLl0DtW0iOoYdSTcvdsM3vVpwK98fnlPP8DqdEUT8OYSj+H8j5gt8Y1h
         SWyou1mfruoF3unIZJNeD20wW1cni+38Hb+7Ltx82ZBUAMvZmXwXlwqFkhFQJIHaHRce
         08lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789651249; x=1790256049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1bKfHi33AeyuqNqHE/0XkI5JeWItjztyday3mg8XCH4=;
        b=IGy6lIKWUyzEPs4sbHJwFByPpoI/GospsztdMlmjXOFvlXML277mcAje++dU1iYNtX
         tWNrI5uGIbLVAXb99qRtEzKcHlBmobsu2XQv/qAg2dj7ghoqT0lSSd2f5xPQbANLbmPD
         UBYE1E5916/CpJqEDcrtLyfVE5X8ZIYfAvDkDVQ1J83lYBb5D0uoH+sZL1QpbG3h2efz
         T0OPoYHD+TG0uShnoDopKs5XpZ2uryYe4EitQRRY49KB//JwsZ+TaPkImWjwB52ukvGp
         stlK1FS1/jb9jKAobAbed7ZZ3frvGx1EHIbVsUDpPMZhQRZKE8kT+D7rWvnz64tPd0EH
         iHMQ==
X-Forwarded-Encrypted: i=1; AKwUvBzu46w4yWy7NEI/a2dTOM+JBQcrU41Q17sKb8JihTpVCys8Re3yb+fF9sfiDRdabntH1sigXk/bAS57yQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nYAgKmEef09Da4IDN+3lhID5hPqSfY5UT+yVRYswZvOL1TSzhZ
	ZMTGZTMRyEbWbm53ZL/XOMDbH9h/vs6R7v4QkL6do18UbFoGHzntU299lrQODN4XXsE=
X-Gm-Gg: AYBFou03OkS/xREwubw0GCFMlNMkplJ9R515Lu5tSPpQ0yxduw2nW4z3PtU/JTwmikS
	IaDYmlj7bi2Aq+8uZdDosU/eZ5RujZWBMS+6xa2sLHxH45fSUDiievHe4GXAVQCG41BxGLYSubo
	7qq2s6Mlgpe2K2kPpQxC8jE/tDgzM3Pmd0+0UDsF7OUw2qewL3fgDKbScz0eAftSk6Uy7e7iCaO
	VkozbLTM3DCdR7qet/5QjVkRiHXSHD6isMIc04XVjhb6FDjwaDfMJDtBHEingiOlacSOc09xEx5
	MxyzzwKa7cG476nVvJGndWCyQEOUs1oLY3AhJK8Lp3kqporVV9dC+oMxTE7yP5XQ0BXTAltYDNy
	Ih9HInNyXyEpX7tjPU/DcDhK0C/Dz7lka9rreK+GxZo/VmzzCorwXOuo7YpGX4wwCuTLqVs963X
	t1HDfI6ocb5JKXW1lTTZ07HY3R1hi+q0beZwtngIrVH/yK6tS0ni+MJTnJJcOw9qom9qXW9bT49
	G4QWJwIMA==
X-Received: by 2002:a17:906:6a0e:b0:c26:1648:a06a with SMTP id a640c23a62f3a-c29e5308f62mr466820466b.37.1789651248597;
        Thu, 17 Sep 2026 06:20:48 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.29.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de5e4ca9sm279681166b.42.2026.09.17.06.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 06:20:48 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 17 Sep 2026 14:20:35 +0100
Subject: [PATCH v7 10/12] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add l7b_2p8 voltage regulator for RGB camera
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-x1e-camss-csi2-phy-dtsi-v7-10-1a63eb35838b@linaro.org>
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
 linux-media@vger.kernel.org, 
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, 
 Daniel J Blueman <daniel@quora.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1194;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=FnhBHziDuSpvQ7tZpRwbFfPtfB+z/OltOMxBsjosUQc=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqq+kiOCCvZQDdBGX7A1hSLnuqsALYZcYsSP7g3
 3mxnog6KKOJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaqvpIgAKCRAicTuzoY3I
 Oh+HEAC8yNcA+tZS6J5IIX9EEj1ZJ5KtkGaMHL2yfAr/3FQucTtniSlzdXc9CdzY4WxBIfWz0WY
 4Pkb6LWO9o13TILU6YiZJOSPl7sI5FOs7Rb4/sGpgVuwOIhHmGsPjDaC1d/92fKEDNU+y3Be+GT
 8ojSV52gGS53gSdnkJtq4BF8epnayuAnnFlbKeuUv7ENP3guBrJVkOTXzE9w2yHrU1vT6ovYzEt
 N1bvdJVpDxzEhhvwfRqdP2r/Aq5tDRuhJcF71W1KXmuFlfctK4znItq7OH1ukz/xupKfpP/bgv8
 W2ng8MFrGu3oEQCJzTjKr5pv3jafIWiPtnPkHKFps81w/7zLhLljIHghIYkITeLKTboNy7uDpas
 5pFuo+bcEuoPvBdIL+CIZLa1hs7XJBOUOLdnqOvQWRh17s4ehOYY7vPCyjTZsZ/wvotbYvxDIzk
 dpnt2Box7dyAfYh6naWSRPGPdPZQaeTgkUX3LXw8SkcHHbLFpd02pQynWqWOFEBdQ2aaHhn0By8
 cSZzFlhNx3jITAk7jkwW4uvDTlhxw0wCasTmkN6e+RM5Wzxos61RWqjzpbAlw45qEAo4vDxfxFV
 p+3FMFNWhB15esRFZifxjYcI7Otyy0zz10yXnotFWshA4D7G7juptQ+m0Ks4SgS7dnxJHwuAiNR
 udYU04AoMUaRh3w==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Some sleuthing work by Aleksandrs Vinarskis in the bowels of the ACPI
tables for this part shows we need l7b_2p8 for the avdd supply.

Suggested-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Tested-by: Daniel J Blueman <daniel@quora.org> # Lenovo Slim 7x X1E80100
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index f4064e09d6231..79e1c47bec855 100644
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

