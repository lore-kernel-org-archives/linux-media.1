Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795632500;
	b=DDOaoyUz/9sopV7O22LH3O/ICKnmRqDpidye4aau3qI7A6nZyMBT7JGjd8VbYsavcdZC
	 Ls5U9p5YixVHOEhBIjAUGuFn6c/mq/y2zYIHXO4CxMpCmDNGT89oYTtIoIpGGzna4RFNf
	 XFTkN3gosJ3htX1FbBe+RSc5DxRjHE0w2/0g2QLOcGffDuxZBrxsATArb5ydjmK5sU8Aa
	 V5Qgxc87Kg3SmzOkwNYlBpqt1HzVvhqbe0Q5qkeKIKfW3pS34oX2/jkeDenkUrqmi23W8
	 jBdz5fXOUPKwLCZ4A9I+JWWyYXype3yVXTFt64x+FKs3ea+Rva3ul9jKmPbjEdqxJng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632500;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XRZdj8OAA5IgBUgIXtKpGdWFleIEtSggcmllPJz2aKU=;
	b=H0ZnsSSfLE+kms9QeuDqCqn5N4jmWWzYj3otIdb3eqkCjFK5NHnp8mXkUuW6LEcifx75
	 xhYUHr14KqtuibzC0kB+Q9q08lv/JSxTBQT9XeGwxLUnf7zT1Lx/i+psXB3XA/RaVI2Jy
	 kaxT7Q6XMvZ+/u04b7K7j8u5vL7iSMjPWe0F0Yz8Gpy9nGTslDgMhl4FmBVolf7d36F9v
	 WqxE58zRn0QhfD2fNA5yto7ANgDkg92/G27Wg7Z5iCcpBO3cuz2N9SdfA/WvhAN9X5UuY
	 qWH3XlueNldqXDSbDmycYK8cnwLKv47MJ3HvfiT8eEKrD+Ykkt6Mt6Z3v99BhrsPJSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lM6jPvTR;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AF0606A680
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 18:48:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35AF0606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lM6jPvTR
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so1129457666b.2
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 10:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795632498; x=1796237298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XRZdj8OAA5IgBUgIXtKpGdWFleIEtSggcmllPJz2aKU=;
        b=lM6jPvTRh8qC2tVEZxJ68Vw2DXnOsWAPa/Hxyo3vQhA2zAFe/MejY0hAD0zdt/076P
         FRh1bvwBu2AMN0W9nu0BQy3ySoAq7UjjWTuteT5cGjB5LQfTcDnDidmoBlJBCbWVQi0H
         U8RkDKgN1kbmwcXHqPweWxaMcn9IErDkmuE8kCSBog3R+w77Ml3s8pXsI8RTvXeATNNK
         foTTKZwypSgexu8jk9H1TcGqgQq/kEUeYS2i6OO6Zsn4SjEECE1JypvAdZbuI8Tj2v0i
         YShrmZYhrR53MZHuohEChrnpTslc2OFjcXWzQ7BwquGlMo94uuGZ1iiNFsAj7u++Y57q
         VXMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795632498; x=1796237298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XRZdj8OAA5IgBUgIXtKpGdWFleIEtSggcmllPJz2aKU=;
        b=P3Z6zuVLUUQ2N2aCS/b7p1rWsgb9rNui1VcD7Vp8c8np+wf/1Si9TSrV1e5A3urfex
         HDg7G7ps9+44F00yLBIj3zFbvu062YspGG52M4c4PfUweW2NmBx5XTwTpqw/mM8gikSU
         YuitDjR3Aqm4V3uDi5ym/8kfHbvF+11Gn0TALA2QDL19SmOoUctdAUWMkMx2PPPV374x
         Mv4/MVrCF/3w69MI28lqks0jqHt+s0WHxr8OJpRWnK3zzk7y7c0cxz51+H6k/1054Zk7
         exruCIc2pe2mVtuiktzVcIRJ4LNNyQ3Ymv7Ec7jJD2/xeb9iOyvda+OynsXKoSsk1Wpb
         KeKQ==
X-Forwarded-Encrypted: i=1; AL+hErG+NJ4M+3uGWHrjaelRuZGoHkQXb796H22B9BKa0zy0KMcP70YWmfQAcuuyC+H4LDUOm+6bfqS+9P4S8Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z88WRVdFxJMZLzrUc3WT7WBUBZJG//+loDHrlTxucj1zTZyqZYD
	4K0M1PtbUiDbPwVbmaXzEPkJcg7rz31ySkFghbeF+S7XXGRQlphVWgSN
X-Gm-Gg: AZFdTZdFuI8aybOHLe2+yWtLEdqvomJdUKQw5TtkuDXQs7JXlGwtJp/7krUhWHR0D99
	vJ4ZFbx8Qa+3CR7vdaWVLB5fWtSRNIA/uWTmBHhTIrBgisHLE56WkY3Qz/VQCamh4Hnn2P7zyb2
	QbvXAzvkdD+cpNMfjXM+m4FgiZbUq5imMUVenwddDPnuckIVGGtdDgCL33OO+HTWNOiEDTHTLSg
	yvvyUc+P/zKG5vcDRxvdWpGjAitjnMuAbOFPMELOd9lTDbzL506UlQKtbk3rEUeH2k0vfAvJcZ7
	cQO8DysOwR+h9wjNaG9RXmK/YS1BkWL8iUV9NrdG10rmf0YRzqvoUL54yyt4VztoYcTsajDT01B
	z9qqXsq47SHRQUG8tSTp+yUm3hJKjxgBCjf9Te9yp66c6i5UlN3aw75bFwmB+du87fILrk2Rf8d
	Bw/mJkvZ6LZsZFU96gJ1hOH/nF1ZBUrqXzUV/9pVApgUlJkeOUtBODZy+y0Tgkwlg0EOBFgPxEy
	UpOFt7xtolqHKCprce8WO/ap+JxA4G/GdnJSHpsO1h8B6qhITVnqnH655Nj0spWsybb4HQx/SJU
	b9OfZQ7/TUeiDsYAtw7fgu4iCxwU2FE9zohjbLjRnTSr7yA9S0DQ7YYF+dRrpI638dE6+CAgwtR
	gw1uV
X-Received: by 2002:a17:906:5492:b0:c51:caa:607 with SMTP id a640c23a62f3a-c513ab0c394mr1129231566b.19.1795632498494;
        Wed, 25 Nov 2026 10:48:18 -0800 (PST)
Received: from antoniarch (84-40-239-22.cgnat.inetia.pl. [84.40.239.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc73d3sm677226666b.64.2026.11.25.10.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:48:18 -0800 (PST)
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
Subject: [PATCH v4 1/3] dt-bindings: i2c: ti,omap4-i2c: Add DMA properties
Date: Wed, 25 Nov 2026 19:47:46 +0100
Message-ID: <20261125184750.57866-2-apokusinski01@gmail.com>
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

