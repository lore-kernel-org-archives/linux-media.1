Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9CA437105
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 20:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784751458; cv=none; b=rLKF1lVKB84QfbK328Qx6r8FOxk8Zy26O+iLboKenETpPyfFm6AEsrn43xsa3LgqxFtxdffiLPkwHvkdnU4YElQKa5ms4oB5A69naz6XDiT/8NOaX6lqopygPfEtPvzaJRIQZc6Xxxa6Qr0xxSwO/uePJFuppsdnkj/qYIGsayU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784751458; c=relaxed/simple;
	bh=lE0BRLbpoMsGl2jH5YXu2f1E0PNhNUYeuMEbd04x4zY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ax80ylO8JfqkY6LinFI90H4n4WPKrAgYyG8APHkhyGfW0AatXkywWBsvdW94ELFdpbb2XZwslu7yKqYGerH1vCqpHfx3n4vQAlxl5OGSRuPnZIAdYwteHaazODUqY6Pn+O6AsZ3R4QcBqFp9keggy3IFut9PU77JhM/608Qo/5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F4YugzB8; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F4YugzB8"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-6679d88abdcso9622151d50.2
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 13:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784751456; x=1785356256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ivYBWU5cN/JEQ/dOoSRXx/VTuv2YZc+EvRKHLDz+SQA=;
        b=F4YugzB8br7IFSBxOmrZ4HGpeb1k62sFTwD+kQoV5hCigFx1gfmkc8t5dRhp7gpP2i
         tf9456hg5sT9lDwrTfSA6w9t6D2SFAIOv/Kp3UDZ6aHGLnjHIPfJiM70pVPpzphH+Df/
         n0m6nbdBFk/eKQaUp/OoH7jFWAHbWGl7mgSQFZC8pU2x+Ath8EhCTxEXUmQF1d7fxU/9
         4wBM+Xa9X4e1FdHYHCnsdozblAM+FAIV6KTbD6LZ93eMUuXytc0UY67YiAdUTOpfTvaO
         uKmHCI/bGWHPrtRRgW5PZvo+2HKO7+DDMkV0+hdjXjWn2EGc9Lc2gHbVzWkrQ1Dx0Kab
         9hhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784751456; x=1785356256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ivYBWU5cN/JEQ/dOoSRXx/VTuv2YZc+EvRKHLDz+SQA=;
        b=F7JL/8MlokAU0Gosjfb/ftUcNXOogh9+Xpz48n4PaE7NYzveKuVN6v2rnpCa2ClNsq
         3vzqWN/MoXq7kMmFyh6A79YIGtZV6gVs+uGoWiJ2kYhuDDZCel6+na2UJ+6fKVUCjVKe
         EBwKRhpPqlAiCYM23RCD9/4S8N/gGFqNpXg8eq4yiLpsXWMhG7OQwS8xLIe5uGbEHBF9
         E2JuJDbylqMX/6bW0M1EOWcI/1WrZulqvJ210FDS4iJ+G4cTJN9NEvFNVmySOtcCRSNn
         QdwMrTd2cF+pW836+84h5QM95oFd8yrp1aEuokgocZwPxJOrxqkDsyL7D+vNHVYQCRs/
         xm9g==
X-Gm-Message-State: AOJu0Ywd19NOeANo4xMGu3GO0o+Tv3gFzRBnM36Wo2vkRD5IfeXwQpNq
	oLeWz/cHmVJ1rXMq4Tyu6uaSCr4g+j7PHWWsQCxmORlDUMJpHcF5PPnytPqagCg0Thc=
X-Gm-Gg: AR+sD12W8jO3IiMAYIKnytOTTwxgoqcEUet9K3Mq/b2IcTNBLMQLNgRDicY5ZrBYXmS
	8JY5TrpShhAPpsvqRzJRXDNKrZb9XOgzDlaOdSUR4l4c7nZ3RXxyENI6pLFRmAbMmvJnT/E8/ve
	uFGieTRacI33Vz1LbaTKkUClYRimHuJe6JN0S8CKvJi/z4zPGpu+9gVgFJYYVSsWWag/9VmJgLT
	hs5XYru/BE9ivuz3NISsuwLQ4iHLtqWFvQ1RQOCs/jDiWoZBVTzi4jq6z0S4kLLfWwCu/TCkiYN
	2hLnAVdXnMyLIyOKSIn7T9lrAheRf+K5lrUTyFtv7RYrmqQHztd5kFfobbiXz3xUuusKHcxQ68t
	7MVWkcxfbnZ6+S8HPXyHAQlMYQDAvJsVzrJeCh3AbovXIsp4LWhUUnG5OdlmQ+YB+Awacrp1+fw
	2lfpuHZCfPCN0SjiulZD+Ms41L5WTKQaVzvpWh
X-Received: by 2002:a53:b083:0:b0:668:9128:28dd with SMTP id 956f58d0204a3-668a4f87cbfmr21361d50.81.1784751456120;
        Wed, 22 Jul 2026 13:17:36 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:4392:41cd:1ce2:e391])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6689056dfbasm1958866d50.9.2026.07.22.13.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:17:35 -0700 (PDT)
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
	Justin Suess <utilityemal77@gmail.com>
Subject: [PATCH v2 3/3] arm64: dts: allwinner: a523: enable IR receiver on the X96Q Pro+
Date: Wed, 22 Jul 2026 16:17:17 -0400
Message-ID: <20260722201717.2205609-4-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260722201717.2205609-1-utilityemal77@gmail.com>
References: <20260722201717.2205609-1-utilityemal77@gmail.com>
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

