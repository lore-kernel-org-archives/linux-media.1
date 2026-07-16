Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987B5392C2C;
	Thu, 16 Jul 2026 07:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784186532; cv=none; b=N1sNOee57s8mWsaTpidrM+8TBnZsa1QDi+nrxJd4vx4MhyV6ZX/rZFC0mKa8aIqIrcFzQzzcpeKZVjc5b5f+9gfIcs6ZZ8fe6jIXYgDcaF5Nss0OPABoBv041t42IXcx3BzlPi0yPXxOOQngKB0bwXfOoFn1XuFhBrckygXDXaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784186532; c=relaxed/simple;
	bh=o0m4APPaukNUDsqquduBQa3IDyrgVS4NIbrxh2agRUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cao7UwFfhOzKQtl3BIfzfGwPccjkPHnEp3ztLfuqDhnfvipG8Q1m1g2bjyDo4/TLQAu0J5B6Ssb9qHI74zQxvxxE9AVic4Crk52M59ehbzynaHaQ0WhMYVt1JLwUffE3bz6Y6R+Ar7yRu0585ewjeS1GJemtkfgvbeYN8AHdB4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DryU336E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DryU336E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D4181F00A3A;
	Thu, 16 Jul 2026 07:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784186528;
	bh=yBgQLJoWIrp6n9tPjBRkaU8xKOqMrnxXi4OkMm84RIg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=DryU336EAmjujWSTE3CBCKKu7HVPVtKAXpTTV4i8Z9lSEFeJJpBgi5WXzojM26ogD
	 7yOqNKEmsgmR1DrQPSSWHb9HkKROBus8XmwgF1XrUNMRgpIcxkqx+8qMUVbg+zVnaJ
	 KjlWDho6C/clvd9kVBgVICWlDoK/GVmAI5xbmMmahbrCrf7MdtVTet7cbCd48SNpPn
	 U1aYkcFENVyyz13yR4y8vBJWJY3Lp+q8Ld9aJRKXSix923WbqB/QYKqLEOyNIYPMuY
	 X+3Pz8tImHDjApLJWbuwHGayNrn6Sx7/dPIUUud13xmydlSLPg11v0SJ68whqKz2XG
	 4KbY0GJLi5aRQ==
Message-ID: <bb075afb-56bf-4cea-9732-f2613feb88d1@kernel.org>
Date: Thu, 16 Jul 2026 10:22:03 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: bcm2835-unicam: Fix pipeline wrong validation for
 unpacked formats
To: Jai Luthra <jai.luthra@ideasonboard.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Eugen Hristev
 <ehristev@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@redhat.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Ray Jui <rjui@broadcom.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Scott Branden <sbranden@broadcom.com>
Cc: linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260520-bcmpi-v1-1-41d80125a7b9@kernel.org>
 <178046930079.1525445.16102733967737177325@freya>
From: Eugen Hristev <ehristev@kernel.org>
Content-Language: en-US
In-Reply-To: <178046930079.1525445.16102733967737177325@freya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/3/26 09:48, Jai Luthra wrote:
> Hi Eugen,
> 
> Quoting Eugen Hristev (2026-05-20 21:07:00)
>> The commit
>> 08f9794d9b79 ("media: bcm2835-unicam: Fix RGB format / mbus code association")
>> introduced a check to see whether the format requested is the same as the
>> fourcc in the format list.
>>
>> However, this breaks the case when userspace requested an unpacked fourcc,
>> e.g. RG10.
>>
>> Unicam can work with or without unpacking pixels, e.g. pRAA or RG10, depending
>> on what userspace requests.
>> In the unpacking case, a dedicated register is being set.
>>
>> If the userspace requests pRAA, this works, because the check validates the
>> pipeline:
>>
>> v4l2-ctl -d /dev/video0 --set-fmt-video=width=3280,height=2464,pixelformat=pRAA \
>>  --stream-mmap --stream-count=1 --stream-to=frame.raw
>>
>> but, with
>> v4l2-ctl -d /dev/video0 --set-fmt-video=width=3280,height=2464,pixelformat=RG10 \
>> --stream-mmap --stream-count=1 --stream-to=frame.raw
>>
>> unicam complains at validation level:
>>
>> image: format mismatch: 0x300f <=> RG10 little-endian (0x30314752)
>>
>> This should work, because MEDIA_BUS_FMT_SRGGB10_1X10 can be packed into either
>> RG10 or pRAA depending on the packing register.
>>
>> To fix this, modified the condition check to also allow in the case when
>> requested format (fmt->pixelformat) is equal to fmtinfo->unpacked_fourcc.
>>
>> Fixes: 08f9794d9b79 ("media: bcm2835-unicam: Fix RGB format / mbus code association")
>> Signed-off-by: Eugen Hristev <ehristev@kernel.org>
>> ---
>>  drivers/media/platform/broadcom/bcm2835-unicam.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
>> index 8d28ba0b59a3..cc7627e9a51a 100644
>> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
>> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
>> @@ -2158,7 +2158,8 @@ static int unicam_video_link_validate(struct media_link *link)
>>                  * In order to allow the applications using the old behaviour to
>>                  * run, let's accept the old combination, but warn about it.
>>                  */
>> -               if (fmtinfo->fourcc != fmt->pixelformat) {
>> +               if (fmt->pixelformat != fmtinfo->fourcc &&
>> +                   fmt->pixelformat != fmtinfo->unpacked_fourcc) {
>>                         if ((fmt->pixelformat == V4L2_PIX_FMT_BGR24 &&
>>                              format->code == MEDIA_BUS_FMT_BGR888_1X24) ||
>>                             (fmt->pixelformat == V4L2_PIX_FMT_RGB24 &&
>>
> 
> Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
> 

Hi Sakari,

I saw you taking some of the patches on unicam, this one is the most
important as all unpacked formats are basically broken for a very long
time (months) and the patch is pending for quite some time.

This should also go in stable as some older versions also affected.

Thanks,
Eugen

> Thanks,
> Jai
> 
>> ---
>> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
>> change-id: 20260520-bcmpi-2c4850314e21
>>
>> Best regards,
>> --  
>> Eugen Hristev <ehristev@kernel.org>
>>
>>

