Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7246B3E5578
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 09:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790762395; cv=none; b=lHEnqsc43hDxs8meuZg+1bohAvdN02Kk1C3uDzOKUG2Al/srSMrFF5G8mE4OmENgs8p6CegnLK6nethXY9Eqoe1K5AkuVXGuzvBXewolajKmGzYdSQlvwqu6oy6xxFyieMCUbOPIj+mFEDtU7JNFO75SMkGWQ0pNlCLcdEk0dfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790762395; c=relaxed/simple;
	bh=1b31d7dSehH3PI2QlopHK4DUZnarQIYlJZTL1IW2qEU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hk1Va5NnkAAku3WBs2+Xmt0JnRzqsyfyHH/QaUTli4BvdcloLvFihwxVTiTshfLPGhMv6DsNfzjfMZl4hU1/K8880vt2pmZXvXFAZoGYlRg5VEZpu2uNKr7gITvFrV1N1BXIkVvqRMvuPmcercdvmkKMRHIOy0bbtQfu+Ce6v8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lkbgNK/R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lkbgNK/R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28E9C1F00898;
	Wed, 30 Sep 2026 09:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790762393;
	bh=eltlc4XJPkEePPv4dhmwN+srAP9IcW7i1HbrHQ0ceuU=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=lkbgNK/RyJQ+Z0ad5WyqqaCqaPqnvCnEFPHoqpkWVgRcWrtyAq4U6DyA5kPz5sPBW
	 LCbpc9SxnAA75CjyIBW4VsgYWrtcetImWnn7iDfQfP/M156rx/iE2gP7BgOapS0UgM
	 3Vf6zn7H2tIziDl85OhLHA/8NnW4z04SGtwKpqvTyMePY6ShkIlXNOg2BiB8RyiNR1
	 O0Y4rXr+pReLtcu9UTX0d1jft2mSTOcHsbnf8jOaPCI2zMMX9qm+khRfT4kF3+7vjA
	 w1d5AinGtAWGobW9+g13XVHGi8h/+4eVFnCOvnWVIHSd+kdEv/yoWxyrbjimM682QQ
	 Nxa5V/gbzGwpA==
Message-ID: <d355baaf-3c7b-42d9-8364-18cf91e1bcf3@kernel.org>
Date: Wed, 30 Sep 2026 11:59:49 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [RFC PATCH] media: usb: gspca: remove driver for old webcams
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ethan Nelson-Moore <enelsonmoore@gmail.com>, Frank Zago <frank@zago.net>,
 Olivier Lorin <o.lorin@laposte.net>, Erik Andren <erik.andren@gmail.com>,
 Brian Johnson <brijohn@gmail.com>, Leandro Costantino <lcostantino@gmail.com>
References: <6e63b180-d6c6-41e9-a2a2-78cced514f7e@kernel.org>
 <20260923075156.GB3532@killaraus.ideasonboard.com>
Content-Language: en-US, nl
In-Reply-To: <20260923075156.GB3532@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/09/2026 09:51, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Wed, Sep 23, 2026 at 09:32:54AM +0200, Hans Verkuil wrote:
>> The gspca driver supports a large number of old non-UVC webcams that use
>> proprietary formats.
>>
>> These webcams are poorly maintained, have very poor image quality, and
>> there is no use-case for them anymore since even the cheapest UVC webcam
>> will be better than these.
>>
>> The last time there was a 'real' change to gspca was in 2021, one in
>> 2019 and one in 2018.
>>
>> We see an uptick in the number of suspected AI patches in this driver,
>> and I really don't want to waste time on that.
>>
>> So let's remove this driver.
>>
>> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
>> ---
>> I CC-ed this to several maintainers of gspca webcams listed in the MAINTAINERS
>> file. It would not surprise me if at least some of these emails are obsolete.
>>
>> This is an RFC for now, and if we do this then it will be for kernel 7.5.
>>
>> Regards,
>>
>> 	Hans
>> ---
>>  .../admin-guide/media/gspca-cardlist.rst      |  451 --
>>  .../admin-guide/media/usb-cardlist.rst        |    6 -
>>  .../media/v4l/pixfmt-reserved.rst             |   32 +-
> 
> There are other mentions of gspca in the following files:
> 
> - Documentation/.renames.txt

I wasn't sure if it should be removed there as well, but I see that it should.

I'll do that.

> - Documentation/admin-guide/bug-hunting.rst
> - Documentation/translations/zh_CN/admin-guide/bug-hunting.rst

Yeah, that's a separate patch. Not so easy, it has to be rewritten with
a different example driver.

> 
> arch/arm/configs/tegra_defconfig also needs to be updated to drop
> CONFIG_USB_GSPCA=y.

Probably best to do in a separate patch as well.

> 
> Should we move the gspca-specific pixel formats in
> include/uapi/linux/videodev2.h to a separate section with a header that
> documents them as deprecated ? I think we can also drop them from
> v4l_fill_fmtdesc() if nothing uses them in the kernel any more.

Good question. I think putting them in a separate section is certainly
a good idea. But should they be removed from v4l_fill_fmtdesc?

One reason for keeping them there is if someone (or some distro) decides to
keep the gspca driver. On the other hand, how likely is that?

It's probably best to drop them in v4l_fill_fmtdesc.

Regards,

	Hans

> 
>>  MAINTAINERS                                   |   49 -
>>  drivers/media/usb/Kconfig                     |    1 -
>>  drivers/media/usb/Makefile                    |    1 -
>>  drivers/media/usb/gspca/Kconfig               |  455 --
>>  drivers/media/usb/gspca/Makefile              |  100 -
>>  drivers/media/usb/gspca/autogain_functions.c  |  165 -
>>  drivers/media/usb/gspca/benq.c                |  274 -
>>  drivers/media/usb/gspca/conex.c               |  953 ---
>>  drivers/media/usb/gspca/cpia1.c               | 1898 -----
>>  drivers/media/usb/gspca/dtcs033.c             |  430 -
>>  drivers/media/usb/gspca/etoms.c               |  782 --
>>  drivers/media/usb/gspca/finepix.c             |  293 -
>>  drivers/media/usb/gspca/gl860/Kconfig         |    9 -
>>  drivers/media/usb/gspca/gl860/Makefile        |   11 -
>>  drivers/media/usb/gspca/gl860/gl860-mi1320.c  |  551 --
>>  drivers/media/usb/gspca/gl860/gl860-mi2020.c  |  793 --
>>  drivers/media/usb/gspca/gl860/gl860-ov2640.c  |  477 --
>>  drivers/media/usb/gspca/gl860/gl860-ov9655.c  |  373 -
>>  drivers/media/usb/gspca/gl860/gl860.c         |  730 --
>>  drivers/media/usb/gspca/gl860/gl860.h         |   93 -
>>  drivers/media/usb/gspca/gspca.c               | 1700 ----
>>  drivers/media/usb/gspca/gspca.h               |  243 -
>>  drivers/media/usb/gspca/jeilinj.c             |  537 --
>>  drivers/media/usb/gspca/jl2005bcd.c           |  519 --
>>  drivers/media/usb/gspca/jpeg.h                |  156 -
>>  drivers/media/usb/gspca/kinect.c              |  474 --
>>  drivers/media/usb/gspca/konica.c              |  478 --
>>  drivers/media/usb/gspca/m5602/Kconfig         |   10 -
>>  drivers/media/usb/gspca/m5602/Makefile        |   12 -
>>  drivers/media/usb/gspca/m5602/m5602_bridge.h  |  161 -
>>  drivers/media/usb/gspca/m5602/m5602_core.c    |  446 --
>>  drivers/media/usb/gspca/m5602/m5602_mt9m111.c |  600 --
>>  drivers/media/usb/gspca/m5602/m5602_mt9m111.h |  125 -
>>  drivers/media/usb/gspca/m5602/m5602_ov7660.c  |  468 --
>>  drivers/media/usb/gspca/m5602/m5602_ov7660.h  |  105 -
>>  drivers/media/usb/gspca/m5602/m5602_ov9650.c  |  784 --
>>  drivers/media/usb/gspca/m5602/m5602_ov9650.h  |  155 -
>>  drivers/media/usb/gspca/m5602/m5602_po1030.c  |  623 --
>>  drivers/media/usb/gspca/m5602/m5602_po1030.h  |  166 -
>>  drivers/media/usb/gspca/m5602/m5602_s5k4aa.c  |  759 --
>>  drivers/media/usb/gspca/m5602/m5602_s5k4aa.h  |   84 -
>>  drivers/media/usb/gspca/m5602/m5602_s5k83a.c  |  576 --
>>  drivers/media/usb/gspca/m5602/m5602_s5k83a.h  |   60 -
>>  drivers/media/usb/gspca/m5602/m5602_sensor.h  |   69 -
>>  drivers/media/usb/gspca/mars.c                |  427 -
>>  drivers/media/usb/gspca/mr97310a.c            | 1077 ---
>>  drivers/media/usb/gspca/nw80x.c               | 2105 -----
>>  drivers/media/usb/gspca/ov519.c               | 5030 ------------
>>  drivers/media/usb/gspca/ov534.c               | 1608 ----
>>  drivers/media/usb/gspca/ov534_9.c             | 1821 -----
>>  drivers/media/usb/gspca/pac207.c              |  475 --
>>  drivers/media/usb/gspca/pac7302.c             |  951 ---
>>  drivers/media/usb/gspca/pac7311.c             |  687 --
>>  drivers/media/usb/gspca/pac_common.h          |  119 -
>>  drivers/media/usb/gspca/se401.c               |  730 --
>>  drivers/media/usb/gspca/se401.h               |   76 -
>>  drivers/media/usb/gspca/sn9c2028.c            |  963 ---
>>  drivers/media/usb/gspca/sn9c2028.h            |   48 -
>>  drivers/media/usb/gspca/sn9c20x.c             | 2409 ------
>>  drivers/media/usb/gspca/sonixb.c              | 1469 ----
>>  drivers/media/usb/gspca/sonixj.c              | 2981 -------
>>  drivers/media/usb/gspca/spca1528.c            |  438 -
>>  drivers/media/usb/gspca/spca500.c             |  979 ---
>>  drivers/media/usb/gspca/spca501.c             | 2036 -----
>>  drivers/media/usb/gspca/spca505.c             |  791 --
>>  drivers/media/usb/gspca/spca506.c             |  599 --
>>  drivers/media/usb/gspca/spca508.c             | 1526 ----
>>  drivers/media/usb/gspca/spca561.c             |  911 ---
>>  drivers/media/usb/gspca/sq905.c               |  428 -
>>  drivers/media/usb/gspca/sq905c.c              |  330 -
>>  drivers/media/usb/gspca/sq930x.c              | 1156 ---
>>  drivers/media/usb/gspca/stk014.c              |  434 -
>>  drivers/media/usb/gspca/stk1135.c             |  676 --
>>  drivers/media/usb/gspca/stk1135.h             |   44 -
>>  drivers/media/usb/gspca/stv0680.c             |  339 -
>>  drivers/media/usb/gspca/stv06xx/Kconfig       |   10 -
>>  drivers/media/usb/gspca/stv06xx/Makefile      |   11 -
>>  drivers/media/usb/gspca/stv06xx/stv06xx.c     |  647 --
>>  drivers/media/usb/gspca/stv06xx/stv06xx.h     |  103 -
>>  .../media/usb/gspca/stv06xx/stv06xx_hdcs.c    |  532 --
>>  .../media/usb/gspca/stv06xx/stv06xx_hdcs.h    |  193 -
>>  .../media/usb/gspca/stv06xx/stv06xx_pb0100.c  |  432 -
>>  .../media/usb/gspca/stv06xx/stv06xx_pb0100.h  |  131 -
>>  .../media/usb/gspca/stv06xx/stv06xx_sensor.h  |   74 -
>>  .../media/usb/gspca/stv06xx/stv06xx_st6422.c  |  273 -
>>  .../media/usb/gspca/stv06xx/stv06xx_st6422.h  |   38 -
>>  .../media/usb/gspca/stv06xx/stv06xx_vv6410.c  |  265 -
>>  .../media/usb/gspca/stv06xx/stv06xx_vv6410.h  |  242 -
>>  drivers/media/usb/gspca/sunplus.c             | 1073 ---
>>  drivers/media/usb/gspca/t613.c                | 1041 ---
>>  drivers/media/usb/gspca/topro.c               | 4972 ------------
>>  drivers/media/usb/gspca/touptek.c             |  712 --
>>  drivers/media/usb/gspca/tv8532.c              |  365 -
>>  drivers/media/usb/gspca/vc032x.c              | 3838 ---------
>>  drivers/media/usb/gspca/vicam.c               |  353 -
>>  drivers/media/usb/gspca/w996Xcf.c             |  569 --
>>  drivers/media/usb/gspca/xirlink_cit.c         | 3149 --------
>>  drivers/media/usb/gspca/zc3xx-reg.h           |  250 -
>>  drivers/media/usb/gspca/zc3xx.c               | 7029 -----------------
>>  102 files changed, 16 insertions(+), 78186 deletions(-)
>>  delete mode 100644 Documentation/admin-guide/media/gspca-cardlist.rst
>>  delete mode 100644 drivers/media/usb/gspca/Kconfig
>>  delete mode 100644 drivers/media/usb/gspca/Makefile
>>  delete mode 100644 drivers/media/usb/gspca/autogain_functions.c
>>  delete mode 100644 drivers/media/usb/gspca/benq.c
>>  delete mode 100644 drivers/media/usb/gspca/conex.c
>>  delete mode 100644 drivers/media/usb/gspca/cpia1.c
>>  delete mode 100644 drivers/media/usb/gspca/dtcs033.c
>>  delete mode 100644 drivers/media/usb/gspca/etoms.c
>>  delete mode 100644 drivers/media/usb/gspca/finepix.c
>>  delete mode 100644 drivers/media/usb/gspca/gl860/Kconfig
>>  delete mode 100644 drivers/media/usb/gspca/gl860/Makefile
>>  delete mode 100644 drivers/media/usb/gspca/gl860/gl860-mi1320.c
>>  delete mode 100644 drivers/media/usb/gspca/gl860/gl860-mi2020.c
>>  delete mode 100644 drivers/media/usb/gspca/gl860/gl860-ov2640.c
>>  delete mode 100644 drivers/media/usb/gspca/gl860/gl860-ov9655.c
>>  delete mode 100644 drivers/media/usb/gspca/gl860/gl860.c
>>  delete mode 100644 drivers/media/usb/gspca/gl860/gl860.h
>>  delete mode 100644 drivers/media/usb/gspca/gspca.c
>>  delete mode 100644 drivers/media/usb/gspca/gspca.h
>>  delete mode 100644 drivers/media/usb/gspca/jeilinj.c
>>  delete mode 100644 drivers/media/usb/gspca/jl2005bcd.c
>>  delete mode 100644 drivers/media/usb/gspca/jpeg.h
>>  delete mode 100644 drivers/media/usb/gspca/kinect.c
>>  delete mode 100644 drivers/media/usb/gspca/konica.c
>>  delete mode 100644 drivers/media/usb/gspca/m5602/Kconfig
>>  delete mode 100644 drivers/media/usb/gspca/m5602/Makefile
>>  delete mode 100644 drivers/media/usb/gspca/m5602/m5602_bridge.h
>>  delete mode 100644 drivers/media/usb/gspca/m5602/m5602_core.c
>>  delete mode 100644 drivers/media/usb/gspca/m5602/m5602_mt9m111.c
>>  delete mode 100644 drivers/media/usb/gspca/m5602/m5602_mt9m111.h
>>  delete mode 100644 drivers/media/usb/gspca/m5602/m5602_ov7660.c
>>  delete mode 100644 drivers/media/usb/gspca/m5602/m5602_ov7660.h
>>  delete mode 100644 drivers/media/usb/gspca/m5602/m5602_ov9650.c
>>  delete mode 100644 drivers/media/usb/gspca/m5602/m5602_ov9650.h
>>  delete mode 100644 drivers/media/usb/gspca/m5602/m5602_po1030.c
>>  delete mode 100644 drivers/media/usb/gspca/m5602/m5602_po1030.h
>>  delete mode 100644 drivers/media/usb/gspca/m5602/m5602_s5k4aa.c
>>  delete mode 100644 drivers/media/usb/gspca/m5602/m5602_s5k4aa.h
>>  delete mode 100644 drivers/media/usb/gspca/m5602/m5602_s5k83a.c
>>  delete mode 100644 drivers/media/usb/gspca/m5602/m5602_s5k83a.h
>>  delete mode 100644 drivers/media/usb/gspca/m5602/m5602_sensor.h
>>  delete mode 100644 drivers/media/usb/gspca/mars.c
>>  delete mode 100644 drivers/media/usb/gspca/mr97310a.c
>>  delete mode 100644 drivers/media/usb/gspca/nw80x.c
>>  delete mode 100644 drivers/media/usb/gspca/ov519.c
>>  delete mode 100644 drivers/media/usb/gspca/ov534.c
>>  delete mode 100644 drivers/media/usb/gspca/ov534_9.c
>>  delete mode 100644 drivers/media/usb/gspca/pac207.c
>>  delete mode 100644 drivers/media/usb/gspca/pac7302.c
>>  delete mode 100644 drivers/media/usb/gspca/pac7311.c
>>  delete mode 100644 drivers/media/usb/gspca/pac_common.h
>>  delete mode 100644 drivers/media/usb/gspca/se401.c
>>  delete mode 100644 drivers/media/usb/gspca/se401.h
>>  delete mode 100644 drivers/media/usb/gspca/sn9c2028.c
>>  delete mode 100644 drivers/media/usb/gspca/sn9c2028.h
>>  delete mode 100644 drivers/media/usb/gspca/sn9c20x.c
>>  delete mode 100644 drivers/media/usb/gspca/sonixb.c
>>  delete mode 100644 drivers/media/usb/gspca/sonixj.c
>>  delete mode 100644 drivers/media/usb/gspca/spca1528.c
>>  delete mode 100644 drivers/media/usb/gspca/spca500.c
>>  delete mode 100644 drivers/media/usb/gspca/spca501.c
>>  delete mode 100644 drivers/media/usb/gspca/spca505.c
>>  delete mode 100644 drivers/media/usb/gspca/spca506.c
>>  delete mode 100644 drivers/media/usb/gspca/spca508.c
>>  delete mode 100644 drivers/media/usb/gspca/spca561.c
>>  delete mode 100644 drivers/media/usb/gspca/sq905.c
>>  delete mode 100644 drivers/media/usb/gspca/sq905c.c
>>  delete mode 100644 drivers/media/usb/gspca/sq930x.c
>>  delete mode 100644 drivers/media/usb/gspca/stk014.c
>>  delete mode 100644 drivers/media/usb/gspca/stk1135.c
>>  delete mode 100644 drivers/media/usb/gspca/stk1135.h
>>  delete mode 100644 drivers/media/usb/gspca/stv0680.c
>>  delete mode 100644 drivers/media/usb/gspca/stv06xx/Kconfig
>>  delete mode 100644 drivers/media/usb/gspca/stv06xx/Makefile
>>  delete mode 100644 drivers/media/usb/gspca/stv06xx/stv06xx.c
>>  delete mode 100644 drivers/media/usb/gspca/stv06xx/stv06xx.h
>>  delete mode 100644 drivers/media/usb/gspca/stv06xx/stv06xx_hdcs.c
>>  delete mode 100644 drivers/media/usb/gspca/stv06xx/stv06xx_hdcs.h
>>  delete mode 100644 drivers/media/usb/gspca/stv06xx/stv06xx_pb0100.c
>>  delete mode 100644 drivers/media/usb/gspca/stv06xx/stv06xx_pb0100.h
>>  delete mode 100644 drivers/media/usb/gspca/stv06xx/stv06xx_sensor.h
>>  delete mode 100644 drivers/media/usb/gspca/stv06xx/stv06xx_st6422.c
>>  delete mode 100644 drivers/media/usb/gspca/stv06xx/stv06xx_st6422.h
>>  delete mode 100644 drivers/media/usb/gspca/stv06xx/stv06xx_vv6410.c
>>  delete mode 100644 drivers/media/usb/gspca/stv06xx/stv06xx_vv6410.h
>>  delete mode 100644 drivers/media/usb/gspca/sunplus.c
>>  delete mode 100644 drivers/media/usb/gspca/t613.c
>>  delete mode 100644 drivers/media/usb/gspca/topro.c
>>  delete mode 100644 drivers/media/usb/gspca/touptek.c
>>  delete mode 100644 drivers/media/usb/gspca/tv8532.c
>>  delete mode 100644 drivers/media/usb/gspca/vc032x.c
>>  delete mode 100644 drivers/media/usb/gspca/vicam.c
>>  delete mode 100644 drivers/media/usb/gspca/w996Xcf.c
>>  delete mode 100644 drivers/media/usb/gspca/xirlink_cit.c
>>  delete mode 100644 drivers/media/usb/gspca/zc3xx-reg.h
>>  delete mode 100644 drivers/media/usb/gspca/zc3xx.c
> 

