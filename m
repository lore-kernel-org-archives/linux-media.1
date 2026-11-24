Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795537661;
	b=HJYN387PDSlAMhtGoeHzXjk1CmCwPAXf2E8cwsp5nxFraU0tH8/FawJ/Twk/VupkZb0T
	 dncI8eo5qM3AsSyqgLUItvrFgGQjbVC9dG0rL+y9nz72zNjS+jIfcw7O4w7gz++DDY5cY
	 Pgk/lNtyXce7HcmosuGUYJA15vvSPtfli6El4uLdfl496kNIy9lVWAakiUReLKz7A3WmV
	 jOaGqxGqHzo1bDlR8frfaN4NSfOiekOjiWdP8NqtT2v3qzB4ovonSG1tL5LKjajdkMJPc
	 7EInsTDqh3BAbj9ILEL22m/LiYFsJxYtUGv1zcFvnax5PqSfyLGDwD2zS2h/16CWXiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537661;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=/4b+hKquXnrPxas17sH/CIlTC3nyBbdzPmcmTJtv4jk=;
	b=ErBl2HyP+4nFsAvNHYIQk5EbnPeSaAF+dpG+KMg8F/DQ2YAI2KuX0S83EA7DqMUw/9e6
	 Z4w1TAcZcXYhzFNk4xC08dZGgMlu0Y0g1vOo9G2sSJxUu+jD4Yt4VLq47UtWMEe3SRvcj
	 35CmdES5vziIgpyTmRqy9QcvGRgLfvYhq7w/O5siofV4Q7Sus5UPddXn6Lo/UfIEJxjXb
	 F1uNynGGNtNkxrIo+7tGJybe7vFukkPfee3JLYIfo5o/qD8TDrJewFCjGN1DlZqj4OtHR
	 jUZV79IxOkhAOMSer5ad/l1a5OMsaazYoYhRe+LIx6E++WUvZbnNI2TXuTRHxOk9vTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=r1eEUBLV;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5621606A33C;
	Tue, 24 Nov 2026 16:27:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5621606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=r1eEUBLV
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 959A9339;
	Tue, 24 Nov 2026 08:27:36 -0800 (PST)
Received: from [10.2.201.43] (e140322.arm.com [10.2.201.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B7B003F86C;
	Tue, 24 Nov 2026 08:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795537659; bh=821rJ0g9HtpMoMuetVK6Nxwg+cBpAnfGyZshLAd+HLM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=r1eEUBLVzAo6010E4T6rWWsxESRfD92OZBhJIp5NCx2BdeNsW2kmJibj4aqGo2iTM
	 fsTQiEQJHxUyYo52JNvhaBnNMmgw4NiYJJ/n+ncK2uKuYE60Tre1P7wjL9eHR4zIun
	 msKtL5KKkIJxVH9DP7XBJidE/wsduMfxNcMgKcBQ=
Message-ID: <39619b6c-7330-459b-aed3-9e8bf303f7dc@arm.com>
Date: Tue, 24 Nov 2026 16:27:36 +0000
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 08/28] media: mali-vpu: register V76 decoder controls
 and introduce UAPI controls
To: Nicolas Dufresne <nicolas@ndufresne.ca>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Rathinavel Sankaralingam <rath.sankaralingam@arm.com>,
 Shobhit Pandey <shobhit.pandey@arm.com>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
 <20261119153758.1426673-9-charvi.mehta@arm.com>
 <0cb2cae4075d3854ebb9c051d169ca121a8a360d.camel@ndufresne.ca>
Content-Language: en-US
From: Charvi Mehta <charvi.mehta@arm.com>
In-Reply-To: <0cb2cae4075d3854ebb9c051d169ca121a8a360d.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/19/26 21:06, Nicolas Dufresne wrote:
>> Add Mali VPU userspace controls for NALU layout, stream escaping,
>> intermediate buffer size, stream-header handling, frame reordering and
>> firmware debug output. Also expose the standard read-only
>> V4L2_CID_MIN_BUFFERS_FOR_CAPTURE control.
> I would strongly recommend to keep each vendor control in its own patch. These
> are API, and they need documentation. In practice, you'll prefer to not
> introduce vendor control as a first introduction of your driver, its just a bad
> idea. You completely missed Documentation/
I had planned to add the documentation for these subsequently, but, I agree,
it should accompany the controls. The initial driver series may not be 
the right
place for these vendor controls, so I’ll remove them and their UAPI 
definitions
from this patchset.


>> +		.cid = V4L2_CID_MALI_VPU_NALU_FORMAT,
>> +		.type = V4L2_CTRL_TYPE_MENU,
>> +		.name = "NALU format",
>> +		.qmenu = mali_v76_nalu_format_qmenu,
>> +		.min_val = MALI_VPU_NALU_FORMAT_START_CODES,
>> +		.max_val = MALI_VPU_NALU_FORMAT_FOUR_BYTE_LENGTH_FIELD,
>> +		.default_val = MALI_VPU_NALU_FORMAT_START_CODES,
>> +		.step_or_mask = BIT(MALI_VPU_NALU_FORMAT_START_CODES) |
>> +				BIT(MALI_VPU_NALU_FORMAT_ONE_NALU_PER_BUFFER) |
>> +				BIT(MALI_VPU_NALU_FORMAT_ONE_BYTE_LENGTH_FIELD) |
>> +				BIT(MALI_VPU_NALU_FORMAT_TWO_BYTE_LENGTH_FIELD) |
>> +				BIT(MALI_VPU_NALU_FORMAT_FOUR_BYTE_LENGTH_FIELD),
> This mixes alignment and NAL format. Its historical, but the format is bound to
> V4L2_PIX_FMT_H264 and is documented as Annex B. If you want to add something
> such as AVCc formata instead, you'd need a new pixel format. There is
> V4L2_PIX_FMT_H264_SC, but its hill define, nobody knows what it was originally
> suppose to do. Venus (Qualcomm) maps it as if it was the same, perhaps they have
> a clue, but I would stay away.
>
> For the alignment, V4L2_CID_MPEG_VIDEO_HEADER_MODE does not cover your 1 buffer
> per nalue case, it only does the split header like OMX IL was doing (sometimes,
> interoperanility killed OMX).
The firmware defaults to Annex B, which matches V4L2_PIX_FMT_H264, so
this control is not needed for that input format. I'll drop this completely.


>> +		.cid = V4L2_CID_MALI_VPU_INTBUF_SIZE,
>> +		.type = V4L2_CTRL_TYPE_INTEGER,
>> +		.name = "Internal buffer size",
> No general equivalent, and to be fair, that seems like something the driver
> should get correctly by itself, I'd say drop.
The firmware already calculates the intermediate working-buffer size when
no override is supplied. I’ll remove this control completely.


>> +	},
>> +	{
>> +		.cid = V4L2_CID_MALI_VPU_STREAM_ESCAPING,
> No doc, I suppose it was about emulation bytes. Nobody needs that drop.
Yes, this controls emulation-prevention byte handling.
Agreed that this can be dropped.


>> +	{
>> +		.cid = V4L2_CID_MALI_VPU_HOST_PRINT_ENABLE,
> Debugging goes into sysfs or debugfs, drop.
Ack. I’ll use an appropriate interface as suggested when I reintroduce this.


>> +	},
>> +	{
>> +		.cid = V4L2_CID_MALI_VPU_IGNORE_STREAM_HEADERS,
> If userspace want that, it can just strip the headers itself. Its not like a
> stateful decoder can work without headers according to the spec. It will always
> break one way or another.
This does not skip the initial headers; it retains existing SPS/PPS 
entries rather
than accepting replacements with the same ID. It was intended to prevent 
a heavily
corrupted stream from replacing valid settings, but it would also ignore 
legitimate
changes. Agreed to drop it.


>> +	},
>> +	{
>> +		.cid = V4L2_CID_MALI_VPU_FRAME_REORDERING,
> You can thank Samsung, instead you need
> V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE and add support for
> V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY 0. That will effectively disable
> reordering. Some vendors calls this the thumbnail mode to add to the fun.
Agreed, I’ll drop the vendor control. I’ll use the suggested standard 
controls with a
delay of zero, when I reintroduce this in subsequent patches.


>> +/*
>> + * The base for Arm Mali-VPU driver controls.
>> + * We reserve 64 controls for this driver.
>> + */
>> +#define V4L2_CID_USER_MALI_VPU_BASE		(V4L2_CID_USER_BASE + 0x1260)
>> +
>>   /* MPEG-class control IDs */
>>   /* The MPEG controls are applicable to all codec controls
>>    * and the 'MPEG' part of the define is historical */
> My recommendation, drop all the vendor controls, legacy users can use your
> downstream kernels.
I’ll drop the vendor controls from this series.

Regards,
Charvi
