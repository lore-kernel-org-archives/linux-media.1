Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792737626;
	b=U+o8WWOsgtssfTQfZk1lsqh2pjKqxoD8YrjxMU7Wvv88qltn3p7Z0EWaIStT7i7fUue+
	 8gRnfGElV7kddLh2m3d183usf+mgETv/kVGVRSu36RJEL5UR8WK59e6dNb4HVjdBdQ29q
	 3eVF3+fsxntPHytVXCy8g8VCgX0el/zStfachs3eiN8ugRF8f+xBg/SPKEnKxkvp+31JV
	 x0tgfudPzm3CurFSSX2zEzSJSImpng1xFbijGDcNIazDi7zPYu4S3NIzz5Jy6TWZ5sTS6
	 xLYecjyfjJ6cVGcQHC+8kLzXoeCTyCbVA8WimdgOhVHQDdJoGscS5SQbpbzSJesRJJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792737626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=4UoeFHsO2E1Dm3EPGxkpKrzw1COi+rNj0JGJlw6wJw8=;
	b=afveFzicugwGVe3bgsPWX26rPXHx+/J8vWrfsBSa4EvtlOHkvGdDHvOvIyBFeyf7zEXJ
	 7w4FRY/J6noKwhYqCfFn4TiGk6LuXuYPlaACx3P9qX3aZ/v90Pt4mlAjoxyRVW99PTi/7
	 lEhflNoS/roJpRPBBQb/zMmHZklVPIqFhqw42E0C56FZ3GjZizA6q2XzWCdhOXRNwkA+b
	 y0wO9gEwXGodYDsSoXWe7FR/TQtJaA3N8H4BzMJr+9BJEOPmHnw23fm4NHMCbsGrfxjoy
	 uNrL+tBST8ZpjTbb9V5o258G4Juz5h4Elm/Q9eZHJQXkQFsZ7ETkZbL1JXvKr2q39AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nFvP+We7;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DD860A3831
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 06:40:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2DD860A3831
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nFvP+We7
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e09aa5264so255108f8f.2
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 23:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792737624; x=1793342424; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4UoeFHsO2E1Dm3EPGxkpKrzw1COi+rNj0JGJlw6wJw8=;
        b=nFvP+We7XiupT2noLK/fzdphPCutvS5h9ja53Rm7jDjlMjuga21PPGPfl3QjU/ECb7
         vJXjzgQQeHxBnTcpUCcDz9Mkzk1J149NiWxkGB4xjLLXKDnJufFFaCU+5G3nko0GgXB0
         p4oO49kFqiWVFd2j4tcut2GOmsdVA4DYdJYWI0HSTZX2HY1wTTai3F7dSrdaqCV3ZQ7R
         sxqKvZlsc7pcylJJ4PVh82aybrbqrD4CanpDTI8g79zfZb0x4tUAx9b9dY8phosjMRNf
         zP7C1OdO/tgqr/6IKB5+tnOqKqj13NexQpJdHS14JPGE4cAzw6Y1th+arl9wwks5uVeg
         Gc1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737624; x=1793342424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4UoeFHsO2E1Dm3EPGxkpKrzw1COi+rNj0JGJlw6wJw8=;
        b=DbI9q4+o65NwMMmhN/MSAAWiT7iElVdoHYCobvUSj68txoOyzZynaSkGFen4PqJ29m
         sherz3tmzoKCCNaaI1agnf/WHcPDvAufd+ayRyCL0WSO3LAEPgiNOpUTsxjxqxSh5L0J
         2GK1diXPtjE4/NLYQLWFyh2bm02fdgVSlzgkqw0qgcMbvEMlLLawCAH7gJ3HDmV5kp4y
         E89yvHe6JgpgOKpGAP2nbAuLAAU4g4lj9GDQdlsiMeG3hcLD5IMU67FJ02Noe+V+EapN
         aCaLR5BC3CJm13cuYLoLroftgAVAG3UFQvTE8prpYzpsnESbXkra+WOphVu4kZ92eLSk
         NVBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxtM0LBVIhzQMm+oJHUS66qi+yrIlp/vZ2v+Y1HP/w2AKOxGjy6blJ0exNum7Ywh8p560NfRNX/mo5LEg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKPmfU27r2i3nes7oYyzHNi9jtzS0GNz0vG0+sGuPvELinNKXcv
	/UBsntwQLvsF74KjOoGoYdYVapau5kmDsGBZi/SDMK5OxtSPbmfFtJVOzEGfpma5wjA=
X-Gm-Gg: AYBFou2qTFsCE6eXuaJdrRZrIAL2lU7/sgd7A9TdEteHNnuU5yibMwRniN9F5yANNBa
	Z/KXn/EAYK0ClluDmOrXA93QpLvqtUN2oHV6zEZGD5f8/ITIaKRuj4+6GyFNKIjVoDab/SQEUmA
	yTr7l+Ubs4MWRSA5a3qfTIH0xiSBx/Omur0u96ePIkDv8a7Yom/N9ZGGGyVVA8VMRnEHBj1rDDO
	KlR5Bgdx7+XukBhsPvMEbnmC25DFSEMtMHXQ50ylkOti9kL7H8IiwHFE5UrRncKR2puFELs2evX
	USXhwDcF5fglXq1hP/CjbKfkNE66HMdM3Z0tjy9fQZOaDN0M+t/n4+mfAEjvJ6h80zbw+r4nVke
	Mx6/gm2PdypXxqBx+TwkmlnQhFKYeQOFd6JGC3jPF+zi3BJJA5u/plxPIFJqbMstJQs+dmBHrbC
	muVw7UX8KnCOJuJgS7Xlw2Jyzb5vYQJvnUclwGHZWKtPqJ2RK/rBpHYtPc4Hr7TZ0WFS03WfTA0
	YtKl1NwIpt3vD/FtNGlkm1cp9Z1lZqElK9GwjQEqT96J73ef10JE/Hy9rBO53nOa/GaNwkFGDtR
	0FHYn+Oy/gQNk37DZZa7KjDoDaEulK8t1PVc40zWow0Xu8nkRBjwjGjGqzM6P0VSjVBIxAzYSYh
	ItDz51weeHFGi+3bqXr0kllMJ
X-Received: by 2002:a05:6000:4910:b0:48e:1c2:55a1 with SMTP id ffacd0b85a97d-48e385c0867mr1563144f8f.52.1792737623908;
        Thu, 22 Oct 2026 23:40:23 -0700 (PDT)
Received: from [192.168.1.22] (cst-prg-49-173.cust.vodafone.cz. [46.135.49.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38030c47sm3104782f8f.21.2026.10.22.23.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:40:23 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@gmail.com>
X-Google-Original-From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 23 Oct 2026 08:39:40 +0200
Subject: [PATCH v3 15/16] arm64: dts: ti: k3-j722s: Add second submailbox
 to the C7x cores
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
Message-Id: <20261023-thames-v3-15-3ab40aa17157@tomeuvizoso.net>
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

For firmware that uses something other than RPMsg for communication with
the Linux kernel.

Assisted-by: LLM
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
index a59c3648d805..611220ff2655 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
@@ -86,6 +86,11 @@ mbox_c7x_0: mbox-c7x-0 {
 		ti,mbox-rx = <0 0 0>;
 		ti,mbox-tx = <1 0 0>;
 	};
+
+	mbox_c7x_0_client: mbox-c7x-0-client {
+		ti,mbox-rx = <3 0 0>;
+		ti,mbox-tx = <2 0 0>;
+	};
 };
 
 &mailbox0_cluster3 {
@@ -100,6 +105,11 @@ mbox_c7x_1: mbox-c7x-1 {
 		ti,mbox-rx = <2 0 0>;
 		ti,mbox-tx = <3 0 0>;
 	};
+
+	mbox_c7x_1_client: mbox-c7x-1-client {
+		ti,mbox-rx = <5 0 0>;
+		ti,mbox-tx = <4 0 0>;
+	};
 };
 
 /* Timers are used by Remoteproc firmware */
@@ -152,14 +162,16 @@ &main_r5fss0_core0 {
 };
 
 &c7x_0 {
-	mboxes = <&mailbox0_cluster2 &mbox_c7x_0>;
+	mboxes = <&mailbox0_cluster2 &mbox_c7x_0>,
+		 <&mailbox0_cluster2 &mbox_c7x_0_client>;
 	memory-region = <&c7x_0_dma_memory_region>,
 			<&c7x_0_memory_region>;
 	status = "okay";
 };
 
 &c7x_1 {
-	mboxes = <&mailbox0_cluster3 &mbox_c7x_1>;
+	mboxes = <&mailbox0_cluster3 &mbox_c7x_1>,
+		 <&mailbox0_cluster3 &mbox_c7x_1_client>;
 	memory-region = <&c7x_1_dma_memory_region>,
 			<&c7x_1_memory_region>;
 	status = "okay";

-- 
2.54.0

