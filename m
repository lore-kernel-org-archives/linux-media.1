Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E52440A27
	for <linux-media@vger.kernel.org>; Fri,  2 Oct 2026 08:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929731; cv=none; b=gzfJRkkIVUvwFvM20ybgKANGMIHhyuFRGKoMbxAZ6VnX07LUBy/s3TijF3WYmNWYTYZVb7FAOy2FaxJZqUnPF/9nkNzxz4EmlgrEoRYuKPFBp8fhtE00LlwUvJrzZKvYwIiCcfMjqNVdoLvkDiYfbwNzGAJAW0+XmICyZdQBW8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929731; c=relaxed/simple;
	bh=CtFT3EHUof72nBALXqeD+zwffUXPjZInoY5/n4inSyk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hky3qqqXnVOHzRMu69t8C9J1hd1tyBu0l6KGRwt3egxjd5aIO84azVw8gcQNe3BN1hmBBucCZjPVrKG+jVOMzSQ+9len6HFZw2AbfyFSaqKo7oSH6O3ZtFWhxwC90Bl4wJhcHHLLgWqBr6xPEFM/8pe5U99y0fNfNGSyr0tP6uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D53X3E5c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D53X3E5c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 106A41F000FF;
	Fri,  2 Oct 2026 08:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790929729;
	bh=1YKclv0LnxgAAnm5X50IREOAt+N9vOR0vT1dcc9cNFw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=D53X3E5cC0kzaQuqLpXCJXq3bJE3iNNBGmV5dPzUUQ/i/e/DbKFXG/4sy5g8RyQCG
	 dVt3XkUdnk2QX3o/krSPzqrVo4kDlizDTD4WPQPSQXQaNGOQaeB3gV7sNO8cqtSjkB
	 xmH17iI9P3Q+QiQSooBiPc1KpmFmIGPXY7SFheCfdByl20Mn1yUP9sGhDdMmbpmISe
	 agJMJa9XRv/qC5MsHqZfpi7PdgfdvXcqL0O9WsjjdeeibBTpMUzAoDIOz/uzVneWTc
	 rsyii1kGTptVgiOcVkxQwyjzn8w8ilFAJ7s727HBilu4WaoH8IUDqlKGoaqaKNyD/l
	 rbmKomtk8mFbQ==
Message-ID: <d60f606c-94f4-4a94-87b7-b0756d8557b9@kernel.org>
Date: Fri, 2 Oct 2026 10:28:46 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] uvcvideo: Realtek 0bda:579f sends multiple variable-length
 bulk payloads per URB
To: leone 1337 <leo.vernisse@gmail.com>, linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com
References: <CADah2-fgdwyZOiAEnK6XAe5qLP0mHNRBH6DebPN+XXdgrM+fyQ@mail.gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <CADah2-fgdwyZOiAEnK6XAe5qLP0mHNRBH6DebPN+XXdgrM+fyQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Léo,

On 2-Oct-26 00:17, leone 1337 wrote:
> Hi,
> 
> I’ve been investigating a long-standing webcam issue on a Razer Blade 14
> (2017), using a Realtek USB camera with VID:PID 0bda:579f with the
> help of Codex.

Thank you for your work on trying to fix support for this camera.

> This appears related to the issue reported for the same device in 2017 and
> to Julian Meyer’s 2020 work on handling multiple UVC bulk payloads inside
> a single URB.
> 
> Old report:
> https://sourceforge.net/p/linux-uvc/mailman/message/35729061/
> 
> Kernel bug:
> https://bugzilla.kernel.org/show_bug.cgi?id=207045
> 
> Previous patch:
> https://lore.kernel.org/lkml/20200420191506.664877-1-julianmeyer2000@gmail.com/
> 
> I reproduced the issue on Ubuntu 26.04.1 with kernel 7.0.0-38.
> 
> With the stock uvcvideo driver, 12 of the camera’s 30 advertised
> format/resolution/frame-rate combinations fail. For example, 640x480 YUYV
> returns buffers marked faulty and shorter than the expected 614400-byte
> image.
> 
> USB captures showed that a complete 640x480 YUYV frame contains:
> 
> 614400 bytes image data
> 
> +six 12-byte UVC payload headers
> 
> =614472 USB bytes
> 
> The additional payload headers appear at 512-byte USB packet boundaries
> inside 16 KiB bulk URBs.
> 
> One additional observation may be relevant to the previous proposed fix:
> the camera’s bulk payload lengths are not fixed.
> 
> For one negotiated max payload size of 119296 bytes, observed payload spans
> included:
> 
> 103936
> 107520
> 128000
> 129024
> 
> I initially tested an implementation based on the negotiated fixed size,
> but it failed during live capture.
> 
> I then implemented a device-specific uvcvideo quirk for 0bda:579f. For
> this device only, the bulk decoder recognizes packet-aligned 12-byte UVC
> headers using FID, PTS and forward SCR continuity and splits multiple
> payloads contained in the same URB.
> 
> The normal bulk decoder remains unchanged for all other devices.
> 
> Testing so far:
> 
>     - all 30 advertised YUYV/MJPEG combinations pass
>     - 360 matrix frames with zero V4L2 error buffers
>     - all 192 MJPEG matrix frames decode
>     - 5400 complete 640x480 YUYV frames over ~3 minutes
>     - ~3 minutes of decoded 1920x1080 MJPEG through GStreamer
>     - repeated open/close during mode testing
>     - successful capture after one S3 suspend/resume cycle
>     - ASan/UBSan testing of extracted decoder logic against captured and
>     - synthetic inputs
> 
> The implementation currently exists as a local three-file patch against
> the Ubuntu 7.0.0-38 UVC driver. It adds a device quirk and a separate bulk
> payload decoder for this camera.
> 
> Before spending time porting and formatting this properly against the
> current media tree, I’d like to ask what approach would be preferred
> upstream.
> 
> Would a narrowly scoped quirk for 0bda:579f be acceptable, or would you
> rather see this handled as a generic improvement to UVC bulk payload
> parsing?

I think we would first need to see the new extra bulk payload decoder
you added. If that is clean enough and we expect no regressions on
other devices from it then we will likely want this as a generic
improvement.

> I can provide the patch, USB capture analysis, validation results and a
> version rebased against the current media tree if useful.

Sending the actual patch (as-is, just rebased) as RFC to the list
would be good I believe. For USB capture analysis and validation results
IMHO it would be best to just put a link in the patch cover-letter or
commit message to same place on the web storing those. 

Regards,

Hans



