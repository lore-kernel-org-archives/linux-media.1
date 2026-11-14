Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794631816;
	b=43nZueZChkPuRqO7caAaVY82+uQw75p5bADAmtU+bm0Hmu00f7piv0fNo4O1fwYJyooV
	 20HlMJqtK6dJAsxvT6tuCZHoDX5GOtddc1HAVOUfWN49IxgmpT3O7xNuSkUuMiFO1JfJf
	 SDKrHmisxY2ZtWRox0vwooDcgIxbuhOIRiTXhJGhyu20EM8Lz4jqQNOn+L2qWPDM9QFN4
	 B+9oUZ+ev8uH9a6+2yBx9hbqGOQ0l0T8slhcAIf3mmUWONXPQfuuvwAvg8tz/XqXHQvxi
	 jbv6DNoatxbElE5adTouk+MWBksHwQg/V4ydF9R+nybnOYHJbNgHd6Wos0/iOnyl2PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794631816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=jlWU+LetvIC/3AgkoO5NcAsGhswOcH4rtrYp5MfQMCg=;
	b=fYcCBoCvvbNrcbRYgv9M3QpwUOlTlvjC/ZnOGog+BkWpzoR7A0PE5gWqMqJdbFCf9NkV
	 4QPmeVRmsOmxB0Ftqs12SVH5qHZyKutwISUK0uHxF6/g5Alzt1D9dMYgPZWrrvVABLkBB
	 dbiFa05H/1PcQLWQYY2kxgnPl5CGq5hDJscqvkrmDdqycnBx60juRHo6W2JkWWiVvA1hf
	 7OqK2lK6t614dIGyo6EFoiQeE9JLVJiqn2+EftaVYRnbg3NJ/tWhs8TGjnuZDQaw2nf6h
	 30u/jPVvVflX2yy4oYuIWHMv5m6fq1kT2nPOAecW3OYeevb79PV/EzQUEXh1JdC7ywQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QhJA5flw;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D0C606A32E
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 04:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3D0C606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QhJA5flw
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b094fb376cso228184a91.0
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 20:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794631815; x=1795236615; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jlWU+LetvIC/3AgkoO5NcAsGhswOcH4rtrYp5MfQMCg=;
        b=QhJA5flw6cCTtX9NhMlG1Eb32t+ik26cbBVAaxJodNTFCkZT7J/Tg0Z7SOoMQaedJG
         2ZARPnvlpNHy1XAsP4JPFn1klkiCuUsqoX9lDHyQq+3RuEFpSrKDxUUG4krJAHmyuoAZ
         NZeI3CcBGZan5v3EWrMD7Xv+A0j/RF+VRHXjya4oJStZ0jhZ+IBAMwiLc4htrArrUqhe
         dX71Ul7F+czmg4uSGzHI6n760N1feBpr7/37uj6tVx/Pz51IP2EmHxIUonpw6N85H/YN
         3c4bAoqqUzlYiF6qBHIiVckPqBp0qleALKtOEQn7aEoAxKIUs6a2wPff1LydYu7xbL+A
         CkMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794631815; x=1795236615;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jlWU+LetvIC/3AgkoO5NcAsGhswOcH4rtrYp5MfQMCg=;
        b=ncIp4nh6LC5XaQCFMLE3BeGWyHAiVMGQjyK1NOWq47FKk3rHhQpUpSieLWSR74n6Ac
         y2YG/X5v+isRsnLoFNTX2W3NPZHWyTtqVWqOZ6uyl0YrGGp8ZgRtxbNofWvZmRcXKEuX
         G4LLFbSktGIjBY8gj19BjK/pGrXnO+Km3lyZQ37LfcPAwYOO2KW9lJxbZG8yRMm0qeZR
         lobvhzKvVRjrSFUaFamIhzDHy+Dpu+ByaY0Ro7VQ2VQh6o/c/CacY6UMu2nl30s41CLz
         joMD3DUyBJWnCcDssydGDvD3xh+C7fYcug+9fByWtC5lrkdH7eisHKVKJrI2hFRT080o
         7Zww==
X-Forwarded-Encrypted: i=1; AL+hErHRYQAUAlYGdJdoEZOKnpNRzJs1WBUpaOBAZT30uVSdvQ/+XgKmBp+cwyg+JUVUfh2HfZWu8kfhBgeCLQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8gH6398fgQgAJerWyHkadDkth0zSd19CsrxVVlM/178CZ3PekF
	IISVwsIfm19MacgD336V1A1XgsIktD6A5fExYj9gwQfhuMhPBC2qL4ce
X-Gm-Gg: AYBFou2aGJ1xBBvtEOC5LhuekOCTDRPz/uEzDSkqAFb0sFzWzQc+y1sdyesDm5QP//I
	jDUdXoQhMBuMFu32f88aEUfxkMd6nKVh03F4N9IsH3AjtstE9kLKTsWCeCPXHjcNvSNwnyiKeUg
	a6vJWMT+vCn3WprQNcUtHB0o1o4DAXrcLfTEL8J9YqOBzOh9HGg5FqpPWR0yrNxmyqnYoThN/Ds
	87fOm8FVwgMUHGTW0Tnh8fhEP9YmdNiCNqkXttbUW2mo2d/apVTdLK+x1PcHP1Nr27Cc5D07exi
	qzQFq54Zk0Es1accUUNAzWTEtuVethsJAurSESrHXDriOLe+fDXr3V8tqVm6OqWTynMaZWnflh/
	AHpmnV9Z6nqiZUR8EN5bUgzFKw+jwHeY9mw6OE43e5vKdhWDtoh7CkZQu81IERGS5Jg/elv4IE0
	HaporPD3uDPByGMyIBrO/NnCbG/A2nUdFBY6ILzIlUsbW982id/8XQc8ZrMNBA6eiBlOJx+OW9d
	wuFNkcu0t/G4IsBBlK1VXB1KNbMmjbr4ih9Z6x3voy6VU/+KLJmNU9JCD5NND6KGwTPHfTAB1E1
	tKCRYLPh2hojS25PgAztUjC7KPIxHqavMHW0Di/TdKiUqQu7v/Sh1Oo4NKA+zTHyPyUP6MEcSFV
	qymo4LUQ=
X-Received: by 2002:a17:90b:3dc7:b0:3b0:9e2f:cfc5 with SMTP id 98e67ed59e1d1-3b1b0826e52mr8146982a91.1.1794631814909;
        Fri, 13 Nov 2026 20:50:14 -0800 (PST)
Received: from claudebox.iyengar.cloud ([50.39.139.68])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d04336sm12649072a91.7.2026.11.13.20.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 20:50:14 -0800 (PST)
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
Date: Sat, 14 Nov 2026 04:50:12 -0000
Message-ID: <179463181227.3521962.172866405609790742@gmail.com>
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

Tested on an Orange Pi 5 (RK3588S), v7.3 with rga/ and rkvdec/ synced
to the 7.4 merge window, together with Sven's RGA multi-core v2 (whose
patch 7 already carries the export of your 3/5; your 4/5 needed a
small hand merge there). Decode-only, 4K HEVC streams in parallel:
1/2/4 streams 105/202/206 fps total (single core: 105/111/129).
4 parallel 4K HEVC and 2 parallel 4K H.264 streams are bit-exact
against FFmpeg's software decoder, and both cores take interrupts.
v4l2-compliance is unchanged, with no IOMMU faults or timeouts. Not
tested: 8K, long runs, runtime PM idle cycling, unbind under load.

Tested-by: Arun Iyengar <aiyengar1990@gmail.com>

Arun
