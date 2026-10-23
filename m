Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792737582;
	b=PWppoWqJ8/c/BAMJoOS7PkkOyPNm2Aq1EucJ3hNC3pgi54Rn0/JCZChhm9HI3su5Vfu9
	 3un3BnfOOjgrtr7tiKuJ8ROBt3kjkH0zKIe5XunHSzh72RWuN+k5go2N1nuq1NAZTSest
	 gHwElwCImNc1XneZp6De8OFCi9o1KG6U/Uwf+fm4SXVDi6v2O1JJyybWAicbWYeoAuTr7
	 tbomgKqhTDwp2psgo3AOLg6DUTy1PkZDH+TGdN+//WaHIWsSdTLWzv4fNqxLsny0KiqZz
	 J3fxgamyxnSvIniTSRG2H+4UJssid6xcCj5pVsFyzhtTrQGFxnGSRftBnFKQdZpoh7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792737582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=e9iXPCmoOhpVXWg91psYHS0PCZjsptq0x3nugAHkv9M=;
	b=vGy09gRds/MuYe9Tjdm4/LY1drLMrOaWeOkA4CwbmmzGhXUoV3ufb59w9qyc6AvgXo9M
	 2ivV1hFjaNlAvH550kG8gi3mg81UUo9GKUXwkx/oCY95sMXfQfTPpGYGyIbvsXvluIaAi
	 jCjcLTpKVUSMCXGnFH5s6k0IDM/MrvjVnr7FeGO/cXEKw1R1ZIllT3uKwbzbZZRL/PxiB
	 6YYojm1tGlo9ZvXJlifk04pJibLRekrbUoJ+H/k/2DhnHwOnMw6wBhLTNaSueAUSj5luu
	 uSzh8hNCpaHVzlEqSQaeAB9dMZ0lVCIOeOyUr7H/rTIMRP5ObBung9Qc42eXvHPBEcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UQBmNYbY;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D97606A329
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 06:39:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3D97606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UQBmNYbY
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so4305265e9.2
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 23:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792737580; x=1793342380; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e9iXPCmoOhpVXWg91psYHS0PCZjsptq0x3nugAHkv9M=;
        b=UQBmNYbYzunSxlqefzQwlfzStDGIZ+9O+P4YzFq567SYqEcPNcMq8eNnih7hPjpmBr
         L8WJT1AH4QjhoiQQMwDxZpUja1QV5Z9Ndg3UInkU3QqkE0YIp5iop6LEpyVEeZg4/YBl
         tXWfus1Qe7w0Sl4ZfuPeTnaMSaaqm+V6iO9niRnGMaxDhAClo/ysPfkoj5EZTd4LVDWa
         4gnW+muQvuA7dEkA0uG5vZtwvTfZqtrmbYW44dkV+3KdX/fyWsQlPG42WUq0sMmn6Zsn
         hDCsNHwA+T+Sd8M84FGeOgCphhp32Qe7uNCO/Tggh7L4eqFsqZvaJvekyhQhS0RrFsL6
         t3ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737580; x=1793342380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e9iXPCmoOhpVXWg91psYHS0PCZjsptq0x3nugAHkv9M=;
        b=oXgDIux8vKmo87cgGizoZX728SuqB3BVNitEVttuHU5EZ0yGpU85PYWKlwIhB+CPzF
         vRGA/xHHrG9vz23NrmXJs/ZTs3W3G9+pVAALxHKd21CQdkl2ivhjtU1c4PP1VJ6To2/y
         kRFHxdu0Vtelupy7YSTyUHbhm6lyaPdpGduL2dkWWBRXRozrE6YUXpVWKjgRCT0Byxdf
         bAIQc9a0VBUaCtiAglvhFG0OzPtNdoeN77/zxWKUCCgZ1FOj9Xbs0VCZp4WaWfli9Ipf
         GAcEXMGywUbunVb+Afw1u3dtcEY93IDVeFq1Q7WGpa4JnRN3oK7BTJn+YsSEdMGn1CdL
         +U0A==
X-Forwarded-Encrypted: i=1; AKwUvBxpTzFeUc33xgZ874gVp94igNCmc/XWhW0Blz5r2IeCZGey0CxRV113y11JnqEvoGox5eRCbpYozR2dWw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLjKMsMjVSZeeYsXHfV5CA5yKkg5aqwV4F68JQluvsD8E3mGv2T
	YweH6XxR339xfgd+RsEBeiBOA49c60jFz0Q15gCOZVySTeUEnvBqH0Xf
X-Gm-Gg: AYBFou18Sb7zYS6EAKvOu/m/d/GtlOBYx4y282XuLKCIyR/AylNnbm/tHxQg/WcWABV
	wtH7N2hQoB+NTHmzQDghXc0pLquF9R3aQgGEKwRPjxf0SJSurjzZZU+k4WicQngYvImEkk3QM+Z
	CTsc3EkF05XiIvW1m6FbjvpcnVk0lFJ3HvEElu4h/oPmhBNDQA3z/288oY5L8tlO2JQLPp5ZVbR
	+FqGmG0v0vJTrQpl40jdg+fBaXzOUksoF3wGxsX+5rKFliLzyKFuaJodpAcJ10dTpaQJ4rMp9K3
	9dstaLBhRdSjdAqR1usyjvGO8IrhNF4646Up7SmHm29fR1oaOpsXeBEMi5qXgmuYy+KhIdNp5WN
	cC094pNIhCzEgc+bB1BCKzDMd0Z86ZqZFdqVa0vc/CBcEwmDu5tONoKAV/ZVPV0QwxIz9I0C5Hw
	0mvDmm2jZYak3PZA3AoN7uGEiOAYW0q6jq9DA7XnMcp3PN+6YRcZFmCdpsoZlP2kHWlbKxxOiJu
	e4Hq20zA8hRrute4JxVNAGj0SBcDLQkd1viR+HOvhAVm2OETcUNKx8XUKggNXI5P/HUy3PoUUrv
	E5ElpV9K1Y0MFyq+YZ7ZrfaNPxWLvlrpHDge7rZzMQ+Dki8IgG2viKv4rgYCFaluhx9iimeXsTA
	UslM=
X-Received: by 2002:a05:600c:a46:b0:4a1:db17:c7e6 with SMTP id 5b1f17b1804b1-4a211c50e30mr19135615e9.2.1792737580211;
        Thu, 22 Oct 2026 23:39:40 -0700 (PDT)
Received: from [192.168.1.22] (cst-prg-49-173.cust.vodafone.cz. [46.135.49.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38030c47sm3104782f8f.21.2026.10.22.23.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:39:39 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@gmail.com>
X-Google-Original-From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 23 Oct 2026 08:39:26 +0200
Subject: [PATCH v3 01/16] dt-bindings: remoteproc: k3-dsp: Add the L2
 auxiliary and DRU regions
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-thames-v3-1-3ab40aa17157@tomeuvizoso.net>
References: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
In-Reply-To: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Beleswar Padhi <b-padhi@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robert Nelson <robertcnelson@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Suman Anna <s-anna@ti.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 linux-remoteproc@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailer: b4 0.15.2

Besides the existing L2 SRAM region, at least some C7x DSPs in K3 SoCs
have an additional region called in the documentation "AUX L2 SRAM".
This is just some more SRAM that is accessed separately.

Also add the memory region for the control registers of the DRU (Data
Routing Unit), which allow starting DMA transactions and polling for
their completion.

The two entries are optional, so existing device trees still validate,
and are allowed only for the ti,am62a-c7xv-dsp compatible, the C7x
generation that has them.

Assisted-by: LLM
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

---

v3:
- Initial version
---
 Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
index 8b1ed384ef22..278b88b7f906 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
@@ -122,11 +122,17 @@ allOf:
     then:
       properties:
         reg:
+          minItems: 1
           items:
             - description: Address and Size of the L2 SRAM internal memory region
+            - description: Address and Size of the auxiliary L2 SRAM aperture
+            - description: Address and Size of the DRU real-time register page
         reg-names:
+          minItems: 1
           items:
             - const: l2sram
+            - const: l2aux
+            - const: dru
 
   - $ref: /schemas/arm/keystone/ti,k3-sci-common.yaml#
 

-- 
2.54.0

