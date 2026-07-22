Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F420B45D5CF
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 23:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784763380; cv=none; b=KM9Cwb93Kuuy+14lOaO0yhWCfGGKxvNzmloeL3eam93/z3nmxrorxMVe2+7fG2q9SUge6VLlfMUry3sg7JRs+4CnuOoOq5LGzxZPjtUbRH5xQKFYsNjsFmulYfpb6xQBedWIfrMUdPbjct1g5ewM/JCbCbobNXcjpx6Yj2FszSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784763380; c=relaxed/simple;
	bh=PI8HEf9PMSu33Ykojy4ZXazIa0qphrPfPQHGrFL4I04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fJDAx4CjTAH+VGwWQ7fnhIB0bpQrKypCqUO2zmOgng+PBW62dpYc3FRJTOfxI1lGtZOls4utYFmpkP1HCGX5XnsT6x7VT0UKsPWBJaE0mKJHb3gEApdoZ+grDC85M/td+NG3YgHv5HaLL9A3VeFo0KV2/7B0ISask3eVmGNgPHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MztaWGmm; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MztaWGmm"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-81eaf3709b4so706507b3.0
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 16:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784763378; x=1785368178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lqOrT9xci3vC0yRAEjJsB/AtSU5bQ1X+i+tu63Bn8bU=;
        b=MztaWGmmHOSWgp3rBkzMJAFWWQlxull6aZF9aSrRNCTI1ff8E+yZ6gr4fhLcUwcfQ1
         fG9l8XjmdsSodNA9v2rlD/OOPOkx+CxfLiskMXnRwB019ki6mzInEzg1QfV4qfNcsgIC
         BsA0mv7yxuPAXu61in2Wg2h1eWEPbOiA2Z5pnPgPLlTers8f7GKB0E1vRhrj3Akh+2wM
         Qzy0+8taa5Tzlhs0WJQljhsuYDg2YPu9LLOhIxD3Onr5wPzeJOK3xXo3Im+sslFK+AXJ
         eCRgJ6ivNmR6oAJsmfdV76fbi/+eXpqJtaWutaH0GWp7s0JqD6ERpH4Uq4qcaayU8P3K
         zkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784763378; x=1785368178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lqOrT9xci3vC0yRAEjJsB/AtSU5bQ1X+i+tu63Bn8bU=;
        b=CofeqmRZLxSB43Mtyln2MI5mkc+LIHaw8CJ8A2cb6FEpgF5MXnpWibnyEXC74Mu1Py
         +3I5oljoJOQBLQDosyFJYEYhZtiJZJDUUWGzpBGfruqeKHBueRua2FNfEvopURf22Dot
         EAcSkv3/egI2qZS0Y6mVwyEgteWFoH8YBpCIyC3lwjLtowmRrULXMllHEkrsz1ki7/z/
         CTs3ANw5dP5oi0pWNUmUGx/ol1ON+FPtE1O51lSXKVw64xAkH989FoIfOTM9/+z4OlXE
         HZBgDGaoUevE0heVO+rgwFZguWaLmNcGAd4R0rsjwivTynx0pU9yMPD1yR71ra3XcZSA
         Pc8g==
X-Gm-Message-State: AOJu0YybYMkTr/UGyV7PGM9qDHnM3WIfRw7Bg4UDgP3EOQmkKoBAtSSq
	qC6m/unQ9uu4tokomDUUPjxP8fZHhDkcqqzTA2RE4w9hVyNCmlRCa64K
X-Gm-Gg: AR+sD13e5rIAuCL8kPUh634chtfAU5L6JQj5c+1W9M6Ur+9gJyP+1JSyFt0kQdEoFwL
	ez0SZtfiPLKUbkSP9740qWUmKmMoLCroHspDS5MgAsQDJBufgtbz7wnOFpMLOfW9jDdpMsxCyC5
	hlwhWdOoJIl5PE+i3cSZiUj9IM4OuJrmJ15LYUGLzn7MgOEaWnwI/afnyvHJY6Zxsjy1i1noaOA
	Du1py0lCLt9qO+2B7cot7HU3bTQwYW6nzS2PneDzq6Z0XnVQNXehb+w+F3wwuqCWUVxWbHRT2IW
	f6ABy4217j5F8l4wU4IjAsD6vH3+XNm6Bb2DHFhXY8t3U2qWH/ddOsTAzTW0diToZbmJf+0t3bn
	UxtwHRLaderfHrkVI035UnCs0MAxKJNw+aX+EV5DXBplCTtdY1NfrvWh6f4BIBD29SNxKkc8ADD
	BnDm8Y1+ACndeRWm10qhE2emy3SiVEC2qjh4ce
X-Received: by 2002:a05:690c:296:b0:80d:66b2:850 with SMTP id 00721157ae682-81f4c2b5753mr2162297b3.42.1784763377901;
        Wed, 22 Jul 2026 16:36:17 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:4392:41cd:1ce2:e391])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f33c627c9sm20937027b3.19.2026.07.22.16.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 16:36:17 -0700 (PDT)
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
Subject: [PATCH v3 2/4] arm64: dts: allwinner: a523: add IR receiver nodes
Date: Wed, 22 Jul 2026 19:36:02 -0400
Message-ID: <20260722233604.3001063-3-utilityemal77@gmail.com>
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

The A523 has two CIR receivers, both compatible with the A31 CIR: one
in the CPUX domain, clocked from the main CCU, and one in the RTC
power domain, clocked from the R-CCU.

Add nodes for both instances, disabled by default. Since the RX signal
of each instance can be routed to more than one pin, boards with an IR
receiver are expected to add the pinctrl properties next to where they
enable the node. Keep the PL11 pin description in the dtsi, as boards
commonly use that pin for the RTC domain instance.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index ca6a16807049..c2de662140ce 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -327,6 +327,17 @@ ccu: clock-controller@2001000 {
 			#reset-cells = <1>;
 		};
 
+		ir: ir@2005000 {
+			compatible = "allwinner,sun55i-a523-ir",
+				     "allwinner,sun6i-a31-ir";
+			reg = <0x02005000 0x400>;
+			interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_IR_RX>, <&ccu CLK_IR_RX>;
+			clock-names = "apb", "ir";
+			resets = <&ccu RST_BUS_IR_RX>;
+			status = "disabled";
+		};
+
 		ledc: led-controller@2008000 {
 			compatible = "allwinner,sun55i-a523-ledc",
 				     "allwinner,sun50i-a100-ledc";
@@ -927,6 +938,23 @@ r_i2c_pins: r-i2c-pins {
 				allwinner,pinmux = <2>;
 				function = "r_i2c0";
 			};
+
+			r_ir_rx_pin: r-ir-rx-pin {
+				pins = "PL11";
+				allwinner,pinmux = <2>;
+				function = "s_cir_rx";
+			};
+		};
+
+		r_ir: ir@7040000 {
+			compatible = "allwinner,sun55i-a523-ir",
+				     "allwinner,sun6i-a31-ir";
+			reg = <0x07040000 0x400>;
+			interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&r_ccu CLK_BUS_R_IR_RX>, <&r_ccu CLK_R_IR_RX>;
+			clock-names = "apb", "ir";
+			resets = <&r_ccu RST_BUS_R_IR_RX>;
+			status = "disabled";
 		};
 
 		pck600: power-controller@7060000 {
-- 
2.54.0

