Received: from mail-lr2-f34.google.com (mail-lr2-f34.google.com [74.125.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754561F8691
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 14:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790866085; cv=none; b=XEwenRRDOspIi+GDKzP3IBt/3OytQNwu67ysAXvKxBPLRQWBdwBfSdAyP07W8UEeVgEmRbukOByBwm4wXg4Bi1ekvX2wJAE2IIKc200OdxZcbGoBAcY2pLqxwppDXM37eWud7iyoje/q78tRkEFOcg5cRRuRNmue+RYmhtvj9Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790866085; c=relaxed/simple;
	bh=rK0uz/KSkFjE1x+MXlOe6fim8a3tw/1d0l+5isYZhlA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pPtJPei5axR4pPyKClx6au5Ux0pMU9YElN/CBMKpOfOK0vfwgzZoufwvbzhgj6EHyOrkrooam9MwRGf3dUQpTBBlojpeHLow/m54JSg6zooGd78hUr6bMGBjkaHUlWwgD/OArTiBkh0KN9jJ/0dnGpRNdfRVJckAi5ulxYUG0/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CfoPka6L; arc=none smtp.client-ip=74.125.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CfoPka6L"
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a772de44c5so17729531fa.1
        for <linux-media@vger.kernel.org>; Thu, 01 Oct 2026 07:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790866078; x=1791470878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7FOj1RGK/mRk1UhJU2+5CuBy3GqPCpS4tTpMqltPtOA=;
        b=CfoPka6LNgH6fX3A9a5+O26ytPhKIxp4IxTWSsjpnkAKmmvQ4CSyTtp2PJ7uo5dQHo
         hzZ0ABXnIy0A2UmgbrA02FXAEgTBktGheQ3LYD0CI/VualuSksb2ZBKLVqYRo1MpcsBa
         ZshPZIs+gkemwLZUqVcnxeX2FUliHszyD2jmAIEmQDt4mOAbfDwh/nLmmKUETFTXATRd
         LZnQfLF7BWLYiBshtHx8CfRz7tgY48/T6hzqGqEDP+entcr2ZSDRiGgCV7bTDkTS9HxQ
         Z1MY1deL2KOUEg8CNHllPcsS2ig6ZyufCsqAGPDgcwdvjWlK3kHairqD/NXsWAsNqedj
         MORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790866078; x=1791470878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7FOj1RGK/mRk1UhJU2+5CuBy3GqPCpS4tTpMqltPtOA=;
        b=n8ex75UpE1wgCwKgtdGXg5U43qiQm8V0hFjOvNVIZ2/kSbuFCPYMq3KU78W6iYBVYr
         Fa/87QsT0U0vI3ULEmV5FZE+f4uyJEBd1YTjTYZLct2IwbDrUOwAq6g9IOvfPT2cugnV
         K0edcRBJllzgYJkKAaZf/iBYZMqlakZifIGEWMMds3HTzInqZOood2RB65nlMFhHAfDH
         q+7jDmIFoCk8rf+oe3adB1dj3Sq1xz0op1O9o370rNoJvrGLUKt3GveL6mx2XOI3v+pt
         duKiVuoovM61q+gFYYF6SOzuSygR/Ryd5ddbgFtadxm24ZxSXW8W3tORFYEgioeFcmAU
         piPA==
X-Forwarded-Encrypted: i=1; AKwUvBwmHaMdWKBs5LbLRNK3LOLcbn+6SYSThiXMTYDqPwttCnE3J/cLRj0UVAKOkq3POVdW5Sg5a1Y8WSUaMg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLdJfzL4XmLJoeOXI/v/VrCsNWu5RTTlPqJblG6RQetnXZSmy8U
	V2FWYzPmipZ2IzqqJjqO08g/2g/1g40vaXVbHQmNfs4bipuqhzBPmvXk
X-Gm-Gg: AYBFou12mnVXrNaPEdWgvS547tql0PjsSfcSbVyjSWH/ZJgwfTKIXhlVgQGeAbXLMT4
	H2eC1Z02z/hI++5dzSk98KdSWNOLUi/AxIOXQqB/M0TPJa6mZEaot3jk20Cn0MsYHz3cvTsekQV
	Ss42xWLbJ8xSVD3k29E1QJEvE2IJZ5cKr/BXlBPxIToMiGVeCW4P6CouQENAFo3kuVvG7fK4BMe
	JePJbSrtNG9WZfTJ26dqaa1gMCq8UTQVVdev/R7hGWmxz01cVyFWmBhL7bTVaTxkf79DuFjludX
	E1X5/hs/XQfCM7FZz2jqKq7zx1YtEypsEszSi556E7FYTjlyY0uckKeSMjLs6h5fqqkrsgj5x78
	Vysl2jkepUwpLUc0FWl/JLjLhORTlAMLuLG/OYlop1cEzRSAvBrJ5TwRy6kuktRqq4UoOvdw9ss
	G47BvxXVnAO8YQ+zQjpGF8X404nC8Y1gM383lq2+wAANELRVF8rWmyUgiCgks+XISED7BiQScCK
	fkLZeY7Pec=
X-Received: by 2002:a05:651c:41d5:b0:3a7:72ec:81aa with SMTP id 38308e7fff4ca-3a779207c3dmr16366201fa.28.1790866077663;
        Thu, 01 Oct 2026 07:47:57 -0700 (PDT)
Received: from quietus.tail91f8a6.ts.net ([169.40.47.10])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87cfec0efsm918191fa.17.2026.10.01.07.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:47:57 -0700 (PDT)
From: Ruslan Koreev <koreev.r@gmail.com>
To: Qiling Zhu <kmatzkaczor244@gmail.com>
Cc: Ruslan Koreev <koreev.r@gmail.com>,
	sakari.ailus@linux.intel.com,
	benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com,
	dan.scally@ideasonboard.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	pm@petermarshall.ca
Subject: Re: [PATCH 4/4] media: staging/ipu7: Add monochrome pixel formats
Date: Thu,  1 Oct 2026 17:47:47 +0300
Message-ID: <20261001144747.1167917-1-koreev.r@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <aru5-aq_sPUDy8dq@ThinkPad>
References: <20260924171820.1179823-1-koreev.r@gmail.com> <20260924171820.1179823-5-koreev.r@gmail.com> <arY2CULvwXGyVvH_@kekkonen.localdomain> <20260929092238.1765758-1-koreev.r@gmail.com> <aru5-aq_sPUDy8dq@ThinkPad>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Qiling,

On Tue, Sep 29, 2026 at 09:25:39PM +0800, Qiling Zhu wrote:
> Since you reported successful plain-V4L2 Y10/Y10P streaming on
> next-20260924, could you share the exact media-ctl/v4l2-ctl commands
> and any setup performed before STREAMON?

I tested on next-20260924 with intel-ipu6 bound to 8086:b05d and v1
patches 1-3, with the vd55g1 changes reworked for v2. Before the plain
V4L2 test, I ran the following with libcamera 0.7.2:

  cam -l
  timeout 30 cam -c '\_SB_.LNK1' -C5 -s width=804,height=704

That captured five frames at 804x704 R8. Afterwards, media-ctl -p
showed Y8_1X8/804x704 on sensor pad 0 and CSI2 pads 0 and 1. The sensor
link was enabled and immutable, and this capture link was enabled:

  "Intel IPU6 CSI2 2":1 -> "Intel IPU6 ISYS Capture 16":0

I did not enable any links manually. I have not repeated this sequence
from a fresh boot using only media-ctl and v4l2-ctl, so the prior
libcamera setup is relevant to reproducing my test.

For each format, I ran these commands first:

  sudo media-ctl -V '"vd55g1 1-0010":0 [fmt:Y10_1X10/804x704]'
  sudo media-ctl -V '"Intel IPU6 CSI2 2":0 [fmt:Y10_1X10/804x704]'
  sudo media-ctl -V '"Intel IPU6 CSI2 2":1 [fmt:Y10_1X10/804x704]'

Then, for Y10 (with the trailing space in the FourCC):

  sudo v4l2-ctl -d /dev/video16 --set-fmt-video \
    'width=804,height=704,pixelformat=Y10 '
  sudo v4l2-ctl -d /dev/video16 --get-fmt-video
  sudo timeout 20 v4l2-ctl -d /dev/video16 --stream-mmap=4 \
    --stream-count=5 --stream-to=/tmp/ir-Y10.raw

I repeated the three media-ctl commands, then used:

  sudo v4l2-ctl -d /dev/video16 --set-fmt-video \
    'width=804,height=704,pixelformat=Y10P'
  sudo v4l2-ctl -d /dev/video16 --get-fmt-video
  sudo timeout 20 v4l2-ctl -d /dev/video16 --stream-mmap=4 \
    --stream-count=5 --stream-to=/tmp/ir-Y10P.raw

Both Y10 and Y10P captured five frames successfully and the images
looked correct.

I have not tested next-20260928, so I cannot yet explain the EPIPE.
Could you capture media-ctl -p immediately before STREAMON and any
IPU or vd55g1 messages from dmesg after it fails?

Ruslan
