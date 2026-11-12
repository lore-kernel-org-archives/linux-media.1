Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483661;
	b=ywOd5FxGWR8hFo8oH64NZZm7RlfkAeOXScON6HP1FtxxsLn+w1DY4PwqBeb5L4cCTLYS
	 n/aKs14/p8fMEMt/DPd+ZzUgWTIckqSaWT1hKZ+6zsss0ZsjWaKySOnPpcAtZrp0XzaHx
	 evHchwl7n3KL1iOejihjkXWK6OI4QI83pH5iZCPcikXkAQMe39CvQph0SJncgWXRKY0+v
	 1jpHKFMd956ZpqwOmakT/YfrZAyeUwp3b4IBEHf5Kkd8YZtcJH54OJlFpTbvp0pX9AT6g
	 alCWCMDVIF6OHTu9x7We0+Jiic6Qyv2GD3bplEPEdvuRVqgVH6BRARlZlcmX1CIvEsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483661;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=gd5qaOSUVWh2d2v6VyXcOF3/P2fT705qxQ3nPfB37vE=;
	b=vuY8kSLm+gaYUVsX9e8NUB97uvqjBMzCP3Wd4Gmp3X+AZIsxyGn2Y6/eIXcOPd9+sB2x
	 VuS8NQq2Etr2q61KwXuFgvgdSHa9yUgasj+PnjR5L6SYu8Hn+0F+nNHrHXlzZgR8hHFzz
	 eljCKa6e0QnicGGosmHqFDyIdUNFUivR34xTkWYN5wnI6dMKow2laAVUOvJ7dz668aixC
	 n3vxEUUH9fbDmsk/cRH3rpUi9yjfLxUtj+i8blEH2uQbB9AQGQTkVaHSrgzR+R0i6ET/p
	 Vb94B8YfAStIvtVDV4QzEdLVcSYXOE+gtHuFRK5MwB2OtpYC1Y8cFfYh97kXBxq+d0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KEmPplNn;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4932606A8B5
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 11:41:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4932606A8B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KEmPplNn
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso8882509eec.0
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 03:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794483660; x=1795088460; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gd5qaOSUVWh2d2v6VyXcOF3/P2fT705qxQ3nPfB37vE=;
        b=KEmPplNnoiOlOa7kWqvKF07gxkGykUViIUtmPh+kP7nQPzhyUQI2a1DrOFo26kA+FN
         C9UmWiuEgkum7U3lnZF2VFTEPJX3p4Ml61IrlT+cGHzD8hsnZNObZ95CR63hz98/GdN6
         oVVLS/uTLJOs5GgM9aOpfrcCHJAATOXLlBLr16lks61jshecz3PHzThBl0mKt6RU4nux
         UWdgHb+cuuerQdqnC2PXOfrZbzzzfXprb4boxxMY5F9Wz3GGu8Xd/EcnThJ8SnNGD12u
         N18W9NAt3u7Q25ugmUdER6ODPxbAGOEuAUNq3WrXdURkhdVsz7uqGd27gWnkRxKiObNB
         +Y0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794483660; x=1795088460;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gd5qaOSUVWh2d2v6VyXcOF3/P2fT705qxQ3nPfB37vE=;
        b=YpyXQpiftdXhWod6ULMocua5tcmMv0k2hlM6Vu/gcrWLbKZocmqy6yJgdaV1Qa4Ppt
         VNCKGS4R/G4hdIHFTs/WdgiB+OB4J3YSf0BjGeLoVgYFFGb+i4lqWSim/UfQo5zXWmF9
         IVl68oanQqjvI6D9fWt8bvlIltywjnDY1U96OVJPvtPm6dy/PTy2/Kzu/NBZASd/atTx
         yhCcooHC7td8iOz8dutQHq3fmjYWLJWijZfHbF5DpZAVLOKIMDkLtbzfF96hUQ8rdbOa
         4CK1mN7ljnTmg+ycNrawvwjh84T0ybRaJg6jsGxnGVKA/mtHJ3GFIgkNNzE9HruAlH6c
         ZRGA==
X-Forwarded-Encrypted: i=1; AL+hErGaIV3iw4JPmXrfzV3kacRq8kan1b5BYs0cNS2BRMkXHO0rq7/BgbrNr9Q61/piF54OU3RxjOxQ1/iUmQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8ArA0M+C8qpUHXS0+uV0JIDrTpUyb8JWqA6LuF999E5LB1l/pA
	MgJQOupoXAfX9SVuk20ndw7FGmET5cjnZZSAzR9VpQ0NfAKiSMGK08HKq5ddqX+Lagc=
X-Gm-Gg: AYBFou1I0l2NLOSRVUQAgvYy0xbzXZlLLk3EMPZE1+Gs3eZ9tdPFXZXIW5udSX2u/nK
	4isSdDZDRa2xKPvLbTmQ4iYO75OAOY60vAU041u3/Gi9mT0vczTfcWcsLGTuZvcR0j8/2mkzV/i
	coHQQUsHpNq8A7c3RLXhNqTXdTLC/PYuCPsbvQOWRhlX8erk8/pErBdRoQ6zhPn8Q/gy2Nhh2Hj
	wALvdbSPvQnK3okrhydwy5Q/ZD8Vzc3Y7frf7H9Okn1s1dLOiO6raXf78Hogxf0tFcmuEIfF0aJ
	1WZ9Xg4W7wiLpvwj1Rm3MjvAGDUAO1sFHxBf7n2UJ6z1CcAaSq/KTXyLpN2Ux/8FxAw6lLsc5GC
	4SECRUv1yf+JRuOW5nnC5O+npSoK///B4j7l6wBol3uYIVq+N+61MV0JQCK2/QqLS0cRLyqAliz
	PGkJcue5rG27Py+uxSL54tlHi/qe+hEdHIfKpg3Yi2Z0kuqaRxue3lchlSqp9ScCXgaAmaqQ0kg
	rCi/L9f08jf7jVRFf3uB391920Xre0TQpT2LRS+s2S5gyPlGuGgv8yuewKD4MoKP1QiSS7Vnaqq
	xOdr+/odPdAYemfkFKvbzvlp3/dDquOMb4Er/X01NBYIdX9bdJJgo79NVkg9Yy0=
X-Received: by 2002:a05:7022:1184:b0:1b2:6b1f:1d89 with SMTP id a92af1059eb24-1b3c0360627mr4336535c88.36.1794483659738;
        Thu, 12 Nov 2026 03:40:59 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([180.67.33.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212ec002sm29245380eec.26.2026.11.12.03.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:40:59 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 4/6] media: iris: add platform data for kaanapali
Date: Thu, 12 Nov 2026 20:40:58 +0900
Message-ID: <20261112114058.428-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261001-kaanapali-iris-v4-4-642f9ac5e699@oss.qualcomm.com>
References: <20261001-kaanapali-iris-v4-0-642f9ac5e699@oss.qualcomm.com> <20261001-kaanapali-iris-v4-4-642f9ac5e699@oss.qualcomm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 01 Oct 2026 20:47:24 +0530, Vikash Garodia wrote:
> +	.inst_caps = &platform_inst_cap_sm8550,

I ran 8K streams on the Lenovo Y700 Gen 5 (TB323FU, Kaanapali), on
v7.3 with an earlier version of this platform data that also uses
platform_inst_cap_sm8550, plus local line buffer fixes for 10-bit
output. Streams of 7680x4320, 30 frames, made with ffmpeg's testsrc2
and software encoders; decoded output compared against the software
decoders:

- HEVC 8-bit, VP9, AV1 8-bit and AV1 10-bit decode: bit-exact.
- H.264 decode: 2 of 30 frames output, nothing in the kernel log.
- H.264 encode: 3 of 30 frames decodable; HEVC encode: no output.
- HEVC Main10 decode: reset the board until I applied commit
  200473c198b2 ("media: iris: Fix iova allocation from restrict
  region", not in v7.3); with it, the session fails with -ENOMEM:
  the 222 MiB co-located MV buffer finds no contiguous IOVA range
  after the 11 capture buffers.

At 1080p and 4K, H.264 and HEVC decode and encode pass, and HEVC
Main10 decodes bit-exact.

With the SM8550 instance caps, VIDIOC_ENUM_FRAMESIZES reports 96x96 -
8192x8192 on the decoder and on the encoder. If H.264 decode and
H.264/HEVC encode are limited below 8K on this SoC, could the platform
data advertise the limit per codec, so that userspace gets an error at
S_FMT instead of a silent failure?

Thanks,
Joonhoe Kim
