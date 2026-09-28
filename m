Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D027E4A0151
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 11:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790594317; cv=none; b=nUSQlbhNVviZA6UllKoziTW+24IBO2TF/rNDiEwujQ36b8ShrMo5zNMs/A4MoPS4nFPWQPjDUB6iNQEFfpuYKSy2YL6pGxGo8p1cpzF3ai25KyFz1TWnZXLDE6Tg2r0fYbaBIiJ6dVW8X0roj8hJOgNT2MnmCwwDW8034fcTcos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790594317; c=relaxed/simple;
	bh=dn8d1LoeuexluRQ27fn30ECfr4EHmxAjCOKOD2zYrxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h4sgYVjvG50YCyUAf1wgT5jXyvXVtBDWJgJOSm3TQ3rPzODDNtrxGfH6SRoUGEUBnnsafIyXjC+tHQkf7XLSEjhTPw4HQWFyByHBs0pHe9X5M935mfiekhgwnwEPzidGmmHgnSmsVobfj0Oz7Gae84TbEpHDlgom6QvF+tJhFE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Y7uo/KCd; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Y7uo/KCd"
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a47d2cf261so213312a91.0
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 04:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790594315; x=1791199115; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wpMpXaHh3gz5KgeWx3Y3cmSaE8Jl5aDPkB4FL7/nBuA=;
        b=Y7uo/KCdydqu4hRJHV4SDJSzBFeEeyzp/Hojl/6ekW/Cf0QS/5xaBytqH2eANvPxtz
         T6dia+GQ9S+NM6aN8yOVrKnIwbkBzX6O4tYk1YNtvpsJlFtWxt1gG3ZZ0sbe5n+DS/iy
         jofiaMx2zrGyRnzef5ncyWD2gewMt9dyyfqdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790594315; x=1791199115;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wpMpXaHh3gz5KgeWx3Y3cmSaE8Jl5aDPkB4FL7/nBuA=;
        b=LGv/mHyaf11k/d1eco/XHQCEuKCnATMWbgMwy+aKUf+HOEFEepEf7kJZiAbSe1yGli
         zOP2rjsCxRwfRtL07mSK2clmMbKfpn7HZgm8tI5o2O4k/WZnImIsCfIWYFUdqMKnZc7r
         5XWkncd+W5JMfHbSmHhlQ1B9nju5Kl3DDkMXMqnjjTUilOTkqBz66NfItBhTxdyiRqBb
         lccpB4j+Whu/5ldF6YMPcqvcwELP2hTvtloe+y1d7fy+BOMKfFuc6070AGLzHsfMQ7pD
         BkWStqVvXETJmPr3ZQN5k7mMyh6w/bJpYIOMaYRO9oPjhkUPZgU0qTjBrYTrIKHAomgg
         +Vlg==
X-Forwarded-Encrypted: i=1; AKwUvBygwGIxjQwc+9oeMCy2uefaxibo769nOw2csxitbVL2a3uVuu5DMuUxvQHN2FHk7Mnn1O3P9Ku0NW24FA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJXN2M3z926+hA6m3kafIeb7o7oeEgAXCSgOsx+NtIRMJORHmyz
	a3d6jd+3sNAQo/zP9SNQUquvZ4Vc5bZY2jg1KH+27sUMrWYczaw6nMVsZy8Q+r+BTkjwk7pQKvE
	ry0Q=
X-Gm-Gg: AYBFou13eV6cM5EhG7MdLbUnT7vlQ/1c3en9LM8me2npsAOcDiUDCOouCX++kGFOcd4
	WoqpoE8y9fnJhuG2FzvOc1UlPq4QNf4Z2s1tsyiq3KStXtTjvasN/k+c7xYdM3oAT8VoP7d0dmZ
	WQuYzqPGC9RUrMdabWMX3kLnKa8S6ya1UXGbySXZLA97i2ElUV1oOoM0DdjpyYu5hafPczaFHAV
	o7dGjCL3FLB2QFW/xNShXbe3oXjLTavEHm/7y65PvfBPZD2tZqAUl6DRG1x1KfONp2KhKGvj0+B
	pl0yMBX5hrZQu2pxe7n1wK+wKsTvTjua1WywzEMdi1hehM+Sk2DrSvPUWculNOnXC/04UhS8XqU
	IwoFnRngA1mWCk52CjrJDW/FrwbSs2ZituDYiamXa19sDm6IVbZC9K4tLBzwhEFJqsbRbbFx9lX
	asZF34qBXoSbz2dLtCrpOX4lvkcFmH1bjdPhlf/j7r58a2hjAVbbaPZMe9NoVgfPNgVbc6fCfex
	bqRolHm5munWwniOrvJGF8aloQrIGqfdBIQnw==
X-Received: by 2002:a17:90b:17c6:b0:3a0:516d:9f88 with SMTP id 98e67ed59e1d1-3a098761df2mr9445557a91.26.1790594315143;
        Mon, 28 Sep 2026 04:18:35 -0700 (PDT)
Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com. [74.125.229.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b8efb156sm21848995a91.1.2026.09.28.04.18.33
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 04:18:34 -0700 (PDT)
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-145ab8fd39cso2597981c88.2
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 04:18:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwOmYRaLs8T3qEKq+FowdRlbKqS098r+hmAxx+g0Kp4NdLSuGrN4FH+IekyTdVpL2dzm6sTa8fD3ty/Tw==@vger.kernel.org
X-Received: by 2002:a05:7023:a5c:10b0:144:f9e5:c355 with SMTP id
 a92af1059eb24-146d058dcb5mr9141407c88.41.1790594312280; Mon, 28 Sep 2026
 04:18:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902002553.34839-1-jordan.mymail@gmail.com>
 <20260902002553.34839-4-jordan.mymail@gmail.com> <CANiDSCvBkMDS9eSRRVoMqQT41c2uq+MQtUFHPm0gGuv13FWevQ@mail.gmail.com>
 <20260927220625.629672-1-jordan.mymail@gmail.com> <CANiDSCsBbns32PGir2JCZ8Ofv9CpXgjV50k-vszmFY-jT-2WNg@mail.gmail.com>
In-Reply-To: <CANiDSCsBbns32PGir2JCZ8Ofv9CpXgjV50k-vszmFY-jT-2WNg@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 28 Sep 2026 13:18:18 +0200
X-Gmail-Original-Message-ID: <CANiDSCuNubuJ1RyTT4g4PORoJzEorwH6CFmcPnXrkRYccz5deg@mail.gmail.com>
X-Gm-Features: AclHuK-4gSKCm-vdwnMIa4Lzdl68g7krqZ_yuaVHRWeczHSgnjMBQV43PvANYNU
Message-ID: <CANiDSCuNubuJ1RyTT4g4PORoJzEorwH6CFmcPnXrkRYccz5deg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] media: uvcvideo: fix up missing AUTO_UPDATE on the
 OBSBOT Tiny 2
To: Michael Jordan <jordan.mymail@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Michael

Since Hans is going to merge your series today into the uvc tree you
should do c) instead.

Sorry for the mixed messages :)

Regards!

On Mon, 28 Sept 2026 at 08:57, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Hi Michael
>
> On Mon, 28 Sept 2026 at 00:06, Michael Jordan <jordan.mymail@gmail.com> wrote:
> >
> > Hi Ricardo,
> >
> > On Wed, 2 Sep 2026 08:34:34 +0200, Ricardo Ribalda <ribalda@chromium.org> wrote:
> > > Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> >
> > Thanks for the reviews on v2.
> >
> > I have a question about how to handle a second device. I now have an
> > OBSBOT Tail 2 (3564:fefc) and it has the same defect as the Tiny 2.
> >
> > Its GET_INFO bytes match the Tiny 2 control for control:
> >
> >   CT_PANTILT_ABSOLUTE   0x03
> >   CT_PANTILT_RELATIVE   0x03
> >   CT_ZOOM_ABSOLUTE      0x03
> >   CT_ZOOM_RELATIVE      0x0f
> >   CT_ROLL_ABSOLUTE      0x01
> >
> > Without a fixup entry, pan_absolute reads back the commanded target the
> > moment it is written. With entries for 3564:fefc on top of v2, all three
> > controls report the live value on GET_CUR, both during a commanded move
> > and when the camera changes them on its own:
> >
> > - pan/tilt position and pan/tilt speed follow the gimbal under the
> >   camera's subject tracking, with the host issuing no requests;
> > - zoom follows a zoom change made at the camera.
> >
> > I checked the other AUTO_UPDATE controls the same way as for the Tiny 2.
> > White balance and focus only echo the last SET_CUR. Exposure time reports
> > live values until the host writes a manual exposure once, and from then
> > on echoes that value, across a power cycle. I would leave all of those
> > alone, as on the Tiny 2.
> >
> > So the change is three more table entries, identical to the Tiny 2 ones
> > apart from the product ID. v2 still applies cleanly to media/next as of
> > 2dcdfb625c3b, so nothing else forces a respin.
> >
> > Which would you prefer?
> >
> >  a) a v3 with the Tail 2 entries folded into 3/3;
> >  b) a v3 with the Tail 2 entries as a new 4/4, leaving 1-3 as reviewed;
> >  c) leave v2 as it is, and send the Tail 2 entries as a follow-up patch
> >     once v2 is applied.
>
> I prefer b) because c) cannot be tested by media-ci.
>
> >
> > I lean towards (c), so that a reviewed series is not disturbed, but I am
> > happy to do whichever is easiest for you and Laurent. In any of the three
> > I will include the Tail 2 lsusb -v output.
>
> BTW, I am curious, did you hear anything back from OBSBOT?
> Could you also report this to them?
>
> Thanks!
>
> >
> > Thanks,
> > Michael
>
>
>
> --
> Ricardo Ribalda



-- 
Ricardo Ribalda
