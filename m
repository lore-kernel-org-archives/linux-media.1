Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3253CF68F
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 13:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776347082; cv=none; b=kk/Bkfpa9XnZOtW9E4rqGAh/wFxMQMySdbEfk9G6p5rBvT1D4MwLdxd9FxGsnY6fkK8rpWwzSL1s8H3j5YHJpm4lnhOpLP+kb6mbY+KxIMq5bSLV+CjmDn9B2Ky/1vDixHGeq9vm5XTqS5R8vllF6IYOrN+GiPriN1uyG7t9v74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776347082; c=relaxed/simple;
	bh=aI25nEi9VQ+DRbhHhvdWFYIwKb2dX/WGA5UFAotTP7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vs9vDlPhol5p9MqOA0PhBV8s9nSsUuW5+4eOt9Ox8PtrFoMjxcz2DyR4S3BGHfaQtmhzhvDIg5JXv3FmCc46S5rMga0OqTqY9OvXdqAFv2b5uOw+GbX2VBBaYBn1guEZjVV+ZHk7HO+Z372ExXpx5Gvfu7y54uCm7wzeJc+EgAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ortdAvMO; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ortdAvMO"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-79a60975dc5so93437867b3.0
        for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 06:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776347076; x=1776951876; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T5R17ZLDIA+FBJrsZkOSCOpWtAhdlsU3PoFA3MU5Wuo=;
        b=ortdAvMOHjNZzuwXYaOF+MpBmGjA4PYIp+AcueYVu02wYaZndZD8Ac0yiBExervz/e
         r1hbnbLDc18OL9YMEugpCk+bnSWkb8ZKQ2fPOEl6TdDEK35H/4xLWhLExxLKxhxBwR0L
         McY7HLTS2vAAZbtANuL24hb01lXRpWCfagaYvOFTwyiJZLDJX/fVep+fJFWPyWubNIah
         3nv0DeukozxPVWHexBTvDNRGBn4XsM7bN2sU6gvttsoZ9Xn22Z037LyF03qizAESH+Ri
         qHWEORYcpKM3oNHrSUCa0U6XTX5dAdNWfXRROcRwPMlOGOrz/LNfhwgK4i+EO80M9/sv
         ZUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776347076; x=1776951876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T5R17ZLDIA+FBJrsZkOSCOpWtAhdlsU3PoFA3MU5Wuo=;
        b=GTZGwZoysU8DKMZNctAiaD1fvWr/O11uvtyOsrFSCq+7PXCcm2Na3A9t4jDafAd19v
         vUrsK3BXxBIK94VmO/6HDfowqEgR0lOQwIYns0ibuGqm84iDFRxUSmy85eQP8Bvkdvwd
         Hmhik/+Kcp9PktZlBiYcRHR1eXIjnQ/eZfAm8NwiIbMEcvbjrgd8tNoemdn9f++KI4Jx
         4c9lhUXswoHxqRFKzM4yjDmv5mgKOYWv/63acrBz+H8hYi34EBI4oBGxATm5ssCpjv3G
         l/nAexGgfmSRXKiZoehY7GPs8FvIrOM8BkGW7mB3AhLsZd4a7UeVxcNdfxiHDVbK6TsD
         gXFQ==
X-Gm-Message-State: AOJu0YyZfcG/kAr7U0pJTOvfUcovsC+ILZohJmUFZHEmm7MTAySwLd7E
	F9goifTS4rItGVBLeycDaAFKF8yrZqmubaOzait2RdJqz1gQvyJmfVHx
X-Gm-Gg: AeBDieu2DztclYQtjTyTbK+9NClvSu0B1qv59b2kmiFdstNz7E4r6A+CRJJc5Wknw1p
	9dqcRPo5l96w7nwhvbi1LWKYd3PRH1KhSDZ8ao8CieZ7hmadj2AnxBDmlMzaDq438Onk0O0g6kX
	95EShpv50DJAqJo7DyXN2HK5ooG1ITafrdn5KyInNxWa7P9P8kWBsIgO/eHcw1riKkGqSqHZ6VE
	J+DpLfNnkfWYAhRynCHjgPoyZ/1brtAVbrvygEow76Ndzy0FoHQjsLi0BcBUNph9DVdzB2/z+Rc
	2+CRg5bb+Jv4xQF9X2e5fGPFKCb1GSaVAMsLB8F78kvkKN/M55kwVVTqwN4/K7wa1WJKE2Z/3Lu
	1xQEPe/nRvqMdd8VJXY3hF/fRZgnruKDJVYzevM4XtmxACCz8roZYM88h5Vb8s23m5KMQVf4WgA
	rzFMM8Na9fyd/meLHfPjY1jKnePN3m2JGWJl59
X-Received: by 2002:a05:690c:3481:b0:7b2:6177:2acc with SMTP id 00721157ae682-7b261773862mr189577217b3.46.1776347075855;
        Thu, 16 Apr 2026 06:44:35 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b76931854esm23363737b3.37.2026.04.16.06.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 06:44:34 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 16 Apr 2026 16:43:53 +0300
Subject: [PATCH RFC 06/10] arm64: dts: qcom: msm8939-asus-z00t: add Venus
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-msm8939-venus-rfc-v1-6-a09fcf2c23df@gmail.com>
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
In-Reply-To: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Enable Venus video encoder/decoder for Asus ZenFone 2 Laser/Selfie.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
index 90e966242720..231a3e9c1929 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
@@ -267,6 +267,14 @@ &usb_hs_phy {
 	extcon = <&usb_id>;
 };
 
+&venus {
+	status = "okay";
+};
+
+&venus_mem {
+	status = "okay";
+};
+
 &wcnss {
 	status = "okay";
 };

-- 
2.53.0

