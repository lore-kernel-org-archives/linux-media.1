Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792737588;
	b=AtMyI8lgXQLDLln9/N4zmSuU1RN0wRWvvGeutzYAsbCh6KzdHcdXiOLr7KMf7EhEVRCk
	 9IHln6yTuO3b4n81x4iIahBtoLY709WBlJjOOo0gPtjfySZq6dJ4NUh0ow/pnTRb2ntgO
	 fysapKZM0shD+hoq6klsXMUCCoeuKefiuujK3+u+dpRyT+EPcUCiAKTqHtvVbyM8x+R66
	 7kC1hQncU/FV8bougpJ4XByrdpxgnOQtQQpzD2kBCQDVZhaN5IgTB84dVIcP+827e3ADt
	 RxoaKRXLP831BBRQ8KOj81D7QC2+lUp5FKR9tRO2OrBPzY3VsYFbkjkCMvjXzXtP1LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792737588;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=zM6qRbp5A9CbBlh2Bu/tmcTR/0lPEgQHJG0kewWnWN4=;
	b=OKsWadoBQpGwS3/qYu4uVqXdmYQLnX3OTPhrtvREPQMsxQX5ZCr/3QHRI4XW2hczWWND
	 TV9wgohA9sJ0pUYzabZNNADoUQ9Q94vE44qZ0RCcLXNTBaOwy67rC5EbmfhQMpb8EGuuk
	 GSCWwz6RjN2IZCrxw6wXjCb9Hrvii15f/wqEx4W6NxGaC6E+1osJz4klCjqgwEQDwZZTM
	 hg9/6KcK1Z1MNA5w5THje9cq6TwMurTNxD+s8z8YqJEsk1XzBoU6l9ib7XClP2VFI4RFJ
	 T1bfOFW8c0SInNerirM3gibUO4mSe1m1NV3BUaPePhhN3OM0bHIJfE/kj7WDohqTU8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dTYQCezJ;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E65606A31D
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 06:39:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64E65606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dTYQCezJ
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso273578f8f.1
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 23:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792737587; x=1793342387; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zM6qRbp5A9CbBlh2Bu/tmcTR/0lPEgQHJG0kewWnWN4=;
        b=dTYQCezJmgcg9GGfQwV8y0d2iLfg6yCWGHqDKMyjsr8yZxOhyUsBMSf/ZNFgwODWF7
         Ca65GerJrzoQMUWzaApQ6FsH021ecFKPP84Vo4xTo6/rpTav2Td2W5SPBRlg3hXGl1px
         xP9Z4zO5uXlxiArcnHL2bAJmJPkPMjMl648DPWqdP90u701pWOiEyM5G/1muxUzPFpq2
         GELahv1hSqryhdLHy5UgrSQvCjuip2O+DMxqQdyrDLqCzm8Xny5XxFUUYZp9tLCW119v
         aS17giMu5xehA1z1L3jBEqcI0NZSj+ukea/DASddTVYuvZWF7/0CR1CzHU/29htSAxpq
         Vazg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737587; x=1793342387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zM6qRbp5A9CbBlh2Bu/tmcTR/0lPEgQHJG0kewWnWN4=;
        b=1Wytapq23eUR7gW6nXX/RsjWJ9diQ+s7t7vFVnEE/X7TgZnDyiuDsvHvS+QeBGwtZ/
         S+7KXwbXyhibFUD0uWMQRBE4VGEiYrL/kVNtlSWnKlK1LA/GPUN6I6ATngaeGrlkX2Bh
         iBYgtzXCBNqi2+xo09AIVq079kL2Vo2+NVjRSAbngGAxYPSZhOITpqog0BiChIKBaqaJ
         9BV7hsrVv5eckBf58vdQSPKz8mINZ8sHdx9CYN3NcEZRtWB6vmUuDMGmr/t3qzc2SHHf
         FoN432AfW1+MnfcqJFhITrRBmkvR8OltAJqUcqtrfO8Kmhdy5svza2CJZCjiXcTpDc5I
         l2vw==
X-Forwarded-Encrypted: i=1; AKwUvBwWodmtT8FJldMHUl/8SZuRRFnlY7f94PiLlOS0rUd1PayrwoNxDuG205kCdqlxpTSscBiAX1HtwP7QRg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKDL+kU42dS5g1Wq2MwyuRcUzUJ33NP7BjE47clPRSYRw8aya9s
	GgtzH4bi9zPTSmyRSykORdfbb0+IiqBdXks8odCmyI2QC6nrklAWI/o+
X-Gm-Gg: AYBFou2iDABK4TU9WDEnyxHqvXVV3/56kVmTOa6EJvr51H5oY6vIi2yI5mVXCmI20sc
	JOm9E6/GhxYKZycpoRYcSrXOZS4BmJWgdSge30+LYQq0XhNtpodKLx6gmr/oiw0VD8EqP5AedmE
	FCumeFoH+2G9C5rB7xCmSAVii8JMs2X3jQruODj4Jbzm7WERqJXOE0MbEFIbY3sVgTQU1eaDKC7
	QZmOlOwL6ynmfqXnuZ34L3CbaEVImhtBCjVt5lWWbVnniOtrzw8IR7ya4SMZ+y1/OsJne/WeMZH
	QanpavolBSRYyloqo/buawpG6iVpjaKopwJVtFHECe+twrlnBtNduTN2QDHlH8tfb0tIdC7oru1
	/vbk4Bsiu4ZwBdzApNpitknhJG7nXtfbhU6gxQHWFD4uOSJXGb0ETBcFQq2HvVPqO3PfxkKeURL
	QNDG/dnSx2RwASpHCJF7EKA0z1bwygs13okTuOhMMpiAFjdG9XkaGy2loMJ8ASGoXAKeglz0pCF
	8odlbOPzwXSn4YwLqEKsDWUHBFbz+w795PTsl0X26qs0shuTaOpownJn5lcHw6XtIABHTuPQE2F
	cv3Z9HBx6y+NAyVzuxMklU1tt7AMdCRR5X/IROmgrE5UBvHJ9UWJ2oUgDKEZRKXrQi/6x7XTUKU
	E3x0=
X-Received: by 2002:a05:6000:41c9:b0:48e:dee:52bc with SMTP id ffacd0b85a97d-48e384e4205mr1725429f8f.0.1792737586551;
        Thu, 22 Oct 2026 23:39:46 -0700 (PDT)
Received: from [192.168.1.22] (cst-prg-49-173.cust.vodafone.cz. [46.135.49.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38030c47sm3104782f8f.21.2026.10.22.23.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:39:45 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@gmail.com>
X-Google-Original-From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 23 Oct 2026 08:39:28 +0200
Subject: [PATCH v3 03/16] dt-bindings: remoteproc: k3-dsp: Allow
 referencing the timers' power domains
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
Message-Id: <20261023-thames-v3-3-3ab40aa17157@tomeuvizoso.net>
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

A firmware may drive the core's timers, which need their power domains
held; the remoteproc driver does not hold them, so let the DSP node
reference them for a driver that attaches to the running core to hold.

Assisted-by: LLM
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

---

v3:
- Initial version
---
 .../devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
index d6319c8e96f8..80eaef0a19b8 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
@@ -76,6 +76,23 @@ properties:
 # Optional properties:
 # --------------------
 
+  power-domains:
+    description: |
+      Power domains of the SoC timers the running firmware ticks on and
+      times its work out with. The firmware programs these timers itself
+      and makes no power request for them, and the timers' own nodes are
+      reserved for it, so nothing else requests their power; a client
+      driver of the firmware holds them on while it drives the processor.
+      The processor's own power is managed through ti,sci-dev-id, not here.
+    items:
+      - description: power domain of the first timer
+      - description: power domain of the second timer
+
+  power-domain-names:
+    items:
+      - const: timer1
+      - const: timer2
+
   sram:
     minItems: 1
     maxItems: 4

-- 
2.54.0

