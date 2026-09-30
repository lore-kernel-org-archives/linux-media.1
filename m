Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B2A45DF72
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 10:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790764072; cv=none; b=LGS/7acb4hDU/kmwOqImLMjsEhyHQKP0kdTyCZAOLL7AFOlK0EWIfuRMaY5BpN8v+FiK7TPOEw3+nbdWVRZPURJhksopfXEnU4T0svXoMlNpXlwMIlmotifuIrvZzZw0aF01W5I/TjQy5XDPmmbSl23s2fxHDTtEPSoqReapVPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790764072; c=relaxed/simple;
	bh=DvvG0kXh/ltgnq/5wbGqbvpn+mXuV9+m6tBN5sOhVZM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=QqUVsaMWE45A5lRgl6TDdlByuJHwbdd7pVQRJi/0/DQp2wC3HMLfNXdSPVqouDUz74GmcNCIBL7ZeNJx6pj2j4qe+aL5v6AwQCQCrz/yWhNf1HQ/fBbkAFJIcBta+j+Kc7liLHJEpF/DgZ153sFu3ZXipsQ3Rg2FeB6zkrtRT9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BfCUUO62; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BfCUUO62"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B55A91F000FF;
	Wed, 30 Sep 2026 10:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790764066;
	bh=38BHeHzIONLKE09Oc2ekrz8AwZBWdhSV3cFQN6/lF/U=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=BfCUUO62vVbGPFrvoZkwMc9YwMYPqCJE4i02OcponD/tUr7BW9mNw3s3n58e+K73z
	 W7liutGmFhC1Yl5KiVj30ZrTJw7j5JYPvOmeLeXEJKrDhewjTZ6wdkzkp9PoI8meAr
	 fppRbnKZWggSN+wOWGw4YC3lQDLObufRM9JrakxM1A7rQwTFjXXEkm0Kth2+DPFVbI
	 FXJOpXZFDZN7rS8NODhtXpQCl/j+a+lvkWd2wDz8uWm7VUra27kAmqSqS8fyztgbhh
	 pvMKottCYxklImg01mlynXyPE4GWEvQhYtQOQ/OZI4pHd0GbE01mUcXnbVtkmD/OPB
	 wdK838akEhofg==
Message-ID: <d421060c-5bc4-4047-82a1-58698da5dfe9@kernel.org>
Date: Wed, 30 Sep 2026 12:27:43 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [RFC PATCH] media: usb: gspca: remove driver for old webcams
To: johannes.goede@oss.qualcomm.com,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Ethan Nelson-Moore <enelsonmoore@gmail.com>, Frank Zago <frank@zago.net>,
 Olivier Lorin <o.lorin@laposte.net>, Erik Andren <erik.andren@gmail.com>,
 Brian Johnson <brijohn@gmail.com>, Leandro Costantino <lcostantino@gmail.com>
References: <6e63b180-d6c6-41e9-a2a2-78cced514f7e@kernel.org>
 <9d6cf632-0c6a-4f93-8c63-2abb7cacdeac@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <9d6cf632-0c6a-4f93-8c63-2abb7cacdeac@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/09/2026 17:29, johannes.goede@oss.qualcomm.com wrote:
> Hi,
> 
> On 23-Sep-26 09:32, Hans Verkuil wrote:
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
> 
> As someone who did a lot of work on gspca I'm a bit sad to see this go,
> with that said I understand why you're doing this and I think it likely
> is for the best.
> 
> The only worry I have is that some of the earlier builtin laptop USB
> webcams might not all have been UVC and replacing the builtin cam is
> no were near as easy as replacing an external one.
> 
> Bur for that I guess we will hust have to wait and see. I guess we
> may need to keep some gspca sub-drivers. sn9c20x / ov534 come to mind,
> these also had pretty decent image quality. Those basically were the
> last proprietary format USB camera bridge chips AFAICT.
> 
> E.g. ov534 is used in the Sony playstation "EYE" cameras.
> 
> I wonder if we maybe should keep those 2?
> 
> Anyways I expect we might get some pushback from some users on this
> but a minimum that will be helpful to decide the future of the gspca
> driver:

We have three options:

1) Remove completely
2) Move to staging/media/deprecated and keep it there until end of 2027
   at which time we remove (or perhaps keep a few sub-drivers if they
   are actually used)
3) Remove most subdrivers, keep sn9c20x and ov534, perhaps others?

Hans, do you have an overview of which subdrivers were used in laptops?

Regards,

	Hans

> 
> Thanks, patch looks good to me:
> 
> Acked-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> 
> Regards,
> 
> Hans
> 
> 
> 
> 
> 
> 
> 
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
>>
>> diff --git a/Documentation/admin-guide/media/gspca-cardlist.rst b/Documentation/admin-guide/media/gspca-cardlist.rst
>> deleted file mode 100644
>> index e3404d1589da..000000000000
>> diff --git a/Documentation/admin-guide/media/usb-cardlist.rst b/Documentation/admin-guide/media/usb-cardlist.rst
>> index 5f5ab0723e48..d17f4f6a8883 100644
>> --- a/Documentation/admin-guide/media/usb-cardlist.rst
>> +++ b/Documentation/admin-guide/media/usb-cardlist.rst
>> @@ -33,9 +33,6 @@ listed below\ [#]_.
>>  .. [#]
>>
>>     some of the drivers have sub-drivers, not shown at this table.
>> -   In particular, gspca driver has lots of sub-drivers,
>> -   for cameras not supported by the USB Video Class (UVC) driver,
>> -   as shown at :doc:`gspca card list <gspca-cardlist>`.
>>
>>  ======================  =========================================================
>>  Driver                  Name
>> @@ -82,7 +79,6 @@ dvb-usb-vp702x          TwinhanDTV StarBox and clones DVB-S USB2.0
>>  dvb-usb-vp7045          TwinhanDTV Alpha/MagicBoxII, DNTV tinyUSB2, Beetle USB2.0
>>  em28xx                  Empia EM28xx USB devices
>>  go7007                  WIS GO7007 MPEG encoder
>> -gspca                   Drivers for several USB Cameras
>>  hackrf                  HackRF
>>  hdpvr                   Hauppauge HD PVR
>>  msi2500                 Mirics MSi2500
>> @@ -106,8 +102,6 @@ zd1301                  ZyDAS ZD1301
>>  	em28xx-cardlist
>>  	siano-cardlist
>>
>> -	gspca-cardlist
>> -
>>  	dvb-usb-dib0700-cardlist
>>  	dvb-usb-dibusb-mb-cardlist
>>  	dvb-usb-dibusb-mc-cardlist
>> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
>> index 1cf6c59f4bc4..66ba10d7548e 100644
>> --- a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
>> +++ b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
>> @@ -53,7 +53,7 @@ please make a proposal on the linux-media mailing list.
>>
>>        - ``V4L2_PIX_FMT_CPIA1``
>>        - 'CPIA'
>> -      - YUV format used by the gspca cpia1 driver.
>> +      - YUV format used by the obsolete gspca cpia1 driver.
>>      * .. _V4L2-PIX-FMT-JPGL:
>>
>>        - ``V4L2_PIX_FMT_JPGL``
>> @@ -64,62 +64,62 @@ please make a proposal on the linux-media mailing list.
>>
>>        - ``V4L2_PIX_FMT_SPCA501``
>>        - 'S501'
>> -      - YUYV per line used by the gspca driver.
>> +      - YUYV per line used by the obsolete gspca driver.
>>      * .. _V4L2-PIX-FMT-SPCA505:
>>
>>        - ``V4L2_PIX_FMT_SPCA505``
>>        - 'S505'
>> -      - YYUV per line used by the gspca driver.
>> +      - YYUV per line used by the obsolete gspca driver.
>>      * .. _V4L2-PIX-FMT-SPCA508:
>>
>>        - ``V4L2_PIX_FMT_SPCA508``
>>        - 'S508'
>> -      - YUVY per line used by the gspca driver.
>> +      - YUVY per line used by the obsolete gspca driver.
>>      * .. _V4L2-PIX-FMT-SPCA561:
>>
>>        - ``V4L2_PIX_FMT_SPCA561``
>>        - 'S561'
>> -      - Compressed GBRG Bayer format used by the gspca driver.
>> +      - Compressed GBRG Bayer format used by the obsolete gspca driver.
>>      * .. _V4L2-PIX-FMT-PAC207:
>>
>>        - ``V4L2_PIX_FMT_PAC207``
>>        - 'P207'
>> -      - Compressed BGGR Bayer format used by the gspca driver.
>> +      - Compressed BGGR Bayer format used by the obsolete gspca driver.
>>      * .. _V4L2-PIX-FMT-MR97310A:
>>
>>        - ``V4L2_PIX_FMT_MR97310A``
>>        - 'M310'
>> -      - Compressed BGGR Bayer format used by the gspca driver.
>> +      - Compressed BGGR Bayer format used by the obsolete gspca driver.
>>      * .. _V4L2-PIX-FMT-JL2005BCD:
>>
>>        - ``V4L2_PIX_FMT_JL2005BCD``
>>        - 'JL20'
>> -      - JPEG compressed RGGB Bayer format used by the gspca driver.
>> +      - JPEG compressed RGGB Bayer format used by the obsolete gspca driver.
>>      * .. _V4L2-PIX-FMT-OV511:
>>
>>        - ``V4L2_PIX_FMT_OV511``
>>        - 'O511'
>> -      - OV511 JPEG format used by the gspca driver.
>> +      - OV511 JPEG format used by the obsolete gspca driver.
>>      * .. _V4L2-PIX-FMT-OV518:
>>
>>        - ``V4L2_PIX_FMT_OV518``
>>        - 'O518'
>> -      - OV518 JPEG format used by the gspca driver.
>> +      - OV518 JPEG format used by the obsolete gspca driver.
>>      * .. _V4L2-PIX-FMT-PJPG:
>>
>>        - ``V4L2_PIX_FMT_PJPG``
>>        - 'PJPG'
>> -      - Pixart 73xx JPEG format used by the gspca driver.
>> +      - Pixart 73xx JPEG format used by the obsolete gspca driver.
>>      * .. _V4L2-PIX-FMT-SE401:
>>
>>        - ``V4L2_PIX_FMT_SE401``
>>        - 'S401'
>> -      - Compressed RGB format used by the gspca se401 driver
>> +      - Compressed RGB format used by the obsolete gspca se401 driver
>>      * .. _V4L2-PIX-FMT-SQ905C:
>>
>>        - ``V4L2_PIX_FMT_SQ905C``
>>        - '905C'
>> -      - Compressed RGGB bayer format used by the gspca driver.
>> +      - Compressed RGGB bayer format used by the obsolete gspca driver.
>>      * .. _V4L2-PIX-FMT-MJPEG:
>>
>>        - ``V4L2_PIX_FMT_MJPEG``
>> @@ -144,17 +144,17 @@ please make a proposal on the linux-media mailing list.
>>
>>        - ``V4L2_PIX_FMT_SN9C20X_I420``
>>        - 'S920'
>> -      - YUV 4:2:0 format of the gspca sn9c20x driver.
>> +      - YUV 4:2:0 format of the obsolete gspca sn9c20x driver.
>>      * .. _V4L2-PIX-FMT-SN9C2028:
>>
>>        - ``V4L2_PIX_FMT_SN9C2028``
>>        - 'SONX'
>> -      - Compressed GBRG bayer format of the gspca sn9c2028 driver.
>> +      - Compressed GBRG bayer format of the obsolete gspca sn9c2028 driver.
>>      * .. _V4L2-PIX-FMT-STV0680:
>>
>>        - ``V4L2_PIX_FMT_STV0680``
>>        - 'S680'
>> -      - Bayer format of the gspca stv0680 driver.
>> +      - Bayer format of the obsolete gspca stv0680 driver.
>>      * .. _V4L2-PIX-FMT-WNVA:
>>
>>        - ``V4L2_PIX_FMT_WNVA``
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 4cc4a2dc6d30..bc88af071e4c 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -11367,55 +11367,6 @@ S:	Maintained
>>  T:	git git://linuxtv.org/media.git
>>  F:	drivers/media/spi/gs1662.c
>>
>> -GSPCA FINEPIX SUBDRIVER
>> -M:	Frank Zago <frank@zago.net>
>> -L:	linux-media@vger.kernel.org
>> -S:	Maintained
>> -T:	git git://linuxtv.org/media.git
>> -F:	drivers/media/usb/gspca/finepix.c
>> -
>> -GSPCA GL860 SUBDRIVER
>> -M:	Olivier Lorin <o.lorin@laposte.net>
>> -L:	linux-media@vger.kernel.org
>> -S:	Maintained
>> -T:	git git://linuxtv.org/media.git
>> -F:	drivers/media/usb/gspca/gl860/
>> -
>> -GSPCA M5602 SUBDRIVER
>> -M:	Erik Andren <erik.andren@gmail.com>
>> -L:	linux-media@vger.kernel.org
>> -S:	Maintained
>> -T:	git git://linuxtv.org/media.git
>> -F:	drivers/media/usb/gspca/m5602/
>> -
>> -GSPCA PAC207 SONIXB SUBDRIVER
>> -M:	Hans Verkuil <hverkuil@kernel.org>
>> -L:	linux-media@vger.kernel.org
>> -S:	Odd Fixes
>> -T:	git git://linuxtv.org/media.git
>> -F:	drivers/media/usb/gspca/pac207.c
>> -
>> -GSPCA SN9C20X SUBDRIVER
>> -M:	Brian Johnson <brijohn@gmail.com>
>> -L:	linux-media@vger.kernel.org
>> -S:	Maintained
>> -T:	git git://linuxtv.org/media.git
>> -F:	drivers/media/usb/gspca/sn9c20x.c
>> -
>> -GSPCA T613 SUBDRIVER
>> -M:	Leandro Costantino <lcostantino@gmail.com>
>> -L:	linux-media@vger.kernel.org
>> -S:	Maintained
>> -T:	git git://linuxtv.org/media.git
>> -F:	drivers/media/usb/gspca/t613.c
>> -
>> -GSPCA USB WEBCAM DRIVER
>> -M:	Hans Verkuil <hverkuil@kernel.org>
>> -L:	linux-media@vger.kernel.org
>> -S:	Odd Fixes
>> -T:	git git://linuxtv.org/media.git
>> -F:	drivers/media/usb/gspca/
>> -
>>  GTP (GPRS Tunneling Protocol)
>>  M:	Pablo Neira Ayuso <pablo@netfilter.org>
>>  M:	Harald Welte <laforge@gnumonks.org>
>> diff --git a/drivers/media/usb/Kconfig b/drivers/media/usb/Kconfig
>> index 813171d25ac5..ba0dc7bb6cb6 100644
>> --- a/drivers/media/usb/Kconfig
>> +++ b/drivers/media/usb/Kconfig
>> @@ -13,7 +13,6 @@ if MEDIA_USB_SUPPORT
>>  if MEDIA_CAMERA_SUPPORT
>>  	comment "Webcam devices"
>>
>> -source "drivers/media/usb/gspca/Kconfig"
>>  source "drivers/media/usb/pwc/Kconfig"
>>  source "drivers/media/usb/s2255/Kconfig"
>>  source "drivers/media/usb/usbtv/Kconfig"
>> diff --git a/drivers/media/usb/Makefile b/drivers/media/usb/Makefile
>> index 6d171beea20d..979704fd4cdb 100644
>> --- a/drivers/media/usb/Makefile
>> +++ b/drivers/media/usb/Makefile
>> @@ -17,7 +17,6 @@ obj-y += ttusb-dec/
>>  # (e. g. LC_ALL=C sort Makefile)
>>  obj-$(CONFIG_DVB_AS102) += as102/
>>  obj-$(CONFIG_USB_AIRSPY) += airspy/
>> -obj-$(CONFIG_USB_GSPCA) += gspca/
>>  obj-$(CONFIG_USB_HACKRF) += hackrf/
>>  obj-$(CONFIG_USB_MSI2500) += msi2500/
>>  obj-$(CONFIG_USB_PWC) += pwc/
>> diff --git a/drivers/media/usb/gspca/Kconfig b/drivers/media/usb/gspca/Kconfig
>> deleted file mode 100644
>> index 9c1939ce6be4..000000000000
>> diff --git a/drivers/media/usb/gspca/Makefile b/drivers/media/usb/gspca/Makefile
>> deleted file mode 100644
>> index a35c45006130..000000000000
>> diff --git a/drivers/media/usb/gspca/autogain_functions.c b/drivers/media/usb/gspca/autogain_functions.c
>> deleted file mode 100644
>> index 7ae7c43951cd..000000000000
>> diff --git a/drivers/media/usb/gspca/benq.c b/drivers/media/usb/gspca/benq.c
>> deleted file mode 100644
>> index 25c40fb1ba43..000000000000
>> diff --git a/drivers/media/usb/gspca/conex.c b/drivers/media/usb/gspca/conex.c
>> deleted file mode 100644
>> index 8b2691243f8a..000000000000
>> diff --git a/drivers/media/usb/gspca/cpia1.c b/drivers/media/usb/gspca/cpia1.c
>> deleted file mode 100644
>> index 14aaf36cde6e..000000000000
>> diff --git a/drivers/media/usb/gspca/dtcs033.c b/drivers/media/usb/gspca/dtcs033.c
>> deleted file mode 100644
>> index 671b205c0059..000000000000
>> diff --git a/drivers/media/usb/gspca/etoms.c b/drivers/media/usb/gspca/etoms.c
>> deleted file mode 100644
>> index c99fd9a1dd21..000000000000
>> diff --git a/drivers/media/usb/gspca/finepix.c b/drivers/media/usb/gspca/finepix.c
>> deleted file mode 100644
>> index bc6133b525e3..000000000000
>> diff --git a/drivers/media/usb/gspca/gl860/Kconfig b/drivers/media/usb/gspca/gl860/Kconfig
>> deleted file mode 100644
>> index e5a35ca72b60..000000000000
>> diff --git a/drivers/media/usb/gspca/gl860/Makefile b/drivers/media/usb/gspca/gl860/Makefile
>> deleted file mode 100644
>> index 7bcfa36f12ac..000000000000
>> diff --git a/drivers/media/usb/gspca/gl860/gl860-mi1320.c b/drivers/media/usb/gspca/gl860/gl860-mi1320.c
>> deleted file mode 100644
>> index d6a540ed378c..000000000000
>> diff --git a/drivers/media/usb/gspca/gl860/gl860-mi2020.c b/drivers/media/usb/gspca/gl860/gl860-mi2020.c
>> deleted file mode 100644
>> index 9e7a29154d45..000000000000
>> diff --git a/drivers/media/usb/gspca/gl860/gl860-ov2640.c b/drivers/media/usb/gspca/gl860/gl860-ov2640.c
>> deleted file mode 100644
>> index 928c1eaf9a87..000000000000
>> diff --git a/drivers/media/usb/gspca/gl860/gl860-ov9655.c b/drivers/media/usb/gspca/gl860/gl860-ov9655.c
>> deleted file mode 100644
>> index 766677ebcb34..000000000000
>> diff --git a/drivers/media/usb/gspca/gl860/gl860.c b/drivers/media/usb/gspca/gl860/gl860.c
>> deleted file mode 100644
>> index ce4ee8bc75c8..000000000000
>> diff --git a/drivers/media/usb/gspca/gl860/gl860.h b/drivers/media/usb/gspca/gl860/gl860.h
>> deleted file mode 100644
>> index a8a5d6450a66..000000000000
>> diff --git a/drivers/media/usb/gspca/gspca.c b/drivers/media/usb/gspca/gspca.c
>> deleted file mode 100644
>> index 4185c9047241..000000000000
>> diff --git a/drivers/media/usb/gspca/gspca.h b/drivers/media/usb/gspca/gspca.h
>> deleted file mode 100644
>> index a6554d5e9e1a..000000000000
>> diff --git a/drivers/media/usb/gspca/jeilinj.c b/drivers/media/usb/gspca/jeilinj.c
>> deleted file mode 100644
>> index 20b2468d065b..000000000000
>> diff --git a/drivers/media/usb/gspca/jl2005bcd.c b/drivers/media/usb/gspca/jl2005bcd.c
>> deleted file mode 100644
>> index 4988fbf5005e..000000000000
>> diff --git a/drivers/media/usb/gspca/jpeg.h b/drivers/media/usb/gspca/jpeg.h
>> deleted file mode 100644
>> index 660081dcb852..000000000000
>> diff --git a/drivers/media/usb/gspca/kinect.c b/drivers/media/usb/gspca/kinect.c
>> deleted file mode 100644
>> index 57ea65863591..000000000000
>> diff --git a/drivers/media/usb/gspca/konica.c b/drivers/media/usb/gspca/konica.c
>> deleted file mode 100644
>> index 53db9a2895ea..000000000000
>> diff --git a/drivers/media/usb/gspca/m5602/Kconfig b/drivers/media/usb/gspca/m5602/Kconfig
>> deleted file mode 100644
>> index d616408b67d9..000000000000
>> diff --git a/drivers/media/usb/gspca/m5602/Makefile b/drivers/media/usb/gspca/m5602/Makefile
>> deleted file mode 100644
>> index 95c9db6dc59c..000000000000
>> diff --git a/drivers/media/usb/gspca/m5602/m5602_bridge.h b/drivers/media/usb/gspca/m5602/m5602_bridge.h
>> deleted file mode 100644
>> index 4d63a9d24048..000000000000
>> diff --git a/drivers/media/usb/gspca/m5602/m5602_core.c b/drivers/media/usb/gspca/m5602/m5602_core.c
>> deleted file mode 100644
>> index 852ee6cce4b8..000000000000
>> diff --git a/drivers/media/usb/gspca/m5602/m5602_mt9m111.c b/drivers/media/usb/gspca/m5602/m5602_mt9m111.c
>> deleted file mode 100644
>> index bf1af6ed9131..000000000000
>> diff --git a/drivers/media/usb/gspca/m5602/m5602_mt9m111.h b/drivers/media/usb/gspca/m5602/m5602_mt9m111.h
>> deleted file mode 100644
>> index 480afd4c9fc3..000000000000
>> diff --git a/drivers/media/usb/gspca/m5602/m5602_ov7660.c b/drivers/media/usb/gspca/m5602/m5602_ov7660.c
>> deleted file mode 100644
>> index fadad530f721..000000000000
>> diff --git a/drivers/media/usb/gspca/m5602/m5602_ov7660.h b/drivers/media/usb/gspca/m5602/m5602_ov7660.h
>> deleted file mode 100644
>> index 6146e8ef17c0..000000000000
>> diff --git a/drivers/media/usb/gspca/m5602/m5602_ov9650.c b/drivers/media/usb/gspca/m5602/m5602_ov9650.c
>> deleted file mode 100644
>> index 82a698052255..000000000000
>> diff --git a/drivers/media/usb/gspca/m5602/m5602_ov9650.h b/drivers/media/usb/gspca/m5602/m5602_ov9650.h
>> deleted file mode 100644
>> index 929a7568c418..000000000000
>> diff --git a/drivers/media/usb/gspca/m5602/m5602_po1030.c b/drivers/media/usb/gspca/m5602/m5602_po1030.c
>> deleted file mode 100644
>> index 8fd99ceee4b6..000000000000
>> diff --git a/drivers/media/usb/gspca/m5602/m5602_po1030.h b/drivers/media/usb/gspca/m5602/m5602_po1030.h
>> deleted file mode 100644
>> index af4a7d836820..000000000000
>> diff --git a/drivers/media/usb/gspca/m5602/m5602_s5k4aa.c b/drivers/media/usb/gspca/m5602/m5602_s5k4aa.c
>> deleted file mode 100644
>> index c022265db3aa..000000000000
>> diff --git a/drivers/media/usb/gspca/m5602/m5602_s5k4aa.h b/drivers/media/usb/gspca/m5602/m5602_s5k4aa.h
>> deleted file mode 100644
>> index 1789cd0514c4..000000000000
>> diff --git a/drivers/media/usb/gspca/m5602/m5602_s5k83a.c b/drivers/media/usb/gspca/m5602/m5602_s5k83a.c
>> deleted file mode 100644
>> index 8ef010a87445..000000000000
>> diff --git a/drivers/media/usb/gspca/m5602/m5602_s5k83a.h b/drivers/media/usb/gspca/m5602/m5602_s5k83a.h
>> deleted file mode 100644
>> index 851e651561f2..000000000000
>> diff --git a/drivers/media/usb/gspca/m5602/m5602_sensor.h b/drivers/media/usb/gspca/m5602/m5602_sensor.h
>> deleted file mode 100644
>> index 46b7297fb115..000000000000
>> diff --git a/drivers/media/usb/gspca/mars.c b/drivers/media/usb/gspca/mars.c
>> deleted file mode 100644
>> index eb9342ee32af..000000000000
>> diff --git a/drivers/media/usb/gspca/mr97310a.c b/drivers/media/usb/gspca/mr97310a.c
>> deleted file mode 100644
>> index 3553788e8542..000000000000
>> diff --git a/drivers/media/usb/gspca/nw80x.c b/drivers/media/usb/gspca/nw80x.c
>> deleted file mode 100644
>> index 0f5f2464ac7a..000000000000
>> diff --git a/drivers/media/usb/gspca/ov519.c b/drivers/media/usb/gspca/ov519.c
>> deleted file mode 100644
>> index 57219a738c73..000000000000
>> diff --git a/drivers/media/usb/gspca/ov534.c b/drivers/media/usb/gspca/ov534.c
>> deleted file mode 100644
>> index bdff64a29a33..000000000000
>> diff --git a/drivers/media/usb/gspca/ov534_9.c b/drivers/media/usb/gspca/ov534_9.c
>> deleted file mode 100644
>> index 91efc650cf76..000000000000
>> diff --git a/drivers/media/usb/gspca/pac207.c b/drivers/media/usb/gspca/pac207.c
>> deleted file mode 100644
>> index 34127114c99b..000000000000
>> diff --git a/drivers/media/usb/gspca/pac7302.c b/drivers/media/usb/gspca/pac7302.c
>> deleted file mode 100644
>> index 608be0d64f94..000000000000
>> diff --git a/drivers/media/usb/gspca/pac7311.c b/drivers/media/usb/gspca/pac7311.c
>> deleted file mode 100644
>> index f6addb29f8f0..000000000000
>> diff --git a/drivers/media/usb/gspca/pac_common.h b/drivers/media/usb/gspca/pac_common.h
>> deleted file mode 100644
>> index acd1be93649d..000000000000
>> diff --git a/drivers/media/usb/gspca/se401.c b/drivers/media/usb/gspca/se401.c
>> deleted file mode 100644
>> index e087cfb5980b..000000000000
>> diff --git a/drivers/media/usb/gspca/se401.h b/drivers/media/usb/gspca/se401.h
>> deleted file mode 100644
>> index b0271409faf6..000000000000
>> diff --git a/drivers/media/usb/gspca/sn9c2028.c b/drivers/media/usb/gspca/sn9c2028.c
>> deleted file mode 100644
>> index dbd1d6da37f1..000000000000
>> diff --git a/drivers/media/usb/gspca/sn9c2028.h b/drivers/media/usb/gspca/sn9c2028.h
>> deleted file mode 100644
>> index beb5d2a5de75..000000000000
>> diff --git a/drivers/media/usb/gspca/sn9c20x.c b/drivers/media/usb/gspca/sn9c20x.c
>> deleted file mode 100644
>> index da916127a896..000000000000
>> diff --git a/drivers/media/usb/gspca/sonixb.c b/drivers/media/usb/gspca/sonixb.c
>> deleted file mode 100644
>> index f251a886024f..000000000000
>> diff --git a/drivers/media/usb/gspca/sonixj.c b/drivers/media/usb/gspca/sonixj.c
>> deleted file mode 100644
>> index 2e1bd2df8304..000000000000
>> diff --git a/drivers/media/usb/gspca/spca1528.c b/drivers/media/usb/gspca/spca1528.c
>> deleted file mode 100644
>> index ccc477944ef8..000000000000
>> diff --git a/drivers/media/usb/gspca/spca500.c b/drivers/media/usb/gspca/spca500.c
>> deleted file mode 100644
>> index b9ce5e35f52f..000000000000
>> diff --git a/drivers/media/usb/gspca/spca501.c b/drivers/media/usb/gspca/spca501.c
>> deleted file mode 100644
>> index f7c75d7535c4..000000000000
>> diff --git a/drivers/media/usb/gspca/spca505.c b/drivers/media/usb/gspca/spca505.c
>> deleted file mode 100644
>> index 0e8cccbb6d80..000000000000
>> diff --git a/drivers/media/usb/gspca/spca506.c b/drivers/media/usb/gspca/spca506.c
>> deleted file mode 100644
>> index 0886587dc89c..000000000000
>> diff --git a/drivers/media/usb/gspca/spca508.c b/drivers/media/usb/gspca/spca508.c
>> deleted file mode 100644
>> index 754ab1dbba83..000000000000
>> diff --git a/drivers/media/usb/gspca/spca561.c b/drivers/media/usb/gspca/spca561.c
>> deleted file mode 100644
>> index 431527ed602b..000000000000
>> diff --git a/drivers/media/usb/gspca/sq905.c b/drivers/media/usb/gspca/sq905.c
>> deleted file mode 100644
>> index 32504ebcfd4d..000000000000
>> diff --git a/drivers/media/usb/gspca/sq905c.c b/drivers/media/usb/gspca/sq905c.c
>> deleted file mode 100644
>> index 6ca947aef298..000000000000
>> diff --git a/drivers/media/usb/gspca/sq930x.c b/drivers/media/usb/gspca/sq930x.c
>> deleted file mode 100644
>> index c3610247a90e..000000000000
>> diff --git a/drivers/media/usb/gspca/stk014.c b/drivers/media/usb/gspca/stk014.c
>> deleted file mode 100644
>> index aa9e921e7cef..000000000000
>> diff --git a/drivers/media/usb/gspca/stk1135.c b/drivers/media/usb/gspca/stk1135.c
>> deleted file mode 100644
>> index 1a602af7310f..000000000000
>> diff --git a/drivers/media/usb/gspca/stk1135.h b/drivers/media/usb/gspca/stk1135.h
>> deleted file mode 100644
>> index 9a77500cc805..000000000000
>> diff --git a/drivers/media/usb/gspca/stv0680.c b/drivers/media/usb/gspca/stv0680.c
>> deleted file mode 100644
>> index b23988d8c7bc..000000000000
>> diff --git a/drivers/media/usb/gspca/stv06xx/Kconfig b/drivers/media/usb/gspca/stv06xx/Kconfig
>> deleted file mode 100644
>> index 59373659ae4d..000000000000
>> diff --git a/drivers/media/usb/gspca/stv06xx/Makefile b/drivers/media/usb/gspca/stv06xx/Makefile
>> deleted file mode 100644
>> index c4d7206e0c92..000000000000
>> diff --git a/drivers/media/usb/gspca/stv06xx/stv06xx.c b/drivers/media/usb/gspca/stv06xx/stv06xx.c
>> deleted file mode 100644
>> index d9bc2aacc885..000000000000
>> diff --git a/drivers/media/usb/gspca/stv06xx/stv06xx.h b/drivers/media/usb/gspca/stv06xx/stv06xx.h
>> deleted file mode 100644
>> index f6bafa982e32..000000000000
>> diff --git a/drivers/media/usb/gspca/stv06xx/stv06xx_hdcs.c b/drivers/media/usb/gspca/stv06xx/stv06xx_hdcs.c
>> deleted file mode 100644
>> index bd0c62a926b9..000000000000
>> diff --git a/drivers/media/usb/gspca/stv06xx/stv06xx_hdcs.h b/drivers/media/usb/gspca/stv06xx/stv06xx_hdcs.h
>> deleted file mode 100644
>> index 326a6eb68237..000000000000
>> diff --git a/drivers/media/usb/gspca/stv06xx/stv06xx_pb0100.c b/drivers/media/usb/gspca/stv06xx/stv06xx_pb0100.c
>> deleted file mode 100644
>> index d30a76df52cf..000000000000
>> diff --git a/drivers/media/usb/gspca/stv06xx/stv06xx_pb0100.h b/drivers/media/usb/gspca/stv06xx/stv06xx_pb0100.h
>> deleted file mode 100644
>> index c5a6614577de..000000000000
>> diff --git a/drivers/media/usb/gspca/stv06xx/stv06xx_sensor.h b/drivers/media/usb/gspca/stv06xx/stv06xx_sensor.h
>> deleted file mode 100644
>> index 67c13c689b9c..000000000000
>> diff --git a/drivers/media/usb/gspca/stv06xx/stv06xx_st6422.c b/drivers/media/usb/gspca/stv06xx/stv06xx_st6422.c
>> deleted file mode 100644
>> index aac19d449be2..000000000000
>> diff --git a/drivers/media/usb/gspca/stv06xx/stv06xx_st6422.h b/drivers/media/usb/gspca/stv06xx/stv06xx_st6422.h
>> deleted file mode 100644
>> index 68ba01c5a8d4..000000000000
>> diff --git a/drivers/media/usb/gspca/stv06xx/stv06xx_vv6410.c b/drivers/media/usb/gspca/stv06xx/stv06xx_vv6410.c
>> deleted file mode 100644
>> index dde1950bdc68..000000000000
>> diff --git a/drivers/media/usb/gspca/stv06xx/stv06xx_vv6410.h b/drivers/media/usb/gspca/stv06xx/stv06xx_vv6410.h
>> deleted file mode 100644
>> index 343ddc30401f..000000000000
>> diff --git a/drivers/media/usb/gspca/sunplus.c b/drivers/media/usb/gspca/sunplus.c
>> deleted file mode 100644
>> index 971dee0a56da..000000000000
>> diff --git a/drivers/media/usb/gspca/t613.c b/drivers/media/usb/gspca/t613.c
>> deleted file mode 100644
>> index 33b37ccf1090..000000000000
>> diff --git a/drivers/media/usb/gspca/topro.c b/drivers/media/usb/gspca/topro.c
>> deleted file mode 100644
>> index aee444042f60..000000000000
>> diff --git a/drivers/media/usb/gspca/touptek.c b/drivers/media/usb/gspca/touptek.c
>> deleted file mode 100644
>> index 734644d928ab..000000000000
>> diff --git a/drivers/media/usb/gspca/tv8532.c b/drivers/media/usb/gspca/tv8532.c
>> deleted file mode 100644
>> index c31baa72c02c..000000000000
>> diff --git a/drivers/media/usb/gspca/vc032x.c b/drivers/media/usb/gspca/vc032x.c
>> deleted file mode 100644
>> index e7a534be061d..000000000000
>> diff --git a/drivers/media/usb/gspca/vicam.c b/drivers/media/usb/gspca/vicam.c
>> deleted file mode 100644
>> index 91e177aa8136..000000000000
>> diff --git a/drivers/media/usb/gspca/w996Xcf.c b/drivers/media/usb/gspca/w996Xcf.c
>> deleted file mode 100644
>> index 700c39fe307c..000000000000
>> diff --git a/drivers/media/usb/gspca/xirlink_cit.c b/drivers/media/usb/gspca/xirlink_cit.c
>> deleted file mode 100644
>> index acfb9a195106..000000000000
>> diff --git a/drivers/media/usb/gspca/zc3xx-reg.h b/drivers/media/usb/gspca/zc3xx-reg.h
>> deleted file mode 100644
>> index ab8f44a4f3d4..000000000000
>> diff --git a/drivers/media/usb/gspca/zc3xx.c b/drivers/media/usb/gspca/zc3xx.c
>> deleted file mode 100644
>> index 5bcbf0d40147..000000000000
> 
> 

