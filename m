Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795299663;
	b=MFQ/J3oidyX4Zk2ZDJscLM4qhv/hWwySOvhp7+AJvTCOO6r1liVe1G3c9eZoR7hTirsZ
	 KpfTISi3yHriUS7L8aohpiKdd929cN+0tLL5N6PI2U55i056xgoSJCEO/SmGKIzE+e9LE
	 9hhVzZ9H7vs9RVJRwuhLUILnvbLCN9jaWvoXtCiMyVoMHW0OtfOU94wnolf1GKRog3C/6
	 XiEHt6ZIyYwXfs3hEPyohlNlb8wN+dBHoYBIh6C7VeJcPMB5iq3p0TUATDA4+OHzZu/WT
	 CJ8zzWSkT43RElRW4rUFCfO2VaQoBjVmTBqYnP5pN2wUcQ9BphlcAbnbFSf5ZrYKo3A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795299663;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:In-Reply-To:References:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Content-Type;
	bh=jRxNYfU3ByhGygFCC0tlb+fhfMUQdL+3gkt8Fyeoc2c=;
	b=KXPcsEMvh+VXWOeO6zVAuZeogDOBSSEXMj4hAimdcKArLoswebVSBWzpklKqmI1E8oLC
	 wXv6ezBFZYGBMkNkd2y6AI6Io0hTXRFAPkN4s7ciDmN17FgUM6OvbB9iErvItDn+/P/gY
	 BzfxKvCO8E6+ZFijlGOnHuAIJjcumrlZZqjh3DUHnG3GVerahKujrIAdCCvbcoyETiCnW
	 gvy0JD+AmGODRXfvUhq5oUvVkjt3xPYzP4exQkyUkCyo5LS48ya7s9hNPvzIMGFPOrQF8
	 a9Zex8SKvQ6zezrn02n1o4uz+FRIK4qlje4wqLihr1ldQLhjdFaohSZVfx9BnFXmidQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="w7/A6zhK";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CA7606A32A
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 22:21:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81CA7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w7/A6zhK
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f05b465cd1so5783105ad.3
        for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 14:21:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795299663; cv=none;
        d=google.com; s=arc-20260327;
        b=ZrTCy3OvN3hD9YvSohQW164dczeqRvzOGYTbkT6GgbWkH/UTg5k5TK5x3mEtznLJNp
         ccUGQBiSV/LTSz1VwI23WyEq/Gj16xRCgD0gOmMExtHQzZ1DtCyC8IXJ5TnwbAYZNiSM
         uZbUZ828/euBuy/wRQHpJ/+VlXEiVMF+5KZf13A7+uVxWjsPNOqUXLL+LZLQyWVh40Zp
         pVO576tz8W98FtDVoeHf5Hwu2QGUmoljqS49ujHkGUP+k+TP8QfgLDFV15cgsQ8CxLZk
         9Q/u/FosXCJVrtvhwxo1f5n8UAtc/BYdaEw1SOXzNpp9sywxbxP9z/cyoN9+/xFReBU8
         7DnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:references:in-reply-to
         :dkim-signature;
        bh=jRxNYfU3ByhGygFCC0tlb+fhfMUQdL+3gkt8Fyeoc2c=;
        fh=RpYxnnRW5A5FvuL86z7f7YWfE0tvaTrs4Vecbev4fLA=;
        b=X/V4X/Pp4feuT5T1zbnprGXuZSfwR6hXieUbepZdINTNe3ATntgg6CQrPyAmqV9617
         l8gm4em+tQy3wGExk/2MmRxLoOKQ5XJDZX7hyDNd1zhkoKiVXQcdtkIUXXo0Q9suKpi4
         ky5m51SWOh7/DEept6tezw6M/2lRTJF/qq50R50McPd2rI1ubyGPYqWN/1MZnM++780Y
         tFMXO+9AcbSDHGHHrzpXmjzOPlioea0OZNUV32ZKrdTRIuLVBJHrqGtP2CANLWTUjZ3f
         rCm+b4JuQS2FbVDfWK5uttKX8B+qjtag4os4OhG77+hIEDzTphlxGBzMO6KVM1VEAuvp
         0ydA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795299663; x=1795904463; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jRxNYfU3ByhGygFCC0tlb+fhfMUQdL+3gkt8Fyeoc2c=;
        b=w7/A6zhKEG4aveWFvLMX9zu4811y1GIbAdTVvoZVps2DEx0KbkpHAtHU1ZY0TzvZw0
         qOZNPUEt3wgCyy4P0POETmHOJ8eIhzl7bTA+tMbmq0JUeOJ5nkZBM9fZPzSiIbune0fB
         jeExY//dtrRZHv8rGyTlAxRSlWY89amsHRcXRHT2Ha0NAx+jUF0GsRkgBp1/sjyIrAAL
         IchR2SvC9N/PgH1nDxYZEE4ddev8mcWFyHt1qbAndJY2LzGLDzDP7zuSjhO4Qz7AxqyD
         v1kjmvZ2QyO+MFQzQfkNBHySLXQmAcbhYm1E/Yk02jb41FMECWeocwivNyDgm1+ElVvA
         XX3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795299663; x=1795904463;
        h=content-type:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jRxNYfU3ByhGygFCC0tlb+fhfMUQdL+3gkt8Fyeoc2c=;
        b=xdtU7bJeBwTVVdlqHHf2330tbr/xdK39TehIP9frHCTVq59gPv4VNwLEDWxfmVUU8o
         yuLhnCsTH4HLY3Q5UAkRQY4GeZMsZlXrc9Bm9vu8GQ0wddPscmSfO9ZecXV/VC4K+h02
         PVG39Town2PwFkCuUDUyGW9cREryYjtCtkAixgDX5nMgwSzFv1ApD7nN/pAkOBTfnblk
         aApRGT79QUCx8BHi0+CIX14Gag84xBIZLMBvQNf4xbqzC/9tdpYaierCfvCGOI0dQT6h
         ijiP2op2L5yl1yaMK/WpvNh+/efZzDDC2TbFVZbvOaq497mGw8JwCSjNThnFahzCyRRU
         qEig==
X-Gm-Message-State: APuU4Z8ECqpGxjisnzhAQxyO6xm4EfRwiAc4XYL+zaNPlyaBARgbsWHH
	XUBfVzcBfnpTA+UW9+qeUvMAyOfn2cKg5e2AI7UIoeYFWgxeicJ123zwUfOKo9J9658e+NUghAc
	Kxb1Mmt0q+7iF7otKafXkeYTmJH3v63ixa/YBtIA=
X-Gm-Gg: AZFdTZftynmYfU7KCDc/j5z2ArT6BpJjPfmZbsEAxgxxVhwhmqgD1w3EME8+yNozRC5
	59i3XNj/BhsBqPJlzN3qh/rpqzTeiH80WHx323J1SoKAB7KzsBL4J6vbjO+Q+n93o+MZ2bH6ylR
	ncTDLW1y4HYDYH4dDl/N4GE9b+foUwd5TN1V2Z6bPZwx4DYtwRxd5yp7mJsClDq1V19Fyf7Hm1d
	Q3Xh9ick+eFGp90o2ZwJdt1lK3N74wJYw31B/3a6zXhV8CfSV5PZPiRxTTSWNbvCdBpd8Ul2Fa8
	tt5NvROMCKXz9DlUc48q0lBhaVoZVnJYmcn5b2ey0pzjeHCzxmMqnOrPRpU0qJUwK182xIQZ1Yc
	wjOT6pJkV78tili5kehAsaW4bqMcsRjkrIe1P
X-Received: by 2002:a17:903:4b07:b0:2dd:ad73:5b6c with SMTP id
 d9443c01a7336-2f03f14521emr60536915ad.28.1795299662716; Sat, 21 Nov 2026
 14:21:02 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 21 Nov 2026 23:21:02 +0100
In-Reply-To: <af0d5840-f025-4791-b026-139e4e5f490b@gmail.com>
References: <20261018-ov13858-x1e-v2-0-cd35434cfcfe@gmail.com>
 <20261018-ov13858-x1e-v2-2-cd35434cfcfe@gmail.com> <af0d5840-f025-4791-b026-139e4e5f490b@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: geoca <geocausa@gmail.com>
Date: Sat, 21 Nov 2026 23:21:02 +0100
X-Gm-Features: Aa3M54pFwbXjPMP2UP-L1X0P7KN7JP7RDuvx3EprKG6jEkeKEf-LRAK-O66ox70
Message-ID: <CA+7Hbh+r9w-9E-V6QSpfwMpXUzMMs-mmM9kzZneYWew60OANvw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] media: i2c: ov13858: Add device tree support
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi all,

Resending this reply in plain text because the initial HTML-containing
copy was rejected by the linux-media mailing list. The individual
recipients were already addressed separately.

On my Surface Pro 11 OLED (X1E80100), I have hardware-tested a
solution to the rear DW9800K actuator's dependence on OV13858 DOVDD.

The actuator uses separate VDD (PM8550 L16B, 2.912 V) and I/O (PM8010
L6M, 1.8 V). I implemented an optional vddio consumer in dw9719,
enabling I/O before VDD and disabling it after VDD. The OV13858
retains its independent DOVDD consumer on L6M.

The sensor and actuator both probe on CCI0 master1 (0x10 and 0x0c).
Lens focus_absolute writes and readbacks succeed, and OV13858 delivers
4224x3136 RAW frames at approximately 30 fps. OV13858 V4L2 compliance
passed 46/46.

Under concurrent streaming and actuator use, L6M regulator enable
counts transitioned 0 -> 1 -> 2 -> 1 -> 0 as the devices opened and
closed independently. L16B turned off when the lens closed without
interrupting sensor streaming. Four device-level PM callback cycles on
our experimental kernel passed.

I have now independently validated the same optional-vddio change on
Oaklee's v15 kernel 7.3.0-jg-1sp11v15-qcom-x1e with its isolated
Ubuntu userspace: a 240-frame capture continued through lens
open/focus/close, all three cameras captured sequential RAW frames,
and three pm_test=devices cycles passed with subsequent focus and
capture.

Tested Oaklee-v15 handover:
https://github.com/geocausa/SP11X1ECamera/tree/wip/oaklee-v15-vddio-hardware-verified-20261121/experiments/E003-oaklee-v15-rear-vcm-vddio

This is hardware evidence from downstream-derived integration, not a
formal Tested-by for unchanged upstream patches. Optical lens
sharpness, full deep standby, and the L6M input parent are unverified.

Thanks,
George

On Sat, 21 Nov 2026 14:10:41 -0500, Haipeng Lin <jimmie.lin@gmail.com> wrote:
> On 10/18/26 5:10 PM, George Neacsu via B4 Relay wrote:
> > From: George Neacsu <geocausa@gmail.com>
> >
> > Add an OF match table for OV13858 and parse its firmware endpoint at
> > probe time. Require a four-lane D-PHY endpoint and both link frequencies
> > used by the existing sensor modes.
>
> [...]
>
> Hi George,
>
> Tested on a Surface Pro 11 (X1P-64-100, LCD 5G) together with Sergey's
> power v4 on a v7.3.4-based tree with out-of-tree CCI/CAMSS & camera DT
> nodes.
>
> The sensor binds via OF at cci0 bus 1 (0x10) on csiphy1 (4 lanes,
> 540/270 MHz) and streams 4224x3136 at ~30 fps via libcamera v0.7.2.
>
> A few notes from the X1P/LCD SKU for a future SP11 DT supporting the
> cameras:
>
> - The rear module is mounted upside down on this device
> (rotation = <180>)
> - Routing and power sequencing match what you decoded for X1E/OLED:
> IR, rear, and front sensors all identify on cci0 bus 0, cci0 bus 1,
> cci1 bus 1.
> - Rear VCM at 0x0c on cci0 bus 1 works with dw9719 as "donwoon,dw9800k"
> (vdd = L16B; focus_absolute shifts focus) but it only answers when
> the sensor's DOVDD (L6M) is up so dw9719 times out at boot unless we
> keep L6M on.
>
> Tested-by: Haipeng Lin <jimmie.lin@gmail.com> # Surface Pro 11 (LCD 5G)
>
> Thanks,
> Haipeng
