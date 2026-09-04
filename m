Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CA8444717
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 10:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788516514; cv=pass; b=a8XUTOos7P/x+tZhGBE+6SeQmk2A5S/DbxGdHAe1b2sDdaV0rymDY1tBCejbV1Ed9O1yNPx9W5/5njiK8V5JVv9hdWkUHEfrrNCTBlpEld9WZmpkTlB79t1YMqkoGazY6NTdFD3xSEvqFw/Gq1AOxh7EOzaRixMA/jJYvYAkk80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788516514; c=relaxed/simple;
	bh=Neh3ISx8FU0Ur5RntB0HE+TPjm/24RSrCVFRHDOrcVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TkMeqITLw6S9LCBAf2hPnI4zlwTd6bn/Jvfeq+J8FZyMBRFBjmrycqJHaLmigX59r8rC6/mTBRoGkbykvBHFkTXxoP5nwmYjsMlH2sFYB1f1+1vBdqZ9Jg+jWRvPpQMivYG/6Zo89ZPA6AF1Uo2ZJjryPE4AGULuWbQjOviSmfE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mH4WVrzJ; arc=pass smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mH4WVrzJ"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4b190cdc9feso627064b6e.0
        for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 03:08:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788516512; cv=none;
        d=google.com; s=arc-20260327;
        b=hfh+pq/YeSssFQMT2hFWWPfKeP7y00pYLDbNOwnvigz1YF5e5D5kBRtUh8lHEaZCoZ
         oq3QaVMsb8R5lZh82a637XtwPy9iPVjdYNVfPdFn2n0DeGxYjOG8KMs7B15nQSQt1koJ
         hPf7MriA9xnUBwNS0O3VskHnJ++2k5pUmcgB+EpGkt3K4in67pdEGjtA6kbXUN6JYp2e
         vznRNas4WdEYUxTRg8tNsDo6nElVKOElKby9BM5iMOq1eflK5LVMcMnjaGGWPkCDhkBQ
         nsa4KXJPUxIlVP39Bm+oVJLovkSpPF1OuHpUmC6HDONE8HgFk1iK0vsEo8mRzlcRxjDP
         9nLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xs97/33FuwU/L1AphDmJWv0zOK7lR4UiTGp07ZMWbPA=;
        fh=9S8fetvmvhGe3iwNnWTBC6KmAvabHSpaM2ZXMHcqqo4=;
        b=pt95s1lpl/CKhpY6WHy0QTv8LDXDi6DGxnNwJot6F4S8ZA1CCv/VOxVzz5RBErtASL
         odT7WMWpm2jzpLyPpHNf2bnkUD/IfwlpZWe+RYnZ9b+ann1KOTsj5b1DJ+fisXNWrYPn
         ddZh48gfioGHLuacTTZEbziVQNOzqW7k5nBa1mlghuCt9Ae5hBtYvxUi+gsaUbzCrgPf
         +Gxj7ftCkpWcY/CBUC2VNWi3iPbPUA3042BP+XAulPiuBcD9FRDagGFaE5DZ0JEq1z0J
         VQ5TDa+zNSHM4/SWePFKIekKpHORiwCU2+9aXJuyNb4QD1FIvJJ7RuCnO17bR6cl0qvT
         9+vA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788516512; x=1789121312; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xs97/33FuwU/L1AphDmJWv0zOK7lR4UiTGp07ZMWbPA=;
        b=mH4WVrzJ5Ann4j2AAEGKm/NzgiMR85LWXK3PBcDnzkxVhqfhEwfk4y+fvWdn+m/JQ4
         o16xTkKli/ymOayE4WmGYiuwSN5w4g0WveCy+KhLPibEdJZ2ZGt02s49FQhbmYGR/qLh
         nsMSTtWWPL3RXRrdkf6TM14rjEwYkbOOwREnhcLRgKC6VibZ6RfYtHvV6axaGVkGwqZ2
         aQ92k9KmGlX0/pPqX7oUscUiqbOTf/d1faqAisXnfK9KxMO7W3cMjRU5Pobf08A7Fdpm
         JeRs7PyyRxvqtcSl9kYKuwTzSxuOTM9AUZlsl00GlYbIKn6FrpEO6+RgLwKsvGfw7SXb
         tVZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788516512; x=1789121312;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xs97/33FuwU/L1AphDmJWv0zOK7lR4UiTGp07ZMWbPA=;
        b=XZBbY0EWRypVri/WfqWgAOlytupWUwZVREe8wXNX+4qn7EPfbsCMrICw6FBTdP1vdn
         S+d4rMrwVOxu0CMMAjrAGwHprNuteX+s4Wxz6W8q4s1uskOs0jtTQRFzvy0axuv7WFK/
         9S7n9AqR3miFUHtuYLLEKCAGybZDjlHtgokskcyDrfUXJhH9qQoAXHtX38TiSF+kXQQm
         LvBR0znqqPi4UUKYx6q1AIdZuot8Y2g3jJFxstTm7o04FRQxJX8NKn20r2pnDlW+gWFc
         SZ1J3fxc90Jud6qQ3O1sRZ7IPCN4HkJ7t2lOIR2FDaof+Z3mo7LlWCvJFOKUW4WomwKn
         aX1Q==
X-Gm-Message-State: AFuF++nHs2aL0fFQMyh2URP7I95/3PdQ0q84gkPW8hG/gLlx6mDsw0sA
	bATSb3tmbhI3JLVe9lQgE7gvXM1tfghIGGDNSvR0ocj+lZJ6ECXvpBo9TKuVBtxWFC9oaSimHta
	cgPt8rVBYmrFVzz9+0Ly9rei1N8/Ryk4=
X-Gm-Gg: AYBFou1FWlqUVRgKzWMhuyRFBa9oytvikYryT22wRH9/dwnwp/7TX81M1kIiijA+EPC
	96AiCZv/HHIxT44QBcA1d3NYRvEzLyIDEvQSYyFOpKoTUCt+cI2CXx2jvhFIL/vJv/fsMkZCDxv
	WiPLVNxFJL2Rlbj3SIejg79pYFMynQJkSCfj1bm8Knwh7tuto+eWF9XdQ1gGQiys+QTbVPD42Jz
	BE/dKaW/0lVQY8cF4ja/60v0xMdrLZ5YfC2H1F4IGOL+ykU8rL6UHj0mPIaGLfrcHvEJOQ8wf0I
	8e5Av0vYt7RW3NHdKkuP+ljLqNofEeN6IXxNksneMGiygkaNLGP8XZQ=
X-Received: by 2002:a05:6808:1a1b:b0:4b5:5bfb:f25c with SMTP id
 5614622812f47-4b9628589bfmr4279541b6e.21.1788516511828; Fri, 04 Sep 2026
 03:08:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820182156.18078-1-jackflusche@gmail.com> <CAMeQTsYbeDqz-u8EsDpeYqH6P+KtBG9kDgrVC6PA5QrX4yxdHA@mail.gmail.com>
 <CAM0duoKuGt3UgdFc+-xznJR9R8K2B0PJ6-5z5W0kNBc2vs8fVw@mail.gmail.com>
In-Reply-To: <CAM0duoKuGt3UgdFc+-xznJR9R8K2B0PJ6-5z5W0kNBc2vs8fVw@mail.gmail.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Fri, 4 Sep 2026 12:08:20 +0200
X-Gm-Features: AcwNN1XFxGKQHDMzcP37af4OWRCIQ3yp_HhfKtWVi06pNEgasoeC_Hirwt9vOTk
Message-ID: <CAMeQTsYLBQguh4aXa5H6nM8WWkfxHrjgK240Ds7VBmWhS9GovQ@mail.gmail.com>
Subject: Re: [RESEND PATCH 0/5] Add driver for Broadcom FacetimeHD camera
To: Jack Flusche <jackflusche@gmail.com>
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com, 
	hverkuil@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2026 at 10:13=E2=80=AFPM Jack Flusche <jackflusche@gmail.co=
m> wrote:
>
> Yes, merging the PRs is probably a good idea. On the firmware, I only
> included the install script since it doesn't require a manual
> download, but including the extraction script as well isn't be a
> problem.

On second thought, this needs to be distributed separately. Distros
should figure out how to create a package that downloads and install
the firmware files on installation. I did this for openSUSE [1].

[1] https://build.opensuse.org/package/show/hardware/facetimehd-firmware

> Can you message me (or submit a patch set) when the driver is ready
> for upstreaming?

The driver is still quite ugly in many places and not up to kernel
standards. I'll resubmit this to staging instead but leave out your
modifications. You can then resubmit your fixes on top of that
instead. Would that be ok?

-Patrik

>
> Thanks,
> Jack
>
>
> On Thu, Aug 20, 2026 at 12:37=E2=80=AFPM Patrik Jakobsson
> <patrik.r.jakobsson@gmail.com> wrote:
> >
> > On Thu, Aug 20, 2026 at 8:22=E2=80=AFPM Jack Flusche <jackflusche@gmail=
.com> wrote:
> > >
> > > Merge Patrik Jakobsson's out-of-tree driver for the Broadcom Facetime=
HD
> > > camera on some Apple Macbooks using the Video4Linux 2 framework to ad=
d
> > > in-tree support and remove the need to install a DKMS package
> >
> > Hi Jack,
> > I'm fine with upstreaming this but here are some initial thoughts:
> > - Should this be in staging instead? I defer that question to the
> > media maintainers.
> > - There are quite a few PRs pending on github. Perhaps I should merge
> > them first and then we redo the submission with those included?
> > - Perhaps we should have both the download and extraction scripts
> > included? We've just updated the download script to grab a much newer
> > version which adds support for new devices.
> >
> > Thanks
> > Patrik
> >
> > >
> > > Jack Flusche (5):
> > >   facetimehd: copy code from patjak/facetimehd
> > >   facetimehd: add Kconfig and Makefile
> > >   facetimehd: fix compile-time issues and formatting
> > >   facetimehd: add firmware extraction script from
> > >     patjak/facetimehd-firmware
> > >   facetimehd: add entry to MAINTAINERS
> > >
> > >  MAINTAINERS                                 |    7 +
> > >  drivers/media/pci/Kconfig                   |    1 +
> > >  drivers/media/pci/Makefile                  |    1 +
> > >  drivers/media/pci/facetimehd/FIRMWARE       |    6 +
> > >  drivers/media/pci/facetimehd/Kconfig        |   12 +
> > >  drivers/media/pci/facetimehd/Makefile       |    2 +
> > >  drivers/media/pci/facetimehd/firmware.sh    |   61 +
> > >  drivers/media/pci/facetimehd/fthd_buffer.c  |  126 ++
> > >  drivers/media/pci/facetimehd/fthd_buffer.h  |   73 +
> > >  drivers/media/pci/facetimehd/fthd_ddr.c     |  670 +++++++++
> > >  drivers/media/pci/facetimehd/fthd_ddr.h     |   33 +
> > >  drivers/media/pci/facetimehd/fthd_debugfs.c |  204 +++
> > >  drivers/media/pci/facetimehd/fthd_debugfs.h |   16 +
> > >  drivers/media/pci/facetimehd/fthd_drv.c     |  558 +++++++
> > >  drivers/media/pci/facetimehd/fthd_drv.h     |  124 ++
> > >  drivers/media/pci/facetimehd/fthd_hw.c      |  710 +++++++++
> > >  drivers/media/pci/facetimehd/fthd_hw.h      |  128 ++
> > >  drivers/media/pci/facetimehd/fthd_isp.c     | 1468 +++++++++++++++++=
++
> > >  drivers/media/pci/facetimehd/fthd_isp.h     |  770 ++++++++++
> > >  drivers/media/pci/facetimehd/fthd_reg.h     |  183 +++
> > >  drivers/media/pci/facetimehd/fthd_ringbuf.c |  133 ++
> > >  drivers/media/pci/facetimehd/fthd_ringbuf.h |   45 +
> > >  drivers/media/pci/facetimehd/fthd_v4l2.c    |  759 ++++++++++
> > >  drivers/media/pci/facetimehd/fthd_v4l2.h    |   34 +
> > >  24 files changed, 6124 insertions(+)
> > >  create mode 100644 drivers/media/pci/facetimehd/FIRMWARE
> > >  create mode 100644 drivers/media/pci/facetimehd/Kconfig
> > >  create mode 100644 drivers/media/pci/facetimehd/Makefile
> > >  create mode 100755 drivers/media/pci/facetimehd/firmware.sh
> > >  create mode 100644 drivers/media/pci/facetimehd/fthd_buffer.c
> > >  create mode 100644 drivers/media/pci/facetimehd/fthd_buffer.h
> > >  create mode 100644 drivers/media/pci/facetimehd/fthd_ddr.c
> > >  create mode 100644 drivers/media/pci/facetimehd/fthd_ddr.h
> > >  create mode 100644 drivers/media/pci/facetimehd/fthd_debugfs.c
> > >  create mode 100644 drivers/media/pci/facetimehd/fthd_debugfs.h
> > >  create mode 100644 drivers/media/pci/facetimehd/fthd_drv.c
> > >  create mode 100644 drivers/media/pci/facetimehd/fthd_drv.h
> > >  create mode 100644 drivers/media/pci/facetimehd/fthd_hw.c
> > >  create mode 100644 drivers/media/pci/facetimehd/fthd_hw.h
> > >  create mode 100644 drivers/media/pci/facetimehd/fthd_isp.c
> > >  create mode 100644 drivers/media/pci/facetimehd/fthd_isp.h
> > >  create mode 100644 drivers/media/pci/facetimehd/fthd_reg.h
> > >  create mode 100644 drivers/media/pci/facetimehd/fthd_ringbuf.c
> > >  create mode 100644 drivers/media/pci/facetimehd/fthd_ringbuf.h
> > >  create mode 100644 drivers/media/pci/facetimehd/fthd_v4l2.c
> > >  create mode 100644 drivers/media/pci/facetimehd/fthd_v4l2.h
> > >
> > > --
> > > 2.55.0
> > >
