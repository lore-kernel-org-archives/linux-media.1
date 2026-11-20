Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201190;
	b=liMaxRplE0qmODJE4sCjUdJIE8aBpW4P5cryF7WKewcLIgCJgxTH4hNb/vneX1D8VizG
	 +Tw7dNi2Z1jXdfhMJxy+ifrXcyUQ1isHgT1+5pv0LKrawB90z9V9WQlRjy1kWPrOWvVwI
	 6WyzXLFDowjbRTj9aN2wQBc+lHl3YquA+s58mnYZ44kuC4Lf1f1P4kXko0kAbYBa09S79
	 ZrtaNzGgChlPkpXCu7x1t3hzf4KjJtxTeijrrUdAvpKJZr5+W0BK/Ref6Ael1q4Htu07L
	 zUDOIRpjm89iRm+/cr39wyi9kSp/SxGT1Vpl/gE56vQZIkF1J/7EqvgGCFOzTdV+kmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201190;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jeNmj5ZEc17RCrEqMZFDITOByu/mJAzOv4t4PwqFZds=;
	b=c6kK2/O5RuqweMX34T8ciCcvAM360N9HQ6FktNnS2jxGwQk9JBQLK7xqCKZlw18ECZGG
	 PEkgB7evLQEsQZ+oMj+2Uq7G2busgynLBH4aJ/TLMGXV7IIn8afEGOeUEkUIOJIr5NorS
	 5zo9LS3F3O4cyaexgkp86NefOvfmFavI//3AgHaeXGkAotrv5HsUC5y7nfjndkgLBskX9
	 jNM/nUJ+Jm7DVyEjecDcWi8JQFlJQUBxdaIYErOVomocXQhtBwnyLEOpqFnmeLsJb2gt+
	 pLQl7eKXi56dRkFf/wru09zCeNCQSJkflmIdlDQt9rq/BpISEoSuU0dT8vJStEV4D+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yxkcDXGO;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2C960A263E
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 18:59:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B2C960A263E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yxkcDXGO
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c511c0e2826so160510766b.0
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 10:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795201188; x=1795805988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jeNmj5ZEc17RCrEqMZFDITOByu/mJAzOv4t4PwqFZds=;
        b=yxkcDXGOasir3Qy6rymbwZ/6dJ/Um58rGBpB81H1qg5RNFLOoQ6GK2AsCGxDtL2CJo
         oJ/y2p/fqn3K01f0Y9rTNMQrS/undGrlx1eJJQaLIFC0tLdFy7wohnRbz+aPQ/fuZ4eh
         zMsVRxYMA67xJ99I6j43TSyT5zA0divNQF2ntlSUYeOqyUUyrC1gYRE5wBok9kkLan97
         Guui3O+gNwH2afkBdz1Qp6BXLpm4AVL+qwhTyQ0PTn0XyfFCN7QBQhO3t7wR5Fi671BE
         JZE+WjePQDzRUmsKlH3DVNkATh8GE1JYn2baRismgDLTBTYftBADchLio99oNKSHZGq7
         QDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201188; x=1795805988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jeNmj5ZEc17RCrEqMZFDITOByu/mJAzOv4t4PwqFZds=;
        b=Xf5FH8WGB9CfbN0IO9vLID56ZE1iyz9/1yJPII6fc6rkCrH30PDBTKInZ9UpKS10K6
         xhsRKF7p0pplb1w9Rx+ASHjppq9Yzlfg3kr/EAWQAb3t6/VEfCFJMs5wNr/DeFoVgvHR
         eSq8AFQ8yZGF848BEn9k2xME0XEaJSdhFwH/tLbNWmM4ZLYFba1+RqKxF1gEPmcw6pBL
         8FFzHJflcQ2Z+n0yueAptKRBFSr9CNOvpHDMwKu8pJ9T7PXadPptBZs+6zVbl0P9OCh4
         zcpYZ5wFHi/LbmxWOwmq8c9EOQc5kduGURJAs9CLBmRlnxO96Kpvf/bJRXd/9U5MKafB
         o4MA==
X-Forwarded-Encrypted: i=1; AL+hErGf/sOjFyWebIVXSrg7rR5v9V27zJ1B/VNm092jdYZK9cxrNnYvTKYHiLDY2xTyiPt1QfVB5dZYPtylvg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9nEN+HbNH9p9bX/nkNSLVjVYNQp5Dy16KsD39LijuLhv5bc4WO
	RWku0saaIt1TueiwUxm1I0aCp0IZ4UImgtxBjUe6YBVYhXwq97s5GSm2
X-Gm-Gg: AZFdTZehuXuyNIp84ICFFaMJXE//VUv6zp0t0Ejp/7JGhJtmJTuYMxRG23Edn33EJUl
	UHve9ayfl5tDGZM9Q6ga+wlWTAxOD+78UAPv9RcEbPpDTwFVxa3Fja3kY8t02wb1pP0vcE8JMx5
	eDSubSSzGSNqR8ZDT+0dQnGP/ZnhIya/TojyRzxanoXrkOJVBAg4NmsGpc1bCwuMMRPGj4dwRvI
	KMU8f833roJY7yyWiKJ27+udXQQ258s1ZHtazq6zPYY5ashaEqopH2KbkemZlryNQPCFh8kMSm8
	kqihkPj5yro5VKWgPho884yJBPzsuI9v+RkIpQS8wRSyrCnTcuTkPxsq59yQyde1FNVrOHgbmX8
	22XAlrhuP51Bp5J1yPssEIGHfoQptJG8Ne/O6MpFqZSkvZxHXGIhaj1kvp3eVOZ18R4OmH7MNsa
	CxOew1kc3lRAkMaUfaw08wpErkYgzOh2y0NjnjuOr9xgfGzWwPLeRfS3sY297DTD127f6CahuaH
	bQUVrajcaJiQiM1smq5pPebJv7n+/hHVpQvSL1cVgv8wIZxhNwghsK/5Xp0pBTz3VqyVF8C9WsJ
	TxuGPxSzf409Fh9Wi4rcwf00ANPCJvqpQ14VprVib3lWNGjTZFSt4zeHhACYpQ==
X-Received: by 2002:a17:907:a890:b0:c2d:c739:30e1 with SMTP id a640c23a62f3a-c513ab14a58mr450503366b.32.1795201187683;
        Fri, 20 Nov 2026 10:59:47 -0800 (PST)
Received: from antoniarch (84-40-238-230.cgnat.inetia.pl. [84.40.238.230])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b02de1dsm125205266b.85.2026.11.20.10.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:59:47 -0800 (PST)
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
Subject: [PATCH v3 1/3] dt-bindings: i2c: ti,omap4-i2c: Add DMA properties
Date: Fri, 20 Nov 2026 19:59:11 +0100
Message-ID: <20261120185915.150228-2-apokusinski01@gmail.com>
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

Document the TX and RX DMA request channels featured
by the OMAP I2C controller.

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

