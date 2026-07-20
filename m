Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3143DCD83
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 18:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784571029; cv=none; b=aZ0sAXn/MMMliQfw/Njd5EHonI4ZI1xl0YtQM0+67WLykG10hsont7OhEtaFC5o0JKmCbdXaVyr0P0F0v+Q6ce0KNFJozddwJr+IBEumDYH0s3cN+bJ4I0w/OawuiI931G2gxezrTleqEBNZsjHaVHEConrTrheRu9aQsdn/0ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784571029; c=relaxed/simple;
	bh=snfhC4eds852zpHv5TLRToaxG6MXoafF7k2mSLY3TiM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LwJqShXUBBhcJKQ0x5rc2yA+0Ee6UXTITgW/ju8jv3Ndq9jfEgb4HTyIhBneawyke2MKQu0pCluBVbQIPcclHaU4A3qlktS3gf7LiHgmfZzSR2HpbTwFtTSxpTPehaqxRsu/31fLHMZum+OmhAC+X1wQl5PQrlPE8uB49IBumY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=artiphishell.com; spf=pass smtp.mailfrom=artiphishell.com; dkim=pass (2048-bit key) header.d=artiphishell.com header.i=@artiphishell.com header.b=sQjz4NUi; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=artiphishell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=artiphishell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=artiphishell.com header.i=@artiphishell.com header.b="sQjz4NUi"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c999f162c9aso6514129a12.3
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 11:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=artiphishell.com; s=google; t=1784571028; x=1785175828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2KBNyOapYcIoxspRWji21lLCGLnG8exhGjgTzAK4W2I=;
        b=sQjz4NUiyCaYovYDJ/m0tG6urbK4nBO63vFFuSBc7aJ0YQ/2yeG0FjVjr4tQOwpg/2
         H3/GdTSjg+esPQ4BtSNe4oPbjX74yzsfut+NQFsWlvBT7ATQEsYAGM4eo4Ey0S169UKL
         YNATi1HbBFRxJa0dxFdz2HdSm8+uQNIlnN3kpfgiMC/bBAuZ3a+wNU7/ihDfUMbAAUUK
         VDSt/2rBrDWfK3RgQgu7eaYgIY6ju/uyNvlX9DelH6ayTCMkOhVpb53UNECYli3IpkVp
         aykOCwp7H2ZxCJezHguK9qnkLgPYv0rJJNuAFwlWqHxSsWFa4yKsLjOyGZkQE70tl6X4
         VTdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784571028; x=1785175828;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2KBNyOapYcIoxspRWji21lLCGLnG8exhGjgTzAK4W2I=;
        b=hgzpLfwdzm3ARGfISYG6sqAyZZsuFyKbWcJ2HaYeDsy1i2KRmNT88cd3aUDfnrk1kR
         gj/1uYkY4861N4TZkrrxhREtRVApKW8myWURRSdRhgsrLtGSB7rsaY1RaycVSHx7yiGM
         moVhPuy7JaMP308Wz2QwWmrZP64Pu3TzlIep2w50DeI2DPiDGBSLwHfmW8BYcCSAnlkI
         JKdxZPWMZQ+FdQpEDY2lT3nVwJNmUpRZdbtPjOrDMqm76glX7GcXe+IvlTVPxsQko071
         yyW29+HZuz7mvGuvkCv4xuP1wLfTUo4epRr0BJDLSa7McY9beCnJ+ptYtNC6ZdGIsCEU
         jpHQ==
X-Gm-Message-State: AOJu0Yw2eDpd37rMdjZ3yY6kY9hX14oJXPkMegqBFqCRj7cM3ibFkDJ+
	Jps2l3xXyPbOqNuVZzCQYH76+oGd703ucRcKVS+YT4bAo3yZlNtIx8UsjdWPQTQao0cs
X-Gm-Gg: AfdE7clOwKVmpMZO/UGNmc/eBbTfvYQoi7Squt4kdKrtLugMnWLAhdD/ZE2Who4kUoi
	b4Y+DG3BHaA+YXrwagaW2FlaysVyobjvShjN1tSczwV4Ns25k5GSAdKGkn79PV6zNy3Lboyo/sJ
	LBtafc+AGybWPEFKlA1PVhWudFrWgWxptVZbzKJY4RiMZac9/rgaEPJjhEBSeIRcR9Gf4MrAjNd
	TLNtEFS4tuRbtQ3V2TrYgmqJrkPL0keFZ+q2UX7JQU/Nhczc+DKHVqE61af+vEuqG9r1ArrD3B5
	ZuViXvZNILbPiMEQBGk976QtV/kitwm+7H75iw9HZaYZtygOQ5/yNjYDoF6XjO/rIoipjvsq7Df
	W50+2SbMKMjm27Cxi/E2M1sZBxy7oR0osS8XritO/aPqj7emchfoBh0wvX4jIxHBX4R32Ww==
X-Received: by 2002:a05:6a21:114c:b0:3c3:8f3d:832f with SMTP id adf61e73a8af0-3c3ad9620f6mr15883123637.49.1784571027603;
        Mon, 20 Jul 2026 11:10:27 -0700 (PDT)
Received: from nixos ([2001:579:62a8:47:a62e:8055:eada:6f4c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce29c2dcdsm35995612c88.1.2026.07.20.11.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 11:10:27 -0700 (PDT)
From: Jay Vadayath <jay@artiphishell.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jay Vadayath <jay@artiphishell.com>
Subject: [PATCH] media: dvb-usb-v2: af9015: reject invalid TS mode from EEPROM
Date: Mon, 20 Jul 2026 11:10:19 -0700
Message-ID: <20260720181021.8067-1-jay@artiphishell.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

af9015_read_config() reads a "TS mode" byte from the device EEPROM and
stores it in state->dual_mode without any validation. That value is
later used as the upper bound of a loop that indexes the fixed-size
af9013_pdata[2] and mt2060_if1[2] arrays in state, so any value greater
than 1 walks past the end of both arrays and corrupts memory.

The EEPROM contents are attacker-controlled for a hostile or emulated
USB device (raw-gadget can synthesise arbitrary control-endpoint
replies), so this is reachable from an unprivileged user with access to
/dev/raw-gadget. A device returning TS_MODE=0xFF drives dual_mode=255
and produces a slab-out-of-bounds write reported by KASAN:

  BUG: KASAN: slab-out-of-bounds in af9015_read_config+0xc5a/0xd40
  Write of size 4 at addr ffff8880052b1980 by task kworker/1:3/86
  Call Trace:
   dump_stack_lvl+0x64/0x80
   print_report+0xce/0x620
   kasan_report+0xec/0x120
   af9015_read_config+0xc5a/0xd40
   dvb_usbv2_probe+0x561/0x3900
   usb_probe_interface+0x279/0x980
   really_probe+0x1c8/0x950
   __driver_probe_device+0x1a5/0x430
   driver_probe_device+0x45/0xd0
   __device_attach_driver+0x156/0x230
   bus_for_each_drv+0x10f/0x190
   __device_attach+0x18e/0x3b0
   device_initial_probe+0x78/0xa0
   bus_probe_device+0x57/0x130
   device_add+0xe2c/0x1530

Reject TS mode values other than 0 or 1 with -EINVAL so the probe fails
cleanly instead of scribbling over slab memory.

This bug was discovered by Artiphishell's vTriage pipeline, which
generated a userspace raw-gadget reproducer that reliably triggers the
KASAN report on an unpatched kernel. The fix below was drafted with the
Claude coding assistant; a userspace reproducer is available on
request.

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Jay Vadayath <jay@artiphishell.com>

---
 drivers/media/usb/dvb-usb-v2/af9015.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

--- a/drivers/media/usb/dvb-usb-v2/af9015.c
+++ b/drivers/media/usb/dvb-usb-v2/af9015.c
@@ -403,6 +403,17 @@ static int af9015_read_config(struct dvb_usb_device *d)
 	if (ret)
 		goto error;

+	/*
+	 * TS mode selects one (0) or two (1) receivers. The value is used as
+	 * the upper bound of a loop that indexes the fixed-size af9013_pdata[2]
+	 * and mt2060_if1[2] arrays, so a corrupted/hostile EEPROM byte larger
+	 * than 1 would cause an out-of-bounds write. Reject such values.
+	 */
+	if (val > 1) {
+		dev_err(&intf->dev, "invalid ts mode %02x\n", val);
+		ret = -EINVAL;
+		goto error;
+	}
 	state->dual_mode = val;
 	dev_dbg(&intf->dev, "ts mode %02x\n", state->dual_mode);
