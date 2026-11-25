Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605996;
	b=wu8/z03MGzWUIAK1Ae+a2hzVB8N7GZD0wDxXpvDVUiZFEjp9NwHglX5h+ABCI61qzjOs
	 lDDCbiPkGnX2Osk2RxKXe57+/qH4BzufTr+Mzn+B3iRGpxAy3XOtbp6hK2svw5/AzqMRc
	 qcdlkPz0M1F4naKcyB6v5SM0GiZqEBcjvMsyezXqVYfZ3h5TFBnaF7llaT3EgjbjRD04h
	 p7JnoEN12w/OuZL+dZlZqi7NV2XRVnG9b65mrqYQ0G/gO/DNqiQL3/NkzjoremWIzigJZ
	 aIJ+RmgOCSo0lX1EIOIGqS3AeFCGi+eZIdnjCo66LdOZ1grpXZW1SRZeyOwHQhEqDCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=v0FXQy5JXr1wYq6VfY5iDrFuAvChplEIolQ2bpb+3GU=;
	b=rUEDq7gpa7NzBaAWoMlJN9Zljutzuv+TT+JHk8CjrhxIAw4vCH3mpd6zNfFjUxZWJQl+
	 blzOR9CVNYghEcv5iLR+9T48qD9BwlCt+5OJRLliXr8ZxOI1kyFhRKUqwRVmGpvXb8h3C
	 S3n43G7SB3rsfiHdPpwEZMaxJcdu3bG/9Z/Hbt9sSmQ4rGdm+lXCv/ZQgJkynG7gQgiJo
	 Q/XuHwX8fAU3o/cCq9momlwhgZWWkeKUpUTCTK1hGBD2o+ihja52uTD7cgewCv3mhDia0
	 NmnZgMtL/DGSZjLwe928IC7UjMliJ7HwvO868XVDmx3Q3l3gkGv3IMVxgyTXr4TndNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QuwcP9VL;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F6E606A693
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 11:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32F6E606A693
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QuwcP9VL
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c50d3ac6b51so1221589066b.1
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 03:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795605995; x=1796210795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v0FXQy5JXr1wYq6VfY5iDrFuAvChplEIolQ2bpb+3GU=;
        b=QuwcP9VLjjET9UqnaCB4VTQ2KnNQAGTJSJ3bQCTHzKaIYapakl4ZQWGsaACsILb641
         W7KtxrisONpVDq4EpSVbWTvDXy86CqnaQFgdLrlYoSRKHlIEdQMtMDh3jijgGpFJF1yh
         EVxBpkbnO97KVy0aa67HyS/In4fpz0Sutuq4O1PuslmAC7w+uAGLD12pCFNFvtKF1c1A
         fKiicqVlZygJkGR80dlBjz1dOvPKQ1ObQ+qR2AxlVaY6MY5TvgX2iFg7mLF7XMYnoGrL
         tp2c0sQwBLFx7gQ6YUmGiPGoArhrmeIw6QsLxL3k4jTsuJKME1vvwF17PuVO+18EfydB
         JsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605995; x=1796210795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v0FXQy5JXr1wYq6VfY5iDrFuAvChplEIolQ2bpb+3GU=;
        b=SUDFLGKpBQ4Zs+YNIv1oZMTQXq5g3OgDL31wkSm2rrfEW1w3wyOk+6mtaoc59xzE/f
         5wx0vGNXgvbDZcgL0ML2wz7UWrDArE8n6K4acjzNuU3iyV+u2YkA/kfVH9OUR6GTQmYN
         kBbtdJmy0IV6NajDbLy01Mr3eR88cr87jKie50+UlBtiQK/zUqSCB3HyysXpbaUSpBkg
         mX4Hw7BfvrpteoCSBRpXVWeQCnuxReR1ZyyJ9756wBa3eN9wgqER/apbEpKRgeK7wuW6
         NCLqUWDAFUloiHFPKRhNUJs89QVFCK67C4+oJ16Yh8Q4AbNkU3DR1B3AMN1sqPVKzCP2
         p/MQ==
X-Gm-Message-State: APuU4Z/ugsSzn+jUjmKExsVyzo2CUgAg2VUgOU+ohL/uI0LFnEsdN/sA
	nUyCkW9mgEb3QFEo2pxT/ozJ3UqxqUmwQN4UbgOuq+fhI1JNMLEQ5B5B
X-Gm-Gg: AZFdTZcybYwlYQ9q/zss/usEQD3HekwkT5lKH3yAlS/zWmkMizA74XEJgHvy7QlUz+W
	ZbNS3A6uiSzkWO7TC2pnSOwfFNEUc9aVEhKtInFRhaevX2ZV/LoWtsLwEZoDISornNxkxAa5NrW
	wWAIyViDBfyvZBIAtw6wbo4IWmZlImOjo8f5hbtEabjFAa1/OsamB+0FoyKQBCC112FYLn10JF8
	XX7XYryNjw31e35sLnsqD9iGH7Cn/8Age3VDeoAfACeFAJW7C9m0cqkzl/7rY/+gk3th5/tsrKG
	T0WhErqSwzoMzFGWgY6wCewxhiRQJ3STIC/v38Qb8PDmNo3vJOsMLhmx5BLFdUVVWjkYb27KGPI
	ykhSnvpfOYIY+7ed50aSuRrAB9CZYFQ2+dmNP9Dk0zHcN126c8Bz13G29/5e7QrCxaavmAZa9Qt
	NFVG5GviemzaRJEa4OaGkhamVuHuvgW7kRUPSET6f8ItVXmZSMimGZp0C3p+s72OG89uqzjEhZ/
	FLe1TrspFR3QgfotwaA/yXnP4ogjmnEcNUd7ajZqqKVLZls/NByGgwwMBL3dQ24+cUJHJItyfpL
	LqqjrrTXEaFgDl1/lzBft4cRCgdkOJMOg0sdzZyK4kANevhZwZsJU/Lz9lIRy4EI6kR27kx3zFS
	rjyJHVyjh9uq/S5OBoRrr/vHgJt8XxOo=
X-Received: by 2002:a17:907:1c8f:b0:c50:9412:93f0 with SMTP id a640c23a62f3a-c51317e3208mr1522656666b.8.1795605994515;
        Wed, 25 Nov 2026 03:26:34 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb1b93a8efsm1202907a12.7.2026.11.25.03.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:26:33 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 4/7] dt-bindings: display: tegra: Document Tegra114 CSI
Date: Wed, 25 Nov 2026 13:26:10 +0200
Message-ID: <20261125112613.237333-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125112613.237333-1-clamor95@gmail.com>
References: <20261125112613.237333-1-clamor95@gmail.com>
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

Add a separate compatible string for the Tegra114 CSI, as it has a
different programming model, uses three additional clocks, and does not
contain MIPI calibration logic.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/tegra/nvidia,tegra20-csi.yaml     | 37 ++++++++++++++++---
 1 file changed, 32 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
index a1aea9590769f..6296f3ab1d0ce 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
@@ -14,6 +14,7 @@ properties:
     enum:
       - nvidia,tegra20-csi
       - nvidia,tegra30-csi
+      - nvidia,tegra114-csi
 
   reg:
     maxItems: 1
@@ -24,12 +25,12 @@ properties:
       - description: module clock
       - description: PAD A clock
       - description: PAD B clock
+      - description: A/B lanes clock
+      - description: C/D lanes clock
+      - description: E lane clock
 
   clock-names:
-    items:
-      - const: csi
-      - const: csia-pad
-      - const: csib-pad
+    minItems: 3
 
   avdd-dsi-csi-supply:
     description: DSI/CSI power supply. Must supply 1.2 V.
@@ -121,9 +122,35 @@ allOf:
       properties:
         clocks:
           minItems: 3
+          maxItems: 3
 
         clock-names:
-          minItems: 3
+          items:
+            - const: csi
+            - const: csia-pad
+            - const: csib-pad
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra114-csi
+    then:
+      properties:
+        "#nvidia,mipi-calibrate-cells": false
+
+        clocks:
+          minItems: 6
+
+        clock-names:
+          items:
+            - const: csi
+            - const: csia-pad
+            - const: csib-pad
+            - const: cilab
+            - const: cilcd
+            - const: cile
 
 additionalProperties: false
 
-- 
2.53.0

