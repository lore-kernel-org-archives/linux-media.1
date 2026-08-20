Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5363769F5
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 19:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787254645; cv=pass; b=LaicNjoMLYzQNvN4F+wqJVarGp3eWYjs8KMQZpNc0nn5+fzY9GiWFk9uLxmzGjfHotd3BSN+cA93Da+h/o4zqtaMZJ9GQn8TxCQ/QNdtr2EYTVw8b7pwGrogLloMWIF8v7wODmksIHSMi2B9LkmxPwgMeJH6T90i03AHYB7GJpM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787254645; c=relaxed/simple;
	bh=sHuFaHCChNf5bEv8EWSDiOnMpRwfo2CG5X5jjJ0R/z4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AW13+m5e92S9OPC3zZBSYqYPw/98BOMnyO2IzI5L4hL1L53+v8OkHVDwVOHmi51LJNj4BXpmlAz8j++qIUf856Uq77fwQQb6djd70XfzrycqczuCCb7UxyobcBc23heNcsYmxQpXqb9PjC7SpNDPU32GUrPEo4WaDEqkVxVzh8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W5cw17ET; arc=pass smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W5cw17ET"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-462df62f872so1191238fac.0
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 12:37:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787254642; cv=none;
        d=google.com; s=arc-20260327;
        b=GIGHdFHyRbe98y98yIPBViYkCGRCtgfId03PaKCo9pZJOJVlZHOWKMsBN1yST4i5PX
         mdWlE8FwKNBJTm6LqsPc12CA7mfAflLYzw8bqbUfE+i6K5CpI1HJrW+6y+TdC3jToPjI
         1ERYMa01KrlfqjyDv5SoEzyP4r/i9AtAU71FTucNTMWHU9VK6gtCDAIToEtWJ5CYPqPl
         BVoOEd35Xrzn3TniBYrtqCs0S8GTS9WQmaD7xDxK3BpBsEl5e9BAuRQb5DPYpiM30w2y
         FdDO3qzi0vTqgZDB6kDNVd3l3LyjHS0LSVmagW/On36KCVk0EYSbJULNQTWYqtLJhm16
         LIeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XClN7d/hqsMBXSHQ5Mx+1doal3KrclX4NeyVHA6ZcPA=;
        fh=9S8fetvmvhGe3iwNnWTBC6KmAvabHSpaM2ZXMHcqqo4=;
        b=neCJGzRC4yZFSN/38qOAuog3wJ2luhZsIB81WRFyNRpk0DgZbyy9N68/BV47Pa0SYM
         u23eoRm7m+nOsgMlvZAAw6V4NbYHWkdHJH942J+y43csw9wzQvBQ2RcjAFXLpFB/Wykt
         mI0mnoZj6JJaGXs/7oKAISQOvdJTZqGMRbWrEiNq/eiUbyBrGl8+N8Ae1kZQMPUqr+Nm
         5Skm5hf3ImadXN/nhLjYvMg9ySg7/o+pITjiyYn+9MZweXz+jk80ZTc/ikYaFb1cksxB
         IVunxDoIx0jLKiZwPyUUbmXpis/wA2c7JDvPVFrrU5i0B/waGlrRsOdtWYXfQwYmw2m7
         LKbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787254642; x=1787859442; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XClN7d/hqsMBXSHQ5Mx+1doal3KrclX4NeyVHA6ZcPA=;
        b=W5cw17ETPSnVPUrVSNA4gAPfkV0smhzpGZENROITO41wCzAp9C6bwQ0XtJvsLiS+Yl
         id64CiACCCrwhj66nF72Spn9e+2kq3YpFZr7hQEqNL+oKE0bOJ02t/1BKBkD7lQp8mxn
         hhZXVSG4bp4HTyIjDOOjvoDyU3YhGSpfRUJJ84xuVqVvm5AD1Np7v3+Q2gL4Llqjk0KR
         0E7diXtTtqgXxwJGCCLjxOMnSTu0qJEZ4lwSZRU7C8rldulE+GRXk6d93bTPbgD4bVDp
         B41iBecjK2X62xGORC66M2D/3brNl9I67ihK6s/VOLq9EY7OabaX2UKT8A/IdOM2By+0
         h5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787254642; x=1787859442;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XClN7d/hqsMBXSHQ5Mx+1doal3KrclX4NeyVHA6ZcPA=;
        b=EVQSZzqKBPwlcgBUwhp54O8/dH19LUYEBK55Og123U88+TOJ0ifku8O6CCqprcX4mk
         OJUhvrJcTqTbZrEplIBW5SGa1mAkhfml+QsKLMolHAHkhJyNR6ZVLmnhzYvHKUOR1Yuz
         5BpNLk/xhm+Ry5Yr3f0ZFwTxsmZYrXm/baMdTz5plubNVkb2cZ4/AQ+74MX0FY6/f989
         xwU5tE8XAsgr1afzwGjK8xdtdaSpNNci1QgnPPxQWqI+CUJncekCHZJfAM0qUs0CJU4q
         1rmqAOK3oRSX/trpH1UekcOEunmfTqaDa3ypZLZXKppDwcw8cldrlu4ujl1kJ0DEVXOn
         RScg==
X-Gm-Message-State: AOJu0YyilqTSSHE3VGrFV1M3y1EtPgQFcBWRKgAykhQ06hIAFElH59bh
	zzy8BePlNL/4J8WuiIOWenGlxqO/3qwsUp/RzhHGS1tJ+ctvGW3EWbXcRr5K8F8mf0jVOFMHDkp
	c/KsQ5rPYIKvfQqe2F+ENjXaXaIXI+Wk=
X-Gm-Gg: AR+sD10fpRbi1wofA+cpXdLJU/G6VomF3JVZlLBMl8LZIBr+KlvwNRM831LHPinDg1l
	0sJFAvxyMDDsj+iId9CGs1z038aZucohXxpLM1IX+3GUIONRnzeH5z6a8l7W/KOsaTHn9vCNB+h
	3gMrhtLIIViFeGV0VJR3bV8I3bfziaWjq3P9+o4I7HQGtzeIs90juQJaLnDmNgs0YL/SXj8gh/m
	ZCnlIshgopqNsTWYz4xnu5MJcwd0rDmBNvJ8uOoM5d9aOX4XZ438y8Myf5DB3v/Sf+RDTBPP1mP
	DOmMLSVfYayleYa8a4Ch+C1kxFmwBHcsrR8pDMuKddXO
X-Received: by 2002:a05:6808:c1b8:b0:495:ca1b:7865 with SMTP id
 5614622812f47-4b2cdcc4f55mr9061447b6e.11.1787254642209; Thu, 20 Aug 2026
 12:37:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820182156.18078-1-jackflusche@gmail.com>
In-Reply-To: <20260820182156.18078-1-jackflusche@gmail.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Thu, 20 Aug 2026 21:37:11 +0200
X-Gm-Features: AcwNN1Vmd-U08MnRda51kpwL3tKqtjgSO-WAu2E_PDdqrIM_Rj7SGX-K57PNVog
Message-ID: <CAMeQTsYbeDqz-u8EsDpeYqH6P+KtBG9kDgrVC6PA5QrX4yxdHA@mail.gmail.com>
Subject: Re: [RESEND PATCH 0/5] Add driver for Broadcom FacetimeHD camera
To: Jack Flusche <jackflusche@gmail.com>
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com, 
	hverkuil@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2026 at 8:22=E2=80=AFPM Jack Flusche <jackflusche@gmail.com=
> wrote:
>
> Merge Patrik Jakobsson's out-of-tree driver for the Broadcom FacetimeHD
> camera on some Apple Macbooks using the Video4Linux 2 framework to add
> in-tree support and remove the need to install a DKMS package

Hi Jack,
I'm fine with upstreaming this but here are some initial thoughts:
- Should this be in staging instead? I defer that question to the
media maintainers.
- There are quite a few PRs pending on github. Perhaps I should merge
them first and then we redo the submission with those included?
- Perhaps we should have both the download and extraction scripts
included? We've just updated the download script to grab a much newer
version which adds support for new devices.

Thanks
Patrik

>
> Jack Flusche (5):
>   facetimehd: copy code from patjak/facetimehd
>   facetimehd: add Kconfig and Makefile
>   facetimehd: fix compile-time issues and formatting
>   facetimehd: add firmware extraction script from
>     patjak/facetimehd-firmware
>   facetimehd: add entry to MAINTAINERS
>
>  MAINTAINERS                                 |    7 +
>  drivers/media/pci/Kconfig                   |    1 +
>  drivers/media/pci/Makefile                  |    1 +
>  drivers/media/pci/facetimehd/FIRMWARE       |    6 +
>  drivers/media/pci/facetimehd/Kconfig        |   12 +
>  drivers/media/pci/facetimehd/Makefile       |    2 +
>  drivers/media/pci/facetimehd/firmware.sh    |   61 +
>  drivers/media/pci/facetimehd/fthd_buffer.c  |  126 ++
>  drivers/media/pci/facetimehd/fthd_buffer.h  |   73 +
>  drivers/media/pci/facetimehd/fthd_ddr.c     |  670 +++++++++
>  drivers/media/pci/facetimehd/fthd_ddr.h     |   33 +
>  drivers/media/pci/facetimehd/fthd_debugfs.c |  204 +++
>  drivers/media/pci/facetimehd/fthd_debugfs.h |   16 +
>  drivers/media/pci/facetimehd/fthd_drv.c     |  558 +++++++
>  drivers/media/pci/facetimehd/fthd_drv.h     |  124 ++
>  drivers/media/pci/facetimehd/fthd_hw.c      |  710 +++++++++
>  drivers/media/pci/facetimehd/fthd_hw.h      |  128 ++
>  drivers/media/pci/facetimehd/fthd_isp.c     | 1468 +++++++++++++++++++
>  drivers/media/pci/facetimehd/fthd_isp.h     |  770 ++++++++++
>  drivers/media/pci/facetimehd/fthd_reg.h     |  183 +++
>  drivers/media/pci/facetimehd/fthd_ringbuf.c |  133 ++
>  drivers/media/pci/facetimehd/fthd_ringbuf.h |   45 +
>  drivers/media/pci/facetimehd/fthd_v4l2.c    |  759 ++++++++++
>  drivers/media/pci/facetimehd/fthd_v4l2.h    |   34 +
>  24 files changed, 6124 insertions(+)
>  create mode 100644 drivers/media/pci/facetimehd/FIRMWARE
>  create mode 100644 drivers/media/pci/facetimehd/Kconfig
>  create mode 100644 drivers/media/pci/facetimehd/Makefile
>  create mode 100755 drivers/media/pci/facetimehd/firmware.sh
>  create mode 100644 drivers/media/pci/facetimehd/fthd_buffer.c
>  create mode 100644 drivers/media/pci/facetimehd/fthd_buffer.h
>  create mode 100644 drivers/media/pci/facetimehd/fthd_ddr.c
>  create mode 100644 drivers/media/pci/facetimehd/fthd_ddr.h
>  create mode 100644 drivers/media/pci/facetimehd/fthd_debugfs.c
>  create mode 100644 drivers/media/pci/facetimehd/fthd_debugfs.h
>  create mode 100644 drivers/media/pci/facetimehd/fthd_drv.c
>  create mode 100644 drivers/media/pci/facetimehd/fthd_drv.h
>  create mode 100644 drivers/media/pci/facetimehd/fthd_hw.c
>  create mode 100644 drivers/media/pci/facetimehd/fthd_hw.h
>  create mode 100644 drivers/media/pci/facetimehd/fthd_isp.c
>  create mode 100644 drivers/media/pci/facetimehd/fthd_isp.h
>  create mode 100644 drivers/media/pci/facetimehd/fthd_reg.h
>  create mode 100644 drivers/media/pci/facetimehd/fthd_ringbuf.c
>  create mode 100644 drivers/media/pci/facetimehd/fthd_ringbuf.h
>  create mode 100644 drivers/media/pci/facetimehd/fthd_v4l2.c
>  create mode 100644 drivers/media/pci/facetimehd/fthd_v4l2.h
>
> --
> 2.55.0
>
