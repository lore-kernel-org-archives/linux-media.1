Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0E445D5D1
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 23:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784763383; cv=none; b=rVH/xtAuJKKtHORyhMcevOFTVw20n+hsQPKry/Vt4Azrb8cnOw6pXo7svY1r5JKO2sBMp0i6TeatRNaELzuMr9fH03Z96NLr9Ilrsm+IgBqKNynzaHw9i1WnKa5Ob+WqT3OV5yd/VnUSNl0/Tmb32A5pqaw4gZT71/fG5fJmZ5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784763383; c=relaxed/simple;
	bh=1/CkHD0oxgnHzUCphQPj9uX6mQV8xPw5f6Jx+XznVi0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UeXuFk/Aozqy4DxX4J0Qn8y2eWG7kcYwKxnLWTqaQX6uLvxk+lQn6X58lanlm2SB1BgZtEMpKOSvgMrlTv+YWL3+HmGV68VgMoWnefKEvvx3ifxBr2L28EAx2YMa0l7wF3hIpavHymAc2h8jDsi5oTZnxXLy4A43CjIk9y6yCGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jF6T1vLG; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jF6T1vLG"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-81e8fa1b8d6so670257b3.1
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 16:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784763381; x=1785368181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gSow7P/U4ty7TVa1wStrr2GU4gsF6dil0NdrrF14oGU=;
        b=jF6T1vLGVhV9442oFMaECj1fsLCJOm9oHRWRlarpgTOxKe3l2pbFzcz+b2QDW8rDkh
         +gQDRB11L6HhgVqCpf+c6PlWOh5qMkQmYj05qRRCuJXwLx3JsYtS6LYRZXq0QtoVRxwB
         lPmHB0ZVLJh5C2dJ/iCFFMCCg6IxwAPIpC6lWLIk5qDIlmHsSoOfdQf/g9O3NQjkopd+
         I1nv6vvT72+4fhAlWJpQ8mC6y5qqzUyxA8xN/4FiiBLjNrlJicu9Stv11NFG3T7pakWe
         TLhzbkxQgfZOFdfp7lNs4yTGfsZqnMH6YZXeT/+GJoAAscX0xOb+0vyhvmYiv+XvPrb2
         OV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784763381; x=1785368181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gSow7P/U4ty7TVa1wStrr2GU4gsF6dil0NdrrF14oGU=;
        b=H2k3aO8q+za1Z9sBPmUXcQlVgaTREpdBkLc7GgOHWeWHvl2HWcp6n5GM/iI55GQM3M
         eyIq+83t+OXTwIk4eL7FxBUwuW9KD0z1Waraov20afdPLW1TAcVvaSC5k85GZ/M0ReB9
         fuu5lKH+0Z4sALm0HuGBL5HKINotOZhiazAuNAkdfrbIOXI3kmylOzk6n2OIWYx/XzJQ
         +535px3cmNQZ/aURTq3xeAOdSP83m99DeDDnOXv+LBu9P2aJ8pPixKUjc1tLq15Ju4jK
         922u+CQd4Kpyrv3G4uTLO82lTgmkMuqOXDzuH6+0AeENJyj7LBC3YBA+aix2PuTfGRGp
         nLoA==
X-Gm-Message-State: AOJu0Yyue1WqZg1/g9KSgriLbNflUn+qv8RA+unGP4gF2ALw2UnN5IYt
	ouNuSuBCtXi7D8jSqU2LH2Wan/OQ4iBmtrztACuVml1MhZozCRDBk4RLmfN5sY09
X-Gm-Gg: AR+sD11P8jVYAsZmb1fkiN8XI6RVvHJlXJB5Z6IW0hzf9nfqAb6N81AHVDCmBxYYLYF
	E9FuRfFj870gbJNn4WaftTEfECAN9kZ5BoURRV3F0t0TzY2s7W7ls6O3tj5c9FbgyiYcshdqy5R
	HtOFe2W5ht5vqvz83X1wXaGSE9aJD3Ckh5Q2ESHk/M719qn6jE2evB7KlQiYhI+vhH6a7bQ8kdM
	Ofv4ON2E/cJZf011kFyAMH2vIC2egGDymii36p+F0girBBMFwDzoI43IIuaKFCfxHDiru/VqEJF
	XE9+TmHat1dGvsf0kEqr1moOKNgjREVzOLef488KMm+NBzOnwBCvdZ9GBXT57EAKw73uIkrAQVs
	cm6qeXqGHNq8SVIgdIEqckKFA5A1c2KH0DSDPZikI8/Da2Hfxy1JFRf/KV/QIlUymeW9OQNCsDx
	hJClpBUo2EYzgwyuVQmGjI44TTYbsTCMcyHMjD
X-Received: by 2002:a05:690c:d07:b0:80c:90ed:c79f with SMTP id 00721157ae682-81f4c30b5e3mr2230927b3.52.1784763380753;
        Wed, 22 Jul 2026 16:36:20 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:4392:41cd:1ce2:e391])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f33c627c9sm20937027b3.19.2026.07.22.16.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 16:36:20 -0700 (PDT)
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
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v3 4/4] arm64: dts: allwinner: a523: enable IR on the Avaota A1
Date: Wed, 22 Jul 2026 19:36:04 -0400
Message-ID: <20260722233604.3001063-5-utilityemal77@gmail.com>
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

From: Andre Przywara <andre.przywara@arm.com>

The Avaota A1 board has an IR receiver chip on the PCB (next to the
Ethernet jacks), wired to the PI8 pin on the SoC.

Add the pin description to the PIO DT node, and enable the CIR receiver
in the main power domain.

Tested on the board with evtest and some random TV remote control.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi          | 7 +++++++
 arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts | 6 ++++++
 2 files changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index c2de662140ce..219fd76a4710 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -155,6 +155,13 @@ i2s2_pi_pins: i2s2-pi-pins {
 				bias-disable;
 			};
 
+			/omit-if-no-ref/
+			ir_rx_pin: ir-rx-pin {
+				pins = "PI8";
+				allwinner,pinmux = <3>;
+				function = "cir_rx";
+			};
+
 			/omit-if-no-ref/
 			ledc_ph_pin: ledc-ph-pin {
 				pins = "PH19";
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
index 474354fbfcec..994f1e4f0ce7 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
@@ -100,6 +100,12 @@ &gpu {
 	status = "okay";
 };
 
+&ir {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ir_rx_pin>;
+	status = "okay";
+};
+
 &ledc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&ledc_ph_pin>;
-- 
2.54.0

