Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201193;
	b=HDtNs13l3ak2hFxlu87LTUjlK+PGOGCvV8oaBuU+1NxDnGWj6rxpuG0auEqYdvXGdkRh
	 8QpFZfyJ3/Sl4xvuRLav9Sf8/6Ux0Uq9DzcsVTYTv/4W8ljU9Coqk3VEB52z205Ej4P+2
	 RNcpVVVNzWThIJo7Nh1Hx3WsaqFL12kYhBnvWhiOXuYGTHtffS5v1Uv2zwoG/K+5BQFs1
	 2pxsDdRQBSKnGhkHClwLFL6LpGjR9C4uVNA/qtv5u+FvxmaPB5a1aZONUwYDVqAldF0o6
	 qPSU4CNygKFLX/3XHXW/0+DtpoWUKLoConaoYikOgaaacLzCnfswOTJSo98vc3+iu4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201193;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HLK3d7iXciTA3gYlWpBInCkheLbOB6EwrTlus+ykLsk=;
	b=Iasefh9EVCFyfNwp2F3W91dLx+Sn1j92mKcAYtp9YqUAaZKeeV8p3K8MaWRnpLuzktOd
	 G80SSVsnBP48927WCpyvRThof61o5d41O783UJUkjLWqquJ5wUXLz3PU0RByNzwEcM0Em
	 JFyIuZF7OmgoILumSeoZqg6TlOaMb7TrkmL5TBQB6wZLrUjgnq1oNtlmijhwBbiU7cBLQ
	 1RawGoPMVkAuEc9TGtmj0cSpu+g/MnJRlrKznokzuN57EyquCG13oN54Xoo4iRmTgOFZY
	 5b0zNV0JwcJbAj1z8RhgHZzXw9tZ+ow4m5o1CzqxI+/GJlQYHGF7Dp2VeIKywRjzDWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="IzVVT4y/";
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3E760A3809
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 18:59:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB3E760A3809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IzVVT4y/
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c505186727fso219962566b.3
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 10:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795201189; x=1795805989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HLK3d7iXciTA3gYlWpBInCkheLbOB6EwrTlus+ykLsk=;
        b=IzVVT4y/3rbXHh6TAeSjFM3cC/AXHTbk+EhYy6zelufBVD4aPc/hWkjoxi1Rmb0jVk
         s8JQtdeHZNZNToyzuRKfrDqtxBtvkSgIcKgvDajPuk9h3TBzAJFbNAbDi2xvVdbfPNjt
         vlhP387H/b2+Jl7MMMbGvXvpSU6EK1dgwwo6qLb32LTYeFMGZkmpvM/PneQqIL8ZLlOu
         w38ix/s2fEZxKMfzh11UOfkdk2e63A3zZV5mnnWLwOmMLdh1YoetQvFl9H8lPkUpKtlq
         ZQUFx3enbC0FIlisEq+y4S8VXTVhJvqt1f86dPpdDm+/xHoNrFTkiN9cJgXlbapmrHdz
         xY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201189; x=1795805989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HLK3d7iXciTA3gYlWpBInCkheLbOB6EwrTlus+ykLsk=;
        b=gBIxeDyJDdjRPB/PTCmnyUXuJQ6F9hpJEnZs7mMadcdyg4l3yy81dUrr9QW6nm/o4x
         xucZ0kfaQmnDi/HR1Zmz16PDajWxrMCz9dZ4E8EoYHSDZocBNq3H8WdbMKao2oO3vmmc
         K6MG5e70gGDfxn8A/d05jMzDe9x9fcmOYmttPFeGEC7KxUYh9F9kj68aafWOPK2wG7w9
         QDhguc82GFbE7NMZiQ8BQZh0+HiISK8yh5mD1b77VTattCWnCkAtGKZ5H91TV3g+8I99
         l8oUIKmfa+TIHc1r9uhdUHMIV7n3chh6/cSzHaUpQzHdlhftj+cE7zonGctioZCvARay
         RTrw==
X-Forwarded-Encrypted: i=1; AL+hErFAcZZENVK0h9x0ov/g18aoPet3Udc0PIVdm2YcDwku2qx22yBqCC2Xm+qc5zZnNtSienbE0/QMmBKzeQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/5gw0pIxdVGay/XyD81CWAHjYhVJmBqQ1G+zJI7G01WawVJhcM
	Nh8EeKe6+tVoi6mq5wcTDEfld7KSzXq26e5BuZ75iL86D5658eSfOBXY
X-Gm-Gg: AZFdTZcE5gwznnPMOKwBm56lMeAD7G+vwQp9SyffRNnwdUOVG8xpDgTxd3HbO4gl2W9
	RFsMuu5WXIFbDUFQkeh29gq2WYOX5hFVDGT+PMgjT9RgJbuyxysNH7jn2Q+gG02YiFiSr/hGvKQ
	Ww8hqQfBDuMCFBrFxmWJFWrbAb08EOmHChSbmpGIsdar0uAP/45HTCNzBFw1H+AKXGMJIZ1JTn+
	a1I1xGqCuQcbGGdWGEnWb8SrV2aajn5WQZXkc0evYGHOn2wgnnAq2cP8MUYo2HOj9YnUR0dnW0I
	HadzPIMqq/7m0T0IZLirq/WGBB1ECJx/xvaUv2KQkw96zZRzcyZjCd3OruSxwUJ1+OZOB5FY3BO
	Dmp8N06yYH33MssZ9M0XR6JxJlY8Uvxx6mrcAq6uJ82LKhvllr1LjkMllcG266SPht7HS9R0m/7
	WcwHK68apM887Oox7Vq44ZiLizE8nLl1/Zli+T6BeXYHaHW4FgKRffjIalKHLF24+UCjeHhZX2d
	CwhqDypLkabst+ajAnA/RiETXzkVaqvQ0ZgeTHByZkvMheYX/YVSTYRxqv8R+98CmIm1t39ndLg
	085ba3WWVUHIdNs3pwCHzPNEGwYy4BUbNa55a73SHN+TU0rCMkDrW1ObzWlqkqLHQmW/4SGCzJc
	HgQcAH2I=
X-Received: by 2002:a17:906:f583:b0:c51:3c8f:55e8 with SMTP id a640c23a62f3a-c513c8f658dmr365847966b.46.1795201189284;
        Fri, 20 Nov 2026 10:59:49 -0800 (PST)
Received: from antoniarch (84-40-238-230.cgnat.inetia.pl. [84.40.238.230])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b02de1dsm125205266b.85.2026.11.20.10.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:59:48 -0800 (PST)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: vigneshr@ti.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	jmkrzyszt@gmail.com,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	phasta@kernel.org
Cc: linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH v3 2/3] ARM: dts: am33xx-l4: Add missing DMAs for I2C controllers
Date: Fri, 20 Nov 2026 19:59:12 +0100
Message-ID: <20261120185915.150228-3-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120185915.150228-1-apokusinski01@gmail.com>
References: <20261120185915.150228-1-apokusinski01@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The i2c0 and i2c1 controllers on AM33xx support TX and RX DMA
requests. Add the EDMA request mappings and DMA names for
both controllers.

Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
---
 arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi b/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
index 57a45609f9f5..89fb1d1eb049 100644
--- a/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
@@ -239,6 +239,8 @@ i2c0: i2c@0 {
 				reg = <0x0 0x1000>;
 				interrupts = <70>;
 				status = "disabled";
+				dmas = <&edma 58 0>, <&edma 59 0>;
+				dma-names = "tx", "rx";
 			};
 		};
 
@@ -1189,6 +1191,8 @@ i2c1: i2c@0 {
 				reg = <0x0 0x1000>;
 				interrupts = <71>;
 				status = "disabled";
+				dmas = <&edma 60 0>, <&edma 61 0>;
+				dma-names = "tx", "rx";
 			};
 		};
 
-- 
2.56.1

