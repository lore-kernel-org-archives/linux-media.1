Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508A73A1E7E
	for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 10:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782123013; cv=none; b=qaKum/ksaU7WqFK0YDynrtNpCJqU6ZcC8rYy4mNqTPKlgQbrxDjJ4U3Lo+4V9G1pXJduiGEUzaqUQ+owPVJxMxD0ZVcECV7mpaFtDXSDq6FzH8yJLEEm7gfSnHQf0jRqxNGNJNOxcTgOaoa+Ub9XNj5bn3TZhnG9dgLXJmxgCY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782123013; c=relaxed/simple;
	bh=MIpJV1Kp5+IKKOnB1urViS1CX0N9INoCe9m4rCb0ADI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Iczz5OLaH0sv9W9GQgw+vOINlB6Y9XA5TaroJeII3W8Ewx5nmHk8wdV5NFQfB/qfu8KCbPzS9b4WeziNbWAUeozcWRWHlJP0vi7/2MeZJmUU/NEGNbxa9qHS1+vlFv4p1+0vCwNyvR7ajNpb+S/FthPERoio3+oXXkhAd4x2caQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AllDFv9d; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AllDFv9d"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84537777d45so3319226b3a.3
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 03:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782123011; x=1782727811; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q2k+tjeODdQaeAZflwyvZ9Y3OS5WINAfimq2sUHFB+I=;
        b=AllDFv9dVsaGxNDqQDKhLKDlCXRbK4P424MoLG2+KGYBe4fCgksfhWvU6f1PXe9m4Q
         WySlpSCU1q//r9x0bBoJez6D+sRPHug282GPhLh/7MlMpGYtWj5cw8Z4DEDKSxNrxCeR
         rIP2+5eWFe5+sDgfowBGxVIutDZfyZ2kbucd2jWv8KOeRciV/BZIbWK+4smF5SH5egDF
         022X1dB864aRGdlKby68+tdjTelEO0XhtKGO9OD8Ufjg7wMucCQngu3BdGJmpoqgs/5t
         6KzrdZRcYKKfwfuwD93dkvrLehnXsu/jnsx68q+dAGLngP5Hdk+pcw7U+sEpwVjDn+UO
         FDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782123011; x=1782727811;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q2k+tjeODdQaeAZflwyvZ9Y3OS5WINAfimq2sUHFB+I=;
        b=AzdPFl64GGyPzF5kEnePI6xZZfM/ZeC90uXk+GvOcJYXXOjDcAFhzITg6B1iZ78BuU
         DwsO5nnuW1jCOMri9zcHwDa6gztHBKLTpsCtDb56sBHDRDelw99hdckxuNMpwPL2iOvI
         SeSk5YgNEGQQofPN8492+hrNjUMzqUdXuI7Z1dhLpuNiC+IgH5FmtlQ6T5vvL7kulhCH
         YVZ0bwaiVfJOlwtazXYNtaBTx+hdOqiLW00O2QGwLPPKwezTqFlsFl/XjWqTFY0j18bg
         Mju+J+epYBuVrYeQ9vSbjUZxfWaXwJH2xjBNs+YDAACYKUadBFRzGtFEV/dnYwM82HwH
         0VFQ==
X-Forwarded-Encrypted: i=1; AFNElJ84P9sMaw2NK12QFBGmg4gsWZbBKsTcdkX3AmoHAmeMj2wzYZiSrbMA9A2zA1NWMq3CWTu6PYgJFTLOrg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+VxxOmdJQJqhERKMGOy2AYROfzdiEI+veGsFYJE3XAl/9fBUo
	QzWbLqdlYJT5MJVM5bmtbCwZBFrt6LSIH2dBEzriQMl9RPcz88KBu+3C+OggBQ==
X-Gm-Gg: AfdE7cm7k+iDsjzGjbaEqJ72YEkJf2iws+R15IkeVNnhuqy08gK7RRpFONRMbNJGyBQ
	qgXsUD3urIaw1FQYzUlfDemVepIxOgVfnRRGMWzWnQ2LAyjDnNr1AZtg+LaYVtDpTw8aB2epSZJ
	df1oWqJKHcZzLKytEbJM5i3GqhK7DFqTxPz3T299FZpvTFl4R/3ah+vc4AEur46R4EV3DPV3g0H
	AHSTPvxUQp5v+uvxCju9KyCOvl4lghJscE1ZtMLjAD0X3AiOxuljJb3AdB4AcDWwvPDhDKgXSt5
	pHl2E1WvvmQzLCsZcwcWwe6imIX7jNqCGgqRovWLA12gbMH7HUEgN1yKYzhW5totvpEWztypJgc
	2h8RbJvPlKl3pdYpVsiqdU3IGDExQ7kItlSwPHlhqClbxwaI0zXLWGHq1eCFkK2I1fv/5KaDi/O
	ejxH3gcgYISgDxilVHHvEpckEytv6vNAB7rUdQEQ==
X-Received: by 2002:a05:6a00:2e23:b0:845:3c47:9159 with SMTP id d2e1a72fcca58-845508e2719mr14998697b3a.45.1782123011430;
        Mon, 22 Jun 2026 03:10:11 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564d6c49fsm6974336b3a.11.2026.06.22.03.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 03:10:11 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Kees Cook <kees@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 ttusb-dec: possible device-controlled overflow in ttusb_dec_send_command()
Date: Mon, 22 Jun 2026 18:10:08 +0800
Message-ID: <178212300844.2248821.488825999079170517@maoyixie.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi all,

I think ttusb_dec_send_command() in drivers/media/usb/ttusb-dec/ttusb_dec.c
can overflow the caller buffer when a malicious decoder returns a large
reply length. I would appreciate it if you could take a look.

The function reads the device reply into a 64 byte heap buffer, then copies
it out with a length byte that also comes from the device.

	b = kzalloc(COMMAND_PACKET_SIZE + 4, GFP_KERNEL);
	...
	usb_bulk_msg(dec->udev, dec->result_pipe, b,
		     COMMAND_PACKET_SIZE + 4, &actual_len, 1000);
	...
	if (cmd_result && b[3] > 0)
		memcpy(cmd_result, &b[4], b[3]);

b[3] is a u8 the device controls. The only check is b[3] > 0, there is no
upper bound, and actual_len is not used. Both in-file callers pass an on
stack buffer of COMMAND_PACKET_SIZE (0x3c, 60) bytes.

	u8 c[COMMAND_PACKET_SIZE];
	ttusb_dec_send_command(dec, 0x08, 0, NULL, &c_length, c);

So b[3] = 255 writes 255 bytes into a 60 byte buffer, a 195 byte stack
overflow, and also reads 195 bytes past the 64 byte b allocation. The first
caller is ttusb_dec_get_stb_state(), which runs at probe through
ttusb_dec_init_stb(), so plugging in a malicious USB DVB decoder is enough
to reach it.

The length looks like it is meant to be bounded. The 2019 fix a10feaf8c464
("media: ttusb-dec: Fix info-leak in ttusb_dec_send_command()") hardened
this function but left the reply length unchecked, and the firmware path in
the same driver clamps to COMMAND_PACKET_SIZE before copying. Clamping b[3]
to COMMAND_PACKET_SIZE before the copy would close it.

I reproduced the write on 7.1-rc7 by running the same copy with b[3] = 255
into a 60 byte stack buffer. It corrupts the stack canary and panics.

  Kernel panic - not syncing: stack-protector: Kernel stack is corrupted

Does this look like a real bug, and is clamping b[3] to COMMAND_PACKET_SIZE
the right fix? If so I am happy to send a proper patch with a Fixes tag and
Cc stable.

Thanks,
Maoyi
https://maoyixie.com/
