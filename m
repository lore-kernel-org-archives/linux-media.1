Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794632467;
	b=BEmLxNzwF5C/K8pJ0n5/lvCMuHrxf/Gjf2f8UqX4Hlt65pQEFjtorNxNqdx+FqrZGFet
	 4tPttsPYHuhCYy3+Mahby7aq6t3oL/80n4rosctMxvH6Ws5Ff1DU93k5KZGHbdhW/J/9i
	 0tMrK0TFfUd/LfYCVuXr45Ie/xW6nPCMUBTqFkPn8T7BM9u9K4aWImt+fpDuNHpPu8boq
	 yQYeFo8Q8EYtvW49eTRNX2F6ECWKBJgzsC5VxMncnZ/2Lem5dIJTIY/zvnARuNToqu3GO
	 fi8y7WOdxGkHXEg84lKEFRY6tC1tZsDApiBBrVzgJJwQ30V9Rc0TYtHA2SQkLyo5SzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794632467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=7aG/eE5olsJwInv+bEoP1V0eDG7IVNV9VWAhiP+RMC4=;
	b=cCHjjIpJgEV7jL+zfMevvZG0w3MLKfvWeI4X/bDVfCuGyMOwubnWfZ6Ne12IBygTSr++
	 994lc25KK84iyVbG4a8Ya8fQx39cFGg3A3TNQGc3eSvmyRV7yica0fcJiILDYm2w7S6Hz
	 D4Y1hBJgCTUfayzC7UYGsI/gG/hcGkMwaYF+ejaq79GVL4JKnU3hRbNlgLrFo7YaxG22n
	 7LfUzwDBRT5aE5ZMgh8Izq5eGuidEm4CSwJXJrj1js3nSH52P/x+aJLb1/2paRm3/ugT5
	 oQLiy9P26HdlqPiWeGDIa9by8uUDIG1o05FdPTKgUCgbuXUDrYDVLpWulE+OIGhzgZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Gwsh/icK";
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E263606C214
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 05:01:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E263606C214
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gwsh/icK
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ac847f9d78so250233a91.1
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 21:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794632467; x=1795237267; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7aG/eE5olsJwInv+bEoP1V0eDG7IVNV9VWAhiP+RMC4=;
        b=Gwsh/icKTb3/QeE3A1s1aZIu8OXdTtXq96YILfq9P9Pawq4oro8j7iFiTyJay+5MQT
         GwNeKlopwVlq3/w99sAsdSX2OodzTlHh7EQfv7LxuK8zLWq2Km3NK5Id5pFE7KGHhTda
         SAgvQ/60PGQmDUhqG0q6GHqjq1b/p5aV62QtQwE1r4p/3cuIUNeYoebbkV3iUlyROj5O
         PUyuo3sefMuLGzwthk6k0R4S+YZAc1aT+NteSikZ6qQEHY/d96/eDgR+uNZCF2rowgqK
         hQulNaBKvYPdblAl4AdaOItGpGUs65u3DySK28wIoGY1O0LP2zzbreieIfCIZLDhi+8/
         id3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794632467; x=1795237267;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7aG/eE5olsJwInv+bEoP1V0eDG7IVNV9VWAhiP+RMC4=;
        b=Q+cVIbWWKrR3YuwPr3LwtQhDSYG4szcr/x0OOYGX7/RLkVxfYCcKMdG5INxHr7xEzT
         Ju8245kUBFb1xrwSyhx/Cr6R4EvEjbyF13iElEJfDkuWKlTHsVBL0zWBwNHCKcUxQj+d
         YRMt0jxZHe6f4xxz1I77/okbZ/TH9qvip+ZwOIBPAtif0aFSoz3/XVwozGD3J/O7Ln2j
         1Ih/RV1PIf7yRcbGKVQxFBN0Ti5/PG/4dpNOptlKWYC7OWteKpF4xHxlmZsDKKaK9lGk
         K/aCugqalwInsy+npD0Mm4fen2PcfGEey+aqrIITcuezxRKxpUzlRgL013+gWhuse4Q2
         hBKg==
X-Forwarded-Encrypted: i=1; AL+hErEPBddhSgyc5XMJetlUK2jqFpMbc8NuW1uIVF47utYfVCEv6gPx5AZnZaqJO2V8BF90II4RTZrYXFXqYQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8kf/rYQG8knvXI3jEBD6rMLpzdypuUwy3Mi/XADkd/zcabz7uf
	Md2CLRDJMHCqEywZxnuqs4OCUj7WJ8kmivBm5Igz0jvhAdQWTyXNCCgy
X-Gm-Gg: AYBFou30ABlQFa4TeoS4gGy897Ez7n8rCKmkc0+mGgI0MPmipc3ywpcqL6sikGx9xRt
	X6mkj55Q9Lrtalolnc5QLF8AV2as95ICNgyHevCbi5rhkDMnpTmOfPqtlWbtrUvjeu0Kebv6k0B
	moxnaEUYSMRu0k1AYu3DJKe6IgSGuCug9YeNdFqk7I6N6hcw/LtqFK/yKFfOagVBzQqVoZz+uiX
	HuYrqCRTHWzHbTYwoQZ+jBcpb0p18kDxM96f0b14+7q1iTmo6sDDZIVAS0uqJit8RxGHGCjC0uu
	WlSLGYll4HvjE2GLHOZUlzlAFJS4Y8nG01Kf4XyoTedDF6rBMLuBkZq52DDPGevLSMA7QkLTFDd
	oBsxLvEijBbbTxxHKlKmGBm5hE/EnLuk+IKIFmrXRz0xEvDBEtHWj4GQomRrQ6UWsmaZvQm45/T
	0JEHvAFLpWPrLFKXgor9i/bLNy/smyicGocSsnge5X1lyNUapag4kPbdcLHtsnBS5T28QExx/ks
	0pXJ7QPkHHyHO8qioTUqbsuSgD7UejWkDn8wasQ4zZQOsW9OH2NCb4Abft0Lnl8ZPNie5SNRsHo
	29QGWPDzVBf/tA2q1MCo6ANVvYqZcJeB4MEgNlzjfK6oNdjogg7dqBgYiP4p+zQvFOx5wkw/3eS
	nwWWQB0cFy8NzitSpoLXld+5zK4s=
X-Received: by 2002:a17:90b:1b06:b0:3a4:c895:570 with SMTP id 98e67ed59e1d1-3b1b0a0e7c9mr7131064a91.4.1794632466846;
        Fri, 13 Nov 2026 21:01:06 -0800 (PST)
Received: from claudebox.iyengar.cloud ([50.39.139.68])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdded58a9b9sm125917a12.12.2026.11.13.21.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 21:01:06 -0800 (PST)
From: Arun Iyengar <aiyengar1990@gmail.com>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Heiko Stuebner <heiko@sntech.de>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, hverkuil+cisco@kernel.org,
 Jonas Karlman <jonas@kwiboo.se>,
 Sven =?utf-8?q?P=C3=BCschel?= <s.pueschel@pengutronix.de>,
 kernel@collabora.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/5] media: rkvdec: Enable multi-core support
In-Reply-To: <20260810-rkvdec-multicore-v2-0-986f89d22cdc@collabora.com>
References: <20260810-rkvdec-multicore-v2-0-986f89d22cdc@collabora.com>
Date: Sat, 14 Nov 2026 05:01:04 -0000
Message-ID: <179463246494.3611640.18079808669048880957@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Detlev,

One more data point for this series. On top of it I have one stream
decoded on both RK3588 cores at once through the CCU, as the Rockchip
BSP does ("soft CCU": each frame goes to the idle core, and the CCU
holds back reference reads until the other core has written them).
For a single 4K stream that gives HEVC 227 fps instead of 130 and
H.264 121 fps instead of 67, bit-exact. It needs two v4l2-mem2mem
additions, so that the next job of a context can be scheduled while
the previous one is still decoding.

I'll post it as an RFC once this series has settled, so it can be
rebased on what lands. The code was developed with Claude (Anthropic);
I review and test every change.

Arun
