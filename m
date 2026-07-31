Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C5D437454
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 15:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785510914; cv=none; b=JPidc4Ad9to7vNi3teS1uZSv10frGMbI70SJV2YuWKOnWUjnaT1Ur1Tc0jSzRahd8wzzywZ1pFw70c22QXMedmp99RAynfRH9voa3n20BKvsYsc4Lvhxm5OSEMHs7r14w3RcBrPe6FEqmSdGNQnTzq1RowXG/VZoS+DeShDZ+EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785510914; c=relaxed/simple;
	bh=A3noVpkk4le+S0U8Rri7M6Js4eWHNKTb7JBke706bxk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T1fMhhX6bVF6k7a2qrS8MC3JVLrhtv85wPVYs2/2QvounnzUncN7Rdtgt2lRx+nDk00yNDRIyR1gGhpxd30qAP86e6Uiac2R90zLMhpqW1nmlhUrdTk3n/ItnX/JDBCS/vuAiBuG1iRqeAfV9ykovz5qLVVxGWjmQylTLJj0saY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Obhhb9DT; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Obhhb9DT"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-81f3b227a4aso16788807b3.1
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 08:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785510911; x=1786115711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YQqtFdxzNfQ2GMY5lHTyx8q45qE8mZiIcTjEqgZzs3I=;
        b=Obhhb9DTolFf+HwKG9lO9v75jQdPEHKnTqS8OZfzcQ1kiY3mVEbPBtDsd+wd+02WgY
         dNFpylfQ14nf1lnCHidoAVDFIOpLqTFK2Smo/ISb9C6CsiftLo1PokyqaDa1+4yf3VK0
         vzBe2kz2p/HhOlgAeAsqWvdZumXJwrXB/MYODOHpcsGehRXEeGpuEsyJjbR8p1x9qd6k
         wZ0YC6C+jyUSiQyNmop3RKNzVq8qggOJIuPqxsfWy1YI8cJWR3awIFbsN2374YYNTXIo
         uHeem0/1A9shRf4K+/zuK62YQCTXPaFCuc7rck9ieSnf44TulqJLZed8Rkb2ZgSOQnUs
         iSZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785510911; x=1786115711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YQqtFdxzNfQ2GMY5lHTyx8q45qE8mZiIcTjEqgZzs3I=;
        b=ntlVxT9e0gnV7PVIXz9zVt7CrI+bsBSiocp1O7Y6ZqaNg+s77xsyukIRImtHa2/xno
         4kRV+VfCeR/wJ9aPBC6bQCamnPx92V0h3nk1qoZxWqz5vj6S70gbA5IIkboOh86AonXO
         j7ozPNiUxOJb/hiRUWm7hxTtjB7N772eZ4PNGp49ToBnCjl3kn2WMAi2g5y4m9/9UVWd
         OpBj+p0Vj08vc2t2S8QnX3VaCDYwbNzoWwklJ9oXVrlik/2VM0zqcp9V/RSQ7Q5nEOIS
         6QowRj8cXzsPjf4zYyEQ57eM1RWaDS/WDrz6WMELdXkqiNyxalTa3Q5dMBcrswxk/39M
         lq8Q==
X-Forwarded-Encrypted: i=1; AHgh+RpkJ3wleKhBNa5d7AQWTwPiI0KVR+HqpN0LxwT5lzJiPSkxf0BNvXnPdWZpKfK5hlH4I2zpuqEG5PrYPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmXJQW20hAPIZ7t+JlkQp8epnT0uEwccGdBXd3cGAgDkUFv3wr
	npVNF/N4rcNkHo1Iaa3+PSYMdFwmAgFSc0u63d+S/nxvnQ6ZjHifrZA8
X-Gm-Gg: AR+sD12ZM7F03qzmX8dXxAW6uVBXCf92SLkmc0KNtoM0LTpfpzI6Nd2VgAVw7xNtkcf
	yvs5k1s8rzBdcsb0w5VJtGP6kz5o0Ly7lp6nHoy2dNMMtVYqIdr6yZ+y8E1JJ5ui5GyqMPdh+8U
	z4IWaYYdZUuUUzm372Ibrg2Jny/M0zMEdqQqxAM/HAj8WHhhjvlaDPc14RKKbX4kBCnZFWy3JXW
	K7Q857y8jj74egl5ddM0MZsZ3EoAxao75+21WWyAhXaJ8paskFLPO0x+upiAQrmBV/UQKfgdSs8
	ud0QtZPhC1NYkZ4ao24SC2RlcrY38UdsQlswwq7ccWQZRxrU0wXf6zr40KqOPcCzZVKOeioX//X
	1V8Y4M81IOYO91mthrRoOnNfYwZWpVmw3n11UC+h8mIiY2GpiuzBsXq0m1M5lamBmm6YVUOOseS
	HYk1vQivI9x2eQWAcnjjsiD3b9PjaSD+EVIXMDvbo3WnbfF45h8KpDYbwCGA==
X-Received: by 2002:a05:690c:4442:b0:81e:c972:e8c3 with SMTP id 00721157ae682-81fd4ba85d1mr2580787b3.29.1785510911223;
        Fri, 31 Jul 2026 08:15:11 -0700 (PDT)
Received: from llmbox.. ([38.81.85.65])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fcd0d6995sm8212147b3.32.2026.07.31.08.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 08:15:10 -0700 (PDT)
From: Michael Jordan <jordan.mymail@gmail.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: laurent.pinchart@ideasonboard.com,
	hansg@kernel.org,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: query pan/tilt position from the device on every read
Date: Fri, 31 Jul 2026 11:15:09 -0400
Message-ID: <20260731151509.577383-1-jordan.mymail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CANiDSCsyVYanm5MowQv5-rGy1EYs080WRsZYJCT=J=SesPFnjQ@mail.gmail.com>
References: <CANiDSCsyVYanm5MowQv5-rGy1EYs080WRsZYJCT=J=SesPFnjQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ricardo,

On Fri, 31 Jul 2026 10:33:02 +0200, Ricardo Ribalda <ribalda@chromium.org> wrote:
> Dear Michael Jordan
>
> (I always wanted to start an email like that :P)

Happy to have been able to help with that.

> I am not against the idea proposed by this patch, but I would like to
> understand your use case a bit better. Do you want to know where the
> camera is because:
> - You want to do something continuously with that info (e.g., tagging
> frames with the live position)?
> - Or because you just want to know when the camera has actually
> finished moving?

The former. The application computes framing adjustments from the
current pose -- "move 10 degrees left of wherever you are now" needs
to know where "now" is -- and shows live position while the gimbal
moves. A single end-of-move notification would not be enough even for
the commanded-move case, and it does not exist at all for the
autonomous one, which brings me to:

> You also mentioned that the camera can reposition itself. Do you mean
> that the camera could be tracking something and decide to move on its
> own?

Yes, exactly that. This camera (and similar PTZ conference cameras)
has on-device AI tracking: once enabled, the gimbal follows a person
continuously, for minutes at a time, with no host involvement at all.
While tracking is active the position is a continuously varying
quantity with no SET_CUR in flight and no "end of movement" to
report. That is the case that made me give up on every event-shaped
mechanism:

> If it is the latter, you could use V4L2 control events. That should
> work perfectly for signalling the end of a move:

Three separate things go wrong, in increasing order of stubbornness:

- uvcvideo's device-originated control events come from exactly one
  place, uvc_ctrl_status_event(), fed by the Control Change
  interrupt, and the spec only promises that interrupt "at the end of
  the movement" (4.2.2.1.15). So even a perfect device yields one
  event per move, not a trajectory.

- This device never emits the interrupt at all. GET_INFO on
  CT_PANTILT_ABSOLUTE_CONTROL returns 0x03 -- neither D3 (Autoupdate)
  nor D4 (Asynchronous) -- so the event path has nothing to deliver.
  (Arguably a firmware defect per 2.4.4, but it looks systemic: the
  value is identical across every CT control on this device, so the
  firmware is not computing it per control.)

- Under autonomous tracking there is no end of movement, so even
  compliant firmware would have nothing to hook the event to.

> - Because your patch uses UVC_CTRL_DATA_CURRENT for the
> read-modify-write path, the control will send (100, 300). That will
> unintentionally move both axes, yanking the PAN back to 100 and
> fighting the camera's autonomous tracking.

The behaviour is real, but the patch does not introduce it: the write
path is byte-identical before and after. What the RMW merges against
today is decided by the device's GET_INFO bits, and both outcomes you
are weighing already ship:

- On a device whose GET_INFO clears AUTO_UPDATE (this one),
  ctrl->loaded stays set after the commit, so the tilt write merges
  against the cached setpoint and sends (100, 300) -- your scenario,
  reproduced exactly, on an unpatched kernel.

- On a device that reports Autoupdate, uvc_ctrl_commit_entity()
  clears ctrl->loaded, so the tilt write does a fresh GET_CUR and
  merges against live data, sending (200, 300) -- kind to the
  tracker, but this is the variant that cancels a move the *user*
  commanded: issue two single-axis writes a few tens of milliseconds
  apart, and the second merges against a live reading in which the
  first axis has barely left its old position, and commits it right
  back.

I have measured that second failure on real hardware (this camera
keeps AUTO_UPDATE when probed while asleep, since it does not answer
GET_INFO in that state -- its own small horror story): S_CTRL(pan),
then S_CTRL(tilt) ~20ms later, and pan is yanked back to where it
started. Same hardware with AUTO_UPDATE cleared, both axes reach
their targets. Both merge sources are in the tree today; the patch
adds neither and removes neither.

If anything the patch improves your scenario slightly on Autoupdate
devices: reads no longer set ctrl->loaded, so the write path can no
longer merge against a stale sample frozen in the cache by an
earlier G_CTRL.

> What I think we should do instead is manage the cache validity based
> on who "owns" the control. For ASYNCHRONOUS controls that have an
> active handle (i.e., a user-commanded move that has not completed), we
> mark them as "loaded". But when they are owned/updated by the device
> autonomously, we never mark them as loaded.

I think ownership is the right frame -- for the write path. Which
merge source is correct genuinely depends on who owns the control:
while a user move is in flight, the setpoint (live data cancels the
move); while the device owns it, live data (the setpoint fights the
tracker). That is a real pre-existing problem, your scenario is a
good demonstration of one horn of it, and I would be glad to help fix
it. But I do not think it can replace this patch, for the reason you
already identified:

> This specific logic still doesn't support polling the live mid-flight
> position of a user-commanded move, but maybe V4L2 events can cover
> your actual use case?

Right -- and the mid-flight (or mid-tracking) position is the entire
use case. However the write path picks its merge source, G_CTRL still
has to report the actual position, which is what this patch does
without touching the merge at all. The two compose: an ownership-
based write path plus a live read path leaves nothing stale anywhere.

Two practical notes on the pseudo-code:

> - ctrl->loaded = 1;
> + if (!FLAG_AUTO_UPDATE)
> + ctrl->loaded = 1;

__uvc_ctrl_load_cur() fills UVC_CTRL_DATA_CURRENT, which is the RMW
source, so with this hunk every load puts live data where the write
path merges -- the user-move cancellation above, now unconditional on
every Autoupdate device. Keeping the live value in a buffer of its
own is precisely how the patch avoids creating that. Separately,
anything keyed on AUTO_UPDATE or ASYNCHRONOUS will not trigger on
this device, since GET_INFO reports neither -- one reason the patch
uses a static table flag that uvc_ctrl_get_flags() does not rewrite.
The ownership logic would also need a completion signal for "the move
has finished", and the only candidate is the Control Change interrupt
this firmware never sends.

Happy to respin if you would like any of this argued in the commit
message itself -- the autonomous-tracking use case in particular is
probably worth stating there rather than in a reply.

Thanks again for the review.

Best regards,
Michael Jordan
