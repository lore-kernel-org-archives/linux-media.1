Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9677545A29D
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 23:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784763382; cv=none; b=sKJWg4GsvC6UYF9AOopVAuK/giR0SXXpjKuamNGXoWuU0E1iUAnP9FLSYedSAZSO3/E5uBxT/QHiHPjMJfXkWOQsK4s6PLsoT8tAPuzSlGFFguZSDA2KDQ9HS1hPPUcZhx9aVK5FBL1qS2NyJmTuwc5Kg6vdkcYmIwWsKaEedew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784763382; c=relaxed/simple;
	bh=/QV/a2X9l1SRCZ0f0eQqmAxS/D1oWuZ8tyi8t+tP54I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k0SqqfFX2/RlJDqDGzDkSzdp3O0eUGbRxWdeUiWdXs5lEz56US29mQftg0XvfG9E89yQ7QGiNdwFUptWzJRFV9px2s4yWRCZvStefqfpw071UmMdxsBHpKRmc3S1mVuP55hmkg6LMwbXAORvWfyyzLNw+U8XXzfL3BZAjVLVqOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L7F2Pk+g; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L7F2Pk+g"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-81e6f2ee60bso27327b3.1
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 16:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784763379; x=1785368179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9smGZPIePSsY0cU9QHa9y4DXLJagF50l0voTZ623s+g=;
        b=L7F2Pk+gUaqyBxJRR0D/QPHjrGugUzVNQSPrz4exsIZkpIHIZcRs0dcB+t1mUInS7+
         8kP036BMxU9isXxjIUA3NzQXeGIfOqNYLwaRhB8vaoVxo0yIuCPRyAT/pTQM/Oa6rmDW
         HCtVVrn2GO4d5G3KfIRKG85OJUh27VMwLy+RfedB9YospWhO8wFVpJJfU3yLuXvNE+RM
         IBajCI6L8b45PKMZZqwaaMU+HSDMqzEixecvCKxD8FWKF0BEnEY2SeQt+RNDKaf9ZDsP
         OjrmQ0aPkBptSqa47fBrxw8vWV+LJJHgpfKdr959JPDRq1jOhOFm50XcSRrQ2j2mCwIL
         Oo4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784763379; x=1785368179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9smGZPIePSsY0cU9QHa9y4DXLJagF50l0voTZ623s+g=;
        b=UexXgjBH0mnHPmFVU3xL5AfBEfJXmrG0Ke5AYyF/ddcWnEDRe9mAeo2Ku9tnMJpykM
         FUfnShhgb+vNnQbL6bxcMopOP0mC7ggSNtQMzGDJCuEf+3Ba4xLuNrjBhsJDN0yCfsRK
         hBlZtXL+RLoPPAPl/qCRXbsHer78XRCXCNnqig+e705vu6PqsrHJEkdCCcadw+90Hfxf
         B7/NdNOLzexJPSJyaDz18yK4X1x+nIzfq9j3xCK8L5xg8Lqw8TR+T30IOve8X3mZqWAh
         p7g0h4HPibzugcm4QQzcldpdx2w0c08i+45Zw/CSRguEowrcYgepjPV41sdofS26rXcJ
         y9cw==
X-Gm-Message-State: AOJu0Yz/Qf06MNuknjvBa7/X+zYh/grkmxOd2EJqyydRG4V/7rT4VAy/
	AgGrzSInfipY0383kMTmobPm+pfyTx/WuXwydyFRqXVozGauRuc8eZie
X-Gm-Gg: AR+sD12kDfOvEOIMjXdWCCsV9CS/JlE9kYaT+7/33vtHwUYGtKLNBkyFTyEgPLj9dWM
	cW7WlLMV9QnpyhKN++fZFvO+0mFG8ArzydPWACDCXghQJzbN47Lsv8ye91/97R4CkQkr7Zrd0IP
	p1EEpAD+G9FnzVAptJbsBukFISrVwnPKhtvpSxulYTYl71aH1Ax2lOr/LhV+q8Fqmsmt1xU5x2F
	rzjFWukb/dLYj2LAJHfUEDZnFDFHSHGc2wM7GyyjI3JP/ae7PZ9hrtWisS/CVHw5+C7LkrF+F8H
	Cbn4iA0cBJXw8yUtKlP06RJClME/KULJ8xaM78Zb8ab7bITE28ClocMnZWYMBO1O8X1FgsxoUUj
	Tb6nqbucgnwRLrfAmUviTD6ZoY1oaWUs4MiUDLnP42j7WTlSduHkgtlhFKNinPQ55E8+knjSCpM
	0tuPSY80yrW9E0uHJoSzRGLjNRmzESTJq/66GzHL5UYVinfgw=
X-Received: by 2002:a05:690c:6e89:b0:812:9e6d:d47c with SMTP id 00721157ae682-81f4d3b498emr1003157b3.10.1784763379557;
        Wed, 22 Jul 2026 16:36:19 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:4392:41cd:1ce2:e391])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f33c627c9sm20937027b3.19.2026.07.22.16.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 16:36:19 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Justin Suess <utilityemal77@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v3 3/4] arm64: dts: allwinner: a523: enable IR receiver on the X96Q Pro+
Date: Wed, 22 Jul 2026 19:36:03 -0400
Message-ID: <20260722233604.3001063-4-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260722233604.3001063-1-utilityemal77@gmail.com>
References: <20260722233604.3001063-1-utilityemal77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The X96Q Pro+ TV box has an IR receiver window on the front panel,
wired to the SoC CIR input on PL11.

Enable the CIR receiver in the RTC power domain and mux its RX
signal to PL11.

Tested on an X96 Pro+ with ir-keytable and nec keybindings with
the remote that it came with in the box.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Tested-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
index a96927fbdadd..1eaee20acaab 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
@@ -266,6 +266,12 @@ reg_dcdc3_323: dcdc3 {
 	};
 };
 
+&r_ir {
+	pinctrl-names = "default";
+	pinctrl-0 = <&r_ir_rx_pin>;
+	status = "okay";
+};
+
 &r_pio {
 /*
  * Specifying the supply would create a circular dependency.
-- 
2.54.0

