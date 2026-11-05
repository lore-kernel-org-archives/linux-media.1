Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793911269;
	b=wX1/I/6WnKfVU+RmT9zrx6ZurA7KbkvZyyZHOjk+hNq6gINa8In1tuqYlW0sN1oHGzew
	 NNf9YWrGhpIpxLd5MRCcE9fVz/HAmnX5jBGklqwLK06Q/D4Lpnu9Ogf64Awdt4hEz7daq
	 84M6em5i/Z5y36Bkmj2E4W1UM4U99wUZdKXtyWwe9LGqoVWeF7c7e4vI9eaFgFU4G7yEm
	 XiPsfJ5GPlOgKSuEnLv/PRDvgOS4QE5PPO3Tk8U1uLoeGkiwX319X5VD6xpU3tdRd5mQh
	 H+5b2fuU+/yWMcGd0ROqZqNewCB1tJsX0gg9h+5bRbu7U6MkKuy/0sTvU94PZFgvrhw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911269;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Content-Type;
	bh=Fjvd7G1M4kYC5N1HFg2u1AmIMrhzwo399bxrYq5ey1Q=;
	b=kMnFn1tODSsCJu6ELfhml8nqBbeQuM+QIzJALKB9hp7mcYGgHi8O1k0cqWtnrFAMGmJ9
	 MCqDu8w9mV+JtylcVDncjw9FYm1PFtnZbyV/EUmkLJza2sjGj7h795n0pgpKU3Vej/Bar
	 9EiD5uo4qh08TB8Uh4/M9K7CVVOQohy84OJldFPP+FqPQfo8GrL5ramYTLG+Dyz2l7q7Q
	 KJqsW7UlQa0WTxRydry8vOBH0buvLFeQrbFWgyg9/EoFtRjU2N9JxTElST+egzQ+gGhSv
	 YuSXSLF4TQpc0tyThn0A1mivJiiJ4lk7kx8wKzx5VpKSa0llK7fcV8JLeJZ2R5LGRqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sRy4tFAS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4BF606A31B
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 20:41:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB4BF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sRy4tFAS
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36cad25b8b0so3472105eec.1
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 12:41:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793911268; cv=none;
        d=google.com; s=arc-20260327;
        b=bt92iUYX+Vw94GoUx6s+qfVsh/tgFWXv7S3u4mVJCewmRS2Ysa5e/fyHGrlS6LlUGV
         AIZezgmgiAKoUNJMnqxPb5I0FqCHlIhS+NPjH/PAb8Hn+a0UestGachnU8bCZcI8DZX7
         +i80N65kZCiWTUfA16NcjUiU1IgICpyFf7dBqSjI1AEfbkREaw9PorxO6Xr8T9Pjd7Tm
         KDe5nM7qoYhgv46/U8B3kEkPoczk51mK89jmcEBRqZs8g413bn09IHQegku+IEvyUbuC
         uO+ZgTZHhZ5LD0Nm65STLNEszT8d+onw5uetrStbdbwt50933dtLSRKqwBa2PJ3Qm+GC
         anoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Fjvd7G1M4kYC5N1HFg2u1AmIMrhzwo399bxrYq5ey1Q=;
        fh=RpYxnnRW5A5FvuL86z7f7YWfE0tvaTrs4Vecbev4fLA=;
        b=oyKyqaA83OYBReSnwjpN/flUxD/q4+iXmh4HStismHhpBxm49EOjvtL5nA/7GtD5HM
         tlsOGrmX+ip8TqKtKfCGj+CVW0gm2uZz/84/UlkP73TZ0BDZ8QE56Mo0TS2xE6E5JenZ
         62L8CkRN6U+H6DwvS5MSZ0E5hQqMuSZhPHqjfDrBlmh7AgJFQtgq2phmTdlRyqkkBpsl
         XGQqkO99Tv8k26LWZTidOJgMjGzH97lMw3nSh6wx4uTJFFi5OrZ82xBw1dUio/gSyvc/
         /UJYnyCoRbdzZXypaG0cDzZXp4o9y0a0jrB5HO6iaCcLOFozlV7YqLm0NcrGg5iVJ1v5
         WoPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793911268; x=1794516068; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Fjvd7G1M4kYC5N1HFg2u1AmIMrhzwo399bxrYq5ey1Q=;
        b=sRy4tFASc039OZzymx6zaz/qC3jyaHAFTJ4RdFPGZ1AmMyKor+oqTSdoekQ8qr0Wkx
         O4SFwdWFfoF2of7WW1UgmCBQl+itDWQf2wCimII1XYlZ809YkQEuTdkwM7ybG5zNnP7O
         bRtzg+EXOR9Qm3nZ4Z+tZsIfFcqDX1AMPW6Ffr6JBSUBDo9KW11DsSEJn9EM0ZUOLzrm
         EK8Vin1W4eY592Aq7drO7053lhdUfxGuWgvWd3yZzbkrqfuYgdpX30Ts0+s22REHabrA
         SPJC4QfBRkfPDiWYD3GB9wsSQ1T46t2W7/fLXieOOJ3zJU2jThdHl+Acs7N5dU118TMu
         UNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911268; x=1794516068;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fjvd7G1M4kYC5N1HFg2u1AmIMrhzwo399bxrYq5ey1Q=;
        b=znhRCQrGA6ej0K2H0kkgFX0UFgVE0GK/+KiKdZTI/ekqRCpgiMPokK3ACor0aP1tOA
         TaWtl0CbYRq9Qm+EX6V535wr64RI104hZmGfWU8dY/NraYGSFMNetkTE6OVVyY68ALSP
         QrcBr7ZBEcpcWrowTZ9eF16kcSoeKIc69bHuyIU8qGLYothfU67ouBR13ei0cC162d2A
         jar6q4jDkxVSt0UQsfbVl73WJYj0RbnZ2LK+q179g7LU6i+OIaR1eyS+RzJWkCgx2KJk
         E3M7zRiyMdbiYvdDgSzUthXdGsfSHHuhKhP/Wbthlh8FYigvOVuY0pPAHqsUeblxCAOT
         DVHg==
X-Gm-Message-State: APuU4Z8GPRFCCQn08a88+nE9a/Fj79LA1t/9EGO9lI9zcFXBj8C+PcHK
	Mae/0pd844LTV79gY8w/rtTAcEr1F4yPrNYLAzDfgvFjKxn9sXxXA3ED8uMs8OqFiX+V5izDPsa
	A8J9h7n6lUmVsGb8opmtnrumDtxmt4Gxakhirb1Q=
X-Gm-Gg: AYBFou1kf7bCXMN0vp+Nb0pvcE4+L6MsgRqd+zlktk7UX7sUCkiNnCrUuwcDu7wHY55
	s4eRWkSxG1M/aOhG1aiiRueys8dS7XzDKNN/HKpPEvmqMSne7gxtq4bIroq3CR4PRalL496g65g
	OiuKlTc16phQr59azIWR4gRktCH+2JPXFoAurNO9SKN9UQOfwVlMVsbGTPywHolNG5TaOwpZUtO
	yJQX1mHQtvKLL9y+BvZtXkmMHwEKJK8eVkq1yMGs3Hz2x57XmjctC5MtME9q/WQwN7qiyehR3MK
	M466BznKEmVTeDa8JH5E978SLOm0Sqwp273aVLie+aJbYtis+O1XmmFJ4+xP4SbgMFRZ4Zalm8R
	tu+HhEMITZs2pwz92wSBPFp+UQXRxNEXJaPpyhN9npE74zZLl55H8ggvaXWDBVkzLAvE8
X-Received: by 2002:a05:7301:fc02:b0:369:f05d:6c67 with SMTP id
 5a478bee46e88-36f75441941mr411950eec.12.1793911266700; Thu, 05 Nov 2026
 12:41:06 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Crissc Linux <crissc.linux@gmail.com>
Date: Thu, 5 Nov 2026 21:40:53 +0100
X-Gm-Features: AclHuK_j8aHkxuw9u8EMHzlMnihJyK8h9-rXgX5Xe1qwuRPGxzRdc2VGyjCRn_I
Message-ID: <CAH9gcaifYt_Q86iabH4r5u5fyRmWrT_opW20LPiJk-tnPzBR=A@mail.gmail.com>
Subject: ov5648: support request for ACPI/IPU3 platforms (CHUWI UBook XPro
 rear camera)
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

Transparency note: I am a user, not a kernel developer. The analysis
below was done with an AI coding assistant (Claude Code, by Anthropic),
running on my machine. It read the driver sources and inspected ACPI
tables, clocks and GPIOs. I haven't verified every technical claim
myself, so please treat them as leads to confirm. I can run any test or
command you suggest on the hardware.

I'd like to report a hardware enablement gap, and I'm offering to test
patches. The rear camera of the CHUWI UBook XPro (Intel IPU3, Kaby Lake)
is an OmniVision OV5648, described in ACPI as OVTI5648. It cannot be
used with current mainline. The front camera (OV2680, OVTI2680) on the
same machine works fine with Linux 7.0 and libcamera.

What I found, comparing Linux 7.0 with current mainline
(drivers/media/i2c/ov5648.c and drivers/media/pci/intel/ipu-bridge.c):

1. ipu-bridge has no entry for OVTI5648, so no software node or graph
   endpoint is created for the sensor. At boot, ipu3-cio2 reports only
   "Found supported sensor OVTI2680:00" and "Connected 1 cameras".

2. ov5648 has only an OF match table ("ovti,ov5648") and no ACPI match,
   so it never binds to i2c-OVTI5648:00. The I2C client exists, but no
   driver is bound to it.

3. ov5648 requires a 24 MHz xvclk (OV5648_XVCLK_RATE), and its PLL
   configurations are computed for 24 MHz. On this platform, the clock
   provided by the INT3472 discrete device (INT3472:01, \_SB_.PCI0.DSC0)
   runs at 19.2 MHz:
     INT3472:01-clk  19200000 Hz
   Supporting this would need PLL settings for 19.2 MHz that keep the
   210/168 MHz link frequencies.

4. For libcamera, the driver lacks V4L2_CID_VBLANK and V4L2_CID_HBLANK
   (mandatory in libcamera's CameraSensor) and V4L2_CID_ANALOGUE_GAIN.
   Selection (crop) support would also help.

The ov8865 driver (same original author and structure) received similar
ACPI/IPU3 enablement work, so it may serve as a model.

Platform details:
- Machine: CHUWI UBook XPro (CHUWI Innovation And Technology(ShenZhen)co.,Ltd)
- BIOS: American Megatrends ZW-BI-13-SF133KR300-KB60C-066-E, 11/05/2021
- IPU3 ImgU [8086:1919], CIO2 [8086:9d32]
- ACPI: \_SB_.PCI0.LNK0 = OVTI5648 (rear),
        \_SB_.PCI0.LNK1 = OVTI2680 (front)
  Both sensors are on i2c-2 (i2c_designware.2, PCI 00:15.2).
  Power/clock: INT3472 discrete (DSC0 for LNK0, DSC1 for LNK1).
  INT3472:00 (\_SB_.PCI0.I2C2.PMIC) is disabled (_STA = 0).
- Kernel: 7.0.0-42-generic (Ubuntu 24.04 HWE). Secure Boot is disabled,
  so I can load test modules.

The SSDB/lane/link-frequency values are filled at runtime from BIOS NVS
variables, so I could not read them statically. I can provide them
(for example with a debug build of ipu-bridge that includes OVTI5648)
along with a full acpidump on request.

I'm happy to test patches on this hardware.

Thanks,
Christophe Schleicher
