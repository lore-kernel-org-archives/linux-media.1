Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794916106;
	b=yrKQvMBSdwYePxRZG8wtZGbyokvqztvt+KnRuPhAkKxoSsgo94EukY4476gBYxsoX4dL
	 p6XqVVGK1mpHLjkKvOoNkwa9ezTIHKzebw9AVScmWo/ak4IikWOOCAl75TWp0eCbEdOgs
	 4Ii6GE+r7nuo8Nz0RnNmioAHQvkEY3klvcJ13XKJBxtVGIfTxcRco5go7OfKZv5H793rq
	 H+rcrKSfNs6fp+ISTOUpzAvfjRFnN4N+BdKmQEQ2UydsrYsbf4ewAxP5gcUCZC8jVJTwL
	 dEWMZKYVEgABgP18wWcNQ/ab3kJ7dRK8kgzuADUMsqQXIYP3fQWlmQHzBLyD0bhlNRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916106;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=jg2VGmR4aEP6BsJDhrAD3ts3wD3YGf2YFOG/uGOdFpM=;
	b=xxaYuHuGSRI3KYFMUG+iFV3KivUQgUyWutHNX6ULplgcQB/xootkiTABDeLQhsInikLY
	 QWwPpt4Z6I97WOp6AokKUH00rtd6/MUVGApC7Ml2pb0A4Y8p2i4q9RxLBuM5Mu6oAEq4d
	 sh7mi5rcX3VC/28T23snYFcZr5iPEC6LHWEWGpaVY8odiwfTOaChY9ye28V+AJGQ63qXd
	 IcL86WcBjWRqc8uxnNwXx1GD8XguZYsc8ZtBBlqcaZgrhjRKLTUMM3cOitDezLLKV07qP
	 GnjLmT16kuHCs+JajK6K8ojgLn8SrxnskwYNFn/kOLLneiPpUMJIB8sXBxu++tHtLVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MWgsEobU;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050E9606A323
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 11:48:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 050E9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MWgsEobU
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso506112a91.0
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 03:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794916105; x=1795520905; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jg2VGmR4aEP6BsJDhrAD3ts3wD3YGf2YFOG/uGOdFpM=;
        b=MWgsEobUsScOB/7yRpro9kElDWS23uSIRVFNz5TtvLpxkIXdTRS8NDX0icoN9rcm20
         yqRO59fmO+UDGngnTjCRihJxB7rNrn8jS2H3ESoYxX2tR9LpMM3S4H5kIiVcCmBgLwMP
         1KAf3p0Xi08SYhphrBdUOa16ogweWV8RmDGrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794916105; x=1795520905;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jg2VGmR4aEP6BsJDhrAD3ts3wD3YGf2YFOG/uGOdFpM=;
        b=0VmcL9ei2tL4P2sSyLL13AB+Z2UlHdj4/T6wTRUbD1WXGEuTPJ0uPyFYdrEMAED8vs
         hCvtGvJlw4aH0isbXLRTt5pGJyjtUzapICMnQ0BrC6tMQNM7zGmAS079AD0KDx9aIodU
         A4/i3TynNC3M3L0VNGaDdKGRi7YHDdQfrdshcNjck3z/W7bV33ww/MsD+RTW0I9eTzyz
         /M9zlJQUkn0kPyqzxu0tBairGdAYG7Om0oITUG+hD2jhgW1YKVvvrLcZ3lhlRKb6JXmp
         8OOdmovNyZa9FV8+pKf/5Ek/04lm+asS7CS7y+rA06FBWCbwL766nUgZz9xY/Qa3Hh2/
         9x9w==
X-Gm-Message-State: APuU4Z/5dIyzs12yO7X5/aZ9JfPc9ue6+Ey2kCAgvtFhioI1t8yVY8Am
	vRuZbj81WxwB/y9IRV3k4bXhwksa4+akxoLBBkdzlmJEREdJlRiN0t5D0xcmN8oAPZLQiHu+OvD
	aXL8=
X-Gm-Gg: AZFdTZex1OgQAPOkQeiVlAn0A/MLh9G8DMs+DBHG/zqalmSDnlJKoBOEqnRcMJxNnA6
	wgcLBMjrVfHov8Gd8Gd2jpptHnhiHVtHAfOIVq+uwMBSaHW0gqi21e8FgPEwcTfYLrOTliFLsxc
	k4h4hUHEDRb6o+LPazGEHmS4ClbHS4zknA8npm4NCuwVeJJTLVr17KdVGfhPgBYP6HiWffLknfL
	VpM4W6s/iBJkXYH3N/l8IIpBHQsvSAeRcPqyW8UYziW6AozNYfWmW1dET+HdFbWL8/rVxV1YmbH
	L66t//otxaEipRBco6nOILfxZN2iwvAv9KaGtOvYyfEAOOP8PQWhjpLH7wl9QDWO4s3+Bt0kJPK
	+nuC1rEnsV8l9+sj46BH7rzH6u00SG7NxjgRLaLUAOYiJtDSbkTXY+wofJoNwDgHLqgzxd8CIx/
	M3jx8Z5+Kl1QwnFuZQU37Og+JIWjBVyzdSmWP8vu5dz+UqpJlIYz4HDvv0QJhmZpBCk64iEQE3Z
	6571z8YtM1W9HI6Rf6cD9kp4kAsruCG8pglQuXJOuANeD7saUCedoLLCyh8HbiviA5X0+bORoaX
	L9mgSbrTW0O1BNB+FriYlHkUW2Rxcph2xX3Ji0Vx1vZdLB7QIqVgIAzTIiHEZf4Z3p2JlA==
X-Received: by 2002:a17:90b:2d48:b0:3ac:77a2:18a4 with SMTP id 98e67ed59e1d1-3b3ab977968mr1804695a91.0.1794916105155;
        Tue, 17 Nov 2026 03:48:25 -0800 (PST)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com. [74.125.82.177])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18cabc9sm5766672a12.30.2026.11.17.03.48.24
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 03:48:24 -0800 (PST)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-37198ed3727so980876eec.0
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 03:48:24 -0800 (PST)
X-Received: by 2002:a05:7022:7f03:b0:143:808b:b178 with SMTP id
 a92af1059eb24-1b53a480996mr2082021c88.26.1794916103586; Tue, 17 Nov 2026
 03:48:23 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <2e522ada-8a66-4803-adb9-ed8edc33a3d2@jordan-systems.de>
 <CANiDSCviWGBhTRPo7S1MV5pq+6yLc3vxt9XEWd34wLUhzR3F0A@mail.gmail.com> <c2c00ad1-b21c-42f9-b3a1-e03a0ad49651@jordan-systems.de>
In-Reply-To: <c2c00ad1-b21c-42f9-b3a1-e03a0ad49651@jordan-systems.de>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 17 Nov 2026 12:48:08 +0100
X-Gmail-Original-Message-ID: <CANiDSCtPJjBxCMVHqTHh5A0rhWbdOBs8hduZixc=VLzNboed6g@mail.gmail.com>
X-Gm-Features: AclHuK9MInh3ijq2Xd93JAt6ljCCrzJXAiYDjojfP7CA57I4WA1cMxcA9_WdY4U
Message-ID: <CANiDSCtPJjBxCMVHqTHh5A0rhWbdOBs8hduZixc=VLzNboed6g@mail.gmail.com>
Subject: Re: [BUG] uvcvideo: DJI Osmo Pocket 4P (2ca3:0023): HEVC format has
 sizeimage 0, VIDIOC_REQBUFS fails with EINVAL
To: Jordan Moormann <service@jordan-systems.de>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com, 
	hansg@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jordan,



On Mon, 16 Nov 2026 at 22:35, Jordan Moormann <service@jordan-systems.de> wrote:
>
> Hi Ricardo,
>
> thanks for the quick reply. The hack fixes the issue for me.
>
> Tested on 7.3.4-x64v3-xanmod1 with only uvcvideo rebuilt from the
> 7.3.4 sources plus your two changes.
>
>    $ v4l2-ctl -d /dev/video2 \
>        --set-fmt-video=width=1920,height=1080,pixelformat=HEVC \
>        --get-fmt-video
>    Format Video Capture:
>          Width/Height      : 1920/1080
>          Pixel Format      : 'HEVC' (HEVC)
>          Bytes per Line    : 0
>          Size Image        : 1866240
>
> Streaming works, no WARNING anymore:
>
>    $ v4l2-ctl -d /dev/video2 \
>        --set-fmt-video=width=1920,height=1080,pixelformat=HEVC \
>        --stream-mmap --stream-count=150 --stream-to=test.hevc
>
> The resulting file plays fine with ffplay, which reports
> "hevc (Main), yuv420p(tv, bt709), 1920x1080".
> 3840x2160 HEVC works as well.
>
> Output of the new debug message (1920x1080):
>
> uvcvideo 1-3:1.0: probe (GET_MIN): fmt 2 frame 1 dwMaxVideoFrameSize
> 1866240 dwMaxPayloadTransferSize 1866240
> uvcvideo 1-3:1.0: probe (GET_MAX): fmt 2 frame 1 dwMaxVideoFrameSize
> 1866240 dwMaxPayloadTransferSize 1866240
> uvcvideo 1-3:1.0: probe (GET_CUR): fmt 2 frame 1 dwMaxVideoFrameSize
> 1866240 dwMaxPayloadTransferSize 1866240
>
> So the device does report a sane dwMaxVideoFrameSize itself.
>
> I am happy to test the proper patch as well.
>
> Thanks,
> Jordan
>

That is great :)

Could you test
https://lore.kernel.org/linux-media/20261117-uvc-dji-v1-0-7cb3cf3b4b5a@chromium.org/T/#t
 ?

And reply to that thread with a Tested-by:  tag if it worked out for you?

Thanks!



--
Ricardo Ribalda
