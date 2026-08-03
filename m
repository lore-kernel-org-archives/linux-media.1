Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF82D4266B8
	for <linux-media@vger.kernel.org>; Mon,  3 Aug 2026 17:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785779817; cv=none; b=DhohAafjHUoIytlhniMsn/yWl2rpwuveFmp3bcTls/6N/4BFmH1SUpWab5m4vO3aB6QQkl++Vs4Ph76jyAopJ7P149J0UC+FlFL8cyAwyMeHS7KjjtQfUEGF9lP7MMp5s6p01+cJ3MraE1LQFDKSzVmb0V85a62nPX52ui6oUyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785779817; c=relaxed/simple;
	bh=I9zGRsO2umeh01t9602rz0KcmFk6eDMI6IoBdlpywtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qDdQw7Hyay7uAFXEbhUGpICllUsBrQ7RDyMRa15vpOnouyc6bOn6BJ7bO3r+9VkCOTkSgK/8LL43IK8BJRv8RUgEd2/S1HUuFPUV/0429zJRd2XaadWXOlPKUfaarbRX/Rbyt3UZW1SR2EHe9N5doggL012ObwaI4YnYhjQ7KfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c8U4Uaxh; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c8U4Uaxh"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cab973140bso46047485ad.3
        for <linux-media@vger.kernel.org>; Mon, 03 Aug 2026 10:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785779815; x=1786384615; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pz4K308i/jRa7NRBFPDL98FdclZDGa8gdEaJXDSDBS8=;
        b=c8U4Uaxhk3w6fDOZA05DnzSecWKTvhFcCodKPRq7FyNY+Ju95petrFlvNzfOR9LWt1
         sh5F4gyM0eXny5cKucnyVOgbaKxvZBdKWx6RBOM6Jwd+h8xBXiQWEPJHo13RsSPr7QK2
         3EH2xz0KjZPvTxLv94ULZV2azt1zsOdQTxwQ9EZEK4Q94G5LXm1jjGPrjuH7f4e2nV/n
         EzUlon032yh0V4FjoLZRZT568pqmKAAcd/uWr7hjoZ1SwnuOGL7bf1KrJ2vtI8TzdPSg
         HvARlTzQ0NOGWi1yWAPFtvSFc3vZpbMDXmqIlRiO9/cXCHX0RWwtKlSS9zJaiCnPoPKp
         v/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785779815; x=1786384615;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pz4K308i/jRa7NRBFPDL98FdclZDGa8gdEaJXDSDBS8=;
        b=V2CueqHRp/l4kPLCWj8i1wBDfnDRfycMkrhjJMZiD+rZvMYxfNhx5fAHb7Pbh9UedU
         vGZ186phqplDohz3e7BTkO4LUnzu/h1EFG9p/WDcbxEHo5lBMaSvKOl7bw/nyq38/j5c
         W3HvcxHLC1Kx7qSxt6S6OM8hmeieqlf1El6FPb8U8bal1Va2X9YYJ0j+2AEOG78yaJdP
         la0fQBTxiFBHZ6mJ950q5q3d1M8mK+eg7eHVD1zVT8M4KC0UeHcyNzU8W9mUTBqJZqoz
         xA1ZQhEYZtym9nuLogpJ7wpXM8SIPqOEK6rn/Gynbc73SDVWrRX38bce5A+zWAm4ftmP
         USTA==
X-Forwarded-Encrypted: i=1; AHgh+RqzYckn2eqAFJ/Alwoh7kjVGvP9pUWsVI69PocG1axw+gRdVVHntMrDWg9Mi4UEnm524FCE5rgwn8nt8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkCq/nuBpFjtLZWK8f3F6thmntN4FsAPfkKgRnz+mjjsQ+dBCi
	EHGXMU/u+lXGQLrQgM7o+EU9lVPnnITynxnTuQkepLSxF484WTNrA5s1
X-Gm-Gg: AR+sD13+7sOfW8N0YgNwlyhVeqgl5D/nWJ2MsADT7U0LhNIZaQjAoDXLF1erv8LYdr7
	CgoslinAMxVRj3v7cBFDcdQNUPm1nXiD46XlYRu7HfXQUSSPyU/H4xzEU+k//npOQOBcFDMafW2
	OpAg6K4SwgUE9zaLYSs3WQCI1l6G9pMfDrcyksWhO4hO3KFeop3pI88Y11i0lCgdjFNkw9MbtTi
	Kp/leIwgOujHr9Np6gUH2yb5BflnnG8q9YdwEUkYa9mIM0iFXNnLjN8tvp0UBj79eTAL7UORWQI
	V8Tqo8hrFz5oWXWlDCNV+r6wlD3bGDN54AoZ/M6k+M1IY7r1rL1Qa4YW/KWHvfOOr4cLb0SVXeD
	c3Jf62GkAdj1JcKR1bAbAYAexFiudv1f7YTKZSX4EwuDNN4SpORAZP8ZKt0uezDgA9e7P0DRSPY
	XWr62WFVcNn5Z91MZiegHMZfOdGVkXhhPtUOiPF8s+urcv21C0MwBjJLbm/5zx9gnGvFFM4QZlm
	ALNyIr2V1RqT1m5CgDHuVU=
X-Received: by 2002:a17:903:198c:b0:2ce:e75f:b713 with SMTP id d9443c01a7336-2d052299ec1mr109827185ad.23.1785779814856;
        Mon, 03 Aug 2026 10:56:54 -0700 (PDT)
Received: from localhost ([77.237.184.210])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b0ea128sm41965925ad.40.2026.08.03.10.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 10:56:54 -0700 (PDT)
Date: Mon, 3 Aug 2026 21:26:50 +0330
From: Ali Nasrolahi <a.nasrolahi01@gmail.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, mchehab@kernel.org
Subject: Re: [RFC] Discussion: VIDEO_NUM_DEVICES limit in v4l2-dev.c
Message-ID: <anDGkOfGUWNmWvwS@zephyr>
References: <am7LpodognguIZN5@zephyr>
 <20260802125734.198631b5@foz.lan>
 <am-KtTBaHCshGpeb@zephyr>
 <01dab9ea-d57b-430d-b235-2d927ee5f5d2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01dab9ea-d57b-430d-b235-2d927ee5f5d2@kernel.org>

On 26/08/03 09:04AM, Hans Verkuil wrote:
> On 02/08/2026 20:25, Ali Nasrolahi wrote:
> > On 26/08/02 12:57PM, Mauro Carvalho Chehab wrote:
> >> On Sun, 2 Aug 2026 08:24:29 +0330
> >> Ali Nasrolahi <a.nasrolahi01@gmail.com> wrote:
> >>> I'm working on a project involving high density video processing on a
> >>> single server using a large number of v4l2 loopback devices to route
> >>> virtual video streams to tenants.
> >>>
> >>> While doing so, I ran into the hard limit imposed by `VIDEO_NUM_DEVICES`
> >>> (currently 256) in `drivers/media/v4l2-core/v4l2-dev.c`. Looking through
> >>> the code and git history, this limit has been there for quite a long time.
> >>> However, after searching the mailing list archives, I couldn't find any
> >>> previous discussion regarding this limitation.
> >>>
> >>> May I ask:
> >>>
> >>> 1. Is there any internal design constraint that requires limiting the
> >>>    number of V4L2 devices to 256 on modern kernels?
> >>
> >> There was a constraint at the very beginning due to the way minors
> >> were generated. If I'm not mistaken, this was long gone.
> >>
> >> Still, having a maximum limit is desirable as there is a hard limit
> >> in terms of the memory.
> >>
> >>> 2. Has this limit been discussed previously, or is there any relevant
> >>>    discussion that I may have missed?
> >>
> >> Probably, but likely very years ago. I can't recall last time we
> >> discussed this particular limit.
> >>
> >>> If the current limit is no longer intentional and there's no historical
> >>> context that I might've missed, I'd be happy to work on a patch series to
> >>> address it, and I would appreciate any guidance on the preferred direction.
> >>
> >> What is the maximum limit your hardware has? Can you provide some
> >> documentation related to it?
> > 
> > Assuming I understood your question correctly, because the workloads run
> > on a server, theoretically, there is no fixed limit on the number of
> > virtual video devices that could be used. As long as there is enough cpu
> > power, memory, and i/o bandwidth available, it is beneficial to be able
> > to add devices and, consequently, run more workloads.
> > 
> > That being said, to give some rough numbers, I think supporting at least
> > 1000 to 2000 devices would likely cover most practical cases.
> > 
> > This is why I was wondering whether making this limit dynamically
> > allocated or at least configurable might be beneficial, so, for example,
> > mahcines with limited memory would not have to reserve an unnecessarily
> > large array, while systems with more resources could scale accordingly.
> 
> It shouldn't be too hard to add a module option to set the max number of
> devices. Minimum and default value would be 256, max 4096 (it can go higher: the
> minor number has 20 bits, but I'd cap it to 4096 for now).
>
> This module option is only available if CONFIG_VIDEO_FIXED_MINOR_RANGES is
> not set, as that would cause problems (and perhaps it is time to retire
> CONFIG_VIDEO_FIXED_MINOR_RANGES).

That makes sense.
If that's okay with you, I'd be happy to work on this change and send a
corresponding patch series. Before that though, I'd just like to make
sure my understanding of the implementation is aligned with what you
have in mind.

That is:

- Add a new module parameter (e.g. `max_nr_devices`) with a default of
    256, and within the range of 256 to 4096.

- Convert the static allocations that currently depend on
    `VIDEO_NUM_DEVICES` so they honor the `max_nr_devices` parameter.
    This would apply to `video_devices`, the associated bitmaps,
    character device region registration, etc.

- Make this parameter available only when VIDEO_FIXED_MINOR_RANGES is
    disabled. Otherwise, the current limit of 256 devices should remain
    unchanged.

This is my understanding based on your comments. Please let me know if I
have misunderstood anything or if there are any implementation-specific
considerations that should be kept in mind while working on this.

> You're the first in my 20+ years of V4L experience who needed more than 256
> devices, so this is not a common request :-)

Well, v4l2 devices are so well-tested and well-supported by userspace
applications such as ffmpeg, gstreamer, and many others that they become
a natural choice for many video processing workloads :)

Thanks,
-Ali

