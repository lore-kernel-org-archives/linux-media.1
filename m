Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919338;
	b=0r8nn7t9b8IWw98xo1TdKncE5mtkEHSv2YZ2+76SZGRRUGMmF/V1JpxBb07Svy5m9Dws
	 oLAIYUdblL1g5hWvzR6kTZbsGfM9b0e/exQCJNUel7DXqL+ksqjwIKNEbKAYoYNRBT3i8
	 eUUOsqXwzgKFhkP0esfbV/8BuoPaqix6gj5m926IMLY6stsO0w2OAYXM9MUEyvW/5v65X
	 iJAwSNuy9PWQcaiy21kZg70o1xlbRGxeou31knEB6kD4gfb/sTIiNvt0cOpUQBN7vLtGt
	 o+nAuzsTu0iQo7LIwGk4soUmO5emk3KZqRvyJjPWcdVLGkgTEb4aJOCnTheA1YyNi7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=+WEBtr/8JSNohNzv89EN8vX89/+poqMMTCUuO0C1p1k=;
	b=ewtKZh7GSK90eqMqj1DlCK9iYLHFZX9ECEK8yjFGn/fcE8q8wpJl6rMiHk0QLVFhg7Sh
	 lG+1ZZ6Ohw/uSDmEw8uEFpsolVvlzmcBYHljgOEcizn5v7/RMVzxB2rWaLMAckASYQYCR
	 NidW+Eom7i6q/BOZ82KuSD4v/79mYjW3lwva5HfPE7A4qE1UedD0tbs2FqXhIQBFbQRir
	 Nfp06on9YPqWiC8hP7LAaKDsbU7ugOkoGFhYiznqtLwNvR7/HT5QKIrETH1R7nNllHvq2
	 Y0H9MypcRLL4EsXNkZOTN6fNd4SZWj3XjUyppWAaq63hJhpbE/RvbS6OkdqlmkYEuAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=GjfsafhR;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7C0606A336
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 12:42:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E7C0606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=GjfsafhR
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ae1b34e0d2so478817a91.1
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 04:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794919337; x=1795524137; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+WEBtr/8JSNohNzv89EN8vX89/+poqMMTCUuO0C1p1k=;
        b=GjfsafhReVYoQG+yWCB8umQ8x42WVGvtYvNtS3rFyyguS5QHq6woiRSS11fH+xaGtV
         aqt66cXXDkZiD/2UTdu8rg7nlItoU4vlQT1tjT34gTYnU/AvooHZCaCjbFtcgxBn4cCu
         Zxm9eD69qk+zA60q8Rp3tDCjPPcjjhdJEKe+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919337; x=1795524137;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+WEBtr/8JSNohNzv89EN8vX89/+poqMMTCUuO0C1p1k=;
        b=kY4SXyFakQLzgfG9/UNbjXGLDkbDtuONlnnOi0rcjBHPAanLYcTpH2UZz922Co7z2Y
         Cr4tF26bIaTsY+UVHEy4NIemjCAQ6Y7qQd3Mhehh3m732nZ7RcXHX2LzZS4AyTTgbW0X
         ny90jUnugI0ScEFGvUoDl1zAHjshgMGdsqVxI4I0lIewsGDo5j0p0unQMAQetGJ4Szx0
         QX8bY+VteT+HxAG0OTBD5l/C6L8Dturgr7YrJVdxAyROLzQ8UmG3b8+oZ227JmSrRTjI
         gLbtu3iOcamvD77xroRE2Zu5rUWAnaU6QORGkFexLbTesv2SAHBBaBM0gT+NCsFqJBax
         g5tg==
X-Forwarded-Encrypted: i=1; AL+hErHF9K05A+m+BHcSUiIyC1u44crtLqrg3yikrcY/0eCzFUlJErUcX8877p1fxlcR9riinE3ZaV0D4GTlKQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/wbDOVTPrXtSYotKvUoeO95+qZo4zJM4sAJNUbHXDRv3nV1BhO
	L8Zd8G+/hjtz11k+tHHMmlGr0vQGKhm38TGRkMmjht0Y6Yl66Fz96Q5entykwSJRWEOIxKH8THk
	ELBbdWIqE
X-Gm-Gg: AZFdTZfpmXnJ8xCE/Nil8EYJ+WrGHlKjCXZW8gEBS04bbf+04U9bvf7JdeIZHZaRN71
	fwAa2338y4be/wfnCkGytSl2D+O+HETvCSFrhf3YbEJVgJ6Ure8AXg6tIz5/ASlIHBh4I0hcoHQ
	GlRMbVU2dOjJy4xX2cYh/mUuR7BI8IZS9Qf/bRw6q997o2Vw+P3LD2jNb1CpmVN1xSKD4+oNIDV
	O2KoTz5Rja8j/K6IHfjyzbjWyLCmH/NARWRMEHulfUNHgGxsBuNX/cJj84iL+UXmvlRp/Onxd16
	eDgcvw3SMDAds/m/p902pLNQ89Renv517xFUJpj518jsQBaYCQ1LToFdx5FQKo3srVUyZLM3lq8
	dU0t1x+IFUuETVSG9WjF0OlZTXZ9H0Rrj9UocWLawlRNwGgApoedL2d6mCM38I9Usz33Z8ATNcU
	k5UUr5Wg9JqAbGtNiqw8iLGT0jTRyIgK0H08WXa5PtHTjvnYAbDlZFxxBVlG9MCX4i01D8IaeHu
	F4Q9h+l6dkGw7LhkMFjvmTgMCmg8hzefWxQwFhe3ScpJmtsuhc4qeh7c/f6isXIHh7aF4yfi+v8
	Hof+20ZMPOOIrD3f4eT5mlES0iEF2nlQBS4iyp5YNShOpsSbZgtIKXdUvtH0JsnMoGXnk9xmSsM
	nH8nps/zhzFM=
X-Received: by 2002:a17:90b:48cd:b0:3a0:e568:ed63 with SMTP id 98e67ed59e1d1-3b3abaf90ffmr1407492a91.8.1794919336958;
        Tue, 17 Nov 2026 04:42:16 -0800 (PST)
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com. [74.125.82.42])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abd068e2sm4131642a91.6.2026.11.17.04.42.15
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:42:16 -0800 (PST)
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1438d9363fbso614431c88.0
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 04:42:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGr5o5wnFlDQZyDkcZmkjFAoNeiFvZDQMmD8X/b9Tj5TUgOTSpfc3JkOeD6dAa3zX4N3A95cDkYwo6HJQ==@vger.kernel.org
X-Received: by 2002:a05:701b:4208:10b0:1b3:b3d5:566f with SMTP id
 a92af1059eb24-1b53a3d6f36mr2169749c88.11.1794919334620; Tue, 17 Nov 2026
 04:42:14 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <avxKOmxCBLF+7qdT@jpc00229873>
In-Reply-To: <avxKOmxCBLF+7qdT@jpc00229873>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 17 Nov 2026 13:42:00 +0100
X-Gmail-Original-Message-ID: <CANiDSCuX1+ehTGN=HNuLL9YBTt8tUw6fJ2D1JqfePQGaz+QOzA@mail.gmail.com>
X-Gm-Features: AclHuK-EAX41DbKYbj2e_sh3aVA0w84vlTt-MWboq9nmaiJAZIgb1T5nlgGrxS0
Message-ID: <CANiDSCuX1+ehTGN=HNuLL9YBTt8tUw6fJ2D1JqfePQGaz+QOzA@mail.gmail.com>
Subject: Re: [REGRESSION] 5.15.y, 5.10.y: media: uvcvideo: please backport 5b9c75c794ce
To: Naoki Matsumoto <naoki.matt.matsumoto@sony.com>
Cc: stable@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, regressions@lists.linux.dev, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, chenchangcheng <chenchangcheng@kylinos.cn>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Naoki

On Tue, 17 Nov 2026 at 13:36, Naoki Matsumoto
<naoki.matt.matsumoto@sony.com> wrote:
>
> Hi
>
> I use a UVC device of USB3 at v5.15.y. I found the frame rate down with
> the below message after updating stable version.
>
>     uvcvideo 2-3:1.3: UVC non compliance: the max payload
>     transmission size (1729) exceeds the size of the ep max packet (1024).
>     Using the max size.
>
> This message is from by eb6059474e70 ("media: uvcvideo: Fix bandwidth issue for Alcor camera").
>
>     5.15.190: eb6059474e70
>     5.10.241: 3eaf16ff8165
>
> kernel-5.15 supports usb3 of course. This problem is stream->maxpsize is
> not support usb3. Since this function parses it directly, USB 3 support seems
> to have been overlooked. I found the patch at v5.19
>
> Please apply 5b9c75c794ce ("media: uvcvideo: Undup use
> uvc_endpoint_max_bpi() code") to 5.15.y and 5.10.y.
>
> I confirmed that it cherry-picks cleanly and fixes the problem on 5.15.

Thanks a lot for your email. I believe I already asked stable to
cherry-pick this
https://lore.kernel.org/stable/20260323-uvc-backport-bpi-v1-1-5b62c6798ccf@chromium.org/


Sasha, Greg, could you check what happened?

Thanks!
>
> #regzbot introduced: eb6059474e70
>
> Thank you,
> Naoki Matsumoto
>


-- 
Ricardo Ribalda
