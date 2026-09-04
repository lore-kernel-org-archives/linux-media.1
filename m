Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FC14908B5
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 10:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519411; cv=none; b=f06yY+J13DpI7daN07UXIzWCzXSfO/XnlhG9aoZkLCXkQuCkpf7IsRE0rL4Ic5YnHRCp7PmhgKf6/qzDZTT3Sb8a3yO2n4GszOoueYPsFILFXOgS6BVyQXqaW6b18NZNKthr68k2Llp3FRllgFfk8m3ggmYkKupBapWalv60Y+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519411; c=relaxed/simple;
	bh=M9kXVsvI7HG69slRlyhwlWfg6E0tC1kNp8VaQyyX1U0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mfbNBTXfTn8RWhNEAcXRTmD9S0hlfJ5q9N2MkGf1yqNgFY62T4RSb0RnzcW/qbNQVClyVkB+u26Wbg7SfXrHZVT4/ioEH5O4tbj8zJk7PImG8+cSxUFQWbaoQPGe1ir5Oplt2HVX/OG0crWPBM3kV67UsAcSozFxI2pJqZjqKNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kVmOFWJa; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kVmOFWJa"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so7575745e9.3
        for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 03:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788519408; x=1789124208; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5wPHsZMXlrul2kEoI0D9Cua5RpROo0Ph/WeAOvQ4+Z4=;
        b=kVmOFWJaYwdE1r5bLykHhQU6JYe7+VQd2e0YqJCz846dHMtA+A3QJDqBPgFlaVx+PZ
         kv0+nii6YeENWHzAMPF1fyK8bu2tJ3hZ0jr1mDiNWeR696qbsl6sqQLct5JIh7afPdYf
         ljpKXjvPd+nK+pyHRIsGUIidPxAkkFXGsRllnAtOlthWwaZywDBQq4XI9gdls/UTdXx6
         hyYI8IgMAhLqsOb4A9yJ6rfx109/dMMZL8UcB6BAdezDGQw4msVAkGE0zLbqWgZ6j6iv
         +25ohqGwXiyRJc+0tHRDMx72v070og9LabO5ohiu6ycGue2qp6QKKNmCyHXqLq2skFHn
         4svA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519408; x=1789124208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5wPHsZMXlrul2kEoI0D9Cua5RpROo0Ph/WeAOvQ4+Z4=;
        b=ChM0Wo8TNt2kqEoH1FdtWLWpD3TvoOUK5pM4ugg6VqDYodJXEpD5tmBijL4uaNQBYE
         ZqCzd8Bbz71Q5Kc4w2ohTnJ0bnUD1FIQySm0YM14LNy0VpR77Gzc078dALIa6DYlwivY
         tLY0dZFOKXEeSt/uiUmsNbzsNCmbQDCMxvoU5b63KSIbO17AKXdPH8aeYbZxa57I/xOz
         jOibWgLGVTmbRl1BO2JOXSKumoqkKWCG+R8HNXnCCtr/0XKLCb2af3xVkMc23z10amJY
         9AB15dQoxSZ+nrmoZYsM4k2YrBZ93Y/E8tBNL0kTf/QqDZ+kEi528M8PylDKCdiI/W1Z
         JCow==
X-Forwarded-Encrypted: i=1; AKwUvBw8Gf3S43XxJQ0FUf/Wqr/Gz85lCFhK/8P2U4341NuRGXxWJypJV/3OGgnEqoVTPOpkm5/TbdYVYzrjdA==@vger.kernel.org
X-Gm-Message-State: AFuF++laktVl6LgxgUy7qLFfPln/1Zt2CTfUs7CLm3KH8q5h3gyGoP0j
	GedSl/hrc6mCeavEIlmiOmvOGyY0nAXaMIIQ8yXFi4t+eapi6HADEdR+oMmjjE/U+t+xccH5s1T
	l9JSxEMQ=
X-Gm-Gg: AYBFou3cFHtcjyr3Wi7T4INJDCAdzftEoN0991ONW4Jpaj7wkb+q9BpLXuOBFweU4+1
	D4I9aQhQIRBcwtz07R1I/s7gUwDhep76gkFPSLFcZfWGZQuHKniZpD6DpEHGnR0n0RSyZ4jGCh6
	+q9ES5RyLggoSfOi9FWOktV6Nol7NAijKINfHqPzHcond5lW31bhYd9pqUlGDUW5+U7NXaB7mu/
	NGIU6tGpd9AHTm0WyMUG6ia5WlNydZ3TUSyPY525+3+2GU6SXUD7BLBEHCGfXgzY6dEC01YmxwV
	a+nQhhpCsqOgn9nLr8+K6R9gb4LIsUJbXLidOsmVvhjoVHDCCNYd62ZjpLtLLeJ7qfaFqrFP9zl
	/TmbmtpiNkIozOGdtDl6Iya3h6SicvmKrxRZkEMtD2yOURa+WyBSB3iUbb43bpRX7cCFv/LSPHH
	/bRxFhf4jzDFVpxuD8HcjErjx9Gdl3JN+Tj9e68qbomzt6x9bySUZsW0heJkYSiDE8R1tFmgeC9
	x30bSWwVrZ7
X-Received: by 2002:a05:600c:34d0:b0:49c:fc6e:a3d3 with SMTP id 5b1f17b1804b1-49cfc6ea71amr22354165e9.18.1788519407679;
        Fri, 04 Sep 2026 03:56:47 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.237.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm132110525e9.0.2026.09.04.03.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:56:47 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 04 Sep 2026 11:56:35 +0100
Subject: [PATCH v5 03/13] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-x1e-camss-csi2-phy-dtsi-v5-3-dc81d85b599d@linaro.org>
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
 linux-media@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1761;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=M9kXVsvI7HG69slRlyhwlWfg6E0tC1kNp8VaQyyX1U0=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqmqPlbs7W/4Z68URfcSifuw2efIVURUqLN/vhw
 HCeM+HFIAaJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCapqj5QAKCRAicTuzoY3I
 OsxmD/4hGqKLp3LorMln4h335RPDzXo/IVveKRIeg87PKW8S9TEUSqh6PWhKC9S/GK5W+jXEYAz
 /10X7GeDnmvwdRrOq3BMGOUTd0XcOHTeVSDe/HBvl4oVhkVRfpp1zBPb84/NB1AVWIdHIclACxj
 iIR0S25rFE9feYuyIJbvHEIYfrGjLCzIw1jbjhlp/eOeLaXASH4xEkwzLBjoR0zW2f5wLZoktoO
 z7IQfx2kMvZchTkgbWteieG3iSeisCXZ2ig6KwC5Gm8lrsGDIe0XmmSHUV5FwIoMPgXKH8o1Ohc
 UEwaeP2DLmLEqkQ2Q4DygRk3ByZBOKh5eGs5KPvFLnFqwpjgFRyLk3lqw2B3JGoig8oLiGN85to
 qdoOwO5U25L3aUKVqUqNCL4qU5DENdPkU+5ZuIVFKBlCQ+Iz2pg6uQ22IlC0PNszdGdE2XkXrXj
 zE4v1PEvGAWE/lRgQnZK3MVs+u0GXzVyEwUHU+H5DfI7xyihm2QkpH2XIbsQORx+kxTrqoZXVcC
 b4ekjfz/d0Ld5JIoe/LWEDUhk5tAaEjikzHwbhK/JCRLVt1gOHmqeJWgQwxFcblkCvYF+wkyL+j
 YKdKUps1MqvfGM6gaol6mHji+3H4opP9O8JqhbEFcrzfvWoIuQhXKy0PFwMSLBf+14+rR6lH9dO
 B/A5BraqDOVZVZw==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
of previous CAMCC blocks with the exception of having two required
power-domains not just one.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 4ba751a65142b..9a8d6f020a391 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
 #include <dt-bindings/clock/qcom,sm8450-videocc.h>
+#include <dt-bindings/clock/qcom,x1e80100-camcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-gpucc.h>
@@ -5550,6 +5551,22 @@ videocc: clock-controller@aaf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,x1e80100-camcc";
+			reg = <0 0x0ade0000 0 0x20000>;
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,x1e80100-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;

-- 
2.55.0

