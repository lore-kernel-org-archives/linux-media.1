Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF5F44CF3E
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 17:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785518112; cv=none; b=dHHxtAT4uyDb0Q7tYHgWuYdz8KnpP5TvJS+t5cgzGs3qNQzX/OxBG0pxq9m21JqOT9m2+A1ZLloWIJLmJjmqyNCl3gLI6/1DveeBQddwLks1cY02ykF3fLxzBNT6p9kmQlD4eAYiGxQs3hn5spYVUE+SAuWJb7VJCnUnC6Ys5FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785518112; c=relaxed/simple;
	bh=1QLpiF0g+L/4fxffyh1nihJROLj9uyjTsLAgr6ZWHVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SizBshfW/LB5ovYojlkhC8PofP4qceiEhYI2q9Rz7blPESV2JT3TH2YqxEvaCw+1STYNsSHAtwCR8Tmgg8pOGN3A0qZ0e3qNp1c0VS8LrXA43KuSwhx1e94QQmTqe6N86fcEYubocFOHOLfpuS6XdJwdVnMXGH7Xc+K3pHIQUk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZDWsTc15; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZDWsTc15"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c15e592da74so145478266b.1
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 10:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785518108; x=1786122908; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CWHbeNj7ynII0HbOcpD2Ll/TXTl+Bb8IPLYdkxQF69U=;
        b=ZDWsTc15jLO6ZmpEEltNaWnPfaEAIXyf5MFKWDA/PT1xRStklCfqdQV7snBw3LEoBg
         /Cwhp3qth8h5lm7zVLCmK1t2mlpSuY3CQXf5vBYFtRsZmlg4u/GbFQRnBzJFUV6LwU71
         sv7Hl40TLrqBE7laYwpm+ldkO7qmzG6xCocy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785518108; x=1786122908;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CWHbeNj7ynII0HbOcpD2Ll/TXTl+Bb8IPLYdkxQF69U=;
        b=qKkwd06Otap7t93LHYrLqZLJiXLs4nPrhxSta2t1EW1xZBQ0pg35tB36idfd+m6qUz
         ZUj/2kK5qBn/XyR5tjslKSRw/wWopFQzHibeHejy59tzYHzobw1Q5A4WfT1GjsK5VbOE
         NYjblEx87Ws2/PLdY+lG39pTesMoB+h0EnlmEufyCS4NCC7TIzQ+X3ZtyHFuOdBa8Lw3
         rZ/fgbpNkPLhrUVX9frQEtZvpGQtT7EPFPyBbJqo0PHys5XOD+EP7r83KsjM2SQbMvyA
         qqxT/mNTMlZlcl8WZedMJ3cJ4RcN3sAxFQgQgiELoankOSglgzBSS7KqZMqPwH80aZIX
         umrw==
X-Forwarded-Encrypted: i=1; AHgh+RqX1BSFUVozqDbO8d1Xb/KU+DNem4V06DUowcYqVs/UjyEeynOx7HdXVjcDZWHRNyqsgq0ZOvMNfHYD7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk426t++Dsb/0L72hIZeSHOvxi6FoTQ4zwiRPqbvxkA2zZBLxj
	iE2G4AQj1mtRL+IP2fehsyDXlPpmMXnRoc2gEQMYH/CbTEUAorC2buiJaHk4T2QwqWjI7oZh3/7
	btH8IIo5V
X-Gm-Gg: AR+sD13SlDgUmumQo2NL/jfNnkHtUHSn/6nLDwJvvBm+y68XYNQYh1kS7HThahFPF/Z
	HZUrvVUmzyY+DHs9uoBF3cYIsC+X7CTN/qmDZviuag3VHY4KNvlOV/MIs3be2lYHPS+/LqOPUMu
	t/oGcvs9lJ9Z8fOl2mwn45z37S7SQSsNni/HQp+Md8KFB+QWBb9CdBVkITeDqu/gjNW6zgRztgw
	8/bgIeksBluP1UWh/nZukWuJAusVZekfhCRHgPPm/1QU2asAHaoVj9/LapTLJcZx4S1NbayAVDL
	5oX4SdRM7Eyp/Gz184jN4feTFV/WuF1Ji97t9lICjwO21SziACmwWpQHCikMV5zUeECcSHFOR91
	+ENvKl5hPh/m2bDuvw2BGOQzHp9PalHRC7Sz5BIP4DJK6fT5pPvQC5GS1BrCW6OM0qxDzpRryHv
	UJtcJEsxb/1Z+2ZDVC/LTZWRCqroOzrmY8eC/Me1wKn2+6FdfWOM94QXkxN/ylaUpB4akOa2L6L
	axKFei0mXJDJ/7SDtFZ643JPv4Ebh18nOCb
X-Received: by 2002:a17:907:ea93:b0:c15:b96f:c3d1 with SMTP id a640c23a62f3a-c1fe81693fbmr33614866b.41.1785518108250;
        Fri, 31 Jul 2026 10:15:08 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd3c5b0fasm229773566b.5.2026.07.31.10.15.06
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 10:15:06 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c15d3cd51b2so166535866b.3
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 10:15:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Roiv4X8uUIs8l7+sS8GB3BH2X+EJ934KgFKAFyFy0rHFniC6WM+9UJRLRj6gftPKYITAWZj381Ra4G9jA==@vger.kernel.org
X-Received: by 2002:a17:907:3f86:b0:c12:8a3f:3e16 with SMTP id
 a640c23a62f3a-c1fe81aa3acmr34247966b.44.1785518105065; Fri, 31 Jul 2026
 10:15:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiDSCsyVYanm5MowQv5-rGy1EYs080WRsZYJCT=J=SesPFnjQ@mail.gmail.com>
 <20260731151509.577383-1-jordan.mymail@gmail.com>
In-Reply-To: <20260731151509.577383-1-jordan.mymail@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 31 Jul 2026 19:14:51 +0200
X-Gmail-Original-Message-ID: <CANiDSCsS-JJrGMaoBqR-XX54dtp_uQEVVSct-BWL0gQNL4OfRQ@mail.gmail.com>
X-Gm-Features: AUfX_mwYOmwSbxw3Eo2bwtDzMIMVebI1MDxhxfTh6qrbVr0JqHt4D8Ts4ZyL2E8
Message-ID: <CANiDSCsS-JJrGMaoBqR-XX54dtp_uQEVVSct-BWL0gQNL4OfRQ@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: query pan/tilt position from the device
 on every read
To: Michael Jordan <jordan.mymail@gmail.com>, Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: laurent.pinchart@ideasonboard.com, hansg@kernel.org, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Michael

On Fri, 31 Jul 2026 at 17:15, Michael Jordan <jordan.mymail@gmail.com> wrote:
>
> Hi Ricardo,
>
> On Fri, 31 Jul 2026 10:33:02 +0200, Ricardo Ribalda <ribalda@chromium.org> wrote:
> > Dear Michael Jordan
> >
> > (I always wanted to start an email like that :P)
>
> Happy to have been able to help with that.
>
> > I am not against the idea proposed by this patch, but I would like to
> > understand your use case a bit better. Do you want to know where the
> > camera is because:
> > - You want to do something continuously with that info (e.g., tagging
> > frames with the live position)?
> > - Or because you just want to know when the camera has actually
> > finished moving?
>
> The former. The application computes framing adjustments from the
> current pose -- "move 10 degrees left of wherever you are now" needs
> to know where "now" is -- and shows live position while the gimbal
> moves. A single end-of-move notification would not be enough even for
> the commanded-move case, and it does not exist at all for the
> autonomous one, which brings me to:

How accurate does the mapping frame/position need to be?

You do not know how big the camera pipeline is. Maybe you are
processing frame NOW-4 when you read position  NOW

>
> > You also mentioned that the camera can reposition itself. Do you mean
> > that the camera could be tracking something and decide to move on its
> > own?
>
> Yes, exactly that. This camera (and similar PTZ conference cameras)
> has on-device AI tracking: once enabled, the gimbal follows a person
> continuously, for minutes at a time, with no host involvement at all.
> While tracking is active the position is a continuously varying
> quantity with no SET_CUR in flight and no "end of movement" to
> report. That is the case that made me give up on every event-shaped
> mechanism:
>
> > If it is the latter, you could use V4L2 control events. That should
> > work perfectly for signalling the end of a move:
>
> Three separate things go wrong, in increasing order of stubbornness:
>
> - uvcvideo's device-originated control events come from exactly one
>   place, uvc_ctrl_status_event(), fed by the Control Change
>   interrupt, and the spec only promises that interrupt "at the end of
>   the movement" (4.2.2.1.15). So even a perfect device yields one
>   event per move, not a trajectory.

And we rely on that interrupt to know when the device is done and we
can go to sleep.

>
> - This device never emits the interrupt at all. GET_INFO on
>   CT_PANTILT_ABSOLUTE_CONTROL returns 0x03 -- neither D3 (Autoupdate)
>   nor D4 (Asynchronous) -- so the event path has nothing to deliver.
>   (Arguably a firmware defect per 2.4.4, but it looks systemic: the
>   value is identical across every CT control on this device, so the
>   firmware is not computing it per control.)

If the device is not setting the Asynchronous I think we have bigger
problems to deal with.

Without the async, the device will go to sleep as soon as you set the
control (if you are not streaming).

You definitely have to ping the vendor to make sure they fix their firmware.

>
> - Under autonomous tracking there is no end of movement, so even
>   compliant firmware would have nothing to hook the event to.

If AUTO_UPDATE is present you would get fresh data when you poll the control.

>
> > - Because your patch uses UVC_CTRL_DATA_CURRENT for the
> > read-modify-write path, the control will send (100, 300). That will
> > unintentionally move both axes, yanking the PAN back to 100 and
> > fighting the camera's autonomous tracking.
>
> The behaviour is real, but the patch does not introduce it: the write
> path is byte-identical before and after. What the RMW merges against
> today is decided by the device's GET_INFO bits, and both outcomes you
> are weighing already ship:
>
> - On a device whose GET_INFO clears AUTO_UPDATE (this one),
>   ctrl->loaded stays set after the commit, so the tilt write merges
>   against the cached setpoint and sends (100, 300) -- your scenario,
>   reproduced exactly, on an unpatched kernel.
>
> - On a device that reports Autoupdate, uvc_ctrl_commit_entity()
>   clears ctrl->loaded, so the tilt write does a fresh GET_CUR and
>   merges against live data, sending (200, 300) -- kind to the
>   tracker, but this is the variant that cancels a move the *user*
>   commanded: issue two single-axis writes a few tens of milliseconds
>   apart, and the second merges against a live reading in which the
>   first axis has barely left its old position, and commits it right
>   back.

unrelated note: if you need to set the two axis at the set time, you
can use  V4L.VIDIOC_S_EXT_CTRLS
https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/vidioc-g-ext-ctrls.html#c.V4L.VIDIOC_S_EXT_CTRLS

(You probably are aware of it, just want to make sure that you know it exists).

In fact you could use that today to avoid part of the kernel issue.
Always send pan and tilt when you are tracking the movement.

>
> I have measured that second failure on real hardware (this camera
> keeps AUTO_UPDATE when probed while asleep, since it does not answer
> GET_INFO in that state -- its own small horror story): S_CTRL(pan),
> then S_CTRL(tilt) ~20ms later, and pan is yanked back to where it
> started. Same hardware with AUTO_UPDATE cleared, both axes reach
> their targets. Both merge sources are in the tree today; the patch
> adds neither and removes neither.
>
> If anything the patch improves your scenario slightly on Autoupdate
> devices: reads no longer set ctrl->loaded, so the write path can no
> longer merge against a stale sample frozen in the cache by an
> earlier G_CTRL.
>
> > What I think we should do instead is manage the cache validity based
> > on who "owns" the control. For ASYNCHRONOUS controls that have an
> > active handle (i.e., a user-commanded move that has not completed), we
> > mark them as "loaded". But when they are owned/updated by the device
> > autonomously, we never mark them as loaded.
>
> I think ownership is the right frame -- for the write path. Which
> merge source is correct genuinely depends on who owns the control:
> while a user move is in flight, the setpoint (live data cancels the
> move); while the device owns it, live data (the setpoint fights the
> tracker). That is a real pre-existing problem, your scenario is a
> good demonstration of one horn of it, and I would be glad to help fix
> it. But I do not think it can replace this patch, for the reason you
> already identified:
>
> > This specific logic still doesn't support polling the live mid-flight
> > position of a user-commanded move, but maybe V4L2 events can cover
> > your actual use case?
>
> Right -- and the mid-flight (or mid-tracking) position is the entire
> use case. However the write path picks its merge source, G_CTRL still
> has to report the actual position, which is what this patch does
> without touching the merge at all. The two compose: an ownership-
> based write path plus a live read path leaves nothing stale anywhere.
>
> Two practical notes on the pseudo-code:
>
> > - ctrl->loaded = 1;
> > + if (!FLAG_AUTO_UPDATE)
> > + ctrl->loaded = 1;
>
> __uvc_ctrl_load_cur() fills UVC_CTRL_DATA_CURRENT, which is the RMW
> source, so with this hunk every load puts live data where the write
> path merges -- the user-move cancellation above, now unconditional on
> every Autoupdate device. Keeping the live value in a buffer of its
> own is precisely how the patch avoids creating that. Separately,
> anything keyed on AUTO_UPDATE or ASYNCHRONOUS will not trigger on
> this device, since GET_INFO reports neither -- one reason the patch
> uses a static table flag that uvc_ctrl_get_flags() does not rewrite.
> The ownership logic would also need a completion signal for "the move
> has finished", and the only candidate is the Control Change interrupt
> this firmware never sends.
>
> Happy to respin if you would like any of this argued in the commit
> message itself -- the autonomous-tracking use case in particular is
> probably worth stating there rather than in a reply.

Let's wait a bit for Laurent or HansG (or even Hans Verkuil) to comment.

There are different problems here:
1) Your firmware is broken. We need to fix the general case assuming
compliant cameras. (We can introduce a quirk later, for your device)
2) We want different behaviour based on what is happening:
   - The camera is tracking an object autonomously:
                   - Get the live values for pan and tilt and use them
as reference when we change pan or tilt
   - The camera is finalising a movement required by the user
                   - Use the pair of pain/tilt provived by the user as
reference when we change pan or tilt.

note: A firmware that sets the AUTO_UPDATE flag could be used by a
userspace that is aware of who owns the control.

I am very curious what HansV thinks.

Regards

PS: I am planning to be OOO next week so my replies will be slower.


>
> Thanks again for the review.
>
> Best regards,
> Michael Jordan



-- 
Ricardo Ribalda
