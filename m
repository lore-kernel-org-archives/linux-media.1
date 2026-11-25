Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795632499;
	b=Jmq9SrGoH9XEPzHxm3dAIrbEeKGDk3Y+5sXWAHxByakNVurKOMjO85oXcLcXph+9Fpeh
	 2blpY7nRqyHykTHfiHbw2M7KaYrdhUy7IUSZaazjwj2SRZF39PcSbk6CYmamian7PfGcx
	 P2B6KonLVIF8TwnO3ii+YCSGk03jSceCv5mjrUz9sndBiLFBlngLkmlQxvQstx+aWrDLX
	 7wSUmEV4cFx0YPGzy+O4rIhrazNugrA1phtS4Nk2hARwg+V3HgEHuxl9WJ2qYjHnnIgsM
	 p4ndBoomreqG+uQoQAYTh/Gd1K8lr0VyYm1NksNtKOrHVDqN1jZfBLvvJqeudBkSgaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632499;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VQW/Ymb8D+uLvIjWbZ057G5GtIuukitNqjLkdiNCMvE=;
	b=Ir7CpeH8CCneEfjyS9oDsKsqURYbdSKtoGGbkptEDRRKjpJho7wkd9HSbVm5aK8Bbkg8
	 7nCan0zHDbvhBb7zfnqvRbcupmsQe5QWZ7A4BSsi1PdzEZwJj0WK4uNMmj+HyYylvRhZq
	 ZymMe7esWcGwTbVvNxClwcuPRr2cAsJnmKvnShi/HYz/RQYskMroFcDjRGoS4UgvqQhNN
	 9F/gwr3Zr/vLkHrtfdPq6jo5qij+0Bjhfh5xWFg94jLYvrJ0BnPFoQIz2/MC/zoL5wMW5
	 zMQ6cfNex9CC/4+AKjJTg6hl62dAOZ5HPW5vWfRYVq/VYssyQ1aspwEMR+nrzn7YpSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oNnBk9yY;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9647606A31E
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 18:48:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9647606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oNnBk9yY
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4d21051042so132851766b.0
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 10:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795632497; x=1796237297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VQW/Ymb8D+uLvIjWbZ057G5GtIuukitNqjLkdiNCMvE=;
        b=oNnBk9yYeUkh5s9pJTjawpl5to9WwX7SUukW3RYanpUXdKryi5g59gdyC013GPo5KJ
         44RoaPNMbHUir0M+Zhp87TWdQHbZM4kLUCrIT/znmwvN/7W+plDblEnJSJhJVNx59B1B
         chd0czeEamhlDzqBzlSNWAgl9RqCeMqEu6tglGhHKOhF6wrzB6GX//4va9yD4oR5ChIx
         6K6UWxCkBgpDnKlJT8uwYLnlEsvzSB8A3x8XJ6Yf8H9wGHX4cfSvnWq7kPdJ2YCYmOg7
         RA0MMU1tmW9T8fguHCAFFhimvY97TLhouhiNYSJ0/UyZSjdG48daDEwMt3AoiQ+nHBGe
         C1ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795632497; x=1796237297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VQW/Ymb8D+uLvIjWbZ057G5GtIuukitNqjLkdiNCMvE=;
        b=yVLdWtdMO6q803jR6vHoAhW9dG2Gf+M7YG6gqm9sDIky2ObAoBPUDqIN40Tt+KNbnA
         Fm1sxB0Y1+/2B4VzYIYTQuE7KQ69TpV9qd9BEwheIjJU4ZymGbtyZ5ElQZoOHdEr2Cvq
         COWdkzjotsjbFlHeS5Yeg0iOQxDvIKbLfW3TWeluRZw5Wq9nqHwxFr7IHauJbI9Ws3Bz
         EfCbtjwUA+KMBKv/MdqvIoc06SEvllIqEmhsYYVfYEN3u1JqOZUa7u+wwHzeCzDA9gqY
         PeandotWPW+bf9+9VDMyUgGfWuTeug1BXlhV8EVCrFf4LZiw35zjMudHHVgSbxa2Tfop
         nUIQ==
X-Forwarded-Encrypted: i=1; AL+hErFZjhIeJeEg1De3IDeyyv6hsDPu5g4k1/C7aVIOm14RGmb15k/Zxe9mNgnFuYHyLFzfFW4nZwuJ2H9K/Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z/PfzSis5qQoQRVAD4FQuylf1qQofF1hJG3C7mED5AbliHxtev/
	p8a9twf5XnwRdF6uUOrwQ45qLPhQjQ5ev52eHRpn6u80ZnFlYT9nHsXN
X-Gm-Gg: AZFdTZctQYWDw7exYcEaLtgDdU10OJncSRlpl/pHHghwkbMAy7sEM1FLymvQwPrW8nF
	FVEjHG5wAZcTTH4ZZzkVTd3lY3lXCW5SmTfnHaCR8sWIEABKpEThgSuM/s5R9Vq/IjEchIB2y+h
	kf7KRfRSay+w6Ggv8on9KzxeqcWtrYJcopef3hdSe5fa8IkG8q+Kb7oJaHdgHCdqwggCQKrIPG9
	tqwTnkjoU85emcrMX4kbgIItLZiEcn/18DSEs3DIbw7yknBG704jP+OXQug8lpZfo3u4gF5aAcX
	FNoxXzbk/sl8Hii14rv+4dQEWEAT/4hYKezsvRUrPngumV/0GQINCXyTWya44aJQstWuzAR/RGo
	rFn1ruENk94iBbRF2BrVI4aJajiWmtk0GhA+unuZw5xMBi4e7pwKkETY6jNyckQcci4OG+EZlRt
	CiirWwHGj38FtcO1I/aYdxeyMTtSk+pGa/Wlc7UY7KB26u67iKiIe5kDteu0N/S8upxXWIyYRqN
	wSz2mVS6LpFHT0BlYBMf69k5OZMfw9D5nz7x1fG4EodVXYXbrl+lusDeWvHdHSk6yQVzTyNuMZb
	2ukL78lYBgWQ9+anyYd4ncpUgEqZ18M/agC6DEj11uAHlTDbOe23UN1kLDY=
X-Received: by 2002:a17:907:20e4:b0:c40:9b75:84af with SMTP id a640c23a62f3a-c513a5ec7cbmr1173636366b.8.1795632496938;
        Wed, 25 Nov 2026 10:48:16 -0800 (PST)
Received: from antoniarch (84-40-239-22.cgnat.inetia.pl. [84.40.239.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc73d3sm677226666b.64.2026.11.25.10.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:48:16 -0800 (PST)
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
Subject: [PATCH v4 0/3] i2c: omap: add support for DMA
Date: Wed, 25 Nov 2026 19:47:45 +0100
Message-ID: <20261125184750.57866-1-apokusinski01@gmail.com>
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
Changes since v3:
Some minor changes to fix the issues reported by sashiko:
* resize_fifo: changed type of the `size` argument from u8 to u16
* xfer_msg: fixed style of the REVISIT comment
* xfer_msg: implemented fallback to PIO if DMA transfer setup fails
* xfer_msg: disable the DMA request as the first step of the cleanup
            (instead of the last step)
* probe: introduced intermediate `dma` variable
* probe: all DMA init errors except EPROBE_DEFER are now treated the
         same way: dev_warn() + fallback to PIO

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
 drivers/i2c/busses/i2c-omap.c                 | 377 ++++++++++++++++--
 3 files changed, 370 insertions(+), 23 deletions(-)

-- 
2.56.1

