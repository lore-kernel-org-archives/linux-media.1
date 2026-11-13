Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794601991;
	b=QDEJQFfXBF6gaWekcZGclaCn81tahxpEuzXPMsSW8fD3fr5/UQlI/9gTBY5H4AeFb+Y4
	 ptf6CJGZ5u0+glURK+Zhn5PY114RMwrIFi/Jtz6QHOOPKuxLeSt4iFtvjQRa05JwksMRc
	 5i5Bk3qeIIzChCwrBqZ6v4PhIOv+U++I9B2ktDegliJX2vqkXHYDqM8JkImCIwc5+pHam
	 JJVaMyXNRcV165t4MQ1HsgSwNXmjlYx39hLiVgDMKcpMNltv8x7SDV5ZIb1D8xLdQhm49
	 CXuJG7AAhJkAqQ3tEc+TDhNBVckC5IvLHp0W6OIjL7TBR2XHcZT3A8lt8TYopLntN7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=9nMyN0VEnSPNDMOw40qCksgSnlqSB2G4sRnpFPXnQgk=;
	b=YpKgitPQTNNbI1bj2+MiCJgUOJuJ2JA40T9gAoOQM+/SwzvPg6GKvBMC7r44RuPX50TQ
	 0TJ5VRPnUI0bToWCDFyPsY9PRE+taHqN/MbVhRd6qrVW7aYy2yDknV/DegIeGVCuOmxWl
	 wdjUQ4QmRC1izBACg7HI1Cg5+nAPPgwAz7Z5+5jfi2i22YwqtVbs+7M+gFS5Hfx+alRXJ
	 E2ueLe5mfgPvSrQk5pi6gqqJUEAe05eJGRFLwD6t6XKgArPKr+b8JVXrvqnW8paCacTIa
	 sIMScBjxeZH7IjLR1zr/oZrFAr6qU3my8dhBohP10BWgTx9CEYrxwXb9pYROhcoBdXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZLp7NZCm;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69269606A339
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 20:33:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69269606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZLp7NZCm
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ad47c246f8so187981a91.0
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 12:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794601990; x=1795206790; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9nMyN0VEnSPNDMOw40qCksgSnlqSB2G4sRnpFPXnQgk=;
        b=ZLp7NZCmQWAAnZ02+wYgFgtbHoC30BCdKnKTCxTln8KLpmiuRrFaIwdwJYQqRVA7g4
         3cT3k7GD/iqJcSTBNWoEZwtTAoHK3HMcq8gcZgA/8eemkhVFrf80PhgUm4gLWvpYA6S4
         oaAQj+fTjki9zESLABnYD15O/9hOmzp6KvYeEMjVNy9QiAqZfcYHfbTd6mUj7PnYHinq
         Oa4m9icOmpJ9ZnAvvgLh3jj1bShZ2E1R0M4jEqBLK5gHb60u7YPmoCRaxKsaspFN5wSE
         c/j/3fPOsOh1OavfHx1WW1EBmwMagB7r15vwyz09Eb75/4Mi6DyXjdfvsMVr9CgseSOL
         FTsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601990; x=1795206790;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9nMyN0VEnSPNDMOw40qCksgSnlqSB2G4sRnpFPXnQgk=;
        b=05JVplN6WYunBRICMujLPm5BIHPrLJ3qQgQscyI33706k6a8sxTRtgPkfBnh1eJ20L
         h6BQTH3NJaFEgdz45k63jrrcoLaab+gNajDqoPryi4oZb+LFU3ks1gPZPjjSvA53zPLN
         5uj9lZ4wF4tzABKiNBZjGPxGtNKisxaj1cRtnizPxZyZaS3LD1mBKb2gN60k9VXhfYdJ
         pHSvOk/QWtYZX+gC9DLD+sKo41TRKj3edS8ativ0SsBCMEqwElKNux74Hz2PB7O1nwKk
         N1UIpNvqNMdEDXmtRcCmwDKpsPKcnOVdU6sqHccjNZien+TMawrT6XHULgrGsFloMvp3
         YOtg==
X-Gm-Message-State: APuU4Z9JVoU5alThyz8O0rHvIld+7G19TVa3R+JcFStK7Eizt7hj7WFB
	Lhx6/c85co1rr05nPWE8yfA23xwTjBcxUAwEpAqh+P1xLB1q0Mz0f/Mb
X-Gm-Gg: AYBFou379B4SJy/A+gKcK5IweCS9/jNxOoifjjkaCYASmuZPbe05RzkeCCM61Tqdjha
	nRK2hx2JYUFK7PotH7qK0LTqObrMPdDeYqgl/5R2lWgnq8V09Kw/xU0ol4096gwA39SLyU2m6Sp
	bk4m3W8t7qGQjhTW0G6Vcddqzg9J/a41n9WG50wN1UjiYhGa7+/lqdEqD6ogls6x8eFWgNEWrGk
	98+/z2PustqgdpwDG+iIxNaEbaBpOyRGR09XFy3afjmoRaPjK8PUAyyL4WzIXunwtnkj6mmCE8N
	wUMjG/YBGzuPDIqnQajy0BK6+Ug4OY0uh4vhdH+G5j+8xPfOHoA4ZvKC/Y7i4/EuCxdTc7Em5Fa
	MOLfS3s0kRJN91zbm+WDKHZlqYEP6ewFWEYsnxZc6bZ8sUpEDglCtK5n9Mim8sZ72eVdofgCMMn
	u6h5bXSJcYT5SBU2FLrrdZGs/7Hjf/lzuiZWkTUVMekBFmHh/Sn6Hfq36Bhqk1LSibPoTpymVaA
	BgSimD1NiYD/YKjL0k/XMfM5cSMJkw+cmlaJ38i4tL4DRPpR4k/XT8S8u7OcVMOgtBtlFhW7RMn
	WbT8r69txj8Dh3R/0Cz8BVuk8HjKEnrp/15riMKKkzSUDcT0EBeFuPiH/exgq8yVNy5RFuGpwgO
	t4sKePRlvZ7yWoMhiLhU/dSDqbUg=
X-Received: by 2002:a17:90b:4d05:b0:3a0:c1b1:45fb with SMTP id 98e67ed59e1d1-3b1b05aabb5mr4604273a91.0.1794601989766;
        Fri, 13 Nov 2026 12:33:09 -0800 (PST)
Received: from claudebox.iyengar.cloud ([50.39.139.68])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f6e0sm11168256a91.9.2026.11.13.12.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:33:09 -0800 (PST)
From: Arun Iyengar <aiyengar1990@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Paul Kocialkowski <paulk@sys-base.io>,
 Sven =?utf-8?q?P=C3=BCschel?= <s.pueschel@pengutronix.de>,
 Hans Verkuil <hverkuil@kernel.org>, Jiaxing Hu <gahing@gahingwoo.com>,
 Daniel Almeida <daniel.almeida@collabora.com>
Subject: Re: [PATCH RFC 00/12] media: rockchip: Add a VEPU580 stateless
 H.264/HEVC encoder driver for the RK3588
In-Reply-To: <20261110-rkvenc-v1-0-ea8b47122d8c@gmail.com>
References: <20261110-rkvenc-v1-0-ea8b47122d8c@gmail.com>
Date: Fri, 13 Nov 2026 20:33:08 -0000
Message-ID: <179460198852.187691.10732168634380090377@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

I'm withdrawing this RFC; please don't review it. It depends on my
H.264 follow-ups RFC, which I have dropped. The cover also should have
said that Detlev is already writing a driver for this block, as Nicolas
explained in the VEPU510 thread it links; I don't want to push a second
uAPI for the same hardware.

Detlev, three things from the bring-up on an Orange Pi 5, in case they
save you time:

- HEVC wider than 4096 came out corrupted with the external line buffer
  (H.264 is fine with it, tested to 16384x2048). Tile columns of at most
  4096, one hardware pass each, as MPP does, work (tested to 16384x2048
  and 8192x4320).
- MPP's "TU depth 1" is max_transform_hierarchy_depth_inter/intra = 0
  in the SPS. With 1, decoders misparse the residual.
- Two streams, one per core, with both cores in one IOMMU domain and no
  dual-core handshake, ran at about twice the single-stream rate with
  the same output as single-stream runs.

Arun
