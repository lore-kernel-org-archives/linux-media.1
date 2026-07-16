Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303AD3B14A4
	for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 07:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784186827; cv=none; b=uZpW9YFpDCm+dhD8Ww+J3GSOqXWhIr8OvGxW1WYj6GYm/a1sgf3gQM6Fdlmq9MJ/1jLfTapnQrj1BXC8Ie3s00KBLYa/It900Gcz2peVGrz1QCUUhOmYF7GkuPw7GsVYUO2K5mOO3PBhKkgBLwyaB4yd2rK+dSjWxRDs0qvGwQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784186827; c=relaxed/simple;
	bh=Qmii5iiyqbaKIZ7pa5WN3y9kNbCK8lHu1cted1/F5y8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=puguf8cy93JrIWq31Z5yU5ukSACyrSuiGC9f8fcGBh9IGg+5vEDzy69+cEZ4JdAIuyMMvkiwKRoMELlZyjFtBB51u/tNscvRfBzrF0mYng6ogttjjbC5qxCiIqposQpxg7kbblp0NJ43C+llgEeXF5IqaWMWlOMto/iQD25P1M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=me6ZRlTd; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="me6ZRlTd"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c1691e4ec40so49636966b.3
        for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 00:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784186821; x=1784791621; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GV2xbgUl5kcXLfyHOhTgGk+JdpZ1pm9chZdJlFFZoI0=;
        b=me6ZRlTdeeP1SArhT01ABFXBNuFInryUUTMBgKfAPxgrDJ8I7d2JBarXhRpFuv0ymw
         A5BR9ItDHne3WexyQ3OO7jRtwzGFqYdsQRUzbvdYUUcv+Jbh9RmK3J3B+imw93xJorfR
         I4Hwb48Z1I9PPfE+TmqI2xBD72B8K5QNpU39g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784186821; x=1784791621;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GV2xbgUl5kcXLfyHOhTgGk+JdpZ1pm9chZdJlFFZoI0=;
        b=eB1X++Gwzi0WIQfpjaXfsfn9oUeoOVWswlbCqMJFnOR/6/jUnFQlhA7IjaXVBu8PgQ
         S4XQ1MkZwQR2byTCcD8nhZRhdIQu2fWp42/a6WIeiqYSLMRnqi70Cbc8qs92o0bOSHd/
         KnQprjNdyeRX8xM1RWqphlORgZWWj1ZapSPgspATDdjvd6S1fA5R28YO5fUuWCy28vsZ
         3d7HF5i5sszuYM6dWGSBaQkqlT1vnIa9mnvnkRUuAWY7ceWlOSovR0kZDahzIgNiBH9v
         UgP9In1qE73bfzMOPHI777UAI638TvGMJafbMvnq2T3/G1srIbIBRzI1O7cW/xKGfbx2
         33hA==
X-Gm-Message-State: AOJu0YxVoTrFA40NLPIgGGOoUjNW5NL6YThYMq0T71nEWdL9uKPTsY66
	Y4OBieMVbpCk6urszA7lX/orZ/bnoqoxbpMfOsAMVcdfzRTijWQXNNtwnApozO/kxXzFY4e0opZ
	27apzRQ==
X-Gm-Gg: AfdE7cmj6wez/3TMRTUlu8W/BjKScbMkphqjeckQfP0pB9NE33DPb4EEQipvTO2+1wn
	eCIOKBP9/UH/RemI4SjqxEfzhuHs6ffYbhyCyS1y+ve4W80nXaxib+9ORG888GhFdKA8y0tnVW8
	lhj5ORacPh++FyJ7QcJUX47wOdtBXXanot0r1Yli8SOd5b9MnQLl/r5XUrSPvbDrK70ThUBp2zA
	Lfba0hiNl0iCXcf/p7QXIQ6y8Yf1h8ptjOLvarOyu773UPNJ3JQykZ/H2cx3LC+omXwovZBPMse
	Jk+tnb1F5h4dT993rw3RPLy16O9itisFSKzCfoPRq9oacwYBFIRsDoqfRR6abRxBjA9YQ316jl2
	SAVZS2iJLN91T31G5lF9lngR8DzB6Ub/3/sSr1eT2pXSbkawhR3mCWL6XedEALf95hs5/Jtc9b7
	WEAXcFaZ/3xfjtGmCYeZtu1y7ZSVfj14fRTjqiVm0=
X-Received: by 2002:a17:907:7b9c:b0:c15:e04e:aed5 with SMTP id a640c23a62f3a-c166799652dmr542780466b.11.1784186821069;
        Thu, 16 Jul 2026 00:27:01 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c168731879esm149631666b.32.2026.07.16.00.26.59
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 00:27:00 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6986578d8c0so9837891a12.1
        for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 00:26:59 -0700 (PDT)
X-Received: by 2002:a17:907:7286:b0:c12:1c2b:7469 with SMTP id
 a640c23a62f3a-c16679d69bdmr570605666b.17.1784186818789; Thu, 16 Jul 2026
 00:26:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAL+2LXtmekL+oc8e48uUXL_2SXvfCc_v7MrHJ6JDh9usRHu0sQ@mail.gmail.com>
In-Reply-To: <CAL+2LXtmekL+oc8e48uUXL_2SXvfCc_v7MrHJ6JDh9usRHu0sQ@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 16 Jul 2026 09:26:46 +0200
X-Gmail-Original-Message-ID: <CANiDSCukMqtarMGb3F0Nf3TfTB7TxHDeWu776StV+0q5q1VSVQ@mail.gmail.com>
X-Gm-Features: AUfX_mwfmrT6FxxR0o3KdmW2nNX-9gERaFPLMwv7xUDiXPaOZSySAEMuvTe3GIQ
Message-ID: <CANiDSCukMqtarMGb3F0Nf3TfTB7TxHDeWu776StV+0q5q1VSVQ@mail.gmail.com>
Subject: Re: uvcvideo: deadlock when async control drops the last PM reference
 from the status-event path
To: Jay Chooi <jay@robocurve.org>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com, 
	hansg@kernel.org, mchehab@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jay,

Thanks for the detailed report.

Can you check if this patch is part of your kernel?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/d=
rivers/media/usb/uvc?id=3D6d27f92c54ce28cfbd2a8a479a96d6f4a781b7d2

It landed in 7.1 but I cannot see it in
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/log/driver=
s/media/usb/uvc?h=3Dlinux-7.0.y

Regards!

On Thu, 16 Jul 2026 at 09:17, Jay Chooi <jay@robocurve.org> wrote:
>
> Hello,
>
> We are hitting a reproducible, unkillable deadlock in uvcvideo's
> status-event / power-management path on v7.0.6 (Ubuntu 7.0.0-27-generic);
> by code inspection the same paths are present in current mainline.
>
> Hardware: 2x Intel RealSense D405 (8086:0b5b) and 1x D435 (8086:0b07) on
> the same host. The trigger is ordinary control access (exposure /
> auto-exposure, which these devices expose as asynchronous, auto-update
> controls). With camera firmware 5.15.1.55 one unit wedged on most control
> accesses and the other rarely; after updating both to firmware 5.17.3.10
> the deadlock became deterministic on both =E2=80=94 the newer firmware ap=
pears to
> deliver the control-change status interrupt more reliably, hitting the
> race window every time.
>
> Analysis
> --------
>
> uvc_ctrl_set_handle() takes a PM reference (uvc_pm_get) for a pending
> asynchronous control, released by uvc_ctrl_clear_handle() -> uvc_pm_put()
> when the control-change status event arrives. That release runs inside
> uvc_ctrl_status_event(), which is reached from two contexts where droppin=
g
> the LAST status user deadlocks:
>
> 1. From the async worker uvc_ctrl_status_event_work():
>    uvc_pm_put -> uvc_status_put (takes status_lock) -> uvc_status_stop ->
>    cancel_work_sync(&dev->async_ctrl.work) =E2=80=94 cancelling the work =
item it
>    is currently executing in. It waits for itself forever while holding
>    status_lock.
>
> 2. From uvc_status_stop() itself, via the synchronous flush
>    ("if (cancel_work_sync(&w->work)) uvc_ctrl_status_event(...)"):
>    the same put chain re-acquires status_lock, which the caller
>    (uvc_status_put/uvc_status_suspend) already holds. Self-deadlock on a
>    non-recursive mutex.
>
> Once either happens, every subsequent open/ioctl blocks in
> uvc_status_get() on status_lock (unkillable D state), and
> uvc_status_unregister() -> uvc_status_suspend() blocks the USB disconnect
> path, which in turn wedges the hub workqueue (usb_hub_wq in D state) =E2=
=80=94
> after that no device on the hub can enumerate and only a reboot recovers.
> System shutdown also hangs indefinitely waiting on the D-state tasks.
>
> Hung-task stacks (Ubuntu 7.0.0-27-generic)
> ------------------------------------------
>
> Blocked ioctl side:
>   uvc_v4l2_unlocked_ioctl+0x97/0x190 [uvcvideo]
>   uvc_status_get+0x1d/0x90 [uvcvideo]
>
> Blocked worker side:
>   Workqueue: events uvc_ctrl_status_event_work [uvcvideo]
>   uvc_ctrl_status_event_work+0x22/0x90 [uvcvideo]
>   uvc_ctrl_status_event+0x77/0x180 [uvcvideo]
>   uvc_pm_put+0x12/0x40 [uvcvideo]
>   uvc_status_put+0x6d/0x80 [uvcvideo]
>   uvc_status_stop.part.0+0x22/0xb0 [uvcvideo]
>
> (Full traces available on request.)
>
> Workaround we validated
> -----------------------
>
> A local module parameter that skips arming the status interrupt endpoint
> in uvc_status_init() (no events -> no worker -> no deadlock) eliminates
> the hang across repeated control-access stress on both firmware versions.
> Expected side effect confirmed: pending async controls are then never
> cleared (GET on them returns -EBUSY indefinitely), so this is a
> workaround, not a fix.
>
> Downstream report:
> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2160752
>
> It looks like dropping the pending-async-control PM reference must not
> synchronously stop the status URB from the event-delivery contexts =E2=80=
=94
> e.g. defer the final uvc_status_stop() when current_work() =3D=3D
> &dev->async_ctrl.work, and avoid re-entering uvc_status_put under
> status_lock in the synchronous-flush path. Happy to test patches; the
> setup reproduces the deadlock within seconds.
>
> Reported-by: Jay Chooi <jay@robocurve.org>



--=20
Ricardo Ribalda
