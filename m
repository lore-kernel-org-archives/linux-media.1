Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793106213;
	b=Q7njFcPj7qybSXvGgEApmoJ2dyv2zJOk4N5hXJJSMSE0MnUrqSBJsQ3yyr75WKwLMspl
	 K9GV87vDYDoO7lZfJqLX+whFHlKbPjg2jFICXMuAdWaLwOTSAAIb+p+ClmKJJ+qrCCmba
	 Yh0W3dE2QQmPuGshLcAxVbNOGI0IHuS7IZn34I5S2owU2uwc9Lbz9dLEPBQX8rOtu7YYt
	 fQXdG0xi8bYb+Z0klIzhCbdm6beP4ZqOEwzd/rerGlxylwYzRCkWcLXsCsF6DPiF2mZ9B
	 R/6iOj55Yb3o5I6vuSDQ6WmK1SG5PmE0S6fGIo0kXLnoEKUlozg1hvdlH/wUSp9mcDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793106213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ReSdqMrGBGnsTnwVh5aa3vwJIfFSFewN0arb4MIegpw=;
	b=bT9gbXgIAebOHnFS/GvlkQ1RnbSLwApSpSKJQ8HI9wfwPGPmeXR65QbCQ5kbwCZgyaBm
	 CmKVbkxdWUSkTSrG1aaiIvfMRzmEz76sa2iPBDrCgMVfKhqgTA1/H0u99i4E8Nh5tbTln
	 chMJWhiJvlnB6ibnjoAm7EBip6bFdectnEqbz+NnKcP1/vNvWHz4F2RNSWcqENEhNDYmt
	 JGJ2gBpl8af4T4Uvz6BVYNRNZws0v2bHEBYkpq5qxyyF5EVNo/elu87RrrOxD5YrCse+p
	 rW/lONT6Ur2d1Lu9rxhkKrKZpWVGzItzA1Yl1RgjfT/nQVPRQiBrIp23hq5i96KPaRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=pwZubLos;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72D8606A324
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 13:03:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A72D8606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=pwZubLos
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36a17a332ecso554797eec.1
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 06:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1793106211; x=1793711011; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ReSdqMrGBGnsTnwVh5aa3vwJIfFSFewN0arb4MIegpw=;
        b=pwZubLosiPicmF6eOZkcnrmXKaKA0onFcjm5mWUKQ+V0EFxJ+Ny1krsU2gwo/ukIqh
         rqUN13guldw8LZ6tfWAc0W2WKHDNYERK7ZP74wB8FueP2bBNXK3u1ZjeRuGOc1sMSpQy
         f3eWBeCGblNzaC23usWJLhwYcfBo5g6Z5k2g0M1kQ1V5+BsNqMY0omu3RhL3UmBhhDTa
         II3fH1sqsbJAufYvRV/OZbxhH9TbAV6O6b1ChNbIP8GO+fBZZHGIh7N6bSQxHIKc/44V
         Wm7LF9P3hc7tBhnnSkWAUwBcF3UD9Qp/uepks4vAFBlxZ8Qmd3Khnm5hhAYEDg5biV5X
         Zk4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793106211; x=1793711011;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ReSdqMrGBGnsTnwVh5aa3vwJIfFSFewN0arb4MIegpw=;
        b=YXWSbSwleNzQ+Im7DUCvif4NORk77oIw8jsGcvby4NA9lb2w3PE796Sv8rJ2FcIqk3
         ajKSEhu8Krg5UGyGz51HQqWBXiFs41KHyEVe4uanZhROqbNxIypNpkGOoPEvMioNmuVX
         6H43rB7dWkuFKytgFogvFjU57Z++BZ2Q7HyI0e0kPqh/n6T7Wl8B7VpfWC0tNce4uOV2
         Ig+xMTdwXDSzWTl6oKWRY7Bo72PcLzb4+RH2+aQc9T46J1Dh4JadZgjQiJIWUUavPGQo
         LGaISwjxzRxTq9djPaLpq8HQc/B4hUjBY1r6nT94Vv9YOXBKn5F0CdeeZNS4xkzxlAzi
         Hucg==
X-Forwarded-Encrypted: i=1; AKwUvBxh1B9pJmCvkAkc+A0wjg64aPs7OWhYQKpwU9zcZoJoioYYbtBf5agWioPCHLeThKjEEWncWyXHuMQG2g==@vger.kernel.org
X-Gm-Message-State: AFq9FYLTFX0VZcGTuVwdW5xat4MCnaL+OqRF2j432EbUt5glQCMHFuF4
	LOOSNuJhKF6IV9EbWcdOs9HLVAIKC/3b/egrBvNBgG6tC8J441gsTxA7TVvoJ2/GRpw=
X-Gm-Gg: AYBFou1I9HLZ++IgZ2KM4s2xKA1XT3ZBGdoZxZOY3GiUXXrH4+abTudPEQVg7AB/2Vs
	BwXJASvRZUXJdQMcQqWEC9pe/SEry6KX14UCJHipzUMseF75f2o36tj/WanZ+Kv/VWpf7lwJfNa
	JmaiDtJABbiqHskWXQ0JH8lRwuw93bC3+Cn9Fie0xsdKgEz3ltTzLsprn9RysosDfPtfaaCwGYc
	qDrRuwwZDZuXkSwOb46k9umcLZBjjMvIlCMdsjgwUM7tqTeK3h/JsQNkPSfRC5+3/QOak8CHGap
	KvHm1fbkEaXRrU53ojYa/+bDmAb5rt2EMZgws8dK/VqMWPpVAxofqEQ114Z2eZywwBTxbVdu1C3
	7uE64wRAPWBPE5T76uiz/U2tBlA/YNnxVTKoI3Lz3jIuW9qP7oHiFs6flBw6cHtCAQVq52rdI4H
	JdOVJ4w9iEahwyEHLfCCxUO+AiieIhyR8LP9DvMF1NK5srTDxH11Xw9yyylbVxoh+IzPEHpLzJU
	IahZEzAOzhwT7qu1gnmepaeN80VhD33APtrRLmRP3tFuTjXrrQNiLZNIzQuDMGJYctS+Fq6f3m9
	d/ucp5CdjfjZ/idvoX9FHNsOr9DONO9QOS2fBT4=
X-Received: by 2002:a05:7301:77cc:b0:36a:168a:96c4 with SMTP id 5a478bee46e88-36a168a9865mr1879705eec.1.1793106210431;
        Tue, 27 Oct 2026 06:03:30 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8db7b23sm46576346eec.19.2026.10.27.06.03.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 06:03:29 -0700 (PDT)
Message-ID: <f92baf52-bc4b-432b-bc0a-f39f59483805@kernel.dk>
Date: Tue, 27 Oct 2026 07:03:29 -0600
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/1] misc: fgds: introduce GPU-File direct I/O via
 dma-buf
To: Li Wang <liwang@kylinos.cn>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pavel Begunkov <asml.silence@gmail.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mengmeng Zhao <zhaomengmeng@kylinos.cn>
References: <20260908131545.105987-1-liwang@kylinos.cn>
 <20261027090853.30099-1-liwang@kylinos.cn>
 <20261027090853.30099-2-liwang@kylinos.cn>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261027090853.30099-2-liwang@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/27/26 3:08 AM, Li Wang wrote:
> From: Mengmeng Zhao <zhaomengmeng@kylinos.cn>
> 
> This patch introduces a driver that allows moving data between a GPU
> dma-buf and a regular file on NVME without staging it through the page 
> cache. Userspace registers the GPU dma-buf with the device, then issues 
> read and write requests via the device's ioctls. Each transfer is direct 
> I/O: an ITER_DMABUF_MAP iterator is passed to the file's read_iter or
> write_iter, and the filesystem's iomap path submits REQ_DMABUF bios that
> already carry the dma addresses.
> 
> Signed-off-by: Mengmeng Zhao <zhaomengmeng@kylinos.cn>
> Signed-off-by: Li Wang <liwang@kylinos.cn>
> ---
>  .../userspace-api/ioctl/ioctl-number.rst      |   2 +
>  drivers/dma-buf/dma-buf-io.c                  |   3 +
>  drivers/misc/Kconfig                          |  16 +
>  drivers/misc/Makefile                         |   1 +
>  drivers/misc/fgds.c                           | 506 ++++++++++++++++++
>  fs/iomap/buffered-io.c                        |  11 +
>  fs/iomap/direct-io.c                          |  23 +-
>  fs/xfs/xfs_file.c                             |   4 +
>  include/linux/iov_iter.h                      |   4 +
>  include/uapi/linux/fgds.h                     | 124 +++++
>  lib/iov_iter.c                                |   1 +
>  mm/filemap.c                                  |  22 +-
>  12 files changed, 713 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/misc/fgds.c
>  create mode 100644 include/uapi/linux/fgds.h

What's the point of this, when you can just use io_uring to do
the same?!

-- 
Jens Axboe

