Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795035182;
	b=hF3OAsmo3HsFfyBVTrlbHTC/Bg6Q0LO5Iz6JrebVf9+9l4p99Pr4xWwne5cMekPoUV+2
	 wldU2ZDdpV8tx5n2qlPgY9O3dnZ7BaIMec16SNSylI2F4Nv24kb4GVu54DzXC52hIUFsU
	 iP81kDiIer6vkHFyp/6mwIANYytYcZ6FCpwt1icPBkCqlC8YXodzOUH99NT5R4XhqX1q0
	 wLDS8KF8rsMDcRt3LmeGBUsBxE/655f5di3EKm5lzDQSh1rG+HE1f8KAFl7nBAJ4s1c9m
	 gyn2JKaH0dJSEL9sLkdivWu4nDvrzGPmyAzA5anoDkF5zq5M8rVMtlY6NxH5ghSOJpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035182;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XRZdj8OAA5IgBUgIXtKpGdWFleIEtSggcmllPJz2aKU=;
	b=l55cfluu3UcqvlQzLbkpf2vNB9GOLBwDV+IyqmV9zqlGhN6SP0yUXX3cAoidI2x+IEkR
	 t54FJOpI2M0K6keVOqwiJ3nShByxenNQsOFL5a65LTbjVE2NWWhD+xKWMhk2uGOdoQVxT
	 kRMyC1zcTncyPGZQbuxJd/z9qeS/EO2dFoH/Wtx6uiWaSvrn+AMuI7f4XVQtBdt8bdkvv
	 IrWRz2/17dZefBv/Fqtk9hzEw9Eo+iiEC0PyJQ+4MwQXDuSEjmVg5kk5zZQV2tgMI//tc
	 DRSMTtsAYtWBBaClJA6lZ66b+0F5M5szWfKKlSUB6z9tWzR14HNFj5s0VtKYiwcrLxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GbO3L50W;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF68A606A334
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 20:53:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF68A606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GbO3L50W
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c511cdd5a82so126688366b.3
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 12:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795035180; x=1795639980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XRZdj8OAA5IgBUgIXtKpGdWFleIEtSggcmllPJz2aKU=;
        b=GbO3L50W3zPBCKpX4nWT/H81Rr/VofVkYHAV/6mTN0RreJa/VLJiHzdAzzbm1YNJQu
         TUxDyX7UBLBNHjz4ODRXfQhQ+Y4AaBLmgj2SD0s84sMz5dCx+13G9Rv2kPKG6rg8MrBx
         xv/nBTKlaPQRWBTcov+z4vhnapuM/VkuMFHUb33WGBC2sMX4RNCwygHORTOnvuVmFOtH
         znrtOPCXOo59JqsgjVEX0uSt1XjDdI5KFuDauxeOGs+4EsHbplhM+k6+hFSilAR2Ms0l
         JHOX7VEhB8Uala5teN610QZfolr3YbrqrtpH5QZtSfi1G/zUVse3gawlNG+8H29SEeIM
         67gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795035180; x=1795639980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XRZdj8OAA5IgBUgIXtKpGdWFleIEtSggcmllPJz2aKU=;
        b=T6EABoYd9ITM0uEkrN+W8isLbKSp5gfO76hn01Tgtarss6LPhziaRc9GZQ+9pUd06M
         CVKeMfSSwxG27T1n5Kz6yXuheNhk3aqLq5LsPdMwweFSKvo1uz78lv9DokD11wkD71Fv
         b2H35NRz5oIDxig4iuAPByAtWdxGFB3rXv5CguOzftkAmAqOilht58qFXdZq1SmClCP3
         7n0aOBQlp3cjZVQnidVY0AgCp9PWOkY++2psuwT6p7d8QHCcZvXxIImTzO3xzBkABO26
         kg+w+/lLSgGVeHQDUrTtJf3CFsG2QLLvjzy1b3W5TK2lpDf9vGJyKYbTJlPOmsm0N3Vg
         R7ww==
X-Forwarded-Encrypted: i=1; AL+hErFGKCaf2PQKOXeI6tenT42qkheblVO/82b9jtLP82JDfT3jecmSZvkUuP8EJpi7xXxp2SyKj8o6A56YkA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8yqZdt/AeA6Bdm0XI1x8JhPMDv4IUg1OX4E3l1SIrJ1p/jIiZx
	ff6gjsI913JYRCndugADSDoAkOqI2Mfy552njV4FZFgYtgO/oOlaggf4
X-Gm-Gg: AYBFou1zOabKlSQdWZK6IYfs5TGcyUJCJFpBcBJZvJxwX6Yy9bCC5+O5JReIyw6EMny
	ypngWJ+CvndqDqRW7254m21WtV8GzoOqxIm+8YVWMEQvGAyfpPgJRDPEx4v56QAu37gYO6RQY7N
	UaQozEm7MMtPGp7NO5181stcCkxs3mwoFQa4p6bXvYhdAbnmApKVPORMmhshuDrl+yfyB80j+av
	PLvH1fq2c6bDrwJSDfjAvxc93QdQGsdUrLTwx1XvmBxedt+5oU24P0oZG1rZK8fTIu+6zp5uFx+
	kdbpmNMa6BeTPWOwFQFusXKR4QDoxPiRwIYB9phHc3e8dpTrIaRkTeFgThJHopMkkDU7dW0fDdU
	8xc3TGboEaQB2aIwna3WaUom85e2iDa5aqQI2ILiem6Q1Zmqu9H2bV4SnTrCQMIJ5sFc8UeWhCB
	ad4NbQi4gbYT46Vx7uS8sGcM6PfoWKRnIcdoTdF+vpubR/oInP+Il4JOgVuvdl4QD/8ypP1md9+
	f+5R3HZwukonh6hMqgumEQhvNT7CJl9Sw3J73eqUR5wAxgDsJLqhvumJ5PreTJIx2q3/Q2Kr/R0
	eZVvkghUoourrq0Xu4uZHgbLVAO6Hg+30PItMdg5kn9eoBNPuMVfTmdzoNz2B4iLNw6lmFEUMOO
	Jc+x5v+Q=
X-Received: by 2002:a17:907:6d1f:b0:c46:8b87:c1f4 with SMTP id a640c23a62f3a-c510e2d4ee1mr357637066b.20.1795035180171;
        Wed, 18 Nov 2026 12:53:00 -0800 (PST)
Received: from antoniarch (84-40-238-230.cgnat.inetia.pl. [84.40.238.230])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5123421612sm35303166b.41.2026.11.18.12.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:52:59 -0800 (PST)
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
	Antoni Pokusinski <apokusinski01@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/4] dt-bindings: i2c: ti,omap4-i2c: Add DMA properties
Date: Wed, 18 Nov 2026 21:52:04 +0100
Message-ID: <20261118205213.88778-2-apokusinski01@gmail.com>
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

Document the TX and RX DMA request channels featured
by the OMAP I2C controller.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
---
 .../devicetree/bindings/i2c/ti,omap4-i2c.yaml        | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml b/Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml
index 58d32ceeacfc..ff946fdfaad3 100644
--- a/Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml
@@ -37,6 +37,16 @@ properties:
   clock-names:
     const: fck
 
+  dmas:
+    items:
+      - description: TX DMA channel phandle
+      - description: RX DMA channel phandle
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+
   power-domains: true
 
   ti,hwmods:
@@ -93,4 +103,6 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
         mux-states = <&i2c_mux 1>;
+        dmas = <&edma 58 0>, <&edma 59 0>;
+        dma-names = "tx", "rx";
     };
-- 
2.56.1

