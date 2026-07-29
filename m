Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A85547CA70;
	Wed, 29 Jul 2026 13:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785330924; cv=none; b=ECErr12o8k+unWNLIbJSnnU66i5nQd8WKzju+ij7/bcOrC8TGuJXquAklg2lAFisfZ2OhrxFPlMMNmQ5a6Nl69DLIkm4uVrjOKZFB72K/QGYn8jnFEm4rL/CbuNgZARfIAaz0TQm23zvFikLcC7V1kvmmA0ncJRiC7l/OiZtc2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785330924; c=relaxed/simple;
	bh=IXL6xsvI8DX3PCRKgykbkP/sKJHHDWWHG+zsWanOZdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YfwyM8jiXpr+g9Fcio7ZjNAKjGnQHwGMRu8p4I8WtsA8f/M+oHq6oTfv3lfPy0lNicspnBb2K0nRilw46V05vmHgN62466UKd+tE6kcTc83JC3IF7FWXip140W4simTwC/PYH8n0wrrw6Kvyq6of/o0r8+B8GRsFLXRhWBZFoPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kJsnaGDk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kJsnaGDk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68E751F000E9;
	Wed, 29 Jul 2026 13:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785330923;
	bh=/sGXV4ysAOy4M7Uyzl0Qf/BWdUccBZ7L7sFQEqECQSQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=kJsnaGDkxfPi+g0EuQWoiIxljpEy9VSm60hiCQViSAn6bJHjQWQppT96oRLaO2ih1
	 icLf77lQcsubSe3C1rXl3RCthxMJYNAQO/ui76dUJqB12sXzL/rR8eWwLj5IkLs5wk
	 5AHGqGYMm6igEBbZDf8SVCUBLqs8w6Ct0ovWQk/e0C/shcNCMyCZ+T8Ng/2KhMed0y
	 /Gekr6t18YeaoPJEFKa+ewBJ9TwC0KcC3D3TiMsNUwyHgGFrjE/Jh2x2ZRNeCcpEq9
	 XsrkVZOuEIR5gnsP1TlZxC3fcWYznHtAI5LfQkwAWeYtl/npDg8uhM3N5wzkFsTz86
	 oXD0rLP/2OSow==
Message-ID: <98d755d5-68b8-47db-8444-6aee5dab4da1@kernel.org>
Date: Wed, 29 Jul 2026 15:15:20 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/2] media: i2c: ov8865: fix horizontal flip control
 polarity
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jakob Berg Jespersen <dev@berg.pm>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Fernando Rimoli <fernandorimoli11@gmail.com>,
 Tooraj Taraz <tooraj.taraz@yahoo.com>, "Joseph V. Lavigne"
 <jlavig88@gmail.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260720-sp7plus-ov-flips-v1-0-5f345b0673de@berg.pm>
 <20260720-sp7plus-ov-flips-v1-1-5f345b0673de@berg.pm>
 <amktg0O4JqGJEHMc@kekkonen.localdomain>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <amktg0O4JqGJEHMc@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 29-Jul-26 00:30, Sakari Ailus wrote:
> Hi Jacob,
> 
> Thanks for the set.
> 
> On Mon, Jul 20, 2026 at 04:28:40PM +0200, Jakob Berg Jespersen wrote:
>> The ov8865's native readout is horizontally mirrored and the
>> FORMAT2 FLIP_HORZ bits (reg 0x3821) un-mirror it: with the bits
>> cleared the image is mirrored, with them set it is not. The driver
>> maps V4L2_CID_HFLIP=1 to setting the bits, so requesting a flip
>> produces an unflipped image and vice versa.
>>
>> This is user-visible on the Surface Pro 7+ rear camera (mounted with a
>> 180 degree rotation, SSDB degree=180): libcamera requests HFLIP=1+VFLIP=1
>> to undo the mount rotation and gets a horizontally flipped image.
>>
>> Verified by a live 4-state flip/image matrix on the streaming sensor:
>>
>>   hflip=0 vflip=0 -> 180 degree rotation (both flips)
>>   hflip=1 vflip=0 -> vertical flip only
>>   hflip=0 vflip=1 -> correct image
>>   hflip=1 vflip=1 -> horizontal flip only
>>
>> (vertical flip = reflection over a horizontal mirror line, as on water;
>> horizontal flip = reflection over a vertical mirror line, as in a mirror)
>>
>> which is only consistent with an inverted HFLIP and a correct VFLIP.
>>
>> Invert the polarity so HFLIP=0 yields the unflipped image.
> 
> Is this just about, looking at the patch, that the driver before this patch
> effectively implements an inverted HFLIP control? I think the description
> could be simplified.

Ack and even more so for the second patch. The text about
"like the ov8865" really does not belong in the commit message
there.

Regards,

Hans


> 
>>
>> Signed-off-by: Jakob Berg Jespersen <dev@berg.pm>
>> ---
>>  drivers/media/i2c/ov8865.c | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
>> index c6d53c3d55ca..901ea7c16395 100644
>> --- a/drivers/media/i2c/ov8865.c
>> +++ b/drivers/media/i2c/ov8865.c
>> @@ -2204,8 +2204,14 @@ static int ov8865_flip_horz_configure(struct ov8865_sensor *sensor, bool enable)
>>  	u8 bits = OV8865_FORMAT2_FLIP_HORZ_ISP_EN |
>>  		  OV8865_FORMAT2_FLIP_HORZ_SENSOR_EN;
>>  
>> +	/*
>> +	 * The sensor's native readout is horizontally mirrored; the
>> +	 * FLIP_HORZ bits un-mirror it. Map the control so that HFLIP=0
>> +	 * yields an unmirrored image (verified on Surface Pro 7+ rear
>> +	 * camera by a live flip-control/image matrix test).
>> +	 */
> 
> Just a comment saying this is inverted in the sensor considering HFLIP
> should be enough here.
> 
>>  	return ov8865_update_bits(sensor, OV8865_FORMAT2_REG, bits,
>> -				  enable ? bits : 0);
>> +				  enable ? 0 : bits);
>>  }
>>  
>>  /* Test Pattern */
>>
> 

