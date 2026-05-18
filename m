Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A801F2E2852;
	Mon, 18 May 2026 14:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779116371; cv=none; b=buCZbPnswleu9iMCm7okU/4PGjyQROXi+l8adajBNMaTll1ZiNpFV0wAC1OFas1njAkU3PzKAzA2gonzMjQq5faTYImtuvl7oJOaJzsQBENJm/4/lu8ZWPhHFqWDWvO6gm1rNUNUfcLKCwxSk6tIV2m8y9GGMTuJEhpriz3D8Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779116371; c=relaxed/simple;
	bh=4Lgn6t0fuYFERzWq8cSTuFDDHPDJwNAV4U5PBWaO7/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=soEHtyAu/VzSkn/oycgnCZbuAxGTpNbpVANatk2/laTvMwmIRJGoWivK8gxEeo2kUZLjkj9LMIxGuFZ7ztlvyuGpi0L1mkAvdIVrirHnN/DLcortcov4NlqKKYAQdk0LiTP9e2GEZ6wMSsISjwdoJ+zilFlUfTC/hNdzuA6W5us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=DXjbUy/A; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="DXjbUy/A"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gK1D76l2tz9vRv;
	Mon, 18 May 2026 16:59:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779116360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xEoW7QI8tOR5iNVRlAhv7eG6k5IqVBNzfswNCeXalc0=;
	b=DXjbUy/AOTZW3zBiwywU8iZ3jrmaRsxLyz+8KUrE7j9hQKSmrki6ROAGhHAM6WedaoyvhQ
	9jSe5+nmE9VcOnf0+fm7/54Zjf+jtSjDOd+/7I7qVefYGPD2zPDnWpw+07awWynVUM2FE1
	hRW1PZDSxyC7Ni81aCUPphUPUiSg3BWb0svS/bDMm4aevBsDHCf3BtFT4l6ibHVkm2NtQg
	SsqgMevsPLEGZ6vImSVOcBt/o0pTsjHQDAOrMP+RI+r0qDrz6Sk+Ei5sRhDsYCKFhjLTTc
	TbQNJtDMQ/4IQ5ZGYZ1zzoQPJuGqIfp3KGz3Z1ihsIuflzN8G1UZXUqZmgRsAw==
Message-ID: <1162f62e-9c65-446b-9788-bb289a202e6e@mailbox.org>
Date: Mon, 18 May 2026 16:59:12 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 00/12] misc/syncobj: add /dev/syncobj device
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Julian Orth <ju.orth@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-doc@vger.kernel.org, wayland-devel@lists.freedesktop.org
References: <20260516-jorth-syncobj-v1-0-88ede9d98a81@gmail.com>
 <c6c91de9-a34b-4b50-a3c1-d42bf7631f8e@amd.com>
 <CAHijbEUzWZC4GAMU6YGV42gOYkrQaMZZPiwS4Erb4H1J-fh_8Q@mail.gmail.com>
 <69dcbcc1-da58-4d34-bfb0-5c8d33b75d59@amd.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <69dcbcc1-da58-4d34-bfb0-5c8d33b75d59@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 4nag1dydo76jap3z98ifcc9bkczk6f9r
X-MBO-RS-ID: da9341ae0f9ef38a13e

On 5/18/26 14:41, Christian König wrote:
> On 5/18/26 14:02, Julian Orth wrote:
>> On Mon, May 18, 2026 at 1:58 PM Christian König
>> <christian.koenig@amd.com> wrote:
>>> On 5/16/26 13:06, Julian Orth wrote:
>>>> This series adds a new device /dev/syncobj that can be used to create
>>>> and manipulate DRM syncobjs. Previously, these operations required the
>>>> use of a DRM device and the device needed to support the DRIVER_SYNCOBJ
>>>> and DRIVER_SYNCOBJ_TIMELINE features.
>>>>
>>>> There are several issues with the existing API:
>>>>
>>>> - Syncobjs are the only explicit sync mechanism available on wayland.
>>>>   Most compositors do not use GPU waits. Instead, they use the
>>>>   DRM_IOCTL_SYNCOBJ_EVENTFD ioctl to perform a CPU wait. Being tied to
>>>>   DRM devices means that compositors cannot consistently offer this
>>>>   feature even though no device-specific logic is involved.
>>>
>>> Well the drm_syncobj is a container for device specific dma fences.
>>
>> Not necessarily. The DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL ioctl attaches
>> some kind of dummy fence that is already signaled. I don't believe
>> this is device specific. That is also the path that llvmpipe would
>> use.
> 
> Yeah I feared that.
> 
> This is the wait before signal path and if I'm not completely mistaken that one is not supported by a lot of compositors.

Where did you get that impression from?

It's arguably the main point of the syncobj Wayland protocol extension, which is supported by all major compositors (except Weston, where it's still a pending MR).


> So as far as I can see using drm_syncobj for software rendering really doesn't make sense, eventfd is a much better fit for that use case.

I agree with Julian's rebuttal to that.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
