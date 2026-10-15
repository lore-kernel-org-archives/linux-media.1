Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11868509F18
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 09:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057793; cv=none; b=qGp9xxLTGpkVSAW/WrgtRBeLA0qyRmojmih9+w73ROgR72OWWhKyMJaZefMjnPMSytWW+TSz0Fcitp3aOv5o7SPgbccqeT0Plg+RuG29bcohS5NnwgCSvXS8nDVxWGFJ4RedtuXYsGrOPWlccCcLr625cQjGOispBwrpJ1uyNFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057793; c=relaxed/simple;
	bh=EPbN1rORJWdhO5w0CrMysvyQ9XDimYmp4AD4nvPYq10=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZzXVuNiQgfl1SyEHM5po7U01nTZ1RQbWp2P630fZE+Zw9TLeA0lOHGzfvBN64M0S0mg1nRPNQHbDYlj+wuSktR8WQLyawhSQQ9HZXz9tg92R+g8Bvt9oGeOY+AdHXHbmKGxLL4mTDvm8NaMdW84QRyXeq/nFkkR301UniFo2fO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=STW7YJG5; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="STW7YJG5"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so17228905e9.1
        for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 02:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1792057790; x=1792662590; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nYyMJDcnnLjV+DbSoWYwWjwnp5oOgNG09C0OGr9mjak=;
        b=STW7YJG5NZpM20QJiSKm1wL3S9NLdMLha/rQFNb0+DOJFw0tymXJKk2dqex/zeElRD
         CHM3Nwj9BsfgQ2zrHfK+ou3Xk7l1c4vrHWlZQHk41Vyj19Zv+c561AVfpuoITIFcvdf0
         D7znrdm2rrQ36U8vp3aYbUQPnXC2tWmqHaxKtvtOauAd0XDVncaPxhGv4zjwVDIBco0B
         IL+cilffNulZEkzZHEbdNK5Lad9Oh9OJbZrZ5LC6vG1N5kLxm48AdGArOc1hlfCbeC3Q
         OLMIhPluToN9sPiBKS5YeZmvCSJG1QbBFFepyxzcoiT+mSj6tK7K6vPTlm/tJLsToyVH
         AtUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792057790; x=1792662590;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nYyMJDcnnLjV+DbSoWYwWjwnp5oOgNG09C0OGr9mjak=;
        b=J1hDQ/P9KTSy/CmUc3q6X9AttQk85UQ8MeypP32Cl/53y3a0/BMJBgHbk2y3jH7Upz
         gydPkiWg0GXBYPNrv0tB6NRgsI8F4WruUSnGOOr7/MbXCrB2HyI/0yP5yIIX4+NRThDv
         teaZ4FWwV/phWoGM3O4lj/fRGMAMKBnA6Xe/Rw5HhsyscxZJT5YwqMOUyKmfLaVWv7aZ
         Uw922uHWNzlvave6d9ZrbSAHYNKIifAQ8xtV5rcxq7tmdAW0OnSO1ktjw2hpeot46A8B
         +CoywAdelUcdpgDzD4qog5sFy1fFb6QZwp2ikd5TJZkSY9Im9nrBlfN/zfWlU1v8coXs
         GSvQ==
X-Gm-Message-State: AFq9FYKp4RgLwWkiy0cGQKgZN76L1LPEAVVpKBx3u0dWajYR4rskrdYN
	7znFuKIoX0CYlgS2Fdf7830fvGC7vmi3OlyfLXRxpmlYQQEKaCW1bm138MUOBOgBlg0=
X-Gm-Gg: AYBFou3XHDXTP4K3Q9I5/v+n5M7gxEgfWGU7kHUjtcsnEP4xuZAu3Iz2qRQ0yL3Ullc
	coK2moFDHMGsTHws0mZn+XQj1UZ895tLwpkkVLq4bay8apKBNOHzuEWMXWbTKa/N+5tE3larCrI
	2RDl6CZ8hOBaD0rE8lUT6zQ2nnZtyKeDdWJNuTVrbabPfRhqjNooD70mFYgQ9+RP/Mnmfqz9+BI
	BXWmpqWBMsYkmSM3ZHDxeRkBOTUi94g7X3WfIJt9FL6W0YCq9F2/gg4U4MgcnlqanmJiPTPbHpy
	c5H9PMHQuq/fX3h+SmnB8fJcdtxcEEF3PRmr9YrrGaSMublL4v1eUvOemSzCDYLc5zvqOnzt7h8
	H4XjPVvam6SpOEa3KguA9pUAXAGEb/4PfSig+E7msnfDfgrXdLHawn/iUcYt/+3OHZ7WOhTjlUx
	Lbm6mnbqqp50yHBPtrzZg7/kW9xE5g5CyMjnV470ZRnQ9LIA8N0eXIr4tdy1UVNPadrp2ukBrKD
	a6lLkvntwXo8Gq1H0THw9E+Bm5OKBoWgVA7DOEpGT/l+YzXgA+ApmKpkegMw80JS5+OZY4jcs1u
	aoBdMe+DLZexxfEqIeMxFccvzG4=
X-Received: by 2002:a05:600c:6099:b0:4a0:1feb:de6a with SMTP id 5b1f17b1804b1-4a18e4e7a85mr352366385e9.30.1792057790109;
        Thu, 15 Oct 2026 02:49:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c6:273c:cd01:737a:1f7b:d586:a293])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc85b1sm16926246f8f.54.2026.10.15.02.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:49:49 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Subject: [PATCH v3 0/3] media: qcom: camss: Add the SM8550 CSI TPGs
Date: Thu, 15 Oct 2026 10:49:29 +0100
Message-Id: <20261015-sm8550-camss-tpg-v3-0-00fe06a3c557@imd-tec.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKmh0GoC/4XNQQ7CIBQE0Ks0rP0GqCXWlfcwLgp8W0xoGz4ST
 dO7C3XlRpeTzLxZGGFwSOxULSxgcuSmMYd6VzEzdGOP4GzOTHKpBBcSyB+bhoPpPBHEuQelLW9
 bcailaVmezQFv7rmRl+sn00Pf0cTilMbgKE7htX0mUXo/+CSAg5K80+omGmHt2XkLEc3eTJ6Vg
 yT/ETITXFmtsVZorPwm1nV9Azrd6KwHAQAA
X-Change-ID: 20261012-sm8550-camss-tpg-6bd0991432c9
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

SM8550 has three CSI test pattern generators next to the CSIPHYs. They
report hardware version 2.1.0, the same as the x1e80100 TPGs, so the
existing gen1 TPG ops drive them unchanged.

Describe their register regions in the binding and in sm8550.dtsi and
add them to the SM8550 camss resources.

Signed-off-by: William Bright <william.bright@imd-tec.com>
---
Changes in v3:
- Updated binding example in patch 1 (Rb dropped since the patch changed).
- Link to v2: https://patch.msgid.link/20261012-sm8550-camss-tpg-v2-0-06dbbe36ecd2@imd-tec.com

Changes in v2:
- Added commit message to patch 3
- Link to v1: https://patch.msgid.link/20261012-sm8550-camss-tpg-v1-0-620ab6f151dd@imd-tec.com

To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Depeng Shao <quic_depengs@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
William Bright (3):
      dt-bindings: media: qcom,sm8550-camss: Add the CSI TPG regions
      media: qcom: camss: Add the SM8550 CSI TPGs
      arm64: dts: qcom: sm8550: Add the CSI TPG regions to camss

 .../bindings/media/qcom,sm8550-camss.yaml          | 17 ++++++--
 arch/arm64/boot/dts/qcom/sm8550.dtsi               | 10 ++++-
 drivers/media/platform/qcom/camss/camss.c          | 50 ++++++++++++++++++++++
 3 files changed, 72 insertions(+), 5 deletions(-)
---
base-commit: ba86f67908354f41f269ca1d64b22e4624766dcf
change-id: 20261012-sm8550-camss-tpg-6bd0991432c9

Best regards,
--  
William Bright <william.bright@imd-tec.com>

