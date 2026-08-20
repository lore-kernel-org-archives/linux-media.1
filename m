Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCF6389453
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 20:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787256802; cv=pass; b=ekWRqgFz0nCVnYLOqrVavY6JWJ2xNG0YfArI+EZ+2B0RKvbj9gotR06Oj+EE1w3kQv/EEgWkQmqyWW3yLGYGeb9X1PXKFxA0ZTKlANifyzdImn9axS3N8Cj0niKiy7DgNSTsm/yD9dYeAiafO0pE5DHgkyGPtY6NwMfqNscRc6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787256802; c=relaxed/simple;
	bh=hh6xYtJyX1UxvMmQOF/fyNOIPIdiuaaup09MeYZih1o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qKKmALdeza17Glq9EKyn0twgmwSKfdnOvj6pUlcKYLW1LGoUF2NuN+mdKRFRqsDlRuu+XWomuFLLAiV109AHgfBwKcHNo/7FjV6gBa1DJJhXLYEBx7YcbS/Fhgbtki6SeRDWySy0NV1Br+gpnLuapdMxUHhuNtyyzf9QeCcvMgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b2WThbkI; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b2WThbkI"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a173ad7cf4so632183a12.3
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 13:13:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787256799; cv=none;
        d=google.com; s=arc-20260327;
        b=ZlGHkDSMdJ+snN1racntJFUWSD7GJuYAzkL9FVWxFo/qnKGfc6uEQoV9grI7LNF70Y
         uZUwpqUJMUGwYB2w+C9tGhlNBZ4iErwE0bzY4+RsyovykZUhHSIexZl/ZQzhtguWmQ/y
         d5N2qGV5VW1w2qSqC5v3pc69m6m7G6IkZ86wwogsUXHiT/PGH634u92NJgPZQunJPmPj
         LNGIiantvwXXtaMJfE/sgJvQ0lgZaf/JN9dKKWS1RTnFtqyCPYNvdO6jbnaTirwkQANI
         q+h2oljNv3IkW4W/znrAsuNazRFG+LgQhOROUlXE/AzY0R0xM5+hp4XB9skQZ4ir9AHH
         30UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H2Q0ql0B0GBPGwSFPWCTimw6g7z+G2Jt0Tobm31OXts=;
        fh=LKxoAhB++3ZmFF/+TyYFvhzfivMFFIalPPJ8oA9WEs0=;
        b=meZ067GepC4Bvc+DaXKHkVOZAxQgnd7wptfCdM//CiM8CX2yvV6S0YXkooTqCpqRuR
         PqsGWLc2QgXGFMvqlt5+E0wZl8cFMJGvxHw9RtcYzSu4eocATBM28XaYeAPpxLs5msk5
         wf9727aR3eSAgHCx1b55rNkD6LxBCGeVUAfenwQpSX5TfHMkEtf/R1PLfnLLoelddGqO
         VG677ZfHfJ5Bz4kZcehGUqdxvWkj9QtKNLqjiGAn4ld82iAe0JyVaa14rVeK1WG+h9nM
         T+1D4OLlr/YLcXHbAJhtlMAiE0MHsdBMPgO6Ctab4d1CBsWt0z+3QbXoshLeITSkxL1r
         FVhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787256799; x=1787861599; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H2Q0ql0B0GBPGwSFPWCTimw6g7z+G2Jt0Tobm31OXts=;
        b=b2WThbkI4XbBlrYQUwYXrm0aZcYYCENznUu2cDkmUTzPs9spKflV4mkQvx7O//2up6
         jguP8DCB3fqwiAOD1zq9g1h9SeMueJ3BessO5Cl+4dQdnn5f0zSP0xm55E0FCJ81G7/1
         MpEY74xRhDDL0vIt7O0xRrgF5QMJx0qAEklc80r7gwv1NMMKBvgwLLjX/aYnozX57yXF
         BIUQydITEwZVdkGgiKCih1mRWHfYepp1wQWWOTpbnctvwekXf35RcMRxib3Jiw6AKp+S
         aFXDsf07EK5ezt8fpnGvBmAK5tKXUVgiNReEXdN111VmCRjK2A6yqom3CGG69ysBDGq/
         Z+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787256799; x=1787861599;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H2Q0ql0B0GBPGwSFPWCTimw6g7z+G2Jt0Tobm31OXts=;
        b=juCZd9ruXaJXV5gIcOmiB42F+4+kQIBKgW34kUnBbwX9B2sF7/3SXxaVz3tY6yXC70
         3yB/6LlLJVjiFGvVCDu+stQyIXO3fOkBX/zkqsZ/R+QXl+R7szceXhmbriuLD6qJH/U0
         l9ca/2i3M3wTVIkCP7qXP16XvEDeBWvym8FT/n+ZQWTt4SP30L4npKMT3vwM4MwjflZi
         3hQpw0t4s0u59qWtDEMhMDjwlC3mHt2PXjrPGgOG3mAM6sp+brSOYLMONH5h/yCpevbQ
         wfcwBEcJmZnF4SR2WLLxh/r0hxsMIE5S5C2o3oGdSSoLYgO7Km+wejgV7nU2Qrw8D+kd
         gyEA==
X-Gm-Message-State: AFuF++mSP4QRE7I3n1737qhAq0AH1m+SnmL1UM5LksmHw6WsEmi8jr84
	UFxPa4MpfjprHL4B4WAyZ0x7M2DGuCeKGSw8Q5Saceq1JqqJ3JGK+9c99wQnxu37tdLnWrQ+D6q
	AKqtfR2aV1u0pHNy63RTr9ZlTCpDLPPTeP5fB
X-Gm-Gg: AR+sD121e4oZKuHTIB/vlEFIFjH3aqQ2HjtCJdwp5Q7XosXooVCJ/jXiw812w4j81EZ
	2PsoDJWcvDNlf4opDj6INg4RS3xXQgkuJmpsPcAyWXMI77LE5ReWuCXPWvzlQ8WZaLSBBUEU2+M
	sXl1+Ow7n9yp7R/6N9t5QKDAkkx13MQJZK3TfkKxWMgBkKR7XD814xa+jgZCMAkB/iWJwCAMgEv
	6RXuxqVNnhX4f8lMIh2rzKXg0MiPSyL14ZNDX6CVDI82AiwZqMN5nH52PnjTARSIXlm8bolNn5X
	im5dU0aagjvBWgdw+kDvMW/d6SqUCyP9OvtW9M7Q3vvY7Rx73dJ2p9S5JNVo/gSu45vsNPQqVv/
	B0YJ+ZY2rMHY=
X-Received: by 2002:a05:6402:249c:b0:6a3:71fd:4083 with SMTP id
 4fb4d7f45d1cf-6a42f1e930cmr1075797a12.9.1787256798620; Thu, 20 Aug 2026
 13:13:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820182156.18078-1-jackflusche@gmail.com> <CAMeQTsYbeDqz-u8EsDpeYqH6P+KtBG9kDgrVC6PA5QrX4yxdHA@mail.gmail.com>
In-Reply-To: <CAMeQTsYbeDqz-u8EsDpeYqH6P+KtBG9kDgrVC6PA5QrX4yxdHA@mail.gmail.com>
From: Jack Flusche <jackflusche@gmail.com>
Date: Thu, 20 Aug 2026 13:13:07 -0700
X-Gm-Features: AcwNN1V4Xscuf3My3UXqKIZa6XqjG9ugHJwsY6g1gMdFaK_BDzfxNYSfAPAb4Fg
Message-ID: <CAM0duoKuGt3UgdFc+-xznJR9R8K2B0PJ6-5z5W0kNBc2vs8fVw@mail.gmail.com>
Subject: Re: [RESEND PATCH 0/5] Add driver for Broadcom FacetimeHD camera
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com, 
	hverkuil@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, merging the PRs is probably a good idea. On the firmware, I only
included the install script since it doesn't require a manual
download, but including the extraction script as well isn't be a
problem.
Can you message me (or submit a patch set) when the driver is ready
for upstreaming?

Thanks,
Jack


On Thu, Aug 20, 2026 at 12:37=E2=80=AFPM Patrik Jakobsson
<patrik.r.jakobsson@gmail.com> wrote:
>
> On Thu, Aug 20, 2026 at 8:22=E2=80=AFPM Jack Flusche <jackflusche@gmail.c=
om> wrote:
> >
> > Merge Patrik Jakobsson's out-of-tree driver for the Broadcom FacetimeHD
> > camera on some Apple Macbooks using the Video4Linux 2 framework to add
> > in-tree support and remove the need to install a DKMS package
>
> Hi Jack,
> I'm fine with upstreaming this but here are some initial thoughts:
> - Should this be in staging instead? I defer that question to the
> media maintainers.
> - There are quite a few PRs pending on github. Perhaps I should merge
> them first and then we redo the submission with those included?
> - Perhaps we should have both the download and extraction scripts
> included? We've just updated the download script to grab a much newer
> version which adds support for new devices.
>
> Thanks
> Patrik
>
> >
> > Jack Flusche (5):
> >   facetimehd: copy code from patjak/facetimehd
> >   facetimehd: add Kconfig and Makefile
> >   facetimehd: fix compile-time issues and formatting
> >   facetimehd: add firmware extraction script from
> >     patjak/facetimehd-firmware
> >   facetimehd: add entry to MAINTAINERS
> >
> >  MAINTAINERS                                 |    7 +
> >  drivers/media/pci/Kconfig                   |    1 +
> >  drivers/media/pci/Makefile                  |    1 +
> >  drivers/media/pci/facetimehd/FIRMWARE       |    6 +
> >  drivers/media/pci/facetimehd/Kconfig        |   12 +
> >  drivers/media/pci/facetimehd/Makefile       |    2 +
> >  drivers/media/pci/facetimehd/firmware.sh    |   61 +
> >  drivers/media/pci/facetimehd/fthd_buffer.c  |  126 ++
> >  drivers/media/pci/facetimehd/fthd_buffer.h  |   73 +
> >  drivers/media/pci/facetimehd/fthd_ddr.c     |  670 +++++++++
> >  drivers/media/pci/facetimehd/fthd_ddr.h     |   33 +
> >  drivers/media/pci/facetimehd/fthd_debugfs.c |  204 +++
> >  drivers/media/pci/facetimehd/fthd_debugfs.h |   16 +
> >  drivers/media/pci/facetimehd/fthd_drv.c     |  558 +++++++
> >  drivers/media/pci/facetimehd/fthd_drv.h     |  124 ++
> >  drivers/media/pci/facetimehd/fthd_hw.c      |  710 +++++++++
> >  drivers/media/pci/facetimehd/fthd_hw.h      |  128 ++
> >  drivers/media/pci/facetimehd/fthd_isp.c     | 1468 +++++++++++++++++++
> >  drivers/media/pci/facetimehd/fthd_isp.h     |  770 ++++++++++
> >  drivers/media/pci/facetimehd/fthd_reg.h     |  183 +++
> >  drivers/media/pci/facetimehd/fthd_ringbuf.c |  133 ++
> >  drivers/media/pci/facetimehd/fthd_ringbuf.h |   45 +
> >  drivers/media/pci/facetimehd/fthd_v4l2.c    |  759 ++++++++++
> >  drivers/media/pci/facetimehd/fthd_v4l2.h    |   34 +
> >  24 files changed, 6124 insertions(+)
> >  create mode 100644 drivers/media/pci/facetimehd/FIRMWARE
> >  create mode 100644 drivers/media/pci/facetimehd/Kconfig
> >  create mode 100644 drivers/media/pci/facetimehd/Makefile
> >  create mode 100755 drivers/media/pci/facetimehd/firmware.sh
> >  create mode 100644 drivers/media/pci/facetimehd/fthd_buffer.c
> >  create mode 100644 drivers/media/pci/facetimehd/fthd_buffer.h
> >  create mode 100644 drivers/media/pci/facetimehd/fthd_ddr.c
> >  create mode 100644 drivers/media/pci/facetimehd/fthd_ddr.h
> >  create mode 100644 drivers/media/pci/facetimehd/fthd_debugfs.c
> >  create mode 100644 drivers/media/pci/facetimehd/fthd_debugfs.h
> >  create mode 100644 drivers/media/pci/facetimehd/fthd_drv.c
> >  create mode 100644 drivers/media/pci/facetimehd/fthd_drv.h
> >  create mode 100644 drivers/media/pci/facetimehd/fthd_hw.c
> >  create mode 100644 drivers/media/pci/facetimehd/fthd_hw.h
> >  create mode 100644 drivers/media/pci/facetimehd/fthd_isp.c
> >  create mode 100644 drivers/media/pci/facetimehd/fthd_isp.h
> >  create mode 100644 drivers/media/pci/facetimehd/fthd_reg.h
> >  create mode 100644 drivers/media/pci/facetimehd/fthd_ringbuf.c
> >  create mode 100644 drivers/media/pci/facetimehd/fthd_ringbuf.h
> >  create mode 100644 drivers/media/pci/facetimehd/fthd_v4l2.c
> >  create mode 100644 drivers/media/pci/facetimehd/fthd_v4l2.h
> >
> > --
> > 2.55.0
> >
