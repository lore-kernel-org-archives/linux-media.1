Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3563F596519
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 14:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789655407; cv=pass; b=ip08hnrqpvRNR5zufhz18Um3TjtZVV9EWcpkhXURH5Tuj0qoIIU3UR80lpSBHn0LF2btAaH9R9Y58HYkjJpw2HDukduSxawux17W1wzYLsVSkhSHfkcKA/jGp3HqfyqgZs+RKz6K43vWvWJp0AmZbD4w86XRAmWLpsuuMK0JYkQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789655407; c=relaxed/simple;
	bh=tO89l4GyjLHI75AA2qmTYizFB7q8DyYaOKJhG9upfFA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EaiarwUFyV1lQpZiHgaVD8CJhizAj9n7Mb2fmhPNY3o8PmYJ63yZ8Z/qo768TSkstogDm/whnc/n38ecrs46WqfBCwvyGDwmQp76aBcUph4IF7kdciDeW0cLUOL+Llo5L8qUY1O0/z/igJI/iJnLdyIJXKCcYEHZnyLEsREBTUc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GhJrGybS; arc=pass smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GhJrGybS"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4c0cd10d56fso504770b6e.0
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 07:29:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789655396; cv=none;
        d=google.com; s=arc-20260327;
        b=QPZpOlQFVr96bkYtczoduYfzal9Y+WnWvcob0KDJ6R5dyjUgny3Kb2dbhnStSGFgaQ
         0PWX7XT4GxDGYH3sGyTEuWfjIqpJY9cJgjbtISJHYFgzi+M+DE7ZG1BIiqi3Fu45rGrZ
         Bl7OTn7pLVahUP+YaHiMmj9mu9hkXR1gtl0nloTBd/BDcPqo2mEagi3XwC6zq5BvmtCM
         xJQ+GPe4F5RJVzQBIJoBoYWVlWBdv0SBvjCakyc3iemW/mPTBeSvdt4qZ4WdD9/CpRiD
         4fjzLl3yDlZ0GQQ8d2GlQSgbhC4EEpFI+Jfjz6TNB2gLOXr99gwaCN/LApHTSBpKuKyu
         2mdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kbF8DJsBNb/vjvqxltfvOVH4E7JK9oJSWeeIE1KCFZY=;
        fh=nENrd0FBbjmKYsXF+uuVlzQ0Lf74J5C3ZuCt+PM6szU=;
        b=XcAxGHLTIQtrshbRxyj1mno3rF9L8a362YOqixQjBr/BAkRVoOb/QcH2nOlqssnYU9
         5BVXDwUAcT8jnbNJGspNnfWY8BmEPpDB+jdKuvWf9EI9EX7TM0RLyy44/4QlK0kNA5gk
         fFluDWVxtOiRQVPSSJPmQg2CzYWGPwEooucnDMmBHRm/yXPcabUpTNkuEXe2QYhN5KN8
         3ShVGLn4283ot5v6c5+lL67t3mGK3cFjmDeroK3BvoXPGIa1yRhTsTXMkMhFpPTWaJ5e
         falgt3vsmhNlt2Pk7dYbYOXZ7eVVO3jTmdE0Mr4HE4wR6GGWCRU9dw2zMg4n0sxC8AR9
         Zkng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789655396; x=1790260196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kbF8DJsBNb/vjvqxltfvOVH4E7JK9oJSWeeIE1KCFZY=;
        b=GhJrGybSfwS9YbFoIe2/gPu9ZtEdg7ZA+aMgqOb3PnIi+5Ek2dttgHhnH5PMsv95qT
         vuh8+DoeQXyh33mypzIry0nqrwKh4EHX8m+BvZ8va8ncTbucbFHsn5C2jMJxu0Mu5QYk
         Aw5iZCmsX7BjrknEyrnyVYI7a4FWNXMyGF3juh7Sh+2QHQYeVgibHq91aiuSR7BJW1Em
         b6CSkHDNaOpLfLbTe/E5Ooh6mdS3SERScYsoFB76hP9tLXo1EPBU5BcYwPepC41ciEEg
         g9LxKv5S3tmadGybK78duFH5hYnB3jZThpUWoO+xPXFb7yRaIin4ON2KtNDvQjSEDlr+
         JF8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789655396; x=1790260196;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kbF8DJsBNb/vjvqxltfvOVH4E7JK9oJSWeeIE1KCFZY=;
        b=FS4G/iiaPXV9t+3CuE9oWzl/1oJ09V/WC1bNl/3eDutXnhyvOODVe8eY6UrclhfgWG
         x0UsxHrKSBAsZD+tRi0J4RK44uqIsCH+FKgBu5EhVAw3f5bycu2qP1mSe91AXzr683/Y
         OkPimDH/YYyxF2VAUrDHPfeB9zHs/RRhfW0zDohHlrWMU8XCLtKY99kjeURRg7/0NmCU
         B7QPseaN2vmI6bLLmqNnMXqlvxcLrmEHmw0bugiupNHXUMVkV6i08do6JGhhNjuX3diP
         kfyV4IivOcwFU3zDZyY4SnUQw6N4X26t59e8YjAe8jYIrelTJetjCsQgp1xyCV2Lr962
         Am6g==
X-Forwarded-Encrypted: i=1; AKwUvBwG+5RUep6wZllONwBWuvaIEqA7b0IaK81QTzZ7T/EakUCKv+bWSixXYQLO3T85uAe15sExo9khh5HvuA==@vger.kernel.org
X-Gm-Message-State: AFuF++l73fF0XJz4hFOo+0G8hiaf+9vIK8nLk5+Rm//y7ksGF/TpbHji
	yd8DmvQ1/wkRfQMPPkIbtmqjtFR/IIJ8SQjp3VIFm7a4GimTtrzEJS+zReEG/ov8ovI3YE2QN3n
	GHOhCfo7KPhiT70atW5q27nUzXcL0htc=
X-Gm-Gg: AYBFou12HqhBURwb8nDTb4VVHyX4NARg1N/XQ+hApe546uo+thEgsKPLPjsJbCAIzJJ
	BIEK/4mJ52v2zAV4v4swsoFhOSMmyWNakkO7CV2wv3/mlhTRe/Ks20ICwmAB2oWexCjg69XWTZX
	MA+6rh/74yyDrNCrWF4Lbz0ybLaS9e8CGDWVbkigjEcRC+z840aOnk6ueybefDSz+LYeGVKZTFh
	mDBN/FUXBslIj07IZ1E5+TQhzpncNlj1fSkghFJMbvk8U0APJbean6p1f1DMuYfBT9cXt5k6RJz
	sDrw3Mb8FtH1mhpArhnFV/Z1NGLBVVIlWJnIBqhTWhL699NHu/JC5f9A4tWaflSSWrWZwuT9OBT
	A2PnyHT+vdbUxV2dpnfNG2EtUnlqYUBV2tHPbFpwj
X-Received: by 2002:a05:6808:5143:b0:4b8:4703:db93 with SMTP id
 5614622812f47-4cb6a5e4700mr2519969b6e.28.1789655395992; Thu, 17 Sep 2026
 07:29:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804072630.28745-1-arash.golgol@gmail.com>
 <CAMxPZkgk4+idrZowJ1z-ddAzaD-hx-NJP+KSj8pUrSfL0HH4aQ@mail.gmail.com>
 <CAMxPZkhjurfpPvvymamJqTuia8CtFw1gRyYA4KBwFcQoH5jz3A@mail.gmail.com> <20260917120950.GA44274@killaraus.ideasonboard.com>
In-Reply-To: <20260917120950.GA44274@killaraus.ideasonboard.com>
From: arash golgol <arash.golgol@gmail.com>
Date: Thu, 17 Sep 2026 17:59:42 +0330
X-Gm-Features: AcwNN1XNeWNDN1FkqRE3CEAEFF1YFDG9VTOj1PGQgDvjVE6m2w9z6Yu-7cmX5kk
Message-ID: <CAMxPZkhoRAoz9mO29dC_+M9uEfmASpFrJqud73tz+8merQ06TA@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] media: sunxi: Resend active-state conversions
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	yong.deng@magewell.com, paulk@sys-base.io, mchehab@kernel.org, 
	wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Thu, Sep 17, 2026 at 3:39=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Arash,
>
> Your patches have been merged in

Thanks for the update. I really appreciate your review and help with
getting these patches merged.

> https://gitlab.freedesktop.org/linux-media/media-committers. I'm sorry
> it took so long. I really appreciate the work you've done here.

No worries about the delay. I really appreciate all the time everyone
put into this.

> On Mon, Sep 07, 2026 at 08:15:02AM +0330, arash golgol wrote:
> > On Wed, Aug 12, 2026 at 9:50=E2=80=AFAM arash golgol wrote:
> > > On Tue, Aug 4, 2026 at 10:57=E2=80=AFAM Arash Golgol wrote:
> > > >
> > > > These three patches convert the sun6i-mipi-csi2, sun8i-a83t-mipi-cs=
i2,
> > > > and sun6i-csi bridge drivers to use the V4L2 subdev active state AP=
I.
> > > >
> > > > Each patch has already received review and testing individually in
> > > > previous postings (see the changelog and links within each patch fo=
r
> > > > that history), but none have been picked up and none currently have
> > > > a delegate on patchwork. Resending together to make it easier to
> > > > review and apply as a group.
> > > >
> > > > No code changes since the last posted version of each patch.
> > > >
> > > > Arash Golgol (3):
> > > >   media: sun6i-mipi-csi2: Use V4L2 subdev active state
> > > >   media: sun8i-a83t-mipi-csi2: Use V4L2 subdev active state
> > > >   media: sun6i-csi: bridge: Use V4L2 subdev active state
> > > >
> > > >  .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 155 ++++++++------=
----
> > > >  .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   9 -
> > > >  .../sunxi/sun6i-csi/sun6i_csi_capture.c       |  27 ++-
> > > >  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 107 ++++++------
> > > >  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h   |   2 -
> > > >  .../sun8i_a83t_mipi_csi2.c                    | 112 +++++++------
> > > >  .../sun8i_a83t_mipi_csi2.h                    |   2 -
> > > >  7 files changed, 194 insertions(+), 220 deletions(-)
> > > >
> > > > --
> > > > 2.34.1
> > >
> > > I've been trying to get these patches merged for a while.
> > > Multiple pings and followups have been sent, but they haven't
> > > been applied yet. This series is just a collection of my
> > > individual patches.
> > >
> > > All patches have full Reviewed-by/Tested-by coverage from
> > > Laurent Pinchart and Paul Kocialkowski. Current status of all
> > > patches are still New in patchwork, without a delegate.
> > >
> > > Link: https://patchwork.linuxtv.org/project/linux-media/list/?series=
=3D28738
> > >
> > > Given the review is complete, would you be able to pick these
> > > up, or let me know if something else is blocking them?
> >
> > Just following up on this series.
> > Link to series:
> > https://patchwork.linuxtv.org/project/linux-media/list/?series=3D28738
--=20
Regards,
Arash Golgol
