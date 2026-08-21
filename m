Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61BA46C831
	for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 09:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787303047; cv=none; b=e+gwPZvRUaIlbskPmzVSni7ylC4XgBiCrRT7g1rIwhMkJFPXEN8pMK8JAo/OSrKDIhr13Z4CFrZglsGII08vYyro+moMAf0nFVe00KaROeD5tFOR0OIB/vfYnlTd6/ihm21cmLMLWC+1JiWnG3+OYP+Sv1ywrgn3k/1/mCRefNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787303047; c=relaxed/simple;
	bh=Ex60VvMvgK2s8s1Mtj/kS8n774mZCs25qvhLD1PRZsM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HwDWmFLZ5SIXns31xlpeL2bpLJ0JawU+uF3azc68wQsmz58OWSa4j7nQdXznYpOpjIooKE0bQLekgW8o50P7q3P2X0AOjA68krldXGugJvi7G2s0iFFZKdpkHt2aUuaQt2ut4W7EOi7he1L+ZB6iO6vx5NKRUu1JykbS2YVIMck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UlfgMn20; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UlfgMn20"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-66cdf0df0acso1076204d50.1
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 02:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787303024; x=1787907824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fnEok9W/wIG/DKSYQxikwdzuHayklyaynyE6Tc7UawY=;
        b=UlfgMn20p1R7+dzCLnF/9wwVRKaHIgOaVtnRzGKoonfzPfanLSOmJ/jlTS3V47n/f3
         08K2qW8H9K0mxiH+sFKNTG/rUCk12UxT5KDPZXVm+icbebLw03yU5XBtpVdtii0DJiOM
         Cgz8euGjE8bXE3IbWof48Zgya01Nzp5hYSnLl6FxY1H6JR6vB/gnfCmpWSpzdDYmAaR7
         MZW6CokedxrfpW5hzyOS5IFPCmCX90ZqNpjoQLiLIRhpdQfi1uUfUA3bv5kCOogVPo9S
         5kCLnoEi1A5yTQbpkbxKsJlUuPHcqLJjR4n3cjmWMYwut0a0FugbvVcxL3sgYDoDZPYI
         ZUZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787303024; x=1787907824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fnEok9W/wIG/DKSYQxikwdzuHayklyaynyE6Tc7UawY=;
        b=bzrxX1FGNGfdwwgOTnIRtSn6jbcvkMhA3yIrBeEwOROLVYvvFX+QTa1qvKa5y62PHE
         RSvAzfaPf7ORefmPz8gL0Gl6/yNaCYi15uDgTObn5rqb2fInBvEJ4blU3jDsE+7jXECF
         yID4V8R7ANH3iQrvz16hRSBbwLa7pJzx+/m1YxkbDroDi8u9sfJ9NuoeL7ta9a5QGW8N
         2g5HP4yNFB6aeEgCmFNLhHMY7w+hf6zFNrSoC8dgFgFcxg+vW2F5IfogEiqUWKA0BDKZ
         RNGnErwuDAVTeM4d6513toLHiQKdnlRkAp3HhAhlhipPuLLWcm9wQm3ZOZM0f8Hlv9zc
         BBkg==
X-Gm-Message-State: AFuF++nXuduPCoItwJvApAL3kxsFSOKCvvNm+fShrgkKuRJsPT40B7VE
	hI25S/OxkzFmAAqjd2jePmZ4J7+5eYAkvJdUkY8PG7aV6DGxcC9XV2quW/7iNFpw
X-Gm-Gg: AR+sD12xxUwvT3kBSHf60ny55488/ffsSlOggUVjjADWjrkV4s/tvdX5JzOdY7FpMUD
	8m2IyNUsrBLXofVt8jiF4EbVBfshTH8XRroI24M2lBzcxU/ybE2NZ/KF+Yt94g5LKYt2FT+YWFm
	v7zgxKne10+nhCQUBa5W6ryxU6tmu2HonKxOF/1d5B2HgmPeIcp1+MTARVeYosyPE9N4hUPaNjx
	uH3ryItz4UUgmJ9lrSudV+VFYBEzqlXgaLWvUc/uYylY9iKQKd5zKZe3Thv/NOaBQ6YdRJiHata
	ew78nBmrrF7vJevkZgp/ZLfpMZ5SFU/PZEL/kjTHCSNv5VwM+RY5ssyYnFNv1oKcXCNAoqDo2aT
	VgoGXWpg1t0RYSR2mnnFaeLga8aaJ7RUJHg6R5Q1PYKrKjZKAvOsm4Tb8+M6uaP14OGYVHS6QIL
	IwQpg8nvr39a0gQimY3rCkIqovjrVbAVhCaQ3pmVK27SFeTFc4BlcKD0eXYZPSHnBQUCCfjZ11f
	WEcD8MOOqqGpypFqfzAFBr3bJxuToJMLjDSIgaopZk=
X-Received: by 2002:a05:690e:4812:b0:668:9fa5:b9cc with SMTP id 956f58d0204a3-66ce48cc4d3mr1589911d50.0.1787303024421;
        Fri, 21 Aug 2026 02:03:44 -0700 (PDT)
Received: from llmbox.. ([38.81.85.65])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66ccb172b96sm4000100d50.15.2026.08.21.02.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 02:03:41 -0700 (PDT)
From: Michael Jordan <jordan.mymail@gmail.com>
To: linux-media@vger.kernel.org,
	Ricardo Ribalda <ribalda@chromium.org>
Cc: hverkuil+cisco@kernel.org,
	laurent.pinchart@ideasonboard.com,
	hansg@kernel.org,
	mchehab@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: query pan/tilt position from the device on every read
Date: Fri, 21 Aug 2026 05:03:40 -0400
Message-ID: <20260821090340.3041867-1-jordan.mymail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CANiDSCuNhC0-rDiBChZ02Q-PKtc=_a1ptukNUtMNMRWLUa2HeQ@mail.gmail.com>
References: <20260725212332.64927-1-jordan.mymail@gmail.com> <CANiDSCsyVYanm5MowQv5-rGy1EYs080WRsZYJCT=J=SesPFnjQ@mail.gmail.com> <20260731151509.577383-1-jordan.mymail@gmail.com> <CANiDSCsS-JJrGMaoBqR-XX54dtp_uQEVVSct-BWL0gQNL4OfRQ@mail.gmail.com> <20260801050049.984234-1-jordan.mymail@gmail.com> <CAMdm4Cz-oREZfk2-_eQ16umQawWF+c9vA_AV4tBuHHvsbP0vqw@mail.gmail.com> <CANiDSCuNhC0-rDiBChZ02Q-PKtc=_a1ptukNUtMNMRWLUa2HeQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ricardo,

On Tue, 18 Aug 2026 13:30:57 +0200, Ricardo Ribalda <ribalda@chromium.org> wrote:
> I believe that if AUTO_UPDATE would be properly initialized, then, the
> values will always be fresh when you run G_CTRL o G_EXT_CTRLS from
> userspace:
>
> G_EXT_CTRLS
>  uvc_ioctl_g_ext_ctls()
>    uvc_ctrl_rollback()
>      uvc_ctrl_commit()
>         uvc_ctrl_commit_entity()
>             ctrl->loaded=0

You are right, and this corrects what I wrote on 14 August. The rollback
at the end of every G_EXT_CTRLS runs uvc_ctrl_commit_entity(), which
clears ->loaded for an AUTO_UPDATE control at the top of the loop, before
the dirty/rollback checks, so the following read re-queries the device. I
had only counted the Control Change interrupt and the SET_CUR commit as
cache-invalidation points and missed that the read path invalidates its
own cache. So on this device, once AUTO_UPDATE is restored, polling
G_EXT_CTRLS returns fresh data with no volatile flag involved. My claim
that "correcting the firmware would not make the position observable" was
wrong.

> Until they reply maybe you want to:
>   - rename uvc_ctrl_fixup_xu_info to uvc_ctrl_fixup_flags
>   - modify uvc_ctrl_get_flags so it calls uvc_ctrl_fixup_flags
>   - add your device information to uvc_ctrl_fixup_flags

I did this and tested it on the hardware. For the record, the device's
GET_INFO for CT_PANTILT_ABSOLUTE (entity 1, selector 0x0d) returns 0x03 --
GET|SET, no AUTOUPDATE bit -- so uvc_ctrl_get_flags() masks off the
UVC_CTRL_FLAG_AUTO_UPDATE that the static uvc_ctrls[] entry sets for this
control. Calling the fixup from uvc_ctrl_get_flags() unconditionally (so it
also runs when GET_INFO succeeds) and adding

  { USB_DEVICE(0x3564, 0xfef8), 1, UVC_CT_PANTILT_ABSOLUTE_CONTROL,
    UVC_CTRL_FLAG_SET_CUR | UVC_CTRL_FLAG_GET_RANGE |
    UVC_CTRL_FLAG_RESTORE | UVC_CTRL_FLAG_AUTO_UPDATE }

restores it. One detail worth noting: the existing fixup does
info->flags = fixups[i].flags, a full replace rather than a masked OR, so
a standard-control entry has to spell out the whole flag set, not just the
missing bit.

With that in place I verified on an OBSBOT Tiny 2 (3564:fef8) that polling
G_EXT_CTRLS tracks a physical slew on both axes, including motion the host
never commanded (moving the gimbal by hand), while a stock module returns
the stale value indefinitely for the same reads. So your suggestion covers
my use case, and I am going to carry the quirk rather than the volatile
change.

I have also switched my userspace to always send both axes in one
S_EXT_CTRLS, as you suggested. Both mappings land in UVC_CTRL_DATA_CURRENT
before the single commit, so whatever the read-modify-write loaded is fully
overwritten and the merge source stops mattering -- the write side is a
non-issue now regardless of the flags.

Given the rollback point, the general-case argument for the volatile patch
is weaker than I framed it: for the ioctl polling path a device with
correct (or fixed-up) flags does not need it. The only things it still does
that the quirk does not are to advertise V4L2_CTRL_FLAG_VOLATILE to
userspace and to keep the write-side RMW reading from a separate buffer,
and with always-send-both-axes I need neither. So I will not push the
volatile patch further unless you or Hans think the userspace-visible
VOLATILE flag is worth having on its own.

If it is useful I am happy to send the fixup as a proper patch with a
Suggested-by: you, or to leave it to you if you would rather fold it in.
Thanks for the review and the pointer -- both were right.

Best regards,
Michael Jordan
