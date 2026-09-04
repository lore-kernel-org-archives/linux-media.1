Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22AD44EBACC
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 15:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788535237; cv=pass; b=SqReUAUevPR4Yw4FzKD3Vgru8CykFk2qdP4wuZz+wRek+cNqRrgfdDceskq6qScPAdAwpvugbb4DVLTccoCrN4SAy927WLgt1oYgGP2k8/jQ0gGcQL3YqdbhWcCyr9Ypq8VHbZwbF5kiOj7wXPG82H+5YgAFFQrHaVodM4Fg8OY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788535237; c=relaxed/simple;
	bh=1gx+ob7R/t6EJbm9UCNagpUORydySsNQt2S5QVVO3wQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gK3rA+859B9DhWzpNFoHKhfX9qWDnS/4X9yVhQGIdQvlFjpW8rsNqA45OcIo+bSUEjQwKNIB3UMRaJQeFiveeVE5tRr1RhB6uyCSaWtmXokQupRNYOfT/FbsOvL8nYH6pUnFkL+QpearLtuUHiXl6Sgl2qm7ZhHWz0rfHBXmb4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oU11G0T/; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oU11G0T/"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a668cacdadso1694365a12.2
        for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 08:20:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788535233; cv=none;
        d=google.com; s=arc-20260327;
        b=hi23uM/mHDFOOQZsdcIJCqdgtHqRn6h+fwWNmNL6Ja00nvUpSMPVoEKgnHn+CxJgMt
         STlScrxFqBpJAHtOCOtq3BPTCF7mmVOEtyWCzi95MNlNlvZetHvhb6Tgh2DWGqvWTqPc
         rEn8V9tQvHdCK0iqxLwusIfchgRWtBq9S6zCicNv6qQRF0JDTzIlUOGqBmNTpTB8nBoY
         45fNBZFl7vJMNs4SNu75D+zf0yHiPQHzaAOEKlIByydkmGYMwhbutWzYHBCoqzIKZax1
         EbczBMTIe/fFeYpb94kuwrryiAfzf9nfA5o7OljoxWHWdJHf1kZPkvN4E2DG1fOUbe1j
         p6Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I74GumaLgD5w7dclPgfVNDe2pVJDZFbfWC+x89UkeS4=;
        fh=LKxoAhB++3ZmFF/+TyYFvhzfivMFFIalPPJ8oA9WEs0=;
        b=T7qBfsvozOqUD+SpsfxGg/kAy0L2oJCAxAMGpIB5tb5qKjwBZPOpk6S3uq7WtZrJpq
         10WnOLkpDVzsg1laOflTuTjzYjOTvOnl/brYpffr6D2XquoojH6z6BSzw/fWmAeHcsdo
         Zp/yisdf4xmO3Uj2rOYh2M/J/1q06cgDFL6Y2zbzSqzwzSX2tQ11nybvzoPWABTJsceC
         3FOXZLSkLZRPcLG1DdD9yhHz/FNu5xPh297SkdLAvTeOQS66qt+/UMkgiEkTHrkWdUcZ
         zw78+eu0wHosMq7ix0jv6aADKDUVnw/tsH4XrP3QOmUIeGs7iFlT+P3m769k+fB5p2Ig
         dIEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788535233; x=1789140033; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I74GumaLgD5w7dclPgfVNDe2pVJDZFbfWC+x89UkeS4=;
        b=oU11G0T/t65FTuXushxah4lQVa0FUklJ8DePm02m4H7cJiBN51Ow4XPhZqrgqQ23dm
         mPy4dnzC/7Thyz/NiiyWBva+LTbEYnbdEaoGBElpCgPYs6NX/ZKakVpzIAlPOF2KOex/
         8G9d5qJpUuR2Bp3BmeVQXKma2WqjWu/zKA8H7MmXX7liiF87H/lBj14IT5pETQGvAJec
         SxGXHKe25MDJfy51oADsmlQ01NDgMquEp1/25DJGz7SsdCip5kOh2/UUCBYKiwX71gyc
         PmFBGcoPNrFoqfXiYOdIX0bYhsdxjblSL7ePtYaYKVzPgeN3tSJ5ttk8Tc8JLD15dSB6
         vO2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788535233; x=1789140033;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I74GumaLgD5w7dclPgfVNDe2pVJDZFbfWC+x89UkeS4=;
        b=mRkfTrViaZ2ltLCk9ygihpbokfZiy1wrIGbUeS+iCFK5kcmIlFSSoXvkHFMEV+wmaU
         DTZxBn8SrBaxBlOfRWPSUyRdlvxxFm4E4A3mUO5FFdjEekZHxa7TadU7sSrSns5TQH3H
         TYGKc8HP++WPctyFE1rp3DF1W29D0H4XlyMSAkhER3FmX0nRolPmXN8KQ0f0VmMa3rHe
         dInt6Oa6UcVwV34ijXmm22ZDyrh5udhOAsTnujHsBQQgPXaXzRWOFmTIBeG2ga+xPL0a
         nwbq8HF+aaxdetH+yczG9o/cB/d2xEOKIIijZF7e3XjtaGwDOSuErvdbnIIpJcg+R+Tg
         kc/A==
X-Gm-Message-State: AFuF++m/5kPQcnGni9W/pcauSyj4md0LATGyJGgIC7NKz9kXFD/QRz7J
	6jO+JNQ+WHiiwA02cnuBtv1zwd3nh0pYsfkdVHtumFzhT39yFBSP9nyEBxDqwpic/35f1vkS+oG
	GR3YqacSbA/GSZz6/vY/5I/pa9MmBHfU=
X-Gm-Gg: AYBFou17odBaRmCVzKw6kQIwwNYB2I+X08HoJ4QmFMQ1ym1Z7t/8IzoFUfe5d/T6jwp
	P1jInOqGjvlAA2ggIuh4t8gebpgcuSmmt8l6UcsgAvLdzUKs8LNvZGwBChNnNlrj8ujsHhCrTRk
	0E9oTuU3zcUB/poeFDbc11Os8NlvFZpmvj05Z1BYhGwrHlxaQYOf8MbDFajcxw0ujELwuz1GSoH
	kHQsWf+Tgqu8s/FVLQTK8NNs4mOYK+yRNbpmgsUhtPiBBCNOT51Bjwlu7bSkQCannJqY6aphsNh
	4DfCU7XlHDkhu4a3KwCbSJq3I2tPy7NS11BJW7ecgcF881wqEwohjmbG3wMnjK0DX9yn91D58nq
	N
X-Received: by 2002:a05:6402:3789:b0:6a7:ea54:393 with SMTP id
 4fb4d7f45d1cf-6a7ea542680mr1674579a12.36.1788535232829; Fri, 04 Sep 2026
 08:20:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820182156.18078-1-jackflusche@gmail.com> <CAMeQTsYbeDqz-u8EsDpeYqH6P+KtBG9kDgrVC6PA5QrX4yxdHA@mail.gmail.com>
 <CAM0duoKuGt3UgdFc+-xznJR9R8K2B0PJ6-5z5W0kNBc2vs8fVw@mail.gmail.com> <CAMeQTsYLBQguh4aXa5H6nM8WWkfxHrjgK240Ds7VBmWhS9GovQ@mail.gmail.com>
In-Reply-To: <CAMeQTsYLBQguh4aXa5H6nM8WWkfxHrjgK240Ds7VBmWhS9GovQ@mail.gmail.com>
From: Jack Flusche <jackflusche@gmail.com>
Date: Fri, 4 Sep 2026 08:18:15 -0700
X-Gm-Features: AcwNN1UA2tzix5DI3HD9S9cQD1TvSOcyOQycMtM_bpT-O_xcF15lFzH26n-52Ak
Message-ID: <CAM0duoJ=p3mTn7UyVowUjzUNUsMUS4xgK2qCw91NsmcRSgbgbw@mail.gmail.com>
Subject: Re: [RESEND PATCH 0/5] Add driver for Broadcom FacetimeHD camera
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com, 
	hverkuil@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

That sounds great, thanks.

On Fri, Sep 4, 2026 at 3:08=E2=80=AFAM Patrik Jakobsson
<patrik.r.jakobsson@gmail.com> wrote:
>
> On Thu, Aug 20, 2026 at 10:13=E2=80=AFPM Jack Flusche <jackflusche@gmail.=
com> wrote:
> >
> > Yes, merging the PRs is probably a good idea. On the firmware, I only
> > included the install script since it doesn't require a manual
> > download, but including the extraction script as well isn't be a
> > problem.
>
> On second thought, this needs to be distributed separately. Distros
> should figure out how to create a package that downloads and install
> the firmware files on installation. I did this for openSUSE [1].
>
> [1] https://build.opensuse.org/package/show/hardware/facetimehd-firmware
>
> > Can you message me (or submit a patch set) when the driver is ready
> > for upstreaming?
>
> The driver is still quite ugly in many places and not up to kernel
> standards. I'll resubmit this to staging instead but leave out your
> modifications. You can then resubmit your fixes on top of that
> instead. Would that be ok?
>
> -Patrik
>
> >
> > Thanks,
> > Jack
> >
> >
> > On Thu, Aug 20, 2026 at 12:37=E2=80=AFPM Patrik Jakobsson
> > <patrik.r.jakobsson@gmail.com> wrote:
> > >
> > > On Thu, Aug 20, 2026 at 8:22=E2=80=AFPM Jack Flusche <jackflusche@gma=
il.com> wrote:
> > > >
> > > > Merge Patrik Jakobsson's out-of-tree driver for the Broadcom Faceti=
meHD
> > > > camera on some Apple Macbooks using the Video4Linux 2 framework to =
add
> > > > in-tree support and remove the need to install a DKMS package
> > >
> > > Hi Jack,
> > > I'm fine with upstreaming this but here are some initial thoughts:
> > > - Should this be in staging instead? I defer that question to the
> > > media maintainers.
> > > - There are quite a few PRs pending on github. Perhaps I should merge
> > > them first and then we redo the submission with those included?
> > > - Perhaps we should have both the download and extraction scripts
> > > included? We've just updated the download script to grab a much newer
> > > version which adds support for new devices.
> > >
> > > Thanks
> > > Patrik
> > >
> > > >
> > > > Jack Flusche (5):
> > > >   facetimehd: copy code from patjak/facetimehd
> > > >   facetimehd: add Kconfig and Makefile
> > > >   facetimehd: fix compile-time issues and formatting
> > > >   facetimehd: add firmware extraction script from
> > > >     patjak/facetimehd-firmware
> > > >   facetimehd: add entry to MAINTAINERS
> > > >
> > > >  MAINTAINERS                                 |    7 +
> > > >  drivers/media/pci/Kconfig                   |    1 +
> > > >  drivers/media/pci/Makefile                  |    1 +
> > > >  drivers/media/pci/facetimehd/FIRMWARE       |    6 +
> > > >  drivers/media/pci/facetimehd/Kconfig        |   12 +
> > > >  drivers/media/pci/facetimehd/Makefile       |    2 +
> > > >  drivers/media/pci/facetimehd/firmware.sh    |   61 +
> > > >  drivers/media/pci/facetimehd/fthd_buffer.c  |  126 ++
> > > >  drivers/media/pci/facetimehd/fthd_buffer.h  |   73 +
> > > >  drivers/media/pci/facetimehd/fthd_ddr.c     |  670 +++++++++
> > > >  drivers/media/pci/facetimehd/fthd_ddr.h     |   33 +
> > > >  drivers/media/pci/facetimehd/fthd_debugfs.c |  204 +++
> > > >  drivers/media/pci/facetimehd/fthd_debugfs.h |   16 +
> > > >  drivers/media/pci/facetimehd/fthd_drv.c     |  558 +++++++
> > > >  drivers/media/pci/facetimehd/fthd_drv.h     |  124 ++
> > > >  drivers/media/pci/facetimehd/fthd_hw.c      |  710 +++++++++
> > > >  drivers/media/pci/facetimehd/fthd_hw.h      |  128 ++
> > > >  drivers/media/pci/facetimehd/fthd_isp.c     | 1468 +++++++++++++++=
++++
> > > >  drivers/media/pci/facetimehd/fthd_isp.h     |  770 ++++++++++
> > > >  drivers/media/pci/facetimehd/fthd_reg.h     |  183 +++
> > > >  drivers/media/pci/facetimehd/fthd_ringbuf.c |  133 ++
> > > >  drivers/media/pci/facetimehd/fthd_ringbuf.h |   45 +
> > > >  drivers/media/pci/facetimehd/fthd_v4l2.c    |  759 ++++++++++
> > > >  drivers/media/pci/facetimehd/fthd_v4l2.h    |   34 +
> > > >  24 files changed, 6124 insertions(+)
> > > >  create mode 100644 drivers/media/pci/facetimehd/FIRMWARE
> > > >  create mode 100644 drivers/media/pci/facetimehd/Kconfig
> > > >  create mode 100644 drivers/media/pci/facetimehd/Makefile
> > > >  create mode 100755 drivers/media/pci/facetimehd/firmware.sh
> > > >  create mode 100644 drivers/media/pci/facetimehd/fthd_buffer.c
> > > >  create mode 100644 drivers/media/pci/facetimehd/fthd_buffer.h
> > > >  create mode 100644 drivers/media/pci/facetimehd/fthd_ddr.c
> > > >  create mode 100644 drivers/media/pci/facetimehd/fthd_ddr.h
> > > >  create mode 100644 drivers/media/pci/facetimehd/fthd_debugfs.c
> > > >  create mode 100644 drivers/media/pci/facetimehd/fthd_debugfs.h
> > > >  create mode 100644 drivers/media/pci/facetimehd/fthd_drv.c
> > > >  create mode 100644 drivers/media/pci/facetimehd/fthd_drv.h
> > > >  create mode 100644 drivers/media/pci/facetimehd/fthd_hw.c
> > > >  create mode 100644 drivers/media/pci/facetimehd/fthd_hw.h
> > > >  create mode 100644 drivers/media/pci/facetimehd/fthd_isp.c
> > > >  create mode 100644 drivers/media/pci/facetimehd/fthd_isp.h
> > > >  create mode 100644 drivers/media/pci/facetimehd/fthd_reg.h
> > > >  create mode 100644 drivers/media/pci/facetimehd/fthd_ringbuf.c
> > > >  create mode 100644 drivers/media/pci/facetimehd/fthd_ringbuf.h
> > > >  create mode 100644 drivers/media/pci/facetimehd/fthd_v4l2.c
> > > >  create mode 100644 drivers/media/pci/facetimehd/fthd_v4l2.h
> > > >
> > > > --
> > > > 2.55.0
> > > >
