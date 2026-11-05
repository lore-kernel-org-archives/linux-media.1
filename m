Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793909237;
	b=Si+z+UqYFHZjPSkF8IvPWm9NWy8piEU+O7lbxFFmiNc4/iXGcvuYUBOySxegc2Raq5dt
	 52agm2qVfSy6lY68A3wp0HsF/sqjwovsFXuViUamKeEuwrrwzBQWjGrzmiXY5d2bsQmc0
	 ukg1aD1W785NQpVn3XrdEGzbufzUcqIVYwZPXI3Z0szv1ZykkiHXzb8Msx8o/+PX80BhZ
	 Zjp0ZVGfmgC07FqXjQXqq2bQKkw+jJ+hGxcDyTBQCLByPtP/KWcfShNJ+sAPUYshTmOet
	 GQMnODfTNf0Svwy7zVj0mm0EqZZZCMe1SHd8dEKgcXwnI9VpBoV2O8b7xEfJm3KAziQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793909237;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZwrKsB6tOpT/G+EQ3qCbOkWdsaYoyG0ZDwls387/DiQ=;
	b=Ra+dkRYi+vN8aPXcFX2Z+7sWVz7tvkUbnfijQWndsJn9M5wbkZM3J/om/05j512Xe0ey
	 6kRblllXLPQratJQmf9rOaTKD+DJb6qhP/DSgWfWM+BrXDtWBqYXTPMQjvP3/zz6GPCzr
	 JIv4a1i0zGOGNLp1iPXJw227u/Xs5+ohCBgn49UYaJ81gb67GWNT8FKQUCGLzdn80sl0F
	 GEnv9u75tqSy4p8+vXAjBVdFu33jOaL510CS8wukC2YfDLIDJ3KNm1Rb3NHsLh6gneMZ5
	 XWdzdJ8AKEXOVXRsqr8LwDUFML0igAFtPdSMWZ5EkugSyli0RBYxs4jSzXEBAUP2rXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xHgnd0Yw;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977B2606EE9B
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 20:07:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 977B2606EE9B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xHgnd0Yw
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so21375395e9.3
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 12:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793909235; x=1794514035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZwrKsB6tOpT/G+EQ3qCbOkWdsaYoyG0ZDwls387/DiQ=;
        b=xHgnd0YwB3pVKxQKrb7e1Dxdlxiafgo9GQRfOsdPZr7HAuus+XL5JFG05Yxw/pNIWg
         kY/rIy1IlI40ze6PsdD0U92wi8F6AoC0m9dIAXPJWrkj+Ys0WZuXWhkA1Ept874kB29X
         j4HXwSVEKoiekoKMeShmaYyF+YE/odF5B0EICZM1GCeP/I9h/mBBKouctuzMZI/wuaLg
         HI56tMGrt3yDDoZsvSVOOOL80AzwogojKRkey3o3z/+WZo7A9Al9TZuAwTz9dr65H+T8
         izYXAm3RXgSm60s3sU4thmzgOWXZye3MjHa68XRvdut8E5UWKVJJwPISjCRPGoPH4LCb
         uloA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793909235; x=1794514035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZwrKsB6tOpT/G+EQ3qCbOkWdsaYoyG0ZDwls387/DiQ=;
        b=Y6Prpqd9XsGczXYGBYPYJqDigD3+fFhh22zK5J/ueIeQI7vQotbjCSMJfZHLuQQo/L
         NLi/cbB8/muA8+y40ZtM9hOPehpw25e9GSxPH4OynZY7XVHjeC/TTBhGnsKt38HcSiyN
         +rOZkKg+UMdX0WpQq19Bo/j4Fr8POPBCb6AvAOY0ldGi1Sl55/yGXYgVZ7Sgaf//mmCE
         XBKp/tnDZ6nwczvE1BEORGJL0mnTayZLGAx0TgS6If/yi64V2jcEarzpJ+YOjRn5meqV
         FX0dzxfuTEJavBIN4EzvRV9CYwLYQP89F/2oMJiIcuvdktPFT9ODGOdWyAWQAqypvZxR
         kG7A==
X-Forwarded-Encrypted: i=1; AKwUvBzCbq9ogEfSR3bQaN1GNEeBDWbanmU8UgKurj9yfceuIUQs5egVbbLPjLunX392gY8YzxGo/YYVJurayA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8T8FZsiOg+ih/0J+F30xUVDfBfLsCNn1tfeC541xMS2ZcGjtcS
	UvxPE/vzUy3aw1GLuS/9cSqQq+unOqM+3H8EhTIzeAe0qcCsj0bNDNGM
X-Gm-Gg: AYBFou1ka6fKTZ+xY3gmln3ncJK6lw6ODD6+n3JhgtbxTY+RhzMBYzabSiApeBxWXL5
	4jrUDXaUVqDYHuY/DTufYib1ezNYPmRJu4b/bfZ1r4GdXX4o96sdp8iT69GIQ2Jdt822uo/gf8d
	zT8hSXipQs1v98ub1hDvj+nLh0Xd14ml5J+7MHSCgaDVZDtOuI0ZsDPXEPlb32r4JFLH+qNaSyy
	JhDQlIMyOBllkK12kTithmv7TX34JcICd8Ii9V/vL8Fi34uMRsaRQ+tdfPrgxqO8xS31XcFN4nL
	Og/8hUngFlWNnKWSU30jJEOExViqv/sflRVgDvLPMDhBlCCChQI4TnEPAPR2PrenS2E/F2v/C7i
	HtfNU1E1ANnHsi+nFKLRqVv5k9OZ3Mu0KsxKK559+3mMW6b2UnirUly/hn1wa/4ssDAVNWfm2SO
	Ky8hBWpgrpl8+p9IE5x2d5CaXDBpAfDnSupP49zDRoIOLIz2ZbcpPKFSiAG526TIymS+KANB8Qt
	Vboaa5lS7CYRWkQvK7t2ZcNBk1kK0TIKD+R+zjXom3pIN7LAwNLFGC7nVerEQRMan+CFvb1T+ZK
	Gie1iwqPVu32oS9oMiN0/AAdBIRqvAdJwkHt2+ZVwSrDPXpMUAKGnqz+KyY=
X-Received: by 2002:a05:600c:6387:b0:4a7:9025:5c3b with SMTP id 5b1f17b1804b1-4b6de1c6450mr3686705e9.19.1793909234959;
        Thu, 05 Nov 2026 12:07:14 -0800 (PST)
Received: from antoniarch (78-212-29-45.subs.proxad.net. [78.212.29.45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b433ebd278sm131671835e9.3.2026.11.05.12.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:07:14 -0800 (PST)
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
Subject: [PATCH 1/3] dt-bindings: i2c: ti,omap4-i2c: Add DMA properties
Date: Thu,  5 Nov 2026 21:05:52 +0100
Message-ID: <20261105200556.34240-3-apokusinski01@gmail.com>
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
2.56.0

