Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793909239;
	b=PXPK23EyqTr7B7bgTBLCEI+uF+xxgUB7eXyQitYcwQUzQGfHwRrKxwZazEDQnn4hEKa0
	 8onE9CIg27st0thuyXpatPi009/tm53g2/3nUTIYwBY4FtkhIvYh+4jPUxRy4PvvAfcOg
	 PP+yV0ZEH/ukMJKRyY74oogPGtPt7PnKDlcwD2ekPtYbLFfj3pFoakCfiZ32hvea7mfV9
	 o9r/Je+Fbt6OSu7DosBq9WYZe5f62kOzQ3SHOh/lIbRUSdYZtIr+sfxS+G/iBKgmab5HV
	 JpnkIliZ6s5e6IZDt3ONFtlyAykSotdpgXxKtO6YUCJnoYo6wJ+DMz1SWWPfMJngeOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793909239;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=M8yk4UoM0PWyZhp628ipm0Nb1+FaTd9tnw6+7GjamRk=;
	b=IFecoK7daNXThkUQZjWvtuypE7FHkykJaYDqhAAmBGUjG1pRr1v1Bfw5a73rRRYFeuYf
	 QXBne+1NxojbelUe11pmuqpZcij/gm2dRPJNJLUo+2RLy+lfgrLdZjetR3pCM1KzCDL+6
	 TapPS0FTM8DTSTchX738Bsi3BCZh4PnDRo2OKSDQznXCXsJIpe3zFm0RGImull/QJJnob
	 n3u1pggNPAX/ts8enVaJKhY8yz36Be5dTK+nKTJkENXyDXwLjOcJlGLi2LRPZQBo0J9vm
	 0VMPbUUh1G2QL7BsDN0dUBqeBsCCAmgQEUODzcL7p0YIbx/A0Abwahe03p/g8SSCQow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ub1ox8GP;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91401606EEB1
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 20:07:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91401606EEB1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ub1ox8GP
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso25180595e9.1
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 12:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793909238; x=1794514038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M8yk4UoM0PWyZhp628ipm0Nb1+FaTd9tnw6+7GjamRk=;
        b=ub1ox8GPhezjPHlk9Iw0X1EMDdUJXux+i9QRQ7wB/kyUmsRoRwEtaWe2krP5upbaz9
         Hbxlh9pZL+ZsPFL1WzxOGEXjUs7coUW8OlvXL/CyZ9P4jRSNwCsp8+ITtJchShWjobLS
         VS4jqDWatzVBi5x0J9R2aYUGhWARactIEuNQA5hGwCRJBxPeMt4cUf5AgcQmaiCJzbcE
         63VPl+CKEaQ+Y51TybM7udRIgteXEsgBMhrcdhsAeifodq8QUhC+P41aIfqQ03+J4xUm
         9UnEw483xSJmburH9EKf2VI2ZG7cPzJRZ3VYnFtGGDiHD71LbauDl98eFNnRHS/dEAv2
         rAYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793909238; x=1794514038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M8yk4UoM0PWyZhp628ipm0Nb1+FaTd9tnw6+7GjamRk=;
        b=oQT423RHAD8ENSktc2TFqX/BRMn67e7+dcXwJ8NhD0mO8MK2J4YkxvPoOfVsoqNOMF
         UlWj3vi+MPeEXZGfR12oCmI8V2JpS01/RkUunLKAb3i7bGpQA0I+uHSJAxU7BLP+4k9C
         /a1sx/qxx2hqZ5WcDU0uOL0ee8D8FZDKJjCYAm/PtWIXRaDWrA5C6uTO26aX7HqXQ3EJ
         NHNiOd/N/6/EpMZLsDRdxEhSSndnECFt+Oy/5BzHVxEqvkkml8Qi1vB9G0bIkaRXJxt2
         iPN8ifzhp7qFEKogKnK31hkqlAl5etIPW2fUFsMr5Ktt35KAkpHDuVkpDG7P1NT8t9or
         WAFA==
X-Forwarded-Encrypted: i=1; AKwUvBxQbpmuvhoev43Cb9a4ilpE546+qzcQTRN1k/AxbtrWiSVwrgYPF/eCGxr8pQcQX7Lg0dJO/5hYWEQxuQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/S+5T97v5f5gEygJu7amr7VSs41maWyF3WxeViG7X/9Y+m3wdC
	knkB9n7WFABcT98leNqkSZfuH92l28k/q10KdtlngiLcc1+Mejot8Cdb
X-Gm-Gg: AYBFou1e8KnbRIMUxbvif5D4Jg3QFi78cDGZuTimukO3BaBeQSjmwJP4ybm/KQJIK4v
	yXFCWkprpFPPnD22JwIIfSY+d09DafzQNufdlXbMYSEMLqYfHZ+zaZEJMSdoqsAr9rYJ/6UdD3I
	WGpLn2ldO4njA/R02RHkYvlvcTIq31bq2S0lJyVIEpLzXRPuYcE+EU1dMXlrSrWA/Ily0wktcxu
	18Lt/GzWY3aoy2uVu7Kw9a7+L2Hwz91gYfbWbVQMXH59ym7DUKQZpYMWXwiE7d0c6aZwXtcBnOJ
	diMPphMD8PW8vt+wR+y2TpcRIRGjs17DFyavO3qzBYVG4qE/y8ookQQmGK7w3GSH3YSfzu5t2SQ
	X8aR5oN3QCMGUKh+tPSCXs45WHD05M7j5Q1DY53mXLLJFZoSDGLwvgq2CsJTOLQ+zMvkC3Q9ku5
	JA34ui0IF3aVGxUzwqfpVXPH2RBpK2y8WdpJGnpH7gBE+1yKToszKmGkAUeQC5wQvKVF/cBz4jh
	NYAVylgEWhXoVjMO4UloYXR6LsMaFNbm4VDQVNJrvks3NyP6WVO02DgF9Ao1YXtAXcGbNh5UanU
	N5wNDAh38Jxhv1XSseWs1EFfV3NH5CnrQfSkY81Qc/0YxtH1PHZJOe8HrAM=
X-Received: by 2002:a05:600c:138c:b0:4b6:5dac:b61e with SMTP id 5b1f17b1804b1-4b6df6df5d9mr3339265e9.32.1793909237922;
        Thu, 05 Nov 2026 12:07:17 -0800 (PST)
Received: from antoniarch (78-212-29-45.subs.proxad.net. [78.212.29.45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b433ebd278sm131671835e9.3.2026.11.05.12.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:07:17 -0800 (PST)
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
Subject: [PATCH 2/3] ARM: dts: am33xx-l4: Add missing DMAs for I2C controllers
Date: Thu,  5 Nov 2026 21:05:53 +0100
Message-ID: <20261105200556.34240-4-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105200556.34240-2-apokusinski01@gmail.com>
References: <20261105200556.34240-2-apokusinski01@gmail.com>
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
2.56.0

