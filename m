Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0CC2F8E98
	for <linux-media@vger.kernel.org>; Sat,  1 Aug 2026 05:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785560453; cv=none; b=dzj4cENHRMTUPxtUnylDtbd0JqfO1eZ3UvHK6i7F2u3SM72R88fPni/roJpB3eRQX7SBGyBSd8m+ujMrDcTFONzucz0h7X5dEObNTTqok+tZm9h/xpIJ3v5qJ5p4O12uIJY+69T6beY3KlzbssBWpHFqLhb9i1RcHbdgkuYq03E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785560453; c=relaxed/simple;
	bh=4wyrLp/SrEeQ+/4YAQyVLPaL85K+AMmql5OMwhyIIRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jGu8s+geJD5Mjtj55UAi+VqCG9IPIBa0CyxauuZ9cPYHlb6KWEfG07uxVNJCUm3mdt/ri1RNQS9+kWDoNjAXFs967pPiBi/sdzUNlArTZ/Myvc7Qlfv0tmty+5HeVudC1pQRpwBG93P2qqSfV1neCLlLnRV1cQ6sMiYVZ9Ifw/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=plqe/DDr; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="plqe/DDr"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-80cebd41372so25396227b3.3
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 22:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785560451; x=1786165251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TY54OJ8xDORFwsmnTbHRbxsXiQngAEL2gchs9oCincE=;
        b=plqe/DDrNS7dAg0vrsbnMVQZjqPrR+PTKNCNLBEA6wf7lyOpPRiJIkbirS/XE8npn8
         43j4d/9p+s2bSEp1EA0ycSqORZQIPzoIA71bur/rvGzlniuUt1cbjl7BJoM5lm/xPyTu
         FWuMJbwV6SD4QdVDwNHDwls8dzvTg/3g4kYiIo6bJg+4TLTh5AbaiJkH4WnmmdcuQVwz
         pAGcPqyWA33JBXaQYUhCTkoOPdyr6nRvUoHC2areI7fWiRs25HuvoNA6xIGqdeUzsuC6
         YoQZY1tsf2tO2cThNP6NOdYQaPApGcVDfvHIJp7YCgrB7Mk+s7L5VGC7v7WpOPqeVtfO
         Ce6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785560451; x=1786165251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TY54OJ8xDORFwsmnTbHRbxsXiQngAEL2gchs9oCincE=;
        b=NwgkRnM0975ZO8mIUzszv2Wh3t+EKaGbFpl2uGxmE75/PZqOpTSj2NNrnLIPZUGdR6
         NTNnyj1eElBgzbX9KtvbGJSOUKvVaQhBWgxAb9qn2bKATfCaUeUMdv1mqFVvQA/TEX11
         PJ3+ZKFOLoU9s6kuxPinQV213ML8hLU/VZ1Q8oFHOHDnHT6eqzTzM736joCKGM+Nhs0l
         yMJj3VvzBLVYZcLVcw3EYLmBZOAA68/yF2VntJNXAt6Phso5ztQVTDs6FUfpmTSYImT8
         8HyNKXUbKf/IlP+HUoluXBWX0ue4LatkyC24lUTztLjwZlp2s0rgrdhKPdPwV2AKeATK
         t2Hw==
X-Forwarded-Encrypted: i=1; AHgh+RqzgSoPJg55mB0BJqTiWRIOxQ1X0XCrZOfpKxt9B0t2JZ5pE9dC0IVmQEaKzPe7QeUGIujC3Ha6a8gFpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFcevBmdp8jyR1bWu54MC49G3IP54qekvW+Ucg+wiV51FaACfz
	jPUJZ18Box/RKVSff5usRlOpY4vDj2tKpgPaWpu/k0X+FHvODaWd1h1B
X-Gm-Gg: AR+sD13Ghr0Z5BxesiQkfVU+tBfSNY9MC+mo1p0rTrGYOQCcoKBNArZ6pBRj3eWe5Od
	Eo76ydREFyOrwoTh6i80ey4TcOkjLqfFeFwmiXpootfLOTJkAu8w7Ajxq/uBc+flsOX6n+9p8Df
	bjxkOOkjUxmAmr7Kmfskyk2avXlgocvUh8peg77yVizzuSw+U1AoegarwbtD1h24IBxYKaxptQK
	CMmmcvm41JqELohyvv1FpADFVauqAhB3A6Yv9Q5fMwUcsV68GuO7XyzKzwrT8oUBzn6lcCi5Jgx
	Ah81Cz4QCBHRpzzkp5atgSLIVHXiBbidpoOSVUE+YQxTSMH35tsfPiza4BNJAX191YWF+JU8Zym
	LNJTiCbiwtArQP4n+FYKTVXwN8xdNMe7bXooh4JdREQZ0E2fuoOVCepQC3Lze/ondRQyHo957bJ
	qr3WAyeZIcZoT8byU2PDfMuX/CLLwK8Y/2OQUilfk9ANbA/UnjGQAHzceVZQ==
X-Received: by 2002:a05:690c:9b0a:b0:81e:eebb:8e4a with SMTP id 00721157ae682-81fd4ad1c05mr36507957b3.12.1785560450801;
        Fri, 31 Jul 2026 22:00:50 -0700 (PDT)
Received: from llmbox.. ([38.81.85.65])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fcd0d6301sm19005487b3.26.2026.07.31.22.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 22:00:49 -0700 (PDT)
From: Michael Jordan <jordan.mymail@gmail.com>
To: Ricardo Ribalda <ribalda@chromium.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: laurent.pinchart@ideasonboard.com,
	hansg@kernel.org,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: query pan/tilt position from the device on every read
Date: Sat,  1 Aug 2026 01:00:48 -0400
Message-ID: <20260801050049.984234-1-jordan.mymail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CANiDSCsS-JJrGMaoBqR-XX54dtp_uQEVVSct-BWL0gQNL4OfRQ@mail.gmail.com>
References: <20260725212332.64927-1-jordan.mymail@gmail.com> <CANiDSCsyVYanm5MowQv5-rGy1EYs080WRsZYJCT=J=SesPFnjQ@mail.gmail.com> <20260731151509.577383-1-jordan.mymail@gmail.com> <CANiDSCsS-JJrGMaoBqR-XX54dtp_uQEVVSct-BWL0gQNL4OfRQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ricardo,

On Fri, 31 Jul 2026 19:14:51 +0200, Ricardo Ribalda <ribalda@chromium.org> wrote:
> How accurate does the mapping frame/position need to be?
>
> You do not know how big the camera pipeline is. Maybe you are
> processing frame NOW-4 when you read position NOW

Not accurate at all, and I should have been clearer earlier: I picked
"the former" for the continuous part of your question, not for the
frame-tagging example. Nothing in my use case correlates a position
with a particular frame. The position is an input to a control loop
("where am I, so I can ask for ten degrees left of here") and a number
on a UI, and the gimbal's own time constants are hundreds of
milliseconds per move, so a few frames of pipeline skew is far below
anything that matters.

If someone did want frame-accurate pose, I agree a G_CTRL read would be
the wrong instrument entirely -- that is a per-frame metadata problem,
and this patch would not be the right vehicle for it.

> unrelated note: if you need to set the two axis at the set time, you
> can use  V4L.VIDIOC_S_EXT_CTRLS
> [...]
> In fact you could use that today to avoid part of the kernel issue.
> Always send pan and tilt when you are tracking the movement.

Thanks -- and you are right that this sidesteps the merge problem
completely, which I had not appreciated. Both mappings land in
UVC_CTRL_DATA_CURRENT before the single commit, so whatever
__uvc_ctrl_load_cur() put there is fully overwritten and it no longer
matters which source the RMW pulled from. I will switch my userspace to
always send both axes. It does not touch the read side, but it makes
the write side a non-issue for me in the meantime.

> If AUTO_UPDATE is present you would get fresh data when you poll the
> control.

One clarification for the record, since it bears on what you are asking
HansV to weigh: that holds via the interrupt rather than via the poll.
uvc_ctrl_status_event() clears ctrl->loaded, so a poll after a
notification does re-read the device -- but polls between notifications
still return the cache, because __uvc_ctrl_load_cur() returns early on
ctrl->loaded and nothing else clears it outside a commit. So on a
compliant autoupdate device the update rate is the device's signalling
rate, and for pan/tilt 4.2.2.1.15 only promises that signal at the end
of the movement. Good enough for "it stopped, here is where"; not for
sampling a trajectory. I mention it only so the comparison is accurate,
not to relitigate -- your framing of the two problems matches how I see
them.

> You definitely have to ping the vendor to make sure they fix their
> firmware.

Agreed, and I will. I am not counting on a timeline.

> Let's wait a bit for Laurent or HansG (or even Hans Verkuil) to
> comment.

Sounds good -- no rush at all from my side, and I am happy to respin
against whatever shape you all land on. Enjoy the time off.

Best regards,
Michael Jordan
