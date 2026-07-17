Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3578E13635E
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 01:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784253551; cv=pass; b=lxR5UMMbOVF7RokUpuZufs7UxS/OIisY/g1th50FSkRAet68tElqLx+BUYHZgm6P4Q4Odvnk3No4rGCq0rTU8HCL0Q49AvVMuY1bzf9sF05xVLE13Nazzd4Nysu+F0yEvOXZ6au0tS1YQwGhky4/ee1VHvC4x4t1WsQc+oJ9MkY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784253551; c=relaxed/simple;
	bh=VwhE0UN/mD3XXncQEpfLjtdV/LM5gmWs63Z3cHQgLao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cwbpYieSq3CKZivFmyFKJcOGos0WRA93yji+MwJyH8eK9W5OOvt9ErDtxY4sfmQuAYwp0xQqfF/4s+1+QiHVJTNoky3DaLnbmZcDB5oy8KUTeH078lZKqx9xG1XOp1l6phD77ioG9dV4s3zACvPonKMPF5D7FYuQCETSv2T6zo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=robocurve.org; spf=pass smtp.mailfrom=robocurve.org; dkim=pass (2048-bit key) header.d=robocurve.org header.i=@robocurve.org header.b=GINX/VcE; arc=pass smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=robocurve.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=robocurve.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=robocurve.org header.i=@robocurve.org header.b="GINX/VcE"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso5261388a12.0
        for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 18:59:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784253549; cv=none;
        d=google.com; s=arc-20260327;
        b=UuTDycSzxQA+lqzh1D9ttz6WLMwUwJW4n7bsJki3Bv0QaqNtQLuJgJHF09/yGWYYrd
         qNWpt9lHr99qE1Rm3W2DZmGNu8sjUGDJ4nDXwXNcEreiSxkjwRu1Xm5kCUBl8xOY0D7V
         8O7NraXic1IYJyp4a5bPSOuQe9dRZu84JMXv8ezJPey2cNkr7VUq3jINP3Vlc2QpZuuS
         p0N1PCXXTbItCvbb52YVn+bVQwgZzjQdwh3ccWMks9Ifr7mGgJkbuotx6Pj7ZVNgLFE8
         7lgpmGUIW1SiGn42xomh/DYvkSNzBbAkDTUdx3Bipmrbn+8+qu5+SGQvpe9TkTE0PazT
         C8RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wy7iNtcMbvl9JQwCnnQADWVzyWbSwFGj6myL3HVVG6M=;
        fh=YX9VosvAgcgCFyMqieyq10H3DWdfgHuOCrU1YHdR7Os=;
        b=QSaxmw3XkhwDlK2wKwbpFbVgtYe8wBZrvAc869y855qS5RDWBoPb0jtVvC8pcmCkTL
         QyalBRdapR/iSXP69++8LkDo2S8+xQItlWrDuDZwBpj4Cp39uOKo41kMRT9rlDKMT7eO
         lTPedvyTuDpeLiq8kL+N4GUMoAmOngQs7U23wR+x3zd8Ab0YFKfUD6OWJSiUKT+BbYyZ
         AdI99x5eT/PwrAUUSul6WqX6oPqZSmVCJjHpVb8U3elfxkQ79MY3h1IUFRzchi/bnCVb
         Gh4WqwV4TC90Tr1s86V1kqC63v/bTMQ+cwd/S47c6T4Fp0rJbW9+Y7Gu0HE99RcZ6TiA
         bKnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=robocurve.org; s=google; t=1784253549; x=1784858349; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wy7iNtcMbvl9JQwCnnQADWVzyWbSwFGj6myL3HVVG6M=;
        b=GINX/VcEtNcprxKHyF1oV8PTl2/RH1P6cG3n81NIN2F5QM0NKHZAuD6RLRbeFET/hm
         CMrfIPFmGjwdRe7hjsv66oFnP74VWCrnLG5xSj/oJJTrlqv+YWYwMOu7K80NNE3TOUdP
         9mo63N3CiWKmZ/gwhuYGJTmayYDKj734MNtBhzwpmP8fhUlc5pVP9OwKhsSVolc7K0Ge
         Wv+Bv8jVSyw2ZcCPjhZDlMnc5/l7ZLvUXPRnlZqEfMQIPXo18lXm9r2WtEie16G+rZzH
         30LRjI7bh87yZuGBHXRsU2Uxy8CVsQQxqKuhyzipN6hVhiP/VWUyp96Fnxi2REf/yrXi
         WCXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784253549; x=1784858349;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wy7iNtcMbvl9JQwCnnQADWVzyWbSwFGj6myL3HVVG6M=;
        b=dfsxAeZ9rLH3UkgB/1VimtH66DKbU1dko/pa1m0OQn0KGHzIfTob1p6FMKNqjiSW+l
         e1X7WJo21+T+jZWAws86JNuvKLaz6MpQBPv/gN7WQAfqpao511g0KBammnyPxYybu3EG
         FurH/A92/mfnwd+zgeKa1gXDolJbkODURHR28j0Gm15V1Jsl/mLcw+hqYWHM510heLWm
         1tb2RDPTtjqJUXRgQTSYC/agS/ix4b3Fq+YKscpyAAe8C1yWwnu2hygPR01fwVHLHYRV
         41gsnuaAwtWzzm6qmjFwxDTc/i/Y/iL7TPY/em4Wbv8lGBm33LM6uK/xdVT/XmtTNAud
         a8iw==
X-Gm-Message-State: AOJu0YxMcs0SyrKiRQNfk45f9pFmB+JW5z76tf+DflIbeetrIWdo7z0y
	ZiU+y2MiZU51/frjDzeZJ0uo32jiXlLn9gLD9p9lRbap4d/OgvmgSdYg47DtxbVZ7KWhtV774wc
	E5PzOPZh6JWAsUvaxxO4P4nWUm/UkqOKVCRJ4o0wQqn8=
X-Gm-Gg: AfdE7cl1Kc7X6k926gW5MbHVOUUS/AcPOOlIMcX1CYA5rLvIhcNqvDTXAvyJO74biST
	AETh9yngoFOk4uHsFg0Foo/QDZUEes6WB70raqHzrOgnQNBWfl2wcFNNXN/698mHfAEaLv3jOHS
	8sl6nH+vKNSe/xjeRWN4bscCAmJRNDXcITaY+Ofbk5HGd4KBn83wO4/eCJoOPgWA7FllO+pk5sN
	NFPDMB9H1zM7Bp4kz0tJlkZ+0hMqfjZ5ow+GV79NgmlvJp0HWTysdoe3kaou9Y=
X-Received: by 2002:a05:6a21:9206:b0:3bf:a7d5:df38 with SMTP id
 adf61e73a8af0-3c3ad5d4f8emr547146637.9.1784253549346; Thu, 16 Jul 2026
 18:59:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAL+2LXtmekL+oc8e48uUXL_2SXvfCc_v7MrHJ6JDh9usRHu0sQ@mail.gmail.com>
 <CANiDSCukMqtarMGb3F0Nf3TfTB7TxHDeWu776StV+0q5q1VSVQ@mail.gmail.com>
In-Reply-To: <CANiDSCukMqtarMGb3F0Nf3TfTB7TxHDeWu776StV+0q5q1VSVQ@mail.gmail.com>
From: Jay Chooi <jay@robocurve.org>
Date: Thu, 16 Jul 2026 18:58:58 -0700
X-Gm-Features: AUfX_mzyPIzgQIpI9ogp6ybstUAZ_QKjIhN-4fzmlNH8MuvMHIF5lhcN9Vfayl0
Message-ID: <CAL+2LXvV66O_qvbrHeFyHGjreyart277PgfKVK7jKfJ-MXihbw@mail.gmail.com>
Subject: Re: uvcvideo: deadlock when async control drops the last PM reference
 from the status-event path
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com, 
	hansg@kernel.org, mchehab@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Can you check if this patch is part of your kernel?

It is not. Ubuntu 7.0.0-27-generic (based on v7.0.6) has no uvcvideo
changes on top; disassembly of the shipped module shows no current_work()
check in uvc_status_stop() and no flush_work() in uvc_status_start().
The deadlock reproduces there on every async control sequence with our
D405s on camera firmware 5.17.3.10.

> It landed in 7.1 but I cannot see it in
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/log/driv=
ers/media/usb/uvc?h=3Dlinux-7.0.y

Confirmed missing from linux-7.0.y. I backported 6d27f92c54ce alone onto
the 7.0.0-27 tree as an out-of-tree module and re-ran the same stress on
the same hardware: no hang across 15/15 apply/verify cycles, and async
control readback completes, where the unpatched module hung unkillably on
the first attempt. Please queue it for linux-7.0.y; it carries
Cc: stable and Fixes: a32d9c41bdb8, which is in 7.0. Also requested for
the Ubuntu kernel in
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2160752

Tested-by: Jay Chooi <jay@robocurve.org>

One thing I noticed while reading the code: the synchronous flush in
uvc_status_stop() ("if (cancel_work_sync(&w->work))
uvc_ctrl_status_event(...)") still runs the event handler under
status_lock. If that event clears a pending async control handle,
uvc_pm_put() -> uvc_status_put() re-acquires status_lock on the same
thread. All our hung-task traces were the worker-side path that
6d27f92c54ce fixes, so this may be unreachable in practice, but it looked
worth a second pair of eyes.

Best regards,
Jay

On Thu, Jul 16, 2026 at 12:27=E2=80=AFAM Ricardo Ribalda <ribalda@chromium.=
org> wrote:
>
> Hi Jay,
>
> Thanks for the detailed report.
>
> Can you check if this patch is part of your kernel?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/drivers/media/usb/uvc?id=3D6d27f92c54ce28cfbd2a8a479a96d6f4a781b7d2
>
> It landed in 7.1 but I cannot see it in
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/log/driv=
ers/media/usb/uvc?h=3Dlinux-7.0.y
>
> Regards!
>
> On Thu, 16 Jul 2026 at 09:17, Jay Chooi <jay@robocurve.org> wrote:
> >
> > Hello,
> >
> > We are hitting a reproducible, unkillable deadlock in uvcvideo's
> > status-event / power-management path on v7.0.6 (Ubuntu 7.0.0-27-generic=
);
> > by code inspection the same paths are present in current mainline.
> >
> > Hardware: 2x Intel RealSense D405 (8086:0b5b) and 1x D435 (8086:0b07) o=
n
> > the same host. The trigger is ordinary control access (exposure /
> > auto-exposure, which these devices expose as asynchronous, auto-update
> > controls). With camera firmware 5.15.1.55 one unit wedged on most contr=
ol
> > accesses and the other rarely; after updating both to firmware 5.17.3.1=
0
> > the deadlock became deterministic on both =E2=80=94 the newer firmware =
appears to
> > deliver the control-change status interrupt more reliably, hitting the
> > race window every time.
> >
> > Analysis
> > --------
> >
> > uvc_ctrl_set_handle() takes a PM reference (uvc_pm_get) for a pending
> > asynchronous control, released by uvc_ctrl_clear_handle() -> uvc_pm_put=
()
> > when the control-change status event arrives. That release runs inside
> > uvc_ctrl_status_event(), which is reached from two contexts where dropp=
ing
> > the LAST status user deadlocks:
> >
> > 1. From the async worker uvc_ctrl_status_event_work():
> >    uvc_pm_put -> uvc_status_put (takes status_lock) -> uvc_status_stop =
->
> >    cancel_work_sync(&dev->async_ctrl.work) =E2=80=94 cancelling the wor=
k item it
> >    is currently executing in. It waits for itself forever while holding
> >    status_lock.
> >
> > 2. From uvc_status_stop() itself, via the synchronous flush
> >    ("if (cancel_work_sync(&w->work)) uvc_ctrl_status_event(...)"):
> >    the same put chain re-acquires status_lock, which the caller
> >    (uvc_status_put/uvc_status_suspend) already holds. Self-deadlock on =
a
> >    non-recursive mutex.
> >
> > Once either happens, every subsequent open/ioctl blocks in
> > uvc_status_get() on status_lock (unkillable D state), and
> > uvc_status_unregister() -> uvc_status_suspend() blocks the USB disconne=
ct
> > path, which in turn wedges the hub workqueue (usb_hub_wq in D state) =
=E2=80=94
> > after that no device on the hub can enumerate and only a reboot recover=
s.
> > System shutdown also hangs indefinitely waiting on the D-state tasks.
> >
> > Hung-task stacks (Ubuntu 7.0.0-27-generic)
> > ------------------------------------------
> >
> > Blocked ioctl side:
> >   uvc_v4l2_unlocked_ioctl+0x97/0x190 [uvcvideo]
> >   uvc_status_get+0x1d/0x90 [uvcvideo]
> >
> > Blocked worker side:
> >   Workqueue: events uvc_ctrl_status_event_work [uvcvideo]
> >   uvc_ctrl_status_event_work+0x22/0x90 [uvcvideo]
> >   uvc_ctrl_status_event+0x77/0x180 [uvcvideo]
> >   uvc_pm_put+0x12/0x40 [uvcvideo]
> >   uvc_status_put+0x6d/0x80 [uvcvideo]
> >   uvc_status_stop.part.0+0x22/0xb0 [uvcvideo]
> >
> > (Full traces available on request.)
> >
> > Workaround we validated
> > -----------------------
> >
> > A local module parameter that skips arming the status interrupt endpoin=
t
> > in uvc_status_init() (no events -> no worker -> no deadlock) eliminates
> > the hang across repeated control-access stress on both firmware version=
s.
> > Expected side effect confirmed: pending async controls are then never
> > cleared (GET on them returns -EBUSY indefinitely), so this is a
> > workaround, not a fix.
> >
> > Downstream report:
> > https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2160752
> >
> > It looks like dropping the pending-async-control PM reference must not
> > synchronously stop the status URB from the event-delivery contexts =E2=
=80=94
> > e.g. defer the final uvc_status_stop() when current_work() =3D=3D
> > &dev->async_ctrl.work, and avoid re-entering uvc_status_put under
> > status_lock in the synchronous-flush path. Happy to test patches; the
> > setup reproduces the deadlock within seconds.
> >
> > Reported-by: Jay Chooi <jay@robocurve.org>
>
>
>
> --
> Ricardo Ribalda
