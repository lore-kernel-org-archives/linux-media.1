Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794211809;
	b=Zl5KKOYpz0dGeCFB6qMiW3yJyxpQySUATq+dymgYjlZG/KyEuelJwgkQeuMKgadI5FIV
	 xc4Fgzwl9r8/9TStSu4xxFW6OrMUKYK3FFaI5UWZMZJpXUqzEVJUCqMnCpAgzuoVt+tHG
	 4PAQrsrN3qaS2LYbjMzMdGSO4mvj7B81a8zfHyOoT/UHDbVTIca4KrJM6CD4pLz96+402
	 Kiiqk7cL8vx8QhXE3Iejpd0oyAv6tT/NRUIYbvr2Be8s73KsmW5xus0TR77IM/GPjUZau
	 8imfcM+I1Sq9DRZmTK2m6zC1tMLYFdMgLaKfS9rUk8Gr9Kw5Aulzc5osmJVrJxvmMXg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794211809;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=wzZrO5sPMUfvJRQcHJr+J7BND53aW+oD9xw6rkSrV6k=;
	b=EQ477OemcqX+QqPc4uUEdNq/3oERftsYMGLRnSFhLCI3fiABbHEtz0Yhdn35xgF2Ccnx
	 H4OQKq6YTk6iJr5/FNisLTNnxv0R8KU2LvkKdzQx49USZaX8+Yl/n9h0bVj7ki4nV0LYg
	 EDzc/0GIUapHa6fBsLMlpWCUKjZ6AaJ1uasydhhMjHzisTRm3a2nw9wZBqt0tQaqi9Gdg
	 wBsSvTGnamX5kg33X/rkhfliWvVBb1hX5ZIji4GIV9jlmB/NfjNrUNGjYQRHyqfPWiA+Q
	 maGlsb9Fkmvz/z6CMiNk5fl9qoj47mx//M3wj7Wu8O3a28qNDPJyYIGA4Xb8+fvSQ8w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iRqlL3ZV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.178
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDA5606A31C
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 08:10:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEDA5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iRqlL3ZV
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-539a57a0b1fso163807b6e.2
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 00:10:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794211807; cv=none;
        d=google.com; s=arc-20260327;
        b=aqIE1EYmJ8ck1k3RSba7TmDL/Gq8tF1psnLkXxuDbmrPTjOvEz97aYj7VikMHoPutg
         ESOQMqgyfXXanQHd8Il6TCV0mFmZzv45UmCzTkS3SL2SAS+Dv92aMJD4lqcri1pzIMvB
         /c07Ghu9d855ye7YzMdVtX4tYiJUl+aLwQathObI+/A2peLmGTo36SDSlJTDVPDpw9EC
         8tTbtpNL5Bm5UgA1EDtm3z+WiNBqo4G9uHEOsbpje+/SLWYbHtfn/kWCeutwlnxLQcEx
         lMnzKEpfnr7l96WVlJs8jZuIZANspQOP2m7MgP9fbtlF+ZB7DCNuUgxKYKIPI7SGTLhl
         BJ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=wzZrO5sPMUfvJRQcHJr+J7BND53aW+oD9xw6rkSrV6k=;
        fh=f74sK/KbyDsh43uYysEBfmoqcprGam6cd6pViDbzr9k=;
        b=cI0ahFdNguVvEAO1F4og/orDPY8rqSMWN7u0bTn3BKKUyC8/t5uMKO/vRlwDgnM4T5
         H5KHtp3g8qI0/3071zD2SBmlAIeGLSYuM52ehJfYFg1JOUBTTGKwUKE3KAWapGWYYB/A
         OiFYV4GeZUTiNN1b8sy9MBFGWvjca9BWl9wOCHgBINy150FxLJW1h0gYLO58I4uYZiog
         u3SqV7ao6FopXubtvfGT96q1NYe5yjwnkoIljGW9KWXAL0vxITpP/CMgusTsK8gzpuxo
         Ol7cfVCPSfsX1v3SR9mfAbNhG3n1BXdDoFob8QuRW7Ib+UNyLUkXgsOkzRDib0b9fVSM
         AonQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794211807; x=1794816607; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wzZrO5sPMUfvJRQcHJr+J7BND53aW+oD9xw6rkSrV6k=;
        b=iRqlL3ZVJ8hLiKYYDUvSxMWmWQEEtjVknkDndbXx8T4z9rpMz5Hj6p2GXefr9EUr1f
         UheVXdePcPMNWT76r09vHkDNJb5uKytRIbJZ/LoWORnMOuBbP13lcDVhGM06vddQs3v1
         qeg3LWZaVxjCbpunaVtEWp5t4rq8dWC3fhowW+lMQK1iPaWljjlAHjL10HtSctESz3//
         HFoxTmcBq4ajer/kvfonrQzLfFYR1YibGB+Q9xr4dVa6Fi9pla+hp2QwdkQZuJ1h5urk
         +spVBJnym+ZssOnyy7mWMIGHLqZn8BjOvBzHZLdQ+W5tL4/2tQGmzUYDaRFJWikF4idC
         BSsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794211807; x=1794816607;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wzZrO5sPMUfvJRQcHJr+J7BND53aW+oD9xw6rkSrV6k=;
        b=0leh8R2SwOVbEBkVueqeVOMzemFWrX4+WAORowPGYALU9G2rQXhJwnNumTsgN4f6/x
         MgZa+erseYxJBdliy0msLKeA1yL5pqQfrdpV70dVXeUN1a4Y0I/uyk33AqUPA5vNs63t
         26xXha2E3yUOGam3GLVs/KVPTneAyBZku7Mpk56DQ3EGQbJvcC3zN6a2XbaKcwayH2aj
         tYC4PmgkmLKoxuQrVb9DruZrTFNidHyqdjQ/m/MfufE02ug5AoMOx3VlSMBaMia0QUxT
         D/eMdfx4tlmIrNY1H6rUSKFoCeF1r/cE3YqBgjXAAxxeJDcek6SPXw4owFoN3vHNXKIv
         1gpA==
X-Gm-Message-State: APuU4Z84h1dBHUQa7zY9wMyBpa9dhJLSCpGb/lBvSUYKshmFxhNZ7kAc
	KW09TaR9NDwjubVtr6WWYFPcT6+haDcfzW1PGh8kMhoqwHBS5P5hsBjqELUiEyj4dQ7Y1HaHSGz
	a6ihOqbo8dt7nXqTg1t3voMxPXN+atjY=
X-Gm-Gg: AYBFou3w3tg0em8Ch2cFx8ZlCANsVLmxEGPEIGVvNWsKZRFXCj6lyPMqzEOiF8pQ4/t
	+4HwPjZUEzN3vupP9LDJ+SKnNUjy8iTbqEMifStdsFkChviuvMYRIlhIHJ/zZQT8DxikUVyqd88
	TebiZ1JerQj8LsB0nDuqjAiknaM9YJLpN3W+A7b/CVfXxNmKKA4lDkxMRGTaoSj62H99S5vJW3r
	UZlPG9mDbXW9kiZzVA6wXuCTIbMiVXyLcfCb6sL/P9pMpODrUy2kJkay8lz/bDFrwmWjTj6WMpE
	qTkHTddqdci2TzpljaZ/KUV/yQCy8GLCmCRmENE6wi/xjInkmYAmyHVhs8BETJnssRb8PCceQgS
	GKyC7rIon91rIpSuIvinI5vkowKViTeYt7sxWEpU7SRCjZjaogWB4tUOdJbE8thr9gUN01A==
X-Received: by 2002:a05:6808:2443:b0:539:df4e:2d20 with SMTP id
 5614622812f47-568146828c6mr1922857b6e.27.1794211807538; Mon, 09 Nov 2026
 00:10:07 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: YoungJoon Lee <getfeus@gmail.com>
Date: Mon, 9 Nov 2026 17:09:55 +0900
X-Gm-Features: AclHuK90VhaMayepCJ1Mgm4QyzEoe2OcV2WiHEU0AjvSZn4BJkyqHLXO4PcSyLI
Message-ID: <CA+m4KrCF=4KsrN5BfwZ0ycxDPYxfedjLDMtZ4jpLihYShY5rCw@mail.gmail.com>
Subject: MT8173 legacy MDP: PROCESS_ACK status 0 but CAPTURE remains unchanged
To: minghsiu.tsai@mediatek.com, houlong.wei@mediatek.com, 
	andrew-ct.chen@mediatek.com
Cc: linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hello, I tested the legacy MT8173 V4L2 MDP path on a Google Elm using
a Linux 7.2.0-next-20260826-based kernel and MT8173 VPU firmware
v1.2.0.

Two one-job tests completed without timeout: saved MT21C 640x384 input
to YUV420M 640x360, and deterministic linear NV12M 640x360 input to
NV12M 640x360 output. In both tests, PROCESS_ACK reported status 0,
the host wait succeeded, and vb2 returned both buffers as DONE. Host
plane-base and allocation-range checks passed. However, every CAPTURE
plane remained byte-for-byte identical to its pre-queue canary. The
linear test did not use decoder output or MT21C.

Is this legacy MDP path expected to work with this kernel/firmware
combination? What should be checked when PROCESS_ACK status is 0 and
buffers are returned DONE, but CAPTURE memory is unchanged? Does this
ACK indicate actual MDP DMA completion, or only successful VPU-side
command handling? Are there MT8173 device-tree, IOMMU, firmware, or
buffer-coherency assumptions that are easy to miss?

The kernel audit patch only records host-side state and does not
change the MDP job path. It cannot show whether firmware actually read
or wrote the buffers. I have not identified a confirmed host-side
defect or established a firmware defect. I can provide the userspace
client, deterministic input generator, logs, and hashes if useful.

Regards,
Youngjoon Lee
