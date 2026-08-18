Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750BD45519A
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 11:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787052678; cv=none; b=bnWcbFQAGQDajzjYEdXA+VtqMuBRz2YgXhZ+vbqMV+zDG0jd1nbRZcCqi0zyPhbDXMeH0i7R8W9FxdJMgrIApOhf9hVNGqQ4wOS+o0Pq7WJrRSDRSuMoXcV3lPDMC9Vx0RnEn+VoOv7WhPIosoOmnUwJQHeXK8zqGx0+Se+s7o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787052678; c=relaxed/simple;
	bh=gsAPk8hirZLRz7mRRaTCg/CyxrLFonG1JSQ5lt59Z+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DQzZZhF4QkgDzWqNrZteQjuZ87s9qxBSo7cWvl/NS1T0C+US63OCb16AtmkVKdCJsvProIPdQyPLgkYMd7m6U15J0P/y8FCvz8xJvefyEKwSt1nqH5AdSFXlRukcPf1uQjmWGNcXYWI703kjJTq1nIPk/KdVfvCRehn57udDrO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=L6vIsavv; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="L6vIsavv"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c2074710751so711093866b.1
        for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 04:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787052674; x=1787657474; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eV8Mg2GUXRTNmrxolDhvkzpb56y5os/XkeH9InIJu5Y=;
        b=L6vIsavvSZw2OGkOR3LBdVw0qzF1ngDBDfbkOFWgKp2Il6nHK63zC1ZGhBI0tzKWG/
         y+rZPfbf3TBCjdW9CYXYnJY4vuH1i7IfZqc+odrNJ4ts2gQMtewqnArDlLrW2itZBM0z
         Bk+gSWTeDW8Mnn6KmSP3QY/vCxJ5UeFiWVydA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787052674; x=1787657474;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eV8Mg2GUXRTNmrxolDhvkzpb56y5os/XkeH9InIJu5Y=;
        b=jUIgKzrv2mQSxId9rolIhn/dvFMSsP1GIM8yhzn0GWFIMVM/mMa2w/8SwUDTmmEYCi
         nJPwNJHiah0O2EHRIckpG3Hgegi04lxMNRQWt3uGEMzJ741lTYG5Rh6xJ6tQopVuZVWv
         8xtDaAyi2Z+nTdsFf3I62A9XUy/nYXiacjq8KaSJoS7Lt2aIzZ+zzkBhA5KQHMeJJ6l/
         R+HfxhSH9Z/WesT/tROptS0GRZc5NSB6+Ms7O+a+dAerTbumqd886dC3kHHz1KDvbUUK
         9A9D8UU97YM7Bj8pvK/SoaNr+5l2OnlCLtc7cx840yO1+DlCj43JWlONjVq0veAYHOkT
         skYQ==
X-Forwarded-Encrypted: i=1; AHgh+RpsfYrHS2JOA0RiXMDmvzIXH2i5nSHZpCpjeZHlRz8X10a7xkT4Y2FpISWXrzmAhgO/khXIDQtojEAkWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjcMdjdsuF50zMPWdv2MiQc6MkkZ6C0Dnx7r1CJkcksYUDBtW1
	OGtXBA99BZxU0GKr/yvdZWuO6S8CvGf9uduaoTNurFGXRCD4JY9AA62zuhAWqPri4HSh+kI3+cx
	lAF8NTpFB
X-Gm-Gg: AR+sD10dij51dQuTpuD4J2vFMPReLkk0kZgh6ZJKL08Xx1l7WnBIZbWG/nm4Ww5GFTO
	DZDCSNqnrPzkcoTiHXR/kR1vP6a8RcwMLlhoaIT5Ra1scjCTapVvZVzHzua8q3u9/b50qvUTDSN
	QPEojlUSiOE8kOYvgeOto0fzKwQluX//o7KijqH8skSgRj4pfITm2aNV63/AnAa7aDgi8oU5ZgX
	DUIi35Gu+tfd6OFkp0xGIUoDzGY3j2Ox/6EsGD5QnG40vF3OjQUaHn5CgT9K9DcMFRL9HGTPpGl
	Sfjsvvjqlt8X74a4ALT4K9Zs9mzq6qfSbiFMNbVnc/vMMtC6lylzXOaduhsI4VLjx0ij38+Awr5
	V3SClCzElwfQtwaUGzf3T7XWpjQB3LtrF5idwz8xsf1oqGpskChMAmgdIeAygLy+vTEnVp4Itbr
	GPwWlVGdejx/ce5FXsewukG0JNOwrzsKzPDqWaZRM9lcFBqlCQLtuowHmofoMfGNUjwzQxhBquu
	73kyM3mzuBC/wzYr5WIFfhrOg==
X-Received: by 2002:a17:907:3cd3:b0:c16:4df6:176b with SMTP id a640c23a62f3a-c219930e779mr89032566b.20.1787052674540;
        Tue, 18 Aug 2026 04:31:14 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185bc9697sm140763466b.61.2026.08.18.04.31.12
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 04:31:12 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c1671ec8692so610312066b.0
        for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 04:31:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr1TxyYuJv/2AvO2ONjSwGtfuM+/IN+XufH/jQtvO4wXWr8tzedE/Q5W2IJ8J33MPpxhDB+oum8uRkc9w==@vger.kernel.org
X-Received: by 2002:a17:907:9994:b0:c1f:e9d3:a3f0 with SMTP id
 a640c23a62f3a-c2129ac8464mr1690303466b.7.1787052671168; Tue, 18 Aug 2026
 04:31:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260801050049.984234-1-jordan.mymail@gmail.com> <CAMdm4Cz-oREZfk2-_eQ16umQawWF+c9vA_AV4tBuHHvsbP0vqw@mail.gmail.com>
In-Reply-To: <CAMdm4Cz-oREZfk2-_eQ16umQawWF+c9vA_AV4tBuHHvsbP0vqw@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 18 Aug 2026 13:30:57 +0200
X-Gmail-Original-Message-ID: <CANiDSCuNhC0-rDiBChZ02Q-PKtc=_a1ptukNUtMNMRWLUa2HeQ@mail.gmail.com>
X-Gm-Features: AcwNN1XOFjQblh9mHbB9inB_k_eg-ZNX3yK5Z4zhZJCv_sfwWSM9j-T839BpsnY
Message-ID: <CANiDSCuNhC0-rDiBChZ02Q-PKtc=_a1ptukNUtMNMRWLUa2HeQ@mail.gmail.com>
Subject: Re: Re: [PATCH] media: uvcvideo: query pan/tilt position from the
 device on every read
To: Michael Jordan <jordan.mymail@gmail.com>
Cc: hverkuil+cisco@kernel.org, laurent.pinchart@ideasonboard.com, 
	hansg@kernel.org, mchehab@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Michael

On Sat, 15 Aug 2026 at 01:11, Michael Jordan <jordan.mymail@gmail.com> wrote:
>
> Hi Ricardo,
>
> On Fri, 31 Jul 2026 19:14:51 +0200, Ricardo Ribalda <ribalda@chromium.org> wrote:
> > You definitely have to ping the vendor to make sure they fix their firmware.
>
> Done -- I wrote to OBSBOT on 4 August covering the GET_INFO stub along
> with two other compliance defects I found on the device (a control
> default outside the control's own min/max, and PanTilt-Relative
> returning a constant). No response so far. I will report back if that
> changes.
>
> One thing I should have made explicit earlier, since it bears on
> whether this patch is the right general-case fix rather than a quirk
> for one broken camera: correcting that firmware would not make the
> position observable.
>
> The driver clears the control cache in exactly two places --
> uvc_ctrl_status_event() on a Control Change interrupt, and
> uvc_ctrl_commit_entity() after a SET_CUR commit for auto-update
> controls -- and __uvc_ctrl_load_cur() re-arms it after each read. So on
> a fully compliant device a host-commanded move yields two samples, both
> endpoints: the first G_CTRL after the commit reaches the device, but it
> runs microseconds after the command, when the actuator has not yet
> moved, and every later poll returns that value frozen until the
> end-of-movement interrupt. Under autonomous tracking there is no commit
> and no defined interrupt, so nothing invalidates the cache at all.

I believe that if AUTO_UPDATE would be properly initialized, then, the
values will always be fresh when you run G_CTRL o G_EXT_CTRLS from
userspace:

G_EXT_CTRLS
 uvc_ioctl_g_ext_ctls()
   uvc_ctrl_rollback()
     uvc_ctrl_commit()
        uvc_ctrl_commit_entity()
            ctrl->loaded=0

So all the values captured with G_EXT_CTRL() will show fresh data.




>
> So the limit is the caching model rather than the device. That is the
> case I would want the patch judged on, and it applies to correct
> firmware too.
>
> Worth flagging one side effect if OBSBOT does fix GET_INFO: with
> AUTO_UPDATE reported, uvc_ctrl_commit_entity() would begin clearing
> ctrl->loaded on this camera, so single-axis writes issued tens of
> milliseconds apart would start merging against live data and cancelling
> each other -- the second failure mode I measured. It would move the
> device from one horn of the read-modify-write question to the other,
> which is the pre-existing problem you identified and which this patch
> deliberately does not touch.
>
> No action needed from my side while we wait for Laurent, HansG or
> HansV. I am still happy to respin with the autonomous-tracking case
> argued in the commit message rather than in this thread, if that would
> help whoever picks it up.

Until they reply maybe you want to:
  - rename uvc_ctrl_fixup_xu_info to uvc_ctrl_fixup_flags
  - modify uvc_ctrl_get_flags so it calls uvc_ctrl_fixup_flags
  - add your device information to uvc_ctrl_fixup_flags

and then modify your userspace code, so you allways do S_EXT_CTRLS()
with the information of both axis.

I believe that should cover your usecase.


>
> Best regards,
> Michael Jordan
>
> On Sat, Aug 01, 2026 01:00 AM, Michael Jordan <jordan.mymail@gmail.com> wrote:
>>
>> Hi Ricardo,
>>
>> On Fri, 31 Jul 2026 19:14:51 +0200, Ricardo Ribalda <ribalda@chromium.org> wrote:
>> > How accurate does the mapping frame/position need to be?
>> >
>> > You do not know how big the camera pipeline is. Maybe you are
>> > processing frame NOW-4 when you read position NOW
>>
>> Not accurate at all, and I should have been clearer earlier: I picked
>> "the former" for the continuous part of your question, not for the
>> frame-tagging example. Nothing in my use case correlates a position
>> with a particular frame. The position is an input to a control loop
>> ("where am I, so I can ask for ten degrees left of here") and a number
>> on a UI, and the gimbal's own time constants are hundreds of
>> milliseconds per move, so a few frames of pipeline skew is far below
>> anything that matters.
>>
>> If someone did want frame-accurate pose, I agree a G_CTRL read would be
>> the wrong instrument entirely -- that is a per-frame metadata problem,
>> and this patch would not be the right vehicle for it.
>>
>> > unrelated note: if you need to set the two axis at the set time, you
>> > can use  V4L.VIDIOC_S_EXT_CTRLS
>> > [...]
>> > In fact you could use that today to avoid part of the kernel issue.
>> > Always send pan and tilt when you are tracking the movement.
>>
>> Thanks -- and you are right that this sidesteps the merge problem
>> completely, which I had not appreciated. Both mappings land in
>> UVC_CTRL_DATA_CURRENT before the single commit, so whatever
>> __uvc_ctrl_load_cur() put there is fully overwritten and it no longer
>> matters which source the RMW pulled from. I will switch my userspace to
>> always send both axes. It does not touch the read side, but it makes
>> the write side a non-issue for me in the meantime.
>>
>> > If AUTO_UPDATE is present you would get fresh data when you poll the
>> > control.
>>
>> One clarification for the record, since it bears on what you are asking
>> HansV to weigh: that holds via the interrupt rather than via the poll.
>> uvc_ctrl_status_event() clears ctrl->loaded, so a poll after a
>> notification does re-read the device -- but polls between notifications
>> still return the cache, because __uvc_ctrl_load_cur() returns early on
>> ctrl->loaded and nothing else clears it outside a commit. So on a
>> compliant autoupdate device the update rate is the device's signalling
>> rate, and for pan/tilt 4.2.2.1.15 only promises that signal at the end
>> of the movement. Good enough for "it stopped, here is where"; not for
>> sampling a trajectory. I mention it only so the comparison is accurate,
>> not to relitigate -- your framing of the two problems matches how I see
>> them.
>>
>> > You definitely have to ping the vendor to make sure they fix their
>> > firmware.
>>
>> Agreed, and I will. I am not counting on a timeline.
>>
>> > Let's wait a bit for Laurent or HansG (or even Hans Verkuil) to
>> > comment.
>>
>> Sounds good -- no rush at all from my side, and I am happy to respin
>> against whatever shape you all land on. Enjoy the time off.
>>
>> Best regards,
>> Michael Jordan



-- 
Ricardo Ribalda
