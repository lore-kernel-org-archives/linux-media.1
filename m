Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454779;
	b=jIAYfeVBpp7RB4tGT368hqFQKqJtQx0jaQbUL5LUJO+M16IWGYnrvjgGG7BIfTL9VMDe
	 aPWC+UWOCcDjs38SOCMIWYEnjBWtVluOXTzC+o48YJvylvZbLNVhv1NPBSCJPwsJKCFL6
	 GHL4rNS1DtX+Uhi2C1AwRUw7OgZvM1S8SWpmMyABuapVW8RwcH+Rw8sFgGzfnt4EpMgWi
	 ZNvsq5eoWt4R1Y1juRvTiqJ9JQb5lrrVtSF+qEuc9aBCPHfFntLrSSEssGFLwN27PkpvM
	 PCXY/Ui0ryHHk16j/H9j8zDj1h+GmJzyZyxUSEmrqS9UzESSr7ejkOJpjZxWIFYV+ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454779;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=tEZSjcMo5tFr0lKonrNZvE7Hg9BctyWphBzFRSdQf6A=;
	b=Pzc6lo0qymIzcdzU3pdxyjATurkWlHHYjiyhqSlgPw1fuD5Yr8P7yh8o0mOJrLiCyVZ6
	 yY9To87qOyYAyp+cKrtZWi7xrWRqBmoJsaXOOJ/Uv2zxqi1KWLTz2g3VgJBQMh35NWMs1
	 G7n5AVBFWNG/pNFNg2HIzzU1BB7MY6T+IsnXfxiv+iO46PsNClAEPVVLzNn18pe0/fbxo
	 KiK53aZx/wnEV+sKqeNCcYLRumAqNZzMLeYIhnWeWGnc31580lc2iigeYbyglQUB5zNKo
	 2TcLmhqvEeaiWN3UgvjyDW9nU/K/PciPCmq27lJrVFhrigS4C1YNTm1lDQYISmbnNoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=QE3Jkr6Y;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 523B2606A31A;
	Mon, 23 Nov 2026 17:26:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 523B2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=QE3Jkr6Y
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A518E143D;
	Mon, 23 Nov 2026 09:26:15 -0800 (PST)
Received: from [10.2.201.43] (e140322.arm.com [10.2.201.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A081E3F763;
	Mon, 23 Nov 2026 09:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795454778; bh=3o9SAOACMinUblxdO6CqMzislYW/cZpQbgYWlEMnX4M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QE3Jkr6Y6PwKatYN4j7gDNS1cy5qhU0Xt7GLqA3tnZCgEPoUS1KNlIyD1rgh0NxZi
	 9JkBlKtTYf0si6ANoDPflMw4n5u/coK1CnpwJC/+wDnHK0zNw40pt2gPoFu3rHnH+T
	 XR0X3NxO7N5A7Odex5umeqA8X75iRn3SQ3lbAYa0=
Message-ID: <162bf4ec-c23a-49c6-ad7d-7485a5cce2b7@arm.com>
Date: Mon, 23 Nov 2026 17:26:14 +0000
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
Subject: Re: [RFC PATCH 07/28] media: mali-vpu: implement TRY_FMT and S_FMT
 ioctls
To: Nicolas Dufresne <nicolas@ndufresne.ca>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Rathinavel Sankaralingam <rath.sankaralingam@arm.com>,
 Shobhit Pandey <shobhit.pandey@arm.com>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
 <20261119153758.1426673-8-charvi.mehta@arm.com>
 <3415e7b52c3d05214ec125b2b4f8612129c53ae0.camel@ndufresne.ca>
Content-Language: en-US
From: Charvi Mehta <charvi.mehta@arm.com>
In-Reply-To: <3415e7b52c3d05214ec125b2b4f8612129c53ae0.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/19/26 20:44, Nicolas Dufresne wrote:
>> +int mali_vpu_fill_pixmp_fmt(const struct mali_vpu_format_desc *fmt,
>> +			    u32 width, u32 height,
>> +			    struct v4l2_pix_format_mplane *pix_mp)
>> +{
>> +	u32 sizeimage;
>> +	int ret;
>> +
>> +	memset(pix_mp->reserved, 0, sizeof(pix_mp->reserved));
>> +	memset(pix_mp->plane_fmt, 0, sizeof(pix_mp->plane_fmt));
>> +	pix_mp->flags = 0;
>> +
>> +	if (fmt->flags & V4L2_FMT_FLAG_COMPRESSED) {
>> +		pix_mp->width = width;
>> +		pix_mp->height = height;
>> +		pix_mp->pixelformat = fmt->fourcc;
>> +		pix_mp->num_planes = 1;
>> +		pix_mp->plane_fmt[0].bytesperline = 0;
>> +
>> +		/*
>> +		 * Use one byte per pixel as the default compressed sizeimage,
>> +		 * with a minimum of one page, aligned to a page boundary.
>> +		 */
>> +		if (check_mul_overflow(width, height, &sizeimage))
>> +			return -EOVERFLOW;
>> +
>> +		sizeimage = max_t(u32, PAGE_SIZE, sizeimage);
>> +
>> +		if (sizeimage > U32_MAX - (PAGE_SIZE - 1))
>> +			return -EOVERFLOW;
> The "moved" code is not exactly identical, and this is not said in the commit
> message. Depending on you max_width/height, this might all be exaggerated.
The checks were intended as defensive handling in a common helper for future
variants. However, given the frame-size constraints applied before this
calculation, they are overly defensive. I’ll remove them and preserve the
original calculation.

>>   
>> -	switch (type) {
>> -	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>> -		fmt_list = sess->port_src.supported_fmts.fmts;
>> -		num_fmts = sess->port_src.supported_fmts.num_fmts;
>> -		break;
>> -	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>> -		fmt_list = sess->port_dst.supported_fmts.fmts;
>> -		num_fmts = sess->port_dst.supported_fmts.num_fmts;
>> -		break;
>> -	default:
>> -		return NULL;
>> +	vpu_fmt = mali_vpu_find_format(sess, pix_mp->pixelformat, fmt->type);
>> +	if (!vpu_fmt) {
>> +		port_fmt = mali_vpu_get_port_fmt(sess, fmt->type);
> Maybe it would be better called get_default_port_fmt() ?
This helper actually returns the current port format, and it is also used by
`G_FMT`. On a fresh session that contains the defaults, but it subsequently
contains the negotiated format. I’ll rename it to
`mali_vpu_get_current_port_fmt()` to make that clear.

>> +		if (!port_fmt)
>> +			return -EINVAL;
>> +
>> +		*pix_mp = port_fmt->fmt.pix_mp;
>> +		return 0;
>> +	}
>> +
>> +	/* Requested format found, validate other fields */
>> +	w = pix_mp->width ? pix_mp->width : fmsz->width_default;
>> +	h = pix_mp->height ? pix_mp->height : fmsz->height_default;
> No, width = 0 should return min_width, same for height, just drop, and let the
> below function do that. The default width/height are what you set on a fresh
> session.
Agreed. In v2, I’ll pass the requested width and height directly to
`v4l2_apply_frmsize_constraints()`, and let it adjust zero to the supported
minimum.

>> +
>> +	v4l2_apply_frmsize_constraints(&w, &h, &fmsz->stepwise);
>> +
>> +	/* Decode CAPTURE queue: lock geometry to input if streaming */
>> +	if (sess->role == MALI_VPU_DECODER && fmt->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
>> +		src_q = v4l2_m2m_get_src_vq(sess->m2m_ctx);
>> +		if (vb2_is_streaming(src_q)) {
>> +			port_fmt_dec = &sess->port_src.curr_fmt;
>> +			w = port_fmt_dec->fmt.pix_mp.width;
>> +			h = port_fmt_dec->fmt.pix_mp.height;
>> +		}
> This is try_fmt, it should not care if you are streaming or not.
The intention was to use the parsed CAPTURE dimensions once available, but
OUTPUT streaming does not guarantee that parsing has completed. I’ll track
whether firmware has supplied the parameters instead I'll keep the 
adjustment
logic shared with `S_FMT`, so both return the same format for the same
request and known stream parameters.

>> +	}
>> +
>> +	ret = mali_vpu_fill_pixmp_fmt(vpu_fmt, w, h, pix_mp);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (pix_mp->field == V4L2_FIELD_ANY)
>> +		pix_mp->field = V4L2_FIELD_NONE;
> Well, only if you support interlaced.
Since I’m adding interlaced decoding support in v2, I’ll normalize 
`field` to
`V4L2_FIELD_NONE` on the compressed OUTPUT queue and derive the CAPTURE 
field
layout from the stream information reported by firmware.

>> +static int mali_vpu_try_fmt(struct file *filp, void *fh, struct v4l2_format *fmt)
>> +{
>> +	struct mali_vpu_session *sess = mali_vpu_get_session(filp);
>> +	int ret;
>> +
>> +	mutex_lock(&sess->vq_lock);
> This is suspicious, the vb queue already do some locking in most of the vidioc
> call.
Both queues assign `&sess->vq_lock` to `vb2_queue::lock`, but 
`video_device::lock`
is unset. The V4L2 core acquires it for queue-management ioctls marked
INFO_FL_QUEUE, but not for G_FMT, TRY_FMT or S_FMT.

video_device::lock is unset, as this driver uses per-session locking and
format ioctls are not required to be serialized among different sessions.
The explicit locks therefore protect format access against queue operations
and asynchronous firmware updates, which use the same mutex. They do not
reacquire a lock already held by the ioctl core.


Regards,
Charvi
