Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201189;
	b=yVCtBVEuenugbVKphv8IdSch9tUcfI90CTp069bZvIGaP1Kigo+HiHFBpnRM6hoX5zwo
	 Uk31lbHWg5PIY5w5Ixu/0F/PKR9jATSXSueXFuDw2CM6fGZZg14xUIDrJl5x82VtNYOMX
	 Bj7T0f+2S3ldhJOekbpz/CrmxYWkf9p0MOtbrcC/xudKdbHx4pXyyyYzn7RujhNN8zAKD
	 CwhkBJY8VsDkIkotfqMVlPWDZFpR0/hHaAttUqGxssx/QXo+Vz8q5EmItWHXCFfQDHo1U
	 eHMF4nua9J4GuM2qK+X9nez2wER30Luyk9pqJ1KeBL7yEolZITfPMlsVCSQ9SlaICUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=y+xG+koXTgpyKRztQQCKLUQgqoHofBaalUCYpzlKwFk=;
	b=SAEX+riXVM9saHHGL9yMfyZ+xtR9oWwvnaM6UY8SYq2yzQApxOcF5WM38+daYiMN8LOM
	 w7XUG2TmWhRESw+4yQWG01wW8DN+ix2QMx1zU8QWwtkECnN7N12RmK14KiRJszWZ06eNe
	 8d0QTchY6aJPg/z9G5VCTXAUyWx1IxdUuayjcTp77J0Az4AzGJUIrjwLsWATqdZ3Ly3zj
	 WwPWnOPhOSg5RoT+6Q0U/um6GeBnjK65pA9NTDRgncNee61tCvynt+l7tcDeitPpYm2vh
	 ks/F4U6mkbEShnCeU0FUYakmTem5IeMUqR1br5FDD7FrCXJyCWDzq/XVQRB+axvoRrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ZwJ3I/gf";
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0995D60A262F
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 18:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0995D60A262F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZwJ3I/gf
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c40e30c26a4so506207266b.0
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 10:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795201186; x=1795805986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y+xG+koXTgpyKRztQQCKLUQgqoHofBaalUCYpzlKwFk=;
        b=ZwJ3I/gfafwZiWA5aZDcO+609t3J7/x+kBEjaZHwXFdrLDUlZmBT8ZKqFYEwEX7Ob8
         ykNW7FobzosPR+C6Sz0Fdw5qJiQq/GIeyyFcKZxvMxXR+Mka6M74WbVWT45oTZIUatIV
         8qtng2vGdvk7OiLUYXL9BKQD8WEfaxScKpXsHREyR1kMEYzXCPF0d4vlUq426eD23JQO
         UtO4CDbwI/qfXZaOZoj9CxO3BVYjizp3+kddEc0R8JHtenCT8+yKt+elCXEWaNirbrEE
         03HYg0t7D/tzdeAPq1IF2ALgqzNFdFwBod+xSdSg0rTQRrJPksXrmsInAitjjot9hPYn
         cC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201186; x=1795805986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y+xG+koXTgpyKRztQQCKLUQgqoHofBaalUCYpzlKwFk=;
        b=Hqi7WgXibVYOGCX/gdaoQINF4YztqwjZCCCN2uGcq/X9TQj5/DX8x/4Ze8xBUPDvkq
         lHpAqNc3WD5m5W/h0b0Jzze619V3YHNAbuVZm0Dkc3pl5JB3W3xZhDoW1EOhciBwOUOp
         PgBt4B74zq1CH45uudub+JPLwgfFzANO3uSKBRH216bWktcK2Ness7YCQr5fNLR+ggEI
         vPgGyyzve4W4b7PX06x1fWfUdJ1GIG8qOri8mbCPcx3QbqaJoFiDMRMiDrHWXfebN14z
         nhAR1p4m0oOfupYF44300vR50gJLUiK/Zmsf4Z8FWJKsBsYYPdp6tIUjgQKydis1OJfg
         sFgA==
X-Forwarded-Encrypted: i=1; AL+hErFAKYr3MXVLZJtz38xWC5tEtyGztWA8g35J3yp14ZVYX1kCgJmh08j4CslkASMQUgloL3REmlvMG2U/MQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Za//gBVDMCK21yoDQk1thgT3GcxDoaSvSE+3z2CL9JYKiYkDG
	IN7uVv+vz41IfDhMAdZw+4atC2F9YHeTUFIrSw+adnm4MrtQmVM68hbN
X-Gm-Gg: AYBFou2ny62LB7QYT3Aek8HralZNT20k525vQQCLjMtIs5wJaHbOzn4WnB53YruZkCO
	2dVSmPwc+7RWilvCjxWo1EMCDu7fHcnGl+bNSFPPVk6Udu88G40KanAT0BybE+4FhzJui0pI4AU
	xOp/lIyPoYwnS1W8jYUeS2EKsplQCVt1QxFw6zYOtJtKs/fvw6R6fwegT/bIBxfyIiPCDrmEO7A
	3ZNCk8KAxkBLQhHmhJij0k/2oAb4dZ3XTLXeux34+KiZyFVdVjcMoRpkimXsSZZi6mgQxcjtuB/
	zYmaH1NEKWEDrgvjJeGcSiH4ML1ZOsPmMR+V04zRZEM918GLd3J1PjzBKTk8hn9bN6RdEoQk5jZ
	zR+P5EH63luNc4ZwCjKakwocSE5sK408CnkiDvB40YzzVLI6tCMJ98diJVaqwVcibAHXRAI1yCM
	VYb3VsF7vO88HFnAMBC8Hrb/PTAlGABQ5gDZ4LKzWBsdKtoghNPEdXPY8EEAYVijhx68AH+3MaJ
	r2h1sBzmEOJnCgtk/zGhDfeIezgfjnM3qdBTtU4aNMyFmlp1alnpe96UKWllYEoTpnLYET0Hi9j
	MwNrjSazlab2dlM4ACUtyPSwthJCK8L9jnkRlK1DdBc3V+35syK0gal/SHcKOWM=
X-Received: by 2002:a17:907:2d23:b0:c40:2439:4d9a with SMTP id a640c23a62f3a-c51319c24fcmr565365066b.28.1795201186217;
        Fri, 20 Nov 2026 10:59:46 -0800 (PST)
Received: from antoniarch (84-40-238-230.cgnat.inetia.pl. [84.40.238.230])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b02de1dsm125205266b.85.2026.11.20.10.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:59:45 -0800 (PST)
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
Subject: [PATCH v3 0/3] i2c: omap: add support for DMA
Date: Fri, 20 Nov 2026 19:59:10 +0100
Message-ID: <20261120185915.150228-1-apokusinski01@gmail.com>
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

Kind regards,
Antoni Pokusinski

---
Changes since v2:
* dropped patch "i2c: omap: remove unused is_rdr and is_xdr function arguments"
* added `omap_i2c_disable/enable_pio_irqs()` helper functions
* probe: added `if (omap->dma)` before the DMA free
* xfer_data: signal DMA completion in the case of NACK interrupt
* complete_cmd: signal DMA completion in the case of bus error (e.g. AL)
* xfer_msg: removed incorrect checks `if (!omap->cmd_err)`
* xfer_msg: added handling of DMA/IRQ cleanup in the `b_hw && stop` path

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

Antoni Pokusinski (3):
  dt-bindings: i2c: ti,omap4-i2c: Add DMA properties
  ARM: dts: am33xx-l4: Add missing DMAs for I2C controllers
  i2c: omap: add DMA support

 .../devicetree/bindings/i2c/ti,omap4-i2c.yaml |  12 +
 arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi      |   4 +
 drivers/i2c/busses/i2c-omap.c                 | 373 +++++++++++++++++-
 3 files changed, 368 insertions(+), 21 deletions(-)

-- 
2.56.1

