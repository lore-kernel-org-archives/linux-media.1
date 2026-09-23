Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B795443E5E
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 06:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790145008; cv=none; b=mrSM37weKBtXZOGfIuI6yKqKZvkVReDM2lrou8Zq5DlS3a3xuGWbuYTeKtS7/+WqoFmFmJTf1PIMalF8llS0q4tXlJm0/IkOt2zEOjwNjuqHHrX+LScgEH85BcNj64t9Xd8JnOk6b8Y9mGA2cQ+wuma6F51Nceoml86tmarBClI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790145008; c=relaxed/simple;
	bh=2YpYB+A/Bp+mnoyPS7FX+nmsmXarx23M4ztmEAqb3kw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=nj1fd2jUQkR9/YlXRlhaXUURtLNpAS8vL8t47r/IQzhZ4RR5GzZabNnL3OoHn2FHgiUrX4HyDFNO2dYLzQT773ZZqQ4R8qjMr0PSZRnp+4g/L8ugTPI2j5ydUa1tbe0c+s5aclvrTgTfB1uxycGB85fpzJudZN2lmuuQ71jzP+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OrJOPrms; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OrJOPrms"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2EEC1F000FF;
	Wed, 23 Sep 2026 06:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790145002;
	bh=TCgqusoGl0Zo3wQEpeN4NyfmEFfvAwa1DCGMuENxbnw=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=OrJOPrmsdd3EiPsP4EMxErUQ14DGHWeODQjiMH4I8HJKuv9y0FyzIdzZcIviz1iOT
	 mtcl6/96ecc+/NgWF+YJqbQUj4M6NwCSynmKY/F8EBV0sdw+k5dnr/IOxRgFvdIP/v
	 SbCjqKiuoV4CrAfQ+qFCQr2azY6XKqeUzTAXJ2odjMFZIpBgyYu3EwPIkEQakqQ8ba
	 6eSEmve4b9ALcu9T8ZKaG3UKLBwplDWMkJme4KWAAYDuTLFVynmP6P8hr22ITyoTyZ
	 Lkv/ZJuxBTYsAXfZ9s2oiMiQI2/YrfgA6KZhuCxhkxj2EaZbpjnI0VXGFblDxkZq3s
	 XMKvZpJ4PDS/Q==
Message-ID: <7be9601a-cd2e-43b8-abd3-96dd2cc8a38f@kernel.org>
Date: Wed, 23 Sep 2026 08:29:58 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: RFC: Remove gspca and old ISA radio drivers
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hansg@kernel.org>
References: <8d8203ba-a406-4730-9493-dbab8b3ec831@kernel.org>
 <20260922155509.GA2471124@killaraus.ideasonboard.com>
Content-Language: en-US, nl
In-Reply-To: <20260922155509.GA2471124@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/09/2026 17:55, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Tue, Sep 22, 2026 at 05:37:03PM +0200, Hans Verkuil wrote:
>> Hi all,
>>
>> Would there be any objection to removing the gspca driver for all those old
>> webcams with horrible quality and that nobody should be using anyway, and
>> for the old ISA radio drivers where I am pretty sure I'm the only one that
>> can actually test them (and even that is questionable).
>>
>> I could move them to staging/deprecated for a kernel cycle, but to be honest
>> I think we should just kick them out.
> 
> No objection from me. gspca doesn't bother me though, as it's quite
> self-contained. I would be happier to see the em28xx driver go when it
> will be time, as it's one of the few users of some legacy subdev APIs I
> would like to drop. As far as I understand, that driver is however more
> widely used.

That's still in use, and quite a lot too. I still get patches adding support
for new em28xx products. If you want to get rid of legacy in that driver,
then it is best to get em28xx based hardware and make patches. This driver
won't go away any time soon.

> 
>> It also allows me to throw away a lot of old hardware and make some room for
>> new hardware :-)
> 
> I wonder if some computer science museums would have an interest in
> those. I suppose they're not the most interesting devices.
> 

Not old enough, and not special enough.

Now, I also have one of the first consumer webcams (Connectix QuickCam,
parallel port, grayscale), that one might indeed be of interest for a museum.

Regards,

	Hans
