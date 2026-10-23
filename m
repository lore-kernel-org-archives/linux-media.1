Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792737585;
	b=KMQCAP61CmIOlu6kt807uyoHxpAgGrobDCiO5bXcltFVghLxik7keAkTm7odaf8EN+pm
	 pi45E9mQ/6aAPR1VDYSQH4d1jez4tXWZXL9s8+KoR7dMNHYNmB57jUBB8a+CX1oBXOIsb
	 Nd5m00096ptF0b5u3uRQ7llp11G/swf3D6f58Fb5TneYZ/xX6M3MPspZ/BopIRe1xhHpF
	 2XvBT6xdpxuFZqD0hUEb1Ugn06gHTZNZYSE59bxXmLgmuoD/EaEaAtyYJb4xoRJZBQj/y
	 K/1nCRAtHUc5cZNiF/fVLh0ExwkH1ZV5n96vLSn2i76zX9uWqhcKJtK+acG8s9RXDaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792737585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=zCs0TMoU/xtdfW2o//Qc3w2kO9KE9uGMF0SrdJknZZc=;
	b=xNfD1OQCztLSKOAEF3g9kVINkJH4CkO3b8oLzCkILvq6YUn/z5ycpVLfKl8mWCjiLFLi
	 Uc6iyBEGrL6aL+oOrktFjBXVx47y5wo0Xkx9q268k8Rx4EwIrgnnzxgiXfNYQLOA45UJR
	 IADBnC9hWUqyR/TwDfuvQGrl51r+gXpVR3RTUmAEt0354c7i/J6XzVPrGnbd7Askl6uMh
	 5XTXU1/nYUw7vVENm73E0NQqycbdlMOZtK6ZMXkr7C5fFxDbHbdlpk82esOnOskxBFJ1l
	 n6LQyHD8C56x9evV8B2ai7OK4lWpuJbnPEnomwKj4ZrHPJkax6onNX9yGsfBelg42Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K5gmrOYj;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E175606A31E
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 06:39:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E175606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K5gmrOYj
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-487049569b6so254216f8f.1
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 23:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792737584; x=1793342384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zCs0TMoU/xtdfW2o//Qc3w2kO9KE9uGMF0SrdJknZZc=;
        b=K5gmrOYj3tl5gpqCrSw9ozcnETPEC4k8tihxf6zDQDJzO6W1ugLAFbGbsv9Cz/MxUB
         quIUfAE6oCPFSLcX8P+JtzAwqC/EvVQVqVldkQtMgEtTOx+hyvg8NvWOS4XYCf7ud8/o
         Gzc0esoT6mvjMChNOgbAm9m7/Zm3rnihd7W0X1kADDuHzZZYih0caal6tQPHJOejfhVK
         K2BbjC/G+1p6cfFAnupiIBsCBTQOgMBNzgIf/8rwbqnvo+qua43tmcZ9lsB9uE0vJbXz
         TBLYu0YNtvQan1lTxqxqkmOEetHMR1uVhpgkfELL7ASKGJziVeEfwDGBOoqAdY7h9Fsl
         950g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737584; x=1793342384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zCs0TMoU/xtdfW2o//Qc3w2kO9KE9uGMF0SrdJknZZc=;
        b=ysJhaJ4/sS46HUqtPWKhX5U+K7M6+r0xpxS5kkD10SL5zD+SLbibFVMbU3R8OND80k
         gazwPLwyATObcANcdOOTB3ovOXuxpmOjQmWrCPmfdjQpphnjyTDFPyI29txCQgnUIujc
         C0mcU4+6/zkHjrDLDfNqVltLGf113sb+k1SfnFxbdepQbeyWxReYovflXEarozSTwOvl
         d5PBBXUjYxcYVMlHdcSLuwv0coq1fP5+tNARnazZo6dCrWuiMF9O3bNUs1aSXjBZRGH3
         b/DImiRbqmmAgHaPR8UNfX2sObkXYPwTfERXFnGRuMd6zssh14sOuejhANMNk+uekmoT
         s17Q==
X-Forwarded-Encrypted: i=1; AKwUvBzcv7kXGPXdndrVVLfvSurTdDE72wtcnJT2gAvF7R49brq5c0yZXzl/G2kUkJRtkq8uqhrS6RI1VlubZA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLSyJfOxwsm/5pVhlpXCD/utu/n0FeIZz3Z377FN4G5lmhdrM53
	W3kmO5M/pNOqWv971bVyEGm3eTZX9YQ8LXK+UzPgJf2hhHx5MB65DvmP
X-Gm-Gg: AYBFou1YRoGkVZRs3sUDLn4yLxdoY90AqJmfFXBeFkNSAU0MSeET8gRzRS3QR9tFi66
	FiHZdwPPKKfrL2y4nkAPdDSRBA+pKzJhIDnAg9VhM4ryW9sZZ4OtDSuUCC8CwslErtoanKIfsWy
	a4nLppaZaFudHdxHpelzBxofDZqKuOWDuTYUMDMT1qytb5ZpKrN+6lYD7IWMlCxMJIz4crnCyoG
	eS6MDeVnG79MaLk2HtP0eJjYJLzWM2MSP135gMz6MmpVqUer5kUiz0YoTBkSPcZBLPDXxHU4m4S
	Xq3D4R/baBXyuo5vUx4PMXZxcCeizyoyqMjrrL6aivOSQqQ00eO0Of06YRCKef36Yi+b1szd3mb
	lSWpjPtDZ5k/GM5suQPpzEaOPaJVEFAgmpnYI3oJnDmzWS1eSfFEM6fkU3ROvMShHhH7Fjv7jF7
	Yd/uJKEPs1xqCpeaWnzrGhtpdCCUOdo0/1c/YT8QM6T7IsUTCgnDW9qsp+pncst5up1+v7h0RP8
	ChWz/W60OnXoFBQvB0fvIYXoo6vncCVisofrvbLqhQR6cpSM7xAaui1+iP+umok6VR+Gsn3+8rm
	APloMhNvkl8PMBBORNmxh7mYx3OP5SReGAjs7Ost9h2JBpZgZxK4K1Pn3gLe2Up1kMT96sRErSt
	7fV8=
X-Received: by 2002:a05:6000:15d9:b0:48d:ff0d:cfa5 with SMTP id ffacd0b85a97d-48e385b9322mr977703f8f.47.1792737583628;
        Thu, 22 Oct 2026 23:39:43 -0700 (PDT)
Received: from [192.168.1.22] (cst-prg-49-173.cust.vodafone.cz. [46.135.49.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38030c47sm3104782f8f.21.2026.10.22.23.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:39:42 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@gmail.com>
X-Google-Original-From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 23 Oct 2026 08:39:27 +0200
Subject: [PATCH v3 02/16] dt-bindings: remoteproc: k3-dsp: Allow a second
 sub-mailbox
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
Message-Id: <20261023-thames-v3-2-3ab40aa17157@tomeuvizoso.net>
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

Allow specifying a second sub-mailbox that could be used by the firmware
in addition to the first one, which is taken by remoteproc.

This is required by firmware that doesn't use rpmsg for their
communication with the Linux kernel.

Assisted-by: LLM
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

---

v3:
- Initial version
---
 .../devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml        | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
index 278b88b7f906..d6319c8e96f8 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
@@ -51,10 +51,12 @@ properties:
 
   mboxes:
     description: |
-      OMAP Mailbox specifier denoting the sub-mailbox, to be used for
-      communication with the remote processor. This property should match
-      with the sub-mailbox node used in the firmware image.
-    maxItems: 1
+      OMAP Mailbox specifiers denoting the sub-mailboxes allotted to
+      communication with the remote processor. The first is the one the
+      remoteproc core uses and should match the sub-mailbox node used in the
+      firmware image. The second is optional.
+    minItems: 1
+    maxItems: 2
 
   memory-region:
     minItems: 2

-- 
2.54.0

