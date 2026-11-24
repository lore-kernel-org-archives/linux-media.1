Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795532210;
	b=YoG/32CSMGR3PRRZ61fecSPnE9JZ2D7Lvu8I6o7ZxkTMOQuxWcc0/DlYAR4rlUfs+7gv
	 vr6ztRBehaMxvOekLWGBCqU+DNbR6hrEfNr1sgUcu1MsnRN3VfA6oHx25pX6pSObkb5dw
	 3WCjJe1YYZDRJfKPzIYT9s9S7JQNN22AzwLZFxCrvoTogJfDpwYLEMeErZp3mCIh2CEzV
	 JnLzYgb/BdXAn9+57D3f/C5VsKDWE0hvJ4XJ6jOcQyhCvRoEeTaZCeor1q19fCUOZIFnE
	 1CUm7fpadVWFh7m2I23UxDM6JVKzaWP895AOH55yLKNOY1NtcDQGREaPfc1O8xlaO6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795532210;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=MNeRqyRLNEInMXVEh5fr7Fiyd3zVkFC9dr39TesQaxg=;
	b=z1SnEejdeO+Ft/nkTmal8s5ZVxP2DASS+mUMy/Ti9R7innLyQdvNJcYPjxXKVODu8hOi
	 npA9yeHdS1Oh1AlbpFQA4PrbSRkUAarmqSuqjXidcMUZ9XDZA46vEpTM3beUh/ftWBWGQ
	 Itdw21877RQIirrIhLX/iCm7hYyozyO1QwmP5LaDG1vALm1yyssM3oIubsMoXqMpF8/G6
	 1MUjXh5GOIdEhfPm9fCo+BZxj6h1VyDH4NB/wWXCOx/nL4xkMya0SSFVe3i7UIc1kJz6l
	 XqNxrMQlY/u2Rx0w/iN7U8LXeC27SAZkE8j/eIKRmUMCkUzLdBpXGGh6g1A9whyQkTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=AJZpwZz7;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31CA0606A338;
	Tue, 24 Nov 2026 14:56:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31CA0606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=AJZpwZz7
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A97AB339;
	Tue, 24 Nov 2026 06:56:46 -0800 (PST)
Received: from [10.2.201.43] (e140322.arm.com [10.2.201.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D01913F86C;
	Tue, 24 Nov 2026 06:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795532209; bh=4/9nuLvHnv3HcCAvlF76Jnxm0bbYbkUtZm8PyQOh+Ks=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AJZpwZz7bbtae+8Jy7ybd1Hwbx+tx38HccI4agjaJRXdLLGjIFPZnReJaQwKgvFZb
	 iEi7LgYPnGZcA2HuxqQshQ0pNEgtVVfVDFzdKfcUJicTNOmirBsn2lB2ZFjyilriCz
	 1NePzND053BJVFO1gpYhUupLUJYsgpFeS9w63MSg=
Message-ID: <b152209e-6117-4a24-aa2d-59be913850b5@arm.com>
Date: Tue, 24 Nov 2026 14:56:46 +0000
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
Subject: Re: [RFC PATCH 04/28] media: mali-vpu: initialize decoder format
 state
To: Nicolas Dufresne <nicolas@ndufresne.ca>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Rathinavel Sankaralingam <rath.sankaralingam@arm.com>,
 Shobhit Pandey <shobhit.pandey@arm.com>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
 <20261119153758.1426673-5-charvi.mehta@arm.com>
 <d1d53edeb358e1bdcd1c262e48074f7f1be276cf.camel@ndufresne.ca>
Content-Language: en-US
From: Charvi Mehta <charvi.mehta@arm.com>
In-Reply-To: <d1d53edeb358e1bdcd1c262e48074f7f1be276cf.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/19/26 20:30, Nicolas Dufresne wrote:
>> +void mali_vpu_session_init_dec(struct mali_vpu_session *sess)
>> +{
>> +	const struct mali_vpu_format_caps *variant_fmts = &sess->vpu_dev->variant->fmt_caps;
>> +
>> +	sess->port_src.supported_fmts = variant_fmts->dec_src;
>> +	sess->port_dst.supported_fmts = variant_fmts->dec_dst;
> Why? the variant are constant, you can just read the information from the
> variant. Make a getter or point to it.
The format arrays are already static const and shared; only the list 
descriptor
(the pointer and count) is copied. However, you’re right that each port 
could
simply point to the const list in the variant, avoiding that copy too.
I’ll make that change.


> p.s. is that "port" like in OMX IL?
Here, “port” just groups the format and streaming state for a V4L2 OUTPUT
or CAPTURE queue.


>> +static int mali_vpu_set_port_fmt(struct mali_vpu_port *port,
>> +				 enum v4l2_buf_type type,
>> +				 u32 width, u32 height)
>> +{
>> +	struct v4l2_pix_format_mplane *pix_mp = &port->curr_fmt.fmt.pix_mp;
>> +	const struct mali_vpu_format_desc *fmt_default;
>> +	int ret;
>> +
>> +	if (!port->supported_fmts.fmts || !port->supported_fmts.num_fmts)
>> +		return -EINVAL;
>> +
>> +	fmt_default = &port->supported_fmts.fmts[0];
>> +
>> +	memset(&port->curr_fmt, 0, sizeof(port->curr_fmt));
>> +	port->curr_fmt.type = type;
>> +
>> +	if (fmt_default->flags & V4L2_FMT_FLAG_COMPRESSED) {
>> +		pix_mp->pixelformat = fmt_default->fourcc;
>> +		pix_mp->num_planes = 1;
>> +		pix_mp->width = width;
>> +		pix_mp->height = height;
>> +		pix_mp->plane_fmt[0].bytesperline = 0;
>> +
>> +		/*
>> +		 * Use one byte per pixel as the default compressed sizeimage,
>> +		 * with a minimum of one page, aligned to a page boundary.
>> +		 */
>> +		pix_mp->plane_fmt[0].sizeimage = PAGE_ALIGN(max_t(u32, PAGE_SIZE, width * height));
>> +	} else {
>> +		ret = v4l2_fill_pixfmt_mp(pix_mp, fmt_default->fourcc, width, height);
>> +		if (ret)
>> +			return ret;
> I might have to come back to this code once we have TRY/SET_FMT in place,
> meanwhile it seems more like a default setting helper then something that will
> be part of the ioctl interface.

Thanks, yes, this helper initializes the queue’s default format.
I’ll rename it to `mali_vpu_init_port_fmt()` to make that clear.
Patch 7 extracts the format-filling logic into `mali_vpu_fill_pixmp_fmt()`,
shared by initialization and TRY_FMT/S_FMT.


>>   struct mali_vpu_session {
>>   	struct mali_vpu_dev		*vpu_dev;
>>   	enum mali_vpu_session_role	role;
>> +	struct mali_vpu_port		port_src;
>> +	struct mali_vpu_port		port_dst;
> Ok, its time to comment, src_port and dst_port is a lot easier to read imho.
I’ve generally placed the direction last, as in dec_src/dec_dst and 
pixmp_src/pixmp_dst.
I’d prefer to retain port_src/port_dst to follow that pattern.


>> +	},
>> +	.frmsz_caps = {
>> +		.stepwise = {
>> +			.min_width = MALI_V76_MIN_FRAME_WIDTH,
>> +			.max_width = MALI_V76_MAX_FRAME_WIDTH,
>> +			.step_width = 2,
>> +			.min_height = MALI_V76_MIN_FRAME_HEIGHT,
>> +			.max_height = MALI_V76_MAX_FRAME_HEIGHT,
>> +			.step_height = 2,
>> +		},
> Are you sure this will be the same for all codecs and all formats?
These limits apply to H.264 and the three 8-bit YUV420 capture formats
currently exposed by the driver. The plan is to introduce separate ranges
when adding a codec or format that needs different limits.


>> +struct mali_vpu_format_caps {
>> +	const struct mali_vpu_format_list dec_src;
>> +	const struct mali_vpu_format_list dec_dst;
> Strange naming, perhaps src_formats/dst_formats?
Here, dec identifies the decoder role and src/dst the queue direction;
fmt_caps already provides the format context. I’d prefer to retain it.


Regards,
Charvi
