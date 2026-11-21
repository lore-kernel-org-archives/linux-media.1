Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795299672;
	b=OneZd6qGMrcr5IZyHWryHoP4gSke0juPfGl+3mov8soyonnR9y9FkEyMgC62QCSEHqs5
	 YwRBPTW9HqoINs9Q7KDFUyZpreki2XKdU6WpAqz5Ho42hreUn2LuSQwnvmT/BeyvON0fR
	 XGzQcgZZyarz+YaT/AEAhyJdP1hpuYVlfGIBCNLsTvcsC5WeMY96UbXSTpxcGXfgYPcd7
	 YOF6tjgBwVXj4PqYQYVm9TUFf1109RMjlIuADl2+HIx80a2WqcNNQ32aD4lUDtpsQ2sXV
	 B5eOdma2pi5WSZAKm9Zhm/u+0N4z4iAMpqHoxoDV5gISl+RvXbEE9C3W43vuSzT+sNg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795299672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Content-Type;
	bh=5eUjyD6lMD32t5ZqTm+/uDRHmI2UXnPx7e+71IoFIgc=;
	b=AaaosHfzwxw2HmNpyjDmU7Fatn5jFopuitINWSoLgFizMGOuDnFcOxLYoOe/Yom1iUSW
	 VLz0TyYWJywqeKBAdA+gcyOEmbigAkyUM48KJ8Pj9ZPPnvF+j3pvrKlFclS6lPxvc0Fgf
	 clz213Zl2x5gnn56N08Ovf7teAKHs8CPDZ2rtesjQ4Mz8E7UAWINNSlpiKGMR0RvHJpvD
	 U83ZNuR1nx2XWZpMLR0OEwWbQ/iCBgDGNqMY8AFTjgUKlCxfx5dPVxH91/xqpbuXrVGcB
	 uw27OXSVOtaa+Ne1RBnKZX57NyIWm3H2l63hatE/DJ954bWYkprTYrNQbW7NwD+FIGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="eNxPlR/g";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E43A606A32A
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 22:21:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E43A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eNxPlR/g
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f05b465cd1so5783345ad.3
        for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 14:21:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795299672; cv=none;
        d=google.com; s=arc-20260327;
        b=XyPPAOKoIrnjPIASGG2msRLGhy2JO2opH8D695B0f1OO89/pmrcZuPo+qVeoy2Bc4c
         PX/y4K354efrow2sRYS0oka2bdmOOmU9g9ZN1SAclaKi/odcxo+2YBdbG81qPSqPtn/2
         YUB+yZYxzqJH/jJMuk4z7qvI82QnrnbrLhnjZk18EspaygGkYRCW72aIHp5ultelbFyy
         o+d2I5l4lVVqo8VphiVGyXZV4F1LJJX7rrZQfn/vJ8w/rfeCVm/6PpmxjRL0/7Tr2tv2
         xrWNgn8PUS/8GvoFLTCEk8BXz2bBbZkuPY24plXcHO0PlJK+LiMDSuJdKjEsaNkqeNtb
         fl+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=5eUjyD6lMD32t5ZqTm+/uDRHmI2UXnPx7e+71IoFIgc=;
        fh=AcFltS6jZL+HMsn34kNvRnhCUI0uWVII61gQbxqEcS8=;
        b=aLS0CAO71Oz7m7kglkVFhtj1aP5I3U1DpWwzl3OvRapgb55Sw6k9RGF7aWggAlJJzR
         sei38T3yIICpyUB/Hn6KEJHzFSXxXACEiL2Z0I84XZzLQXhVLrk58lrFpqsEkHwxK/CR
         Qv71fAEZ9oph/GGYuiPK4wMynbmm64/ctJA7GlMsrFFd1IyOgcwZxnar+cROGETYuJxR
         96e8NsCQZNPnMOW38ghRnWRow2O8WARLRGMFwbFtXAMbkNATbjPiF/7CYK2emRMeGdab
         mUTBVkh6TosF6qEQ3O0QYg0bORq8g88r6spZnhSupJUaeEivHma+dweY9TKvxBbSa/b2
         ai1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795299672; x=1795904472; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5eUjyD6lMD32t5ZqTm+/uDRHmI2UXnPx7e+71IoFIgc=;
        b=eNxPlR/gmFsp9E5slMfUGlzAXHTjBEwdCsPq3joo6TCrIWWLOOBFMhMqnqyshtkoBO
         cLglt3f3s2gHHs3x2Y+HesRznH5u/M0gi4q7hbVgCx/kSvYE690L6ZKSL/Omj7gHGvtO
         58BtaJ2/DjDcMpnM7Rjb7AmMzF0uxqlG9CzQIjDODJbEUOuyBRb8FBeWtIKQ10SmsmCz
         zXSJIt6gWTQYXnXWMOOMC7iwN1y+Tg+HbY1Syig/gldz8p+pukJOhx4jLlHQyng7q8Hg
         O4YdLSiOJl9x+xsSDN2J730Ti9Xg8L1YrjxehYTBmf8YHiNJQahpsabsHtIZLCiPV0e3
         DENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795299672; x=1795904472;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5eUjyD6lMD32t5ZqTm+/uDRHmI2UXnPx7e+71IoFIgc=;
        b=wzHVQefikZmhN7SGYFAFP0afCfOnJKpEIr6gRJOT7EteOKplZvjuWaLMw4PQWsZBLj
         +kRdwRZpdXwNvS1WkXQdeSCbEJm4RCrUF0dZtnvkPHZrTlVH66QpGts7NRt5ZrUPiy8l
         HPn252EEym1h5SpBLRu0ych659DZrzbOdud7yBMjYEZaRs7Ec1WQZ1iebGIM/g6MGtjx
         q93PxuXvNbkc815z5OyaWLrIfVJUPxna5Aoc30w7l8MUQ95uV89+3+sVhWI3qMTwrKG2
         KafmWgj4c4kubgGb42i5KQtKghGRdS6FC2CNyr6hA2L7HutZ8WaThj4RejSWBMiygW5H
         Pc/Q==
X-Gm-Message-State: APuU4Z9qLW1JdczWBQuUWypcspSPIzLHJdL2pSy5IzMLZmBU1uKUn3PU
	8ezN0qFDOFzB+t/ghEHlvrpbAi4FGOC+9ZHMbW8OhuYD7dXQEtEctCYG/wC9RjCThFjnMwkc8pm
	woiOGT3YI2GyJkaXi/3LLxRk54V6FsX7iVP33
X-Gm-Gg: AZFdTZeUJpYYmdPDkPLHjYc2ANXP+15NXkMEgdShsdxOvCr22K8vf/jn2hrN+UUB457
	2DFmlaB329rONVZgEPy97Z0chu76VoGqBwEw+GTl1JsTfMyU06wPXe2XgYbaXw3FcCITnqlfZs7
	ot5EMwRtYq48Ef5fY17ub44uauzlN68/bgCYPB+iFfHrOCLv4kY+VU7IIbNQcpXXAlSISkvPZdF
	haerh6giNLvD/H2th1XTJ06lMRNXEwzV+Md9jqyPfihD1UeC4j2ILu9Cmg7H6EP9Qf7GFtm42iF
	+zw2e/h41tz3Qa5if337GsdQbj6RY0RsbAg7OdMIxsHau1hx24dkXhsvPIqJhNY45NDBVxHONGf
	1E0DhQhX3pC8RccdEbll2jIVvthjF9QfMZjaY
X-Received: by 2002:a17:90b:2c84:b0:3ac:a203:e092 with SMTP id
 98e67ed59e1d1-3b41c7b6864mr6590328a91.1.1795299671894; Sat, 21 Nov 2026
 14:21:11 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 21 Nov 2026 14:21:11 -0800
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
Date: Sat, 21 Nov 2026 14:21:11 -0800
X-Gm-Features: Aa3M54oWaGiFdEs4GnyFcYKj9Je7NUEFv5NSE69434b6Hqj7oww9wqh-UlyJq4A
Message-ID: <CA+7HbhKKt9thtbS0AR2Gi_Asm5X3pT51xEknuHreyHO2RuWuwQ@mail.gmail.com>
Subject: Surface Pro 11 OLED: tested optional vddio for DW9800K (re: [PATCH v4 0/3])
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Griffin, Sakari and all,

Resending this note in plain text because the earlier HTML-containing
copy was rejected by both mailing lists. The individual recipients
were already addressed separately.

I have hardware results relevant to the November 19 DW9800K v4 patch
series on the Surface Pro 11 OLED (X1E80100).

The actuator uses independent PM8550 L16B (2.912 V VDD) and PM8010 L6M
(1.8 V I/O) supplies. L6M is shared with the rear OV13858 sensor's
DOVDD.

I added optional vddio handling to dw9719, enabling I/O before VDD and
disabling it after VDD. This allows the actuator to probe and power
down independently while preserving the shared sensor supply.

Measured L6M enable counts during sensor/VCM use were 0 -> 1 -> 2 -> 1
-> 0. L16B powered down when the actuator closed, even while sensor
capture continued.

I combined your posted v4 driver changes with optional vddio handling
and compiled it as an isolated module. On the physical SP11, the
actuator bound, accepted focus positions 128/512/896/0 with matching
readback, and autosuspended with L6M/L16B at zero enable counts. I
restored the prior tested module afterward.

I also added optional vddio-supply to the separate
dongwoon,dw9800k.yaml introduced by v4, and binding and DT validation
passed. A pre-v4 RFC and a post-v4 integration preview are prepared,
but the latter is not suitable for submission until the ongoing v4 DT
backwards-compatibility discussion is resolved.

I have since also validated optional vddio directly on Oaklee v15's
real kernel/userspace, with uninterrupted 240-frame capture through
VCM open/close and successful subsequent camera/PM testing. The
Oaklee-specific source and hardware evidence are here:
https://github.com/geocausa/SP11X1ECamera/tree/wip/oaklee-v15-vddio-hardware-verified-20261121/experiments/E003-oaklee-v15-rear-vcm-vddio

Upstream preview patches:
https://github.com/geocausa/SP11X1ECamera/tree/wip/ov13858-dw9800k-l6m-vddio-untested-20261121/patches/ov13858-dw9800k-l6m-vddio/mail-ready

Would you prefer optional-vddio support as a follow-up series after v4
settles, or rolled into an updated v4 revision?

These tests prove driver communication and regulator consumer
lifetimes, not optical lens sharpness or full deep-standby power
behaviour.

Thanks,
George
