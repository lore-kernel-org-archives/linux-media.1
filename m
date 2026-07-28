Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61912F7F14
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 02:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785206967; cv=none; b=oDbRnW+i1dC02W6Fb2CLT7mubsO9jzH2ckT6hqIi7DtESwE5VJOvFWCi7fOzMnLbQ9Z6/I2O358X/TxNmJ++uwvRiTxaP/URR6GZHtvzE1d0ZaojGVCSI5U4uOGUBI4anSwm8uqthbiVduSU5N+r1NCI/Fr/fUDjS0SgRfYaTX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785206967; c=relaxed/simple;
	bh=es+rJotQRwyypM61fneWNzwmRxWIGX4iJwW6Sl/cW/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bqpj8pWA00ZuXeVvXgtMRpyuUPfTybPdvyvdl2RcUxeLmjlpA4DCSn9LONE71cIiY8GzHvdlUJBEVdinxho4MzkQct9m4ZwzTCDpVLRVixKfeFcZvaZFumTvEdg3OlZWR9HXMacu62kmH1wO10WOKxfmND6kFBSBbPphE/yaXdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LqfFKjuE; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LqfFKjuE"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-80bb41f7f3cso32915337b3.2
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 19:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785206965; x=1785811765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i6eNcf+AhwmRS6BoOkHO52GkK3UKWVS1XZpDCOhvYRA=;
        b=LqfFKjuEKWr81EV6Kfj+Lm7Q5NiRWJ8N0zJe5jmXozn51MIPPUol6SvWSWOzziv9uS
         vYDktY9ECSUEi4kr9e06Inc4XXNkZrYbrZcc+oxX4QJjBeK1nRO/77r0O6Ytn8404mT4
         C8UKe49TTbBdqofrULb5MqSLr6k0KqgzJgkh2AokqFZameE8ynbc8TyzoeEg+zV5w2lT
         t0j84p6igG19PjZhwReTN6cjYYjZSKqtUBkIFSL9N9+SvA7vl5KmqT6rKvItk/TR/Vgg
         v/XAtLaQfpC+P0BWQkuToI6B59+dIMwQk+gEdYSgdxJVuyfJ3BaE0Ptu/SvrL2EIkQV2
         oVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785206965; x=1785811765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i6eNcf+AhwmRS6BoOkHO52GkK3UKWVS1XZpDCOhvYRA=;
        b=YNm5Fr7Og1dIgvZ4kcV1X89AikwA3ighzEmzkVSSOXtbfUxlq6BWXpZINqPZlRw1l+
         1hmiVj6b3hAKcQ1jejyMbSzDERPI9YonrVG9f5ftVN8DQhMWNoDouXUga9FzrWV8Shyw
         ANgSnEOyWdtQuvECYJteObeYgv5SLLWidR4oRABkbe5DtfN70WJAseCB74m02TUDYt+S
         XLhW0pswVFDvHtSAidZAyrJxX1NymbWYF0IAM5UyDJu26Zlczf90KlrbPjP9kDfYUUA5
         uTAzG5SNK6mSPv3K0I7QekW34lwGzmq9QA1FgHPdl59mB+dlDdStTdMDRr3+97odTVoI
         NLDQ==
X-Gm-Message-State: AOJu0YxkyKu7uxehBESafFQebqGV3r6A8it1wYb+e+YL+9l7tGMWU48U
	AdpXVCtyQLmz9oaPCwqQPXlpgOCjlfE7SfxvuW5gkjhspu+935R1a4Dh
X-Gm-Gg: AR+sD10Dc3WZwukSsjv5pAlZA9TZZF77L8B8YMb6D1TYl0ThkGbo79YmeYXdA9rmwCz
	fvVv3LpnVFXGV8JWFxCb8PI9Xh8lu9Deik9ifiankqPQS/vsZFTRz1u/KqoFWDn66M7kq7hvp5+
	q+sk3F5wGtmGC2E0M3Hm/cjMDXPSwNrjEmX/34o7HbEzy9KUVVpNhvmYBg7Yuo712Rc6H2ctuX7
	X+bTMkWiFvkRt7xhQbEULQ8IcaYTCt9fO7PFKAlc25EnVxLmDdb2VvgOjGE0PquBBdSyhb13RCB
	Gr5D8Q2tGmj9fP4SaaIfMIl/+WUzsaBWuWgR0AAC7GicsRVGoxEK+BTpzrtkhD2DiIiMq1fg1hj
	fkVCjzMm7o9ILvth1RO3DhuI8u3ffIWC1rYZdfSeTxN3CVu8a9Gci5dLY4dpXvGABEJIUsWTTkW
	O0e62nVTLbtBnL4PGhgsuP0ToSCFr/e0F3PZDu
X-Received: by 2002:a05:690c:4d84:b0:81e:d23b:f8d1 with SMTP id 00721157ae682-81f99368d13mr1674717b3.35.1785206964798;
        Mon, 27 Jul 2026 19:49:24 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:722a:22a9:308b:2c35])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f6579f462sm40974847b3.11.2026.07.27.19.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 19:49:24 -0700 (PDT)
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
Subject: [PATCH v4 3/4] arm64: dts: allwinner: a523: enable IR receiver on the X96Q Pro+
Date: Mon, 27 Jul 2026 22:49:15 -0400
Message-ID: <20260728024916.993224-4-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260728024916.993224-1-utilityemal77@gmail.com>
References: <20260728024916.993224-1-utilityemal77@gmail.com>
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

Tested on an X96Q Pro+ with ir-keytable and nec keybindings with
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

