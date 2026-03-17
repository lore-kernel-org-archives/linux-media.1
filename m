Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3BD3A1D0C
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 09:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773741156; cv=none; b=kI450ZQBFIpAmRndR2pbyS6e1vYoHEfSSnlpppSUsJme5eby35ZKL19fRU0d/dkHr2ZUmk92OrhDu8Lh9oS156MoSXpBfkmz7U62snc3dWBhPu4ysNHHl3kinn17Ik7U34lnixFnppupmTN6bdMXgXu2CHX7K2eeQV34k7VnSeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773741156; c=relaxed/simple;
	bh=62Wks0jts0qeArIM/i4AB2ZwZdT1JNsIGM11M0PipaE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=Z4QW8XsUjL6nrk1gFkB6WnMlDGniTXMDspyDYr03TZqnA6VSaFD7b1bQhfGwCMxi0plEb0cQxjt4wk1HfgFZPbXVqswBAoJKYIPq85DKJRSAA+u5/wrEuNN8WEfSytzNO5NS/RtTq7WU7xJvSZ46X1ux37Fk2+R1OrFdCapb0lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dQ1Cp7Ib; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dQ1Cp7Ib"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41F1BC4AF09;
	Tue, 17 Mar 2026 09:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773741155;
	bh=62Wks0jts0qeArIM/i4AB2ZwZdT1JNsIGM11M0PipaE=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=dQ1Cp7IbEpMTajBCml+X48JPxy1pj2aLKm7pE+8xl2rgbkStL8PGYSPnXNSAPNnIg
	 /7l87ZMybQ2y+fohp7+MBjtUGh6IQi5TDSS3RbS0jSnpiVySkfQL/lzc+BV05/zYKE
	 7lzZStr/IzgY870tVXwMss7yzHmzuXpk57W+YtbT7a8GSBQHN5yQiYYRLHvwVuLyPT
	 8pmbOUK2rqwWzkYeIJonly9a3COf3NoiY4F2xqJqjbqt3upq3vOmDZYC95UgK+1wtu
	 0tD83Obxefv3ZYltxJiqeEJYPk8A3uQpqmbcVh+3obVIYWrcTwvK/XapXPOvmxPFAY
	 ByNlVoIoNBFxg==
Message-ID: <7c653b8b-5d31-4667-9d86-cbaed7ee97f9@kernel.org>
Date: Tue, 17 Mar 2026 10:52:33 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH 00/11] Assorted DVB and TV patches
To: Bradford Love <brad@nextdimension.cc>, linux-media@vger.kernel.org
References: <20260312213532.2907276-1-brad@nextdimension.cc>
Content-Language: en-US, nl
In-Reply-To: <20260312213532.2907276-1-brad@nextdimension.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Brad,

Thank you for this cleanup series!

I'll take them all, except for the "au0828: Fix green screen in analog" patch,
which needs a v2. So no need to post a v2 of the whole series, just post a v2
of that au0828 patch.

Regards,

	Hans

On 12/03/2026 22:35, Bradford Love wrote:
> Hello,
> 
> Attached here is a series of accumlated fixes from integrations
> and deployments.
> 
> The first five patches are related to fixing issues with a
> variety of analog video formats.
> 
> The si2168 i2c timeout patch is something that has been found
> to be critical on a variety of ARM platforms and Nvidia SOC.
> Something in these platforms has USB i2c not consistently responding
> within the embedded deadline in the driver.
> 
> There are two firmware fixes. With Hauppauge hardware fw 4.0-11 si2168
> devices definitely lose warm state and cannot function after sleep.
> The saa7164 REV2 firmware had an incorrect filename and has been fixed.
> 
> Last up is adding some new Hauppauge USB id's and removing an invalid
> analog input from the Hauppauge DVB DualHD.
> 
> Addressing checkpatch warnings:
> - 0001 palN is not misspelled
> - 0003 adding dprintk like driver already does
> 
> 
> 
> Regards,
> 
> Bradford
> 
> 
> 
> Bradford Love (11):
>   si2157: Analog format fixes
>   cx25840: Fix NTSC-J, PAL-N, and SECAM standards
>   xc5000: Add rf strength function
>   cx231xx: Fix AGC levels for NTSC-M
>   au0828: Fix green screen in analog
>   si2168: Fix i2c command timeout on embedded platforms
>   si2168: fw 4.0-11 loses warm state during sleep
>   saa7164: Fix REV2 firmware filename
>   au0828: Add new Hauppauge HVR1265 and ImpactVCB-e
>   em28xx: Add a variety of DualHD usb id
>   em28xx: remove tuner type from Hauppauge DVB DualHD
> 
>  drivers/media/dvb-frontends/au8522_decoder.c |  1 +
>  drivers/media/dvb-frontends/si2168.c         |  8 ++--
>  drivers/media/i2c/cx25840/cx25840-core.c     | 29 +++++++++++-
>  drivers/media/pci/saa7164/saa7164-fw.c       |  4 +-
>  drivers/media/tuners/si2157.c                | 15 ++++--
>  drivers/media/tuners/xc5000.c                | 13 ++++-
>  drivers/media/usb/au0828/au0828-cards.c      | 50 ++++++++++++++++++++
>  drivers/media/usb/au0828/au0828-cards.h      |  2 +
>  drivers/media/usb/au0828/au0828-dvb.c        |  1 +
>  drivers/media/usb/au0828/au0828-input.c      |  1 +
>  drivers/media/usb/au0828/au0828-video.c      | 30 +++++++++++-
>  drivers/media/usb/cx231xx/cx231xx-avcore.c   |  7 ++-
>  drivers/media/usb/em28xx/em28xx-cards.c      | 19 +++++---
>  13 files changed, 156 insertions(+), 24 deletions(-)
> 

