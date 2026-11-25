Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795632501;
	b=MYVbLFlqjdemQv7wGHxzm6LRx3yBCbeShDyA5LUwT1v3hb67PuHh0Zb/odwP7c9mcAC7
	 Q/JgmU7Qja/v00iBk94YG0FOgboeFVprBEcQLh8hrfYbBVX/lsrh5+NrVqfpWRy9c7Krg
	 AqPTbid8Wf8TEYeQPCKj77BR0SvyHkjJ833Rgmv7OCg/6Z0Rk82LsA8Q4DJGSk6NKoSQU
	 XlbCj4e7qwsXm37mM4Nbv/T8SZck83lePbgVX/ZnwNjMUA6v6B37mETu1eYgjvDxzXAUD
	 fd1n4HIdiCGLikvO6+bcUBtlpBhlyvHG+giQ50HCf3yrM1wXQq5oJirq+4SFr2+o6bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632501;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HLK3d7iXciTA3gYlWpBInCkheLbOB6EwrTlus+ykLsk=;
	b=ufr/eiE1to6EcoVJpP9xcXnDUhI0Yw8HKNi4FG1S9rn8wE71if9danOMkzd+XccfWe3k
	 mt5BUpIaXOkmTS4mf4j8ayVCQ8u2qytIUUzhHPGZcZfWAvGWodfQnEao0fSqHH48LmdMr
	 8dJhC4JAJnbEWS4arn8bd5C1h4lw+6FyK2aLsRJr6l5bYwD8YI19kJQirzU7odB/Goqq1
	 9JO9Ku+6QeRG6M/0n70CEzKKbqwECeTC7jRqKnzlq7p9qOMXXYGb5muCTFQ7dmIZ4BPBU
	 XtszD7j/D5fcB2ySSY4ACNJr/nfFxmoSOk3bBVTeVE+EcECPwI3T9Mnb9b7enb/HEEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jxwh8KOh;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EF7606A69A
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 18:48:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73EF7606A69A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jxwh8KOh
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso1170043466b.0
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 10:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795632500; x=1796237300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HLK3d7iXciTA3gYlWpBInCkheLbOB6EwrTlus+ykLsk=;
        b=Jxwh8KOhQ3Dae/jpvU9vqBu1U4h7oCjt+9cRvOeg/9BA1/3ExI9swTZ/M0sYHqBBDj
         c2i4gWGAZ5RkbYoOU06qw3aQ7kan1huizoyKOfyhlPhyRswyCamHMI0WY7oTqtsoRsKe
         whb1zatqu7xCt7ksj4q4PPV5rutttpu5mlCJp2yyfSug3Ow5NWLyvQsshoMYAUqQK6ck
         OCby9sx0XRkeMEaZnUmqFeXuUl8e8QJ+tTASqBkSwbS4mCsoVUSJRDNEaMbh7STS2xwB
         Kebhf+L3FNSfhw4nebvnDhJmkqBLv+brIqP09suqGkbqM3oTjFyEpDzocjE13qUa1mKQ
         hJTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795632500; x=1796237300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HLK3d7iXciTA3gYlWpBInCkheLbOB6EwrTlus+ykLsk=;
        b=St0g/3RXLecw5eLx5vDgPQ3nZV92WFouLxB94Ko5J0MlRh/EuLscFmL74df72lL1mQ
         kCSPQDlOgiLtrWoSgPlTwU7sXCYkAa6EGGJPk7Dlx2/7j8q6k8GlGb/X/9ieTRTT/Zax
         qcgkr+Dr+TILuZI7ytpeY6bT0pml4PBA98bwjk1GZ6b7I9kV1XtgGSdT/p1YUBB7uQbV
         3zPiJQb8Cs7ja4NiKCl/Fca2cbH2JKr34TrUK2hIaOVL55KpWT6rx3/DLFRHbMXSwOAR
         YDyyblMjhljgd/KQBy8QcUobQi0Vz+OwLqNIJQnfy7Utk+AitWsFnEqN0h4IUN/PZRSf
         4KwA==
X-Forwarded-Encrypted: i=1; AL+hErGAb4HTV1moAuO686yRCUHsNwGtO++Do9VLMrdiZem/X7j8h02vJOrhupxyZosgNyI/CgjLZAjYNJc+aw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8V1pRyI9W0fA4X1WZvF/h732t79TJGUvhsgJH6ZWel2xKBRtO/
	vmaRQeugZO6agIs6DFB6eDarbhXLdPi04uPpKemf0GM1qh9NOH6Qunvf
X-Gm-Gg: AZFdTZdztCqYI6xyOiZqBBqn4TWw6+ded5k9ZOWEHfoVxGnl2cj0hp4sPR8E3Rfgph8
	tZbjxSyVicqUi7i55b0PlSjK+3S2130F9CAEjJOjsddQ2Dgqs3WDvrYvlIeJJQVDnZMwVo+VwOe
	1uWtxDs31pW7kieAi0t3FEaocp7K0JuU2DDmiCoIm4TMqG/mXNSBmRXkrfQ6bx2ZaXxg1IPiMEQ
	oYIP4ibM3mBWAXljjJdre5ZRt6pHbsIVdAbl9ue/rCyFCrvyL9SDY1TS08JBm8Z8EOV5aqEZIsl
	OBV3zjFbrAZy0spHBr8ygQmLZrybilbBxPmVgxcIqnl28fnBDH5851gzxrOhiMa+2xispU6k/hh
	y9OlF9VC2yliDgB/m/HFmgT+1q3F6TTioMVzFeg8mXfgCKZYesVeT6jNmy7fSMW01i01wZt3w9o
	oMYtaJT3unAd/0zmkUbAqYZlg39Td65J8dUOJxrOoghmhoakTIBpN5IidWUvJBqZuAqujDOI8Hj
	UpOZiuenN7crPFvAlobSJiGR3U0RH4Mh03EDkPx/HnLLm+TKiChsNIfI1LDYN0mQUaz4DmdWNhH
	r4OKz3T5FYcidftIcknOzKgJO5gI1bzoScCWBow2rYP2UZvc1lSFKVaFwTw=
X-Received: by 2002:a17:907:6d0b:b0:c41:1781:a2af with SMTP id a640c23a62f3a-c51317e3353mr1702989166b.9.1795632499856;
        Wed, 25 Nov 2026 10:48:19 -0800 (PST)
Received: from antoniarch (84-40-239-22.cgnat.inetia.pl. [84.40.239.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc73d3sm677226666b.64.2026.11.25.10.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:48:19 -0800 (PST)
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
Subject: [PATCH v4 2/3] ARM: dts: am33xx-l4: Add missing DMAs for I2C controllers
Date: Wed, 25 Nov 2026 19:47:47 +0100
Message-ID: <20261125184750.57866-3-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125184750.57866-1-apokusinski01@gmail.com>
References: <20261125184750.57866-1-apokusinski01@gmail.com>
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

