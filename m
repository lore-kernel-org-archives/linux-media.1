Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C52370AE6
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 07:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787815873; cv=none; b=tseUtONrFWqx9VhQS0UUHAgC+YmjFIXdR6VMTCcQTP0dXSMmqAsbV1rDJxXmKNTNzoH8Y6jGyFmaLvJJyWKtG3KrcrRkjU92CAKa+jABU+60tYW0nXBW081ypxzTtcVodEiltiv/gNnfZIAlvS0+11xzMqUcvFmnQ1vZbCMDsJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787815873; c=relaxed/simple;
	bh=PfIIOf3/SBUFiL4ggSPb5GvlN1y9GHqRMpF2ptnXpIc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GMzYTu+jhkcnZWZJJD8nAVbhCoBHrFQmq+5bjeLDRhQRSQXzryj75OJSXpuxsZ7Fng9R3Lvyi9Q3v4SO9Lljcw4yNU+mC6dN+gON02B2cAFrJ9eHKLTS1sgdrjcU5h653Y51vZFwgDj58NZO7EgeI4ksXFGYZz7gqM8ZXNCWapc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dDu6T+0b; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dDu6T+0b"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc1a4c62804so1914811a12.3
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 00:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787815871; x=1788420671; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BVRAfpWY0FEi1i3sGThUrg+YWV/e8fwxPwV0PaJXEV0=;
        b=dDu6T+0b6Qavrn+YOthggxPK4U5JxmOIQnOAll4vrxqkcYU7uaWyZ8d0byj0I84WWM
         scForsLPFhtNbFFp1fsJOfboHxNnwDsqYeKtWg1pwu2uwb0WAcyTOyz+nLGjL6vd9Vlx
         XJiQmOtEwV2ENTNuLO64WWKYO6u+YMdjeLevU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787815871; x=1788420671;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BVRAfpWY0FEi1i3sGThUrg+YWV/e8fwxPwV0PaJXEV0=;
        b=T8nZZF/laLzwzFzsZ3hL8hTbIChY6GnzP9EEoyzf9tT41HKadc4KRahqoo2OUJCOHy
         R0f2Pvl4TXdMpips9NuMfjs5OrdGIhf9dUIuIYErWRveQHPyHw6BOmGtpaIprYH+Q8Wn
         JAHKdgYEMSyihRFDOXqIyLoX/lXwy9r/PBoVAgsnJ2vmnscnnn0oxbkoM5b+RH4Itsyf
         httAY60CT7y9aHOtj/zizwXH6g3cqu1Re82tbheJa0+MCF1hkLs/HDrqQ5frZAZPchmL
         RLMk7HCd9l36caFuuBBpsdvVvAG+s39/gmN/RvZpf4oc7FWnhrOljhIzRXqltfOg8ykh
         32xw==
X-Gm-Message-State: AFuF++mYt+GTGd/ceRUYHUfr4JaQXWxCkHTVhdi0+3cXPKP93/f9Thxd
	Vf5UfvR2Ys+XYYWIRGE1mfOG6mIGewprSbBdIn09nNJA880QeBos+Jk4lZrM5nG0x2IXiT8lqkj
	/Wm3OheNW
X-Gm-Gg: AR+sD13SicpbfH7pAnRyj0VTADYV+2eXPHLFMZ64Ge+Foy7FFFC2TQWSTdv6+JZfsN6
	QEEz3yA71GWpUOTY73U3rNoEcwWIzdo+od/9q3d18loMjPqPkbYjTCNVkxDvQt/gtE/6O41Q1gO
	XXUR67FvJlt/rLjvkOwAE2Fm6KT4krRILFNOwxtY4T3EvbbmANQ6/iC3jtWDlifORFJnMXBGigZ
	2etRFenNQ88C6Ih9mwxaqyCOg38jJSQ5GYLiGPdeYO1Q7dFGJu9rFOeg4X4nTE1Uu8b31Os6qMb
	grNLXssR2MFkXds+o2lHdHFF/puVFtwP3BeZAcseJM0gkDhN/aBrfXAVZvowleIiVKgopYvu71x
	F6BGKro2ulxttNZ1+OTznr5E6TZmDKX+9KhTwwUz57SzRWRDkps0UPmCQg32sPJp2ZWb1bNWLEa
	++9K5jqk5WJcyVt7E4Z7ti4qK05x7KqG3leNv1siM5VayIu2uLctjCQE9r8CTE2bANds+YTdn2h
	g0QdX4Jepy1v53b1zy83Sb0pA==
X-Received: by 2002:a05:6a21:4cc2:b0:3c3:7a0a:18a6 with SMTP id adf61e73a8af0-3cf85468c88mr28390195637.18.1787815870861;
        Thu, 27 Aug 2026 00:31:10 -0700 (PDT)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com. [209.85.216.42])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1beb28a27sm1861093a12.12.2026.08.27.00.31.06
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 00:31:07 -0700 (PDT)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3965d3d9ab8so1872339a91.3
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 00:31:06 -0700 (PDT)
X-Received: by 2002:a17:90a:dfd0:b0:38f:bbc:6a0f with SMTP id
 98e67ed59e1d1-3966d144247mr27737511a91.1.1787815865480; Thu, 27 Aug 2026
 00:31:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260725212332.64927-1-jordan.mymail@gmail.com>
 <CANiDSCsyVYanm5MowQv5-rGy1EYs080WRsZYJCT=J=SesPFnjQ@mail.gmail.com>
 <20260731151509.577383-1-jordan.mymail@gmail.com> <CANiDSCsS-JJrGMaoBqR-XX54dtp_uQEVVSct-BWL0gQNL4OfRQ@mail.gmail.com>
 <20260801050049.984234-1-jordan.mymail@gmail.com> <CAMdm4Cz-oREZfk2-_eQ16umQawWF+c9vA_AV4tBuHHvsbP0vqw@mail.gmail.com>
 <CANiDSCuNhC0-rDiBChZ02Q-PKtc=_a1ptukNUtMNMRWLUa2HeQ@mail.gmail.com> <20260821090340.3041867-1-jordan.mymail@gmail.com>
In-Reply-To: <20260821090340.3041867-1-jordan.mymail@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 27 Aug 2026 09:30:50 +0200
X-Gmail-Original-Message-ID: <CANiDSCvbOgth3U_3-Hqa=Pm-03UOi_9k1pQHnneQHy92g91xwA@mail.gmail.com>
X-Gm-Features: AcwNN1WJlLceSvOUz3hEhGsDkqRtrZ3r0PTLIwDh4GGQfd6sssZD7TJUVjpH1sY
Message-ID: <CANiDSCvbOgth3U_3-Hqa=Pm-03UOi_9k1pQHnneQHy92g91xwA@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: query pan/tilt position from the device
 on every read
To: Michael Jordan <jordan.mymail@gmail.com>
Cc: linux-media@vger.kernel.org, hverkuil+cisco@kernel.org, 
	laurent.pinchart@ideasonboard.com, hansg@kernel.org, mchehab@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Michael

On Fri, 21 Aug 2026 at 11:03, Michael Jordan <jordan.mymail@gmail.com> wrote:
>
> Hi Ricardo,
>
> On Tue, 18 Aug 2026 13:30:57 +0200, Ricardo Ribalda <ribalda@chromium.org> wrote:
> > I believe that if AUTO_UPDATE would be properly initialized, then, the
> > values will always be fresh when you run G_CTRL o G_EXT_CTRLS from
> > userspace:
> >
> > G_EXT_CTRLS
> >  uvc_ioctl_g_ext_ctls()
> >    uvc_ctrl_rollback()
> >      uvc_ctrl_commit()
> >         uvc_ctrl_commit_entity()
> >             ctrl->loaded=0
>
> You are right, and this corrects what I wrote on 14 August. The rollback
> at the end of every G_EXT_CTRLS runs uvc_ctrl_commit_entity(), which
> clears ->loaded for an AUTO_UPDATE control at the top of the loop, before
> the dirty/rollback checks, so the following read re-queries the device. I
> had only counted the Control Change interrupt and the SET_CUR commit as
> cache-invalidation points and missed that the read path invalidates its
> own cache. So on this device, once AUTO_UPDATE is restored, polling
> G_EXT_CTRLS returns fresh data with no volatile flag involved. My claim
> that "correcting the firmware would not make the position observable" was
> wrong.
>
> > Until they reply maybe you want to:
> >   - rename uvc_ctrl_fixup_xu_info to uvc_ctrl_fixup_flags
> >   - modify uvc_ctrl_get_flags so it calls uvc_ctrl_fixup_flags
> >   - add your device information to uvc_ctrl_fixup_flags
>
> I did this and tested it on the hardware. For the record, the device's
> GET_INFO for CT_PANTILT_ABSOLUTE (entity 1, selector 0x0d) returns 0x03 --
> GET|SET, no AUTOUPDATE bit -- so uvc_ctrl_get_flags() masks off the
> UVC_CTRL_FLAG_AUTO_UPDATE that the static uvc_ctrls[] entry sets for this
> control. Calling the fixup from uvc_ctrl_get_flags() unconditionally (so it
> also runs when GET_INFO succeeds) and adding
>
>   { USB_DEVICE(0x3564, 0xfef8), 1, UVC_CT_PANTILT_ABSOLUTE_CONTROL,
>     UVC_CTRL_FLAG_SET_CUR | UVC_CTRL_FLAG_GET_RANGE |
>     UVC_CTRL_FLAG_RESTORE | UVC_CTRL_FLAG_AUTO_UPDATE }
>
> restores it. One detail worth noting: the existing fixup does
> info->flags = fixups[i].flags, a full replace rather than a masked OR, so
> a standard-control entry has to spell out the whole flag set, not just the
> missing bit.
>
> With that in place I verified on an OBSBOT Tiny 2 (3564:fef8) that polling
> G_EXT_CTRLS tracks a physical slew on both axes, including motion the host
> never commanded (moving the gimbal by hand), while a stock module returns
> the stale value indefinitely for the same reads. So your suggestion covers
> my use case, and I am going to carry the quirk rather than the volatile
> change.
>
> I have also switched my userspace to always send both axes in one
> S_EXT_CTRLS, as you suggested. Both mappings land in UVC_CTRL_DATA_CURRENT
> before the single commit, so whatever the read-modify-write loaded is fully
> overwritten and the merge source stops mattering -- the write side is a
> non-issue now regardless of the flags.
>
> Given the rollback point, the general-case argument for the volatile patch
> is weaker than I framed it: for the ioctl polling path a device with
> correct (or fixed-up) flags does not need it. The only things it still does
> that the quirk does not are to advertise V4L2_CTRL_FLAG_VOLATILE to
> userspace and to keep the write-side RMW reading from a separate buffer,
> and with always-send-both-axes I need neither. So I will not push the
> volatile patch further unless you or Hans think the userspace-visible
> VOLATILE flag is worth having on its own.
>
> If it is useful I am happy to send the fixup as a proper patch with a
> Suggested-by: you, or to leave it to you if you would rather fold it in.
> Thanks for the review and the pointer -- both were right.


Happy to hear that it works for you! A proper patchset would be
awesome. I do not think we have to wait for Hans(es) to start
reviewing it.

How does this sound?:

1) A patch to add V4L2_CTRL_FLAG_VOLATILE for all the
UVC_CTRL_FLAG_AUTO_UPDATE controls ( I think that is missing)
2) A patch to rename uvc_ctrl_fixup_xu_info to uvc_ctrl_fixup_flags
and modify uvc_ctrl_get_flags so it calls it.
3) A patch to add the quirk for your device. In the commit message,
please include the lsusb -v output of your device and mention that you
pinged the vendor to fix their firmware.

The Suggested-by tag would be great :)

Regards!


>
> Best regards,
> Michael Jordan



-- 
Ricardo Ribalda
