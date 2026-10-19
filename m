Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792447000;
	b=UdxAY6rblLm3nFU6a5pdQFyKHipkdrz1rgGCCuMMp853efMmhpwaBhpZ7mlccw9P1z0J
	 f2kgYY77TXCj0yOPkB1x1y86vN4XQ1SSNZ9Dl7oL02ZeqT8GU9P0xZU7WKsPUA/BtriK1
	 7OKNvBl4wnWuxy2rQ5BvvZAEGnbY9JVvp/u7oTu1PsoGAzMp0pahz7t+7UdgOeVjuxc8a
	 QhmVztx0QxbCGAMjB2XEDAxCVrrCdWEy47Cbcf5xQ76m0zdHgu/UJdEnKvY/8fiqahc85
	 tZZr4HUDpYvoHDwt1bi2d/OOAXFjND08qhUvHtZtpwJ9wCji4GXDtMC7UtXYYr0/ZeA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792447000;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:MIME-Version:In-Reply-To:References:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=iy6FFFbMo4zXlK5qylbVO8N+6UI0KHzjfQawpde353Y=;
	b=wsokrNiIxRshi7lAhUV8CvWIkTYVQkzp1dmrZKrL9ELiKjXkR7+rOrDTe9jDp21jTmim
	 cu5b+hT1CIZwQizZnuCOCJth2uUwKo7OOI8UpbktxizjFztfZFCvsrxmJSqBeZeXMzsr7
	 7w1BuWVAvfN2Fdg4gXZn/+3gQZ1Yu7S94jTq+t8Yvo2j/ZtxfePqiWiBH+QQejbKOfLUb
	 rxrXc5oKRp4m8dpdY2cFq5ccOpgcPGjpN6bKau9dZLCtM5utspBV8JfZS+a2jxdX+GmAN
	 tHcHs1DtWG5cRgxpTEvObCLVLJtaCZgCH0KnmSS/NVBVhIyYBh2Ow7D/6zUFy2axtQg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=carboniste.com;
	spf=pass smtp.mailfrom=carboniste.com;
	dkim=pass header.d=carboniste.com header.i=@carboniste.com header.a=rsa-sha256 header.s=google header.b=j0W3Ljly;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E32606A32A
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 21:56:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13E32606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=carboniste.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=carboniste.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=carboniste.com header.i=@carboniste.com header.a=rsa-sha256 header.s=google header.b=j0W3Ljly
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-66fc7e0ab25so352146d50.0
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 14:56:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792446999; cv=none;
        d=google.com; s=arc-20260327;
        b=sEoF4eNBlGsMQ6aqee+DbzHbiDj6wUUvcZAN7TqFNxll+7uYQHbCS1bYbW77D31Svd
         pqk6S//4k8JidRf5MGpOADNYh/RL2GR94d3cdXcnybYLsqj4y5R1DkqgABOrnqfZQQCW
         pqA0ohv0OQ4SOgl7D75sV39nPQduH7S/VyVDpZkoidpTGjRnG73VyE6whY3ft9yTSygY
         RKivgKLFEXLsIAboybp6nksPQ/SPdOhfYBtf3sF9USOQozpPJLAY5mhMO5kRNcm5UbLm
         RIPMNNeeQ9y5RA9ZzGQwl0vu5c3e3cUaaKRJF6jwTsygN598GxIi7IijJQgQjjg4cfxf
         GPpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:mime-version
         :from:dkim-signature;
        bh=iy6FFFbMo4zXlK5qylbVO8N+6UI0KHzjfQawpde353Y=;
        fh=jM2FKFmSuLeKQPjuc/PGzFaz9yKE6NY/dH5TFNUG9jk=;
        b=RBcl4oN+KYX2Ww6QxNiEUKsDiRlNQ52BrGqTgKGjNKo5CQHoBuLDMfOzEmIJui2mlA
         +JusZgjAqmejebK4JWMHqMozCo9K07bXVb+ECGTg+hTHp/bNZrbXDk59tik5ePwbC5Tz
         DIpCekhKv/i8wIQID80nP9Huw3CWkLRItvfubfs+X4zbulsSeC6xOYKnBHAndr6MOFHu
         XKt1WEafq7HECxpeDEIW8baFU17BKKVkOBdGOhmN6znJ46w2HU5QHmWyhC0P7TFkpI7b
         qeyKV/HbvvY4OKEqXGDplxfpWQZUqLxOZTCGu/kafMV+T4umyjfLY33fwJOPSCne03qO
         5Okg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=carboniste.com; s=google; t=1792446999; x=1793051799; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iy6FFFbMo4zXlK5qylbVO8N+6UI0KHzjfQawpde353Y=;
        b=j0W3LjlyKLqE+vOP81E1g2zt2kiaiImKkPo+yyE/W++ykdHspgJKCGrtCC4up8BmqG
         7opm7ELP/oPtBh29Wa/6gPKqPMqc7PdKVjApIrBtdghtjG17cAV9HYqQ7E4pR0DjoggB
         0WS+1chPGSVTFUlFLVwXKsD+4ATBFsCZCgDbcM0dxi2L6a/GB0jnUy84w9a8mDuAlhTx
         9ktqOGuyE7Luk34VTk6QxFS23q6aN9Aur+tJanVqUwHoTwnaQdGt18gr4FYLF1vcE8oL
         GFuF8HQxLxWYcUQJiRj6UXOAwxngmegHb7n41OLCjvviwfqrAVXO2tQYdljET7vfb3K+
         t6tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792446999; x=1793051799;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iy6FFFbMo4zXlK5qylbVO8N+6UI0KHzjfQawpde353Y=;
        b=GYUnrxZsCGCcOrawfqj++32Tp5P1FvoYoi6S1Pk+VHyCiGajZ42LWkMa1CITEWO7JU
         M1TrE4UgNzK9r+R5JZnWhPn7KMHa5sHgbfmZcT7d5DgQ8/bf5ghF2AOgqbQxn7tKhGlT
         r5M/laaV4iieo3I7nSGrKWLz9GWhT0w3111vFBvh0ATUQPgzWJIIMY0ZFnaBcnNQK0MU
         9jFWvjzROL6BDpfydZkIFeF6QhZCsMcKsjuTMeRkmcNWXUG/PSv8hhlyoqfL+OnVo31C
         vYpfTHvI7V4g1d+rvvIG42jlpZCTBhifvr0+3yW+Xlj7DL1Ke7MMFDGB2CRbRU4Z0q+n
         Cc3A==
X-Forwarded-Encrypted: i=1; AKwUvBzedUjYEZqBVof4ZxR3voN0JJM3MddCV8iua13Nl5yutX4/5wXqQ3XTxNTOEROphc/LpannPqwT5V1jTQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJONlwTikjsCrAWd+Gd/nWmvDkV4MtwchHJHcfkVJk/T9GvGX6D
	4NvkKEVo/0GrDeVarSPUzlEyw+xBu2cbLJdJGce9QKTl58EpHllsx0E0Fo32rRRbd6CMrQ3AEVX
	NfsbEEm5Mc/AGn/O4rqFryJb9/2ByOXUtZinLZ/B5Lmo=
X-Gm-Gg: AYBFou2bGAfM7Y9iLhpGecQgkarffA6zxdPj58ORSzFeEbE8HgFL7Ele6jJuTbMZ1DL
	C1aY6sBBUF8YA1T4FlpxOL3IU9YAmgl+KDlL2FsTLaWXYOzq158xVTIhO6PCOMDpYAeQBD1bDts
	vEo6T6vkm9CpZKjhG6LqbOd8eoTHs9GrDubVcI/N9Ixq9jnpHwvu6L9YBvGn1ywmJqT/ubqIP6W
	JeZ2fY5wrmKuDQA3GQD88iW/2Xl2O6PhKpiPrjQi/+a9Bj38XZc6T1CQ2dTpbOrclgDXdc0RsN0
	QBGohwdmGJFjPa+TVZpf2yUmlpbCBcHAI77dL5JXbvaC209Rtgq8l/FfZDkEBIlNeDg=
X-Received: by 2002:a05:690c:6303:b0:871:3e81:955f with SMTP id
 00721157ae682-8b0f2055da7mr52311397b3.1.1792446999140; Mon, 19 Oct 2026
 14:56:39 -0700 (PDT)
Received: from 658150881093 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Oct 2026 16:56:38 -0500
Received: from 658150881093 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Oct 2026 16:56:38 -0500
From: Dan Person <it@carboniste.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <CABZx5Lu3ShYsPtEsKFfL+Ch6G6KywH9eZ8e=YDYgJqu-k33kJw@mail.gmail.com>
References: <CABZx5Lu3ShYsPtEsKFfL+Ch6G6KywH9eZ8e=YDYgJqu-k33kJw@mail.gmail.com>
Date: Mon, 19 Oct 2026 16:56:38 -0500
X-Gm-Features: AclHuK98tWdLxJ5Ptsrl5ocriRgzu6Qah0653CJkL69oCt_cti_0kmtGhHOWoFQ
Message-ID: <CABZx5LvZ29kUp2OEhLebLS5DRELRsh1LXH5-YDMEkvsG4c06mA@mail.gmail.com>
Subject: [PATCH 1/2] media: ipu6: isys: use the port B 2-lane PHY settings for
 1-lane sensors
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@intel.com>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On the Lenovo ThinkPad X1 Carbon Gen 11 (Raptor Lake, IPU6EP) the IR
camera, an OmniVision OV9234 (ACPI OVTI9234), is a single-lane CSI-2
sensor on driver port 0, which ipu6_isys_driver_port_to_phy_port() maps
to MCD PHY port B. With x1_port1_config_regs the receiver accepts the
stream - firmware open/start are acknowledged, the PHY reports ready and
the CSI-2 error status stays clear - but no frame is ever written and
every capture ends in a buffer timeout and "stream stop time out".

The Windows IPU6 driver for this machine embeds the same MCD PHY register
tables. It has no 1-lane table for port B; a 1-lane sensor there is
programmed with the 2-lane port B set (PPI 3/4/5). The Linux 1-lane port B
table also writes 0x5d060100 to register 0xaa8, a value that appears in
no Windows table and breaks the pattern of every other data-lane entry.

Use x2_port1_config_regs for 1-lane sensors on port B and drop the
now-unused x1_port1_config_regs. With this change the OV9234 streams
Y10 644x364 at 30 fps, alongside the 2-lane OV2740 on the other port.

Tested on Linux 6.14 and 7.0 with an out-of-tree OV9234 driver.

Signed-off-by: Dan Person <it@carboniste.com>
---
 .../media/pci/intel/ipu6/ipu6-isys-mcd-phy.c  | 31 ++++---------------
 1 file changed, 6 insertions(+), 25 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-mcd-phy.c
b/drivers/media/pci/intel/ipu6/ipu6-isys-mcd-phy.c
index 71aa500..cae4dc7 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-mcd-phy.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-mcd-phy.c
@@ -150,30 +150,6 @@ static const struct phy_reg x1_port0_config_regs[] = {
 	{0x00000000, 0x00000000}
 };

-static const struct phy_reg x1_port1_config_regs[] = {
-	{0x00000c94, 0xc80060fa},
-	{0x00000c80, 0xcf47abea},
-	{0x00000c90, 0x10a0840b},
-	{0x00000ca8, 0xdf04010a},
-	{0x00000d00, 0x57050060},
-	{0x00000d10, 0x0030001c},
-	{0x00000d38, 0x5f004444},
-	{0x00000d3c, 0x78464204},
-	{0x00000d48, 0x7821f940},
-	{0x00000d4c, 0xb2000433},
-	{0x00000a94, 0xc91030fa},
-	{0x00000a80, 0x5a166ed0},
-	{0x00000a90, 0x10a0540b},
-	{0x00000aa8, 0x5d060100},
-	{0x00000b00, 0xef053460},
-	{0x00000b10, 0xa030101c},
-	{0x00000b38, 0xdf808444},
-	{0x00000b3c, 0xc8422204},
-	{0x00000b40, 0x0180088c},
-	{0x00000b74, 0x00000000},
-	{0x00000000, 0x00000000}
-};
-
 static const struct phy_reg x1_port2_config_regs[] = {
 	{0x00001294, 0x28f000fa},
 	{0x00001280, 0x08130cea},
@@ -475,7 +451,12 @@ static const struct phy_reg x4_port3_config_regs[] = {

 static const struct phy_reg *x1_config_regs[4] = {
 	x1_port0_config_regs,
-	x1_port1_config_regs,
+	/*
+	 * A 1-lane sensor on PHY port B does not stream with a dedicated
+	 * 1-lane table; program it with the 2-lane port B set, as the
+	 * Windows driver does.
+	 */
+	x2_port1_config_regs,
 	x1_port2_config_regs,
 	x1_port3_config_regs
 };
-- 
2.53.0
