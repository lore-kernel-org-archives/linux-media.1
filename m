Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795035188;
	b=Z+QGTE6Gd7DCZH6v7pG74tmxIMhCr9I0H5YSP+hDzlCn/I2sPCt2q0xqf2toK8hcKOwC
	 8dnuYh4CoIebwNSrfdKtfU1BGQ0AqwPfCoqEgfyM7WlptIjcNYqDbf+gMzjJtpOGlvEjb
	 Xt03FwAEsu6YewLAkHMvOXF4pm1JATXFEgSDc4kUCeYE2+hZ0AW/FT7hw9pzEVi7DXXRK
	 C8MHiC8F13Q71R+b+wEuWm2R0QOzYbKw6Za1/UDalmowW6r9UsmSjA2CFp72LEeeQObub
	 MqH+hVgxv8So4uvCjq5kNRuslxy+4+7dW0KTVFRDwtQYLsX6dNFxvVqmGjJbg1StQNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HLK3d7iXciTA3gYlWpBInCkheLbOB6EwrTlus+ykLsk=;
	b=BnYN+wFO9/QmeXMcqVYiBwyaHrVSseHyFVUfWI9pYIHGN+h6VR/UYN+XJy7kMtZLBEUQ
	 EWmgiWpJXBI9HTFS1Ua/3NTj2T3LakgCPgw/nj4WTgWI/oyLG3kjlj7Au7YFLUf+eHZeU
	 KDMoeHkFErDtrRTjS19lhA9KIGgeNHHZ19DyDaOlf6ly4diyu0qsE2Ad8SkOvd6BqKF+M
	 /pL7QahwjQj7BWn//5shDcL2SpyZvJoj071FDH3mVVb7QElr9YtOVRdOkvJnAJHBKtRX0
	 UhL3rIOcsacoqQKP4fYcRuLVzU/6qiQkymvOZctyLdfHSCifArmLwK/WjDkfcaapRWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mnuOCiw+;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BDF606A333
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 20:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65BDF606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mnuOCiw+
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c50ac25cdd4so192964566b.1
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 12:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795035187; x=1795639987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HLK3d7iXciTA3gYlWpBInCkheLbOB6EwrTlus+ykLsk=;
        b=mnuOCiw+XVWApfJrSVasj2ZwbRaCZD5TnFi3wMHnkk89jysXAwnStHMDwJduYhvMWM
         Q2PvQAilIlElLPf/ESHCmtguPGq6fcjQYD80EbW5p6p0h9w58qWo0WoNsgOv87jk2XBu
         /6WscvhGjJen+7AUTwNMx5B6jyDT3P35kUvp6+OsGBq9ckOPsugUbOhRIAiTbbo1yvHz
         wNA72pMm0g/h4/82Wy7xLDShzDOW8g2rwWHflod5hXoYXdjbsupIWjr48douNVW96rIp
         +LuAqYmahyoe/zpNI7SmwNshZxmL0DXh/aB86mxWTk2jaz3aYAfN2sO2aQ9Kc/bzhEZt
         dADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795035187; x=1795639987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HLK3d7iXciTA3gYlWpBInCkheLbOB6EwrTlus+ykLsk=;
        b=IXUEwrwczNa9IsDsyH+H+FLo01hfloW4O1ZC7yPwaIzXr5LrUfoRMLuTcROOMutWwr
         cXoiC6+eaZkWOSlM3ClT6tIzXMoXeT4jggP2nSLWshhZnm1EdikEoEM7oaCFP82X7KrF
         pKAkXfBBK8xqC2HWsOeAY/MtXa9ZUVNrAyOiwD23PM73czS8Pa4mgVLQOmG6sJnz3v8H
         +ABP4iX9T/01DRdgBfFl57rDUt864d18Mwjje99ojN5HNJtXgYPG89pOdK4Emg4FFE8X
         1mD/fr+Yj4xAVhQyvnBOzoI/B7UY20ega540Kwrlg8b30eehdU9e6WFXDp07/MX5OlJd
         BeWQ==
X-Forwarded-Encrypted: i=1; AL+hErHUveoIZRV/NUnOeCDtEmDbc3n2Ceqom7CKYo7fx3sHV93V3umnuDaYg7My6qECEDfQjBKOLuY7WV7hwA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+U1f0KK6F9D0HCCFaV6dKfweCazqUtZyp4CFJS2SdwwtB7Amh7
	/vZjE459aB8guw3bpR+7Y8Gqf2qSm2rjn95kSnoEFxw0RpipMiLsfXvy
X-Gm-Gg: AYBFou2Nv4U/Ggg/wruzLeOGILQR/bkUc0SD0nsmuhkEBCl3vLO4MD4Vn6+RbWPDxUM
	ZIUupo3tbVGYHqPmnX29qi53Vnxd8o8oZjXc1Z8Etjwsz4iNk2tyai4yCAzUFOQEz569paRhENg
	yr2SzLCbxDKSARB8wpKR9Tj1PoUx8uA8iWrEZsHrHmOOlEsOnPa32YHa4gVEkzb2z0dM8hPFCYm
	Cmt21TLvtXi5k02Lmbm2f9IPlrP1ii98j+Zb2Xz1rJz2TcxZ6FI1QWYMALsA4Isjb0GBfuwxBfX
	ZWOH22l9xRYJ1BpZz+FQvlW6ilUAzgjtRs0NJkOKEpGvJT691U7XvPhdB/EAx3vb8XduVeMwYxS
	WUWFLibcuBi3zvE2S5w2h6C7v7vTdbaKKTkzXh6AObJoVG0AkuCWX+BiuW9cegGJINBJDDRL3ZF
	vjDwWJoD6GsPgDIn84cSlXx7nzBVCUvFarrcNO/Asl4VNp0l+5xqrCf8zCRyE8l62/4ng2UYat3
	/RUOgwxWdfzi6qMcnFbdn5aZfA330/zcWLJZPRjurzrElNz8jfWeEyt0/VHCxnI9MX3W2DPaJkd
	YpSp2QGWoBo2anjfDa0TZ93TeOzqGu+uw0FesXJW+lB/0hwi3/TknDmBXIfAWA==
X-Received: by 2002:a17:907:6d1b:b0:c51:691:c76e with SMTP id a640c23a62f3a-c510e35c6camr355946066b.36.1795035186781;
        Wed, 18 Nov 2026 12:53:06 -0800 (PST)
Received: from antoniarch (84-40-238-230.cgnat.inetia.pl. [84.40.238.230])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5123421612sm35303166b.41.2026.11.18.12.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:53:06 -0800 (PST)
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
Subject: [PATCH v2 2/4] ARM: dts: am33xx-l4: Add missing DMAs for I2C controllers
Date: Wed, 18 Nov 2026 21:52:05 +0100
Message-ID: <20261118205213.88778-3-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118205213.88778-1-apokusinski01@gmail.com>
References: <20261118205213.88778-1-apokusinski01@gmail.com>
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

