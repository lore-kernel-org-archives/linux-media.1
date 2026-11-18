Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795035171;
	b=UKZBQDAJotmtEBK2hk2Wo6YbTOKkMInIbTZUJ0gZEb37iN0ciQvRTz2EnoXE75+HYons
	 HfW8b4tW5qNo2gPuOae2tcLGxv1F5hN4U8ymuwezIee4JFDAvwyK+sccIWUInPVsPLOe5
	 wN11wU9+kYuUT8H+jQY6VWYR0De++TZJdAl9tUzB4y8AzcqlOtjezlPw5/ZFA/M+WWYRA
	 cx4hS/zpE9O31Uk1GR1BtxFNHn7QN4DqbxeL6+9ybp/697xm6gcAf5itW75jg+gHEzYGq
	 oXlUWVZ+6MSLOyXqPdGQW+J4A0VMcahY0OtlewYniuCywvY1QHs2gxv5iimLbupCGlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=a5MhG98OmxdXqTOc5Xluyx99XKwhYZJ2KKliQ9c2OkM=;
	b=GxAkLLT4qb9cG5Do+WqW+CIa8mtXbVX9uBoJ5wJoG5kqpCtzMfuPWt6EK58ESw0LEpUK
	 nnnftGesfFTyrh41pIluGrQLyiYMduGAzn1xX9swHyxGPRT7+2XQmOam1w+9X3zxF/QF9
	 Y9iPTSCJ+KVbMG8MqoGwd5VHFvliy6+3WCbqnuUtMRMRAIzjbSkN4/4oLQdy1sXkK6Ttj
	 DrL0rcWl6S2yZimmwSI+aJIoTohQxSHJyp6Dzv7H8r6EaAxD3tp+ewD6TJbyWezo3+NND
	 ly3tRNAOgwZUE6xRdD6cbismCP6srD/5Px2XUniN4JcoxaS+aKfHE0VyfSDevGUryNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jlxGHW+k;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B4C606A320
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 20:52:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98B4C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jlxGHW+k
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c50cc7540b7so214347166b.0
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 12:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795035169; x=1795639969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a5MhG98OmxdXqTOc5Xluyx99XKwhYZJ2KKliQ9c2OkM=;
        b=jlxGHW+kRyHFaEMpeXR4BNALXPsNplbIhzII6rNliHUbcX6NmABOnQ8XTqgppKQz/0
         jnpx4OD9SPT6Kr4gK+6e7zltezYlXyxXT2NfU5Odo31hxeQDHI1/oRoHWTSOtpxIboeQ
         FH3N84C6KLj2Igb3KbWBC2z49+iRGJvp0vB6BJ0/VWt5XCdgR97RAz5PXJN+PoywAORY
         xte54o9ByrMsQ2uilazjjngyPJdALuFEoOaJiHVqDv/lnXYuJF66BDqjNusCCR1GMXJe
         eOgd9Vlih01Qr/4o+siFo0v2a4oF4APKzmmYHrhLbqFeAgDBI043ZSqUkY6x4nruS+yR
         J75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795035169; x=1795639969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a5MhG98OmxdXqTOc5Xluyx99XKwhYZJ2KKliQ9c2OkM=;
        b=vVqMmBArD/AjEi7HV48BM//gm/E9yD8635reP5Yd5O43TaZ5da1c1GzPnr7SrpVF2M
         Q3voGyaXrq7NGeroJvyQvnI89V9giIFc0AeM9KgkUU/rCoEMm7xNblPUNkOUlPL4hZgq
         g3isuJoJlrGpb5SFga9tdMcOZJfIGFvWn9iVfw/rH+N7/GrQJcSgxQSmcOpRWLXyQNil
         Bl3A+VmMqOk18y8nqnammLKGursSGoE9he+85NT3FFqCxA9N0ZTQrd7JvVMH8WaQKpLl
         Lj/eoKFVr86DI56B9w49djrXXv2W9YjHkQCMBp1OpklA+TLZIM/jUAk0SMwk+RJaCrxW
         lZCw==
X-Forwarded-Encrypted: i=1; AL+hErHnx1xvgnUMrCbGbzxDTWAZWMEVBPVM63zdOAQKXTWjW8Dg2lZLEw/1ITRXT9+d3kuTxf+17Tz22XyCRw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/ovZY6WJDMZ9nJmKmwktaPBcohZ9NDXqdT00mNLqFMlpJ0GkRW
	RweQHjUgQ6nRH8kbnzTQV4AWwZIYqMPbAbRQ78GOzbj5LP9TTHLMQ3eF
X-Gm-Gg: AYBFou0cwts8ZBRNRpoyBqwD0a8k+3BgDkxAxFtkB5BLTMu1AY+wKbsSOB54CR9i7C3
	LgBbllHcXqqHZ9VRy+OWSM3sGoJjDTyi8OofCJgxaOYwd/FYnMXH1RR2eKRA30JV3vP4LU+s5j5
	tdm7YJ1gibTtWueRr8Tmi7z+8rwVI0h9o4oe35JVzk805vouBQitIhu6LGcDoAiwd3xQVIF1pMU
	/8pR4FnqGMDWmMOS3nHwg44AMnJqrYaZ8Tw32e5sfcOAxelzNzSmj7FXxVAp3v1XnTprnpYeU+B
	o04W6mpNp+XbOHn/RTNFo6cHArmlxDTK1t7xfpqQYLPgyyVXsOex5ZGlVsKvR3Dd8rx/8NxU7tq
	PFns6f3PnkbZhQ6KoTAZ1eeZX78EadTjArYygo1pZNRtDBfT6XM3Nuo5NFSdQ287y6y66zWpMP5
	OFCScJUCBgi/RmyatICt4tQiyklJCyU5uA/DA3yC0uEbrA4lTt+2qa3lhePiTI1yeCV+M7lCk+M
	xxM8W98RM8WxpDu/cPCLUaHAeatpPcIDeVTFbQ+veTWokUJMee7dxvsuu0nVfB9/WrgxlLe/ynr
	ipEwrejsIBxCx/5A5ifXJqOX+7VeRrc39r7jioW7FnYTeJGjahoHZBhHDHPlyZRrj1emXa7hgbd
	zmSsIigw=
X-Received: by 2002:a17:907:1ca6:b0:c50:ac4e:3770 with SMTP id a640c23a62f3a-c510e516a2dmr391250066b.34.1795035168876;
        Wed, 18 Nov 2026 12:52:48 -0800 (PST)
Received: from antoniarch (84-40-238-230.cgnat.inetia.pl. [84.40.238.230])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5123421612sm35303166b.41.2026.11.18.12.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:52:48 -0800 (PST)
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
Subject: [PATCH v2 0/4] i2c: omap: add support for DMA
Date: Wed, 18 Nov 2026 21:52:03 +0100
Message-ID: <20261118205213.88778-1-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Hello,
This patchset introduces support for the TX & RX DMA transfers in the
am335x/omap I2C controller. I tested this implementation on AM335x 
(Beaglebone Black) and things seem to work fine.
Also, I noticed some unused arguments in the receive/transmit_data()
functions, so I added a small cleanup patch.

Kind regards,
Antoni Pokusinski
---
Changes since v1:
* new patch "i2c: omap: remove unused is_rdr and is_xdr ..."
* probe: added `goto err_dma_free` instead of `return`
         in the case of failed `i2c_add_numbered_adapter()`
* changes in XRDY/RRDY, XDR/RDR interrupts management:
  - init: do not enable the above-mentioned intrerupts
  - xfer_msg: enable the interrupts before any non-DMA transfer
  - xfer_msg: disable the interrupts after any non-DMA transfer
* xfer_msg: added checks on `omap->cmd_err` to catch
            NACK or AL error occured during DMA transfers
* general: moved scheme-related macros to the top of the file

Antoni Pokusinski (4):
  dt-bindings: i2c: ti,omap4-i2c: Add DMA properties
  ARM: dts: am33xx-l4: Add missing DMAs for I2C controllers
  i2c: omap: remove unused is_rdr and is_xdr function arguments
  i2c: omap: add DMA support

 .../devicetree/bindings/i2c/ti,omap4-i2c.yaml |  12 +
 arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi      |   4 +
 drivers/i2c/busses/i2c-omap.c                 | 363 ++++++++++++++++--
 3 files changed, 350 insertions(+), 29 deletions(-)

-- 
2.56.1

