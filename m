Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF7350C2B4
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 09:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057799; cv=none; b=l9K+AaqXpECSVI/U4rC5KnLgzr9rzJ6EKLgFAqKSJTYkKqYYOzYXTbvSqxqYfPguGJ/zTeu2udGGTTLKt+acLeDUuU9x59/zyxJk0kxQSur0AyXuBe6gA9lGvmo40w5aYbuqz1GciesLdAT95ffIIfTmdqXyO6Ks5BzWP9pxjEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057799; c=relaxed/simple;
	bh=ZOpltpafv/7LlNWra6wWjfFa96A+83F+yhqApR3l6JM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TmzZDhOxgANaT6vnPG3nvKg6Gx+m4Buux0vkrsmcoSWSq6HKYD2r4W46JyiyI09yDQiGFfrvHyq3TfPophe090dUSgt5h6ie74Hx3KdMb9QdO11oFFa2MyAoXODTAC+CN6aSX9LUQGkfLgLg+BdGnJbR06I3/yBrEzH2C2Y34b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=KAa7pvlf; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="KAa7pvlf"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48af27fe287so174162f8f.0
        for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 02:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1792057794; x=1792662594; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bZtTPFUdhwPPjPop4o2Vw8B13QBJM3YcreGJyrx1Qvs=;
        b=KAa7pvlfN9u1gjVrWFZ+5GeN+qfPSajRIwkJ7IzoTZjpdwy3h4vC0Z3Ws3h+3Y3OZD
         tLDamhB/H4brlXm1u+0MG7S6yw0FM06O+6McvXfODyIb9sxhUwk4zEAUCUVLZNzAyF3a
         vkToGr5ZQDTkUpYhEKs5GOcQkvlrtBn1Qo3XBWiEY2cxVZwp7xz8sOz3/MwPMu0Xn++/
         Emgb8LgRZp5EovzWJqNdw64sWx9bWP0OCz5LRiLS+vy8AIqAm+GB5ZEeokOL+9NeBD5S
         +1wDW9lXZD3CEQteiAwBmtpqZdgL3K3UB7zRdjnfguT55dh8bQpsU4JJlkveI9PWG0mu
         OlIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792057794; x=1792662594;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bZtTPFUdhwPPjPop4o2Vw8B13QBJM3YcreGJyrx1Qvs=;
        b=tiBmL+l+tZJANVouU8MW/4VsvazxEdv7oQuE+7eobswGUjC9hcjJO1/Cak54oEvyBj
         lwoEJ2QePHsk2p18X474f2P+kBr6iozmy/FY8ypT/rKOQ93yRGtG0U6V03F7F+0bE0S6
         CYmnz66TkORqUq+V8Sqzb6Z6oK4U4vAIoKGvVLy5izkXxiIw9W3tMwb/XB7lhWlrIGt1
         NiUKE/6T90Fshm/uXVTh+bwXwQdSSMMwQmohngPJyN4pm2Lo0QAeuIBdQ4Hh/fAzlwW/
         8qxIUbNCd7RpJQ8sp1XCX9JPM1Rj/PqBzP7NxU3bREzGagslOuk+hh+ycmzrBfbTuCBc
         DgyA==
X-Gm-Message-State: AFq9FYJlu+Nhj+Ez2A3L2o1uGAHaS5msSAxjbJ5y0xaqjQ7A8+1Gr0Wy
	/hXdWk84YYHHiFEUMks2IDgUOA4g+H8/yQteCn8XGWTgM70olVlbl+NTMm6fdMjED+k=
X-Gm-Gg: AYBFou3E9u7+vvcsS6BPFk5U07sCPgxR1EYqiTj32+Juqds9sMzufSf0Q/YsJFET9tx
	ttKXsbE7YEEjA1Eo7N1zmOLSTk1Hzc/hRKa0wHCwmTWUc0KDGST4ccu7hdmyEU1IwjyxdYaxvAC
	F5dPLc21M4eU60C6LAQ5rFfM/n8/Ayi5Na504cxMY780Kw+2Q1hP794aCs6Vbhb5E6LuTYkmCnQ
	pt01veC0KI8hOlnEB3S1zP5bwMSxMWvD2ma4ro5T6tH0GY/Gu2jr7aThx9HT2vEK1yGyW9JTvO1
	JILr5F0viwo+i9za8cVNdNAYzyUwGYgAfHNjDWppBsc4OI17r7vsk1tw06v8L7js3BU0u5HtfP/
	WtsheYBtWPZYYFYYGANFoWw8LN87xqOgiH+p0VH3/8z91zM44qWdu4arC9Af9yWj2h3I77t9ExQ
	PkK8fyaVC0vb76R+n8lPt11JvZigyNlukI+DYd6jZoZApI9Uk6b2banOKcfhFm7GqTnOGV7aA5Z
	C6muRU8UB2UzejvkPTYz46xQmNQ/iKiU2waDykj696272nj3tkXELAuHvD/9+0J1Sz68V4+BIUk
	Yyo0KXamzBKWNkcB80UZsvKWZ7Z4XYeaASGHxQ==
X-Received: by 2002:a05:6000:40ce:b0:48d:bb54:77e7 with SMTP id ffacd0b85a97d-48dbb547b24mr36277483f8f.29.1792057793781;
        Thu, 15 Oct 2026 02:49:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c6:273c:cd01:737a:1f7b:d586:a293])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc85b1sm16926246f8f.54.2026.10.15.02.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:49:53 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Thu, 15 Oct 2026 10:49:32 +0100
Subject: [PATCH v3 3/3] arm64: dts: qcom: sm8550: Add the CSI TPG regions
 to camss
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-sm8550-camss-tpg-v3-3-00fe06a3c557@imd-tec.com>
References: <20261015-sm8550-camss-tpg-v3-0-00fe06a3c557@imd-tec.com>
In-Reply-To: <20261015-sm8550-camss-tpg-v3-0-00fe06a3c557@imd-tec.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Depeng Shao <quic_depengs@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 William Bright <william.bright@imd-tec.com>, 
 Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2

Add the three CSI test pattern generator register regions to the
camss node, matching the updated binding. The TPG blocks sit at
0xacf6000, 0xacf7000 and 0xacf8000 and are used to generate test
frames without a sensor attached.

Assisted-by: Claude:claude-opus-5-5
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: William Bright <william.bright@imd-tec.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index d21c04b1a306..1270ea8e4fdd 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3862,7 +3862,10 @@ camss: isp@acb7000 {
 			      <0x0 0x0ac71000 0x0 0xf000>,
 			      <0x0 0x0ac80000 0x0 0xf000>,
 			      <0x0 0x0accb000 0x0 0x1800>,
-			      <0x0 0x0accf000 0x0 0x1800>;
+			      <0x0 0x0accf000 0x0 0x1800>,
+			      <0x0 0x0acf6000 0x0 0x400>,
+			      <0x0 0x0acf7000 0x0 0x400>,
+			      <0x0 0x0acf8000 0x0 0x400>;
 			reg-names = "csid0",
 				    "csid1",
 				    "csid2",
@@ -3881,7 +3884,10 @@ camss: isp@acb7000 {
 				    "vfe1",
 				    "vfe2",
 				    "vfe_lite0",
-				    "vfe_lite1";
+				    "vfe_lite1",
+				    "csitpg0",
+				    "csitpg1",
+				    "csitpg2";
 
 			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
 				 <&camcc CAM_CC_CPAS_AHB_CLK>,

-- 
2.43.0

