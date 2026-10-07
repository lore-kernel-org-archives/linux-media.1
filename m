Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8023C3C1C
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 10:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791368102; cv=none; b=IDtVa3dPqnf72buwPNyDhzEfpeeOdgnEO/OpNtEcBORb7V8chHVPe8xCljsD+HaFkLCUpiHy39RMgkeva8LWl4kxxQkTXjSzLrWD/yf0DQsRTSOJxleqRZgD6NNcMT0lU5F6v2nuTT1Em/cLuVRhxmID4Iu5vSbIsfx9apGIh9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791368102; c=relaxed/simple;
	bh=H7Hw8uCThmvxDMbHvZr82QzyJZx8FQi+P1FtUXp+guo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LlfuEKpfnanuZzPoue1Ob6RPaPS47BYcPTsWmlY33fobS7Kplgnbqlaap47XsMJ1tC//QYVM50XiKUKk4Y7oHFvQcU/61ZOwKlnB1oFH2bRxLhUs3qrr6LcBTr2/b/eLB2rYoOVjmYhZtw3JU4ElrO8hiQoqO80e74UodlqruHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QAyL/EO0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QAyL/EO0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBE3E1F0089D;
	Wed,  7 Oct 2026 10:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791368092;
	bh=1WStVdK5cDacv3Uy3DNfj26xW8v3J2nqBLU5FLnhLO4=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=QAyL/EO0t+SEOzcEwBJ2kff566fmAE8ZeaqD074qNtcF4LPQ/3pMgeoi2uSLVs4dD
	 zB7MQ28ny491UZe1JiaRqSV2eq5mWKvv67gqpurjg3KPKg43YOEIQz9NyQbDLFYaC3
	 Y9B1H5NLhusfYtPi1Ef8QDbJVvVT/wMH+zcMWgyiimw1NyTxu/z7/5a/wssoMQm3e8
	 sX3gsck/L8dNmJzp/oqyqjzpyNMWLaH9ZMh5A/Vwk39CCK6qbzMrdXr5uqGe3BFPQr
	 YTjvii8zjHpc2VCIBxfgSFw8EbRryZcgm7LwXm8Izy9ILOc1yy2es3LGv9WVKePoTV
	 SIvO6mURM9VIA==
Message-ID: <07ce46a4-a8f7-49fc-8ceb-7276abc0d4ad@kernel.org>
Date: Wed, 7 Oct 2026 12:14:46 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH 1/1] media: subdev: Make get_fmt on INTERNAL pads without
 STREAMS an error
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Julien Massot <julien.massot@collabora.com>,
 Naushir Patuck <naush@raspberrypi.com>,
 "Yan, Dongcheng" <dongcheng.yan@intel.com>,
 Stefan Klug <stefan.klug@ideasonboard.com>,
 Mirela Rabulea <mirela.rabulea@nxp.com>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Ricardo Ribalda Delgado <ribalda@kernel.org>,
 Hans de Goede <hansg@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 David Plowman <david.plowman@raspberrypi.com>,
 "Yu, Ong Hock" <ong.hock.yu@intel.com>, "Ng, Khai Wen"
 <khai.wen.ng@intel.com>, Jai Luthra <jai.luthra@ideasonboard.com>,
 Rishikesh Donadkar <r-donadkar@ti.com>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Antti Laakso <antti.laakso@linux.intel.com>
References: <20261006092950.690101-1-sakari.ailus@linux.intel.com>
 <ae109b76-67f8-456d-a233-796f50cadcb1@kernel.org>
 <asYVi4p-NRWuVxae@kekkonen.localdomain>
Content-Language: en-US, nl
In-Reply-To: <asYVi4p-NRWuVxae@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/10/2026 11:48, Sakari Ailus wrote:
> Hi Hans,
> 
> On Wed, Oct 07, 2026 at 11:43:35AM +0200, Hans Verkuil wrote:
>> On 06/10/2026 11:29, Sakari Ailus wrote:
>>> Internal pads should only be accessible to file handles with
>>> V4L2_SUBDEV_CLIENT_CAP_STREAMS flag set. Return an error otherwise.
>>>
>>> Fixes: 49cdf56876d3 ("media: mc: Add INTERNAL pad flag")
>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>> ---
>>>  drivers/media/v4l2-core/v4l2-subdev.c | 7 ++++++-
>>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>>> index a07d77e584c3..7cb5a40f0f8c 100644
>>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>>> @@ -854,8 +854,13 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>>>  	case VIDIOC_SUBDEV_G_FMT: {
>>>  		struct v4l2_subdev_format *format = arg;
>>>  
>>> -		if (!client_supports_streams)
>>> +		if (!client_supports_streams) {
>>> +			if (format->pad < sd->entity.num_pads &&
>>> +			    sd->entity.pads[format->pad].flags & MEDIA_PAD_FL_INTERNAL)
>>> +				return -EINVAL;
>>> +
>>>  			format->stream = 0;
>>> +		}
>>>  
>>>  		memset(format->reserved, 0, sizeof(format->reserved));
>>>  		memset(format->format.reserved, 0, sizeof(format->format.reserved));
>>>
>>
>> There is no documentation that I can find that says that MEDIA_PAD_FL_INTERNAL is only available
>> if V4L2_SUBDEV_CLIENT_CAP_STREAMS is set.
>>
>> I think this needs some more thought: if internal pads are only available if that cap is set,
>> then I expect that a lot more ioctls will need this check. In that case the check should become
>> a helper function.
>>
>> But how does this affect e.g. G_TOPOLOGY or ENUM_LINKS? If the cap is not set, should internal
>> pads still be reported?
> 
> We don't have client capabilities on MC side, at least not right now. The
> INTERNAL pads are intended to be used in very special circumstances and for
> that we do have sub-device capability flags. They were introduced in this
> cycle and if we allow wider access to them now, there could be issues
> blocking that as the interface they expose isn't intended to be used
> without these capability flags.

So are the internal pads exposed or not through these MC ioctls? That's not clear
to me. It's not documented either.

> 
> I'll rework this to apply to the rest of the pad-related IOCTLs.
> 
>>
>> And you need checks in v4l2-compliance, ensuring that trying to access internal pads without
>> that cap will indeed fail.
> 
> I can add that.
> 
>>
>> Ideally you would like to have this emulated in vimc as well.
>>
>> In other words, I think this needs more work, both in the core and w.r.t. documentation.
> 
> The INTERNAL pad flag was introduced as the Maxim serdes driver needed it
> and we thought it's fine to merge it early; the bulk of the documentation
> resides in the depths of my metadata series.
> 

Ah, that's not something I was aware of (or may have been aware of, but forgotten). Adding
a new uAPI requires a lot more care: proper documentation, v4l2-compliance tests, if at all
possible emulation support in one of the test drivers.

Neither was it reviewed by the media maintainers (me or Mauro). I'm really not happy about
that. uAPI changes have to be reviewed by the media maintainers.

Before rc1 is released you must have a patch series ready (and reviewed by me) adding proper
documentation, fixing issues like the one addressed in this patch, and a patch for
v4l2-compliance.

Ideally also a patch to emulate this in the test driver (probably vimc), but that will
likely take more time.

If it is not properly documented etc., then I might decide to revert this driver + uAPI
change in 7.4-rcX.

As media committer it is your responsibility to ensure that the media maintainers have
reviewed uAPI changes and are OK with it. That clearly didn't happen here.

Regards,

	Hans
