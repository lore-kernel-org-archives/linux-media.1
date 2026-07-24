Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E5A35E1A1
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 07:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784877443; cv=none; b=OsvMh9T/m2cupksJVHJA7JQ7auaouSefJO4JyX8zYvgil4yEbBVZsyHIHnMyZ6hglSwABkduefc2jglf1Zd39mba+3vEYu3IeXR7WI5Xpyf49QhMhIkR1M8fQspIg9S37QNk5nieT0MMBV6w05DSQSoqdJijF5gFLZoK8mouW+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784877443; c=relaxed/simple;
	bh=IBMyPp/OVr6LRhTSjsBptTMdLdXzAKqoUCqDoJVRn6U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LV3QksKodikqy4mAcWlwD89XcHgFRBD9AkKzVGviQc3JHeYCqzq1h/RKaIWDlrDkCfikQroP0CdhWR7jlGAUzeSwGVm0PzQSXmBEuPuFk/7DcasOJSc9LTZiZJBUNfmEV35jVMrvyxE4pV/P/zF9gE0Xa7SALA8SYQsTGZ+iA+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=R+ZyIrqW; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="R+ZyIrqW"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-69e8ea2783aso121840a12.3
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 00:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784877440; x=1785482240; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IBMyPp/OVr6LRhTSjsBptTMdLdXzAKqoUCqDoJVRn6U=;
        b=R+ZyIrqWdM7r839VwcboPP0uMYsHKUbUA8Q1juvBlatOQrcSJWl/qBgyA4xpQOHMxg
         VJ3hwhj41RT7oi7ZmUP3rCMlRDmslwp6RrKHBZi87YHmKEMJvWUD0QcAnh22vw/o5eIW
         IvNBtlgFB8oFNrk16CE48gtIThQmNXAuXHN3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784877440; x=1785482240;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IBMyPp/OVr6LRhTSjsBptTMdLdXzAKqoUCqDoJVRn6U=;
        b=I/NTfJoLQDZoW/2IBGbF0Jk6xzmuiPJEgeDUKIPrxrskQC91lOtJJwaDB739Tqyaei
         GTLRuvJlgI85jtNdtMgTukyXvVf1Y+vC9SwaY3rOKnA1JcjfkgCSIu7CnBki1LpbG8PE
         9vZK1UTdWp9QDV6T0dr9F1V3AM71o3pRXmkUTwE8rxuANbkDGoNR29DbN16fN807ip9m
         Hvhva/ABRuKePnekoYOkUQfK65jfdq9h+EVlO5qIme91nuJNoByyPtdToHciYndekXDo
         eMJRIoqAq4WL7yOs3u0L2UT5XyDyrZAU2G0C82Ve9G5RfutOzq3gj79ChoMfYxzwNbQD
         jpSw==
X-Gm-Message-State: AOJu0YzEhkm+moabb/Eab9TE/FH9irkArPspt1YocdtQS2yibHJsG09A
	GLEgfjHP4XAl+vz7IJ+xGOkMlYDIHbvW72ug+Cb8TbpuV+tyd7fVOVMbksOi3DHVFoZNKpZdB4s
	j7MA=
X-Gm-Gg: AR+sD121SeaX8iTvGiISRVgzOL3NV5tqQlNFed0rZg83jdUhxL45mck6/LfdiBpPhq2
	s5hHckbzmmMGCMXeWPhB/xS1qovnJwnS7fR6PZaS6nJFiPU12TOWzmyyRZ2fFRD0HHdOqF76Y1p
	jUfVEnujymyuQAxRvYpy0Q88GJIIpSkyyqTAtbIg1i7u3/7ft/blnQgQyOuB0dt330BkStExCDL
	MXWgEjNTzeIv08mcYQUCMJ0jLW/6Yl9OxpXJrbiLve2L0boBtOKqAE/yZLYl7UYOevcyp2ylTgX
	nKZS0FRTOYZ3imy3uw48I02n1od0DU6da5jtbim9FpUZEvrHGp3ECaop6UcJQZCpm8CgEG3n6a6
	92mOQjsirmYrkjoXD5PGmwoh/1f6ymHxHO5JuhNoTddYZ6goPAFJTYYLQlgF3jNR/IeL7n/u+EI
	3MDMQUx6KRsd+I9eYsnRDfS3LxrIO8xDIUQJsXUMY=
X-Received: by 2002:a05:6402:3245:b0:69a:9c00:45 with SMTP id 4fb4d7f45d1cf-69f69c6a2b1mr2166444a12.16.1784877439799;
        Fri, 24 Jul 2026 00:17:19 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69f345b1b9dsm2838941a12.6.2026.07.24.00.17.16
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 00:17:18 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c160420289bso17839966b.0
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 00:17:16 -0700 (PDT)
X-Received: by 2002:a17:907:3f09:b0:c15:dd3d:c6e1 with SMTP id
 a640c23a62f3a-c1c50d1c28bmr256936266b.37.1784877435542; Fri, 24 Jul 2026
 00:17:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABGBkYsZckKwJqcjaQrRvhsmRQ2faST9h0zbPEk9xaCVyXPJ7g@mail.gmail.com>
In-Reply-To: <CABGBkYsZckKwJqcjaQrRvhsmRQ2faST9h0zbPEk9xaCVyXPJ7g@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 24 Jul 2026 09:17:01 +0200
X-Gmail-Original-Message-ID: <CANiDSCvVJ7tTA91rV5S502sL-Ao+KH5x5SvUCn401PYj+PqwyQ@mail.gmail.com>
X-Gm-Features: AUfX_mxyEU6V-pOXocqXeiP6NeeQ9cOU-2gkbUKfeyxDJlmL44_n_rFaMm_F3c4
Message-ID: <CANiDSCvVJ7tTA91rV5S502sL-Ao+KH5x5SvUCn401PYj+PqwyQ@mail.gmail.com>
Subject: Re: usb webcam: infinite reset/resume bug
To: Flynn <flynnwilson772@gmail.com>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Flynn

Is the error reproducible? If so, could you share the output of dmesg
after the camera freezes?

Also, try this:

dmesg -c
rmmod uvcvideo
modprobe uvcvideo trace=3D0xffffffff
CRASH YOUR CAMERA
dmesg > dmesg.log

And then share the dmesg, hopefully it has enough information for us
to figure out what is going on


On Fri, 24 Jul 2026 at 02:18, Flynn <flynnwilson772@gmail.com> wrote:
>
> Hello mailing list, please go easy on me as I've never reported a bug thi=
s way before.
>
> So I have a Logitech USB webcam using uvcvideo and v4l2, and I'm trying t=
o use it with OBS Studio (the Flatpak if it matters). However, upon changin=
g the device's video settings (possibly to an impossible/unsupported combin=
ation? i did try to increase the exposure AND set the framerate to max?), t=
he video stream froze fully and as far as I can tell didn't recover until I=
 manually replugged it. (Frankly I don't have the patience today to check w=
hat makes it start working again, lol)
>
> Expected behavior is that the device should either not fail in the first =
place, or should recover the first time it tries to.
>
> Kernel: Linux pop-os 7.0.9-76070009-generic #202605191504~1780431819~24.0=
4~94774ef SMP PREEMPT_DYNAMIC Wed J x86_64 x86_64 x86_64 GNU/Linux
> Distro: Pop OS 24.04 LTS
>
> UVCVideo quirks: 4294967295
> modinfo uvcvideo | head -20 attached as uvcvideo.txt
> lsusb -v -d 046d:0825 attached as webcam_info.txt
> v4l2-ctl --device=3D/dev/video3 --all attached as capabilities.txt
> v4l2-ctl --device=3D/dev/video3 --list-formats-ext attached as formats.tx=
t
> the full OBS run log is attached as obs_log.txt
>
> I'm ready and willing to provide further info, do more diagnostics or run=
 test patches if it would help. Thank you
>
> Regards,
> Flynn
>
>


--=20
Ricardo Ribalda
