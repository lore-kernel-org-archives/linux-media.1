Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795725214;
	b=XI4oZakkOlXdiqSbAT7KXPjWBbumlr6SKbdHSi6GQOs0MebUHiuOVFb/VT2xxYJknJEF
	 +/k+z6m2lGMyBvk4w3+UsUQa6hMxmYIqCs8w4B4vxlouzHXvEPPpK7OZtx8fp9fgQrxDy
	 wLkKlauG/HpgTGTIN6+ymiXveSI/ZNEez0i27d2TeazR7BRjiupGmsMVt0Y6Y9mJgVAgF
	 lJ9Ctu/hD2cFtSsb27CAF1G79gQnvgGohw259NHLBguRlURVKbwpajJmnRR6AzHWrv8mO
	 EGzFSsOQSMqeS1EqwI1nRv9DXXCBzEpCBmaNwfN/Yq4A1G/iJN6hBa5TtGfYky8NQFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=j5O7/PEs6pwDhi+NzYfdrAMfnos1pXGUy7fz0A25FII=;
	b=2DuUQBmKIuM0/0hkWfe9U8o9mQsK+apNqfBjWQ+zeZiVNmQcXwJKnpe2872GxKxoTrWF
	 3xNpdHwmxptWkky+aNWzZczU8WePB5DEESOPU19xHHw6UyqGo8gkcUutFuZ1oG9Vp/eZo
	 LBVQ+u01b8rEtOT6/anN3krLDhkL+q6AuSSuBTTPF0r+92tRwERPhhGrD19ibODxGegjV
	 hxgH0xR9LV607/R5MIznucrCw5wUHZzc5avW6xza5hV5xMFTpWgV63OQK8Y+lx21Qo/5m
	 u7xc595RloD3dsOI1RlfYO6+sZfpeNx7rfVKcdLfFqUOTwmva73M/02Po06u9PU9HWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i3Qv+LbI;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7773E606A333
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 20:33:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7773E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i3Qv+LbI
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8bddb1172a4so648737b3a.1
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 12:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795725214; x=1796330014; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j5O7/PEs6pwDhi+NzYfdrAMfnos1pXGUy7fz0A25FII=;
        b=i3Qv+LbIaxFkVwQ2sGh2BN9MbVIIwI5k8Lf9gAawDXQA0ibCqAzAbLlbk1wUbwH6GK
         hIEYTRTcJY5BXTF86xYfP8L9LCSukBQc+psjvIKRVyyLDGW91fWTFzwP11tHS5+dGTW3
         kBrzUSuzjHJuPBjKYcm4+B6wmcBv2LJ2NMPeuxSsFaPsV0lsUzqExm+i51qKybFWi7FW
         gCvKOd8/m2n4dC8L+Nqp8tlpz7XDUkfcbnhkApltekz1cp59D0/6Av3NAHWi2LjZ+A/R
         jliVfEyE8RhyJgoRFYOBztEo1sRInZB2WTwaBD3q9HiRAY4TMEExRXkcyeYseAPc4bsg
         Oxeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795725214; x=1796330014;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j5O7/PEs6pwDhi+NzYfdrAMfnos1pXGUy7fz0A25FII=;
        b=lefdbrOzqugk6dApYGXcdu8UG2A34s2rN60/25R2/4SgknLHrSBl1saufW2+U/M+AF
         aw3jl4v4k02B6+ejIHlXWBJwDhAQ8tsIpPte6lcSinWoiK6QrQhkgmTzrznBwvNmreKo
         1Xqwkwsh65LBg1TwUv7Jg3noXTrXDjxOHEBBz1BaEdFQdjLF2T9xFKzk0CCpRWkKQM0Z
         E2ILkfpPQoVeoQ+wAcKA/c6Jhg+ghXkoSi5Q8AlugKMx3kkdW32OItKFrSnlLke0VW9j
         Xg4L11zLeo/5O2jxpmsDMFroZ/f9B7P59PgVKmXunL/eB7Kr/ywg+EZmPC/RZUuNFgsb
         CVuA==
X-Forwarded-Encrypted: i=1; AL+hErF6Lsq5h3aFoDLp36xiQM5y/prL+kT2gBN7pUhmJVHd/t1BknkYbQrNyPVX6KfEp2dlCu7iyUUI6NDKGQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+FFF/cT1xu/HnXj5fhg4mGURuAGnzvGYdmSeUBb17vfWdwY+Am
	DhhBVei7UuHpOK+aO9bcLsOReoCFIHwZ2I3EFDMNM5H0dqHR9lpkeN4f
X-Gm-Gg: AZFdTZcMULfuu+NGLriEJLoKeaetXDVHJtw8Al6VMh0MOP0xJ+UwLbLB8FbLOR4U09T
	JrbReo059MLsod4wA0+upE3hibllRQ55rR491Wuf1ZOc69nYozK4jpwl442z8BiNbLDnLgysBSn
	/hSc25k4CrdKDwcBEB6O68vB4c0wqLLS93jOQCdf+uzVcZwDgiTEroTDwVk3QG1t/cO/c20OZMU
	99QpaHK1UKPofaZQwKdofw7yghuERbyPYABjOmuF5xVzLNdmbWIq+sopFYDNbH9SL/x9g1bCTor
	1iIyKiz3J0JY0JU48D7RMupmKwY9pHFKBh1uPqQ2lZF9SVnWyYCVt26yBIZGCq9ohFshAmfdBeW
	0SYbCzhnHUjAPulsf85UQKTXuBulk9W1GBn6F3YgvWzUNOJFWi/H7C3vUFohuOWDN6IVhRjY5zE
	Q/4ZQMDu84JmOJmS0q29Vl/13neyrpANUCIzJdJlPgrRJJzpMn8MjSWbMVTuJALipI2Mu1xrHRK
	ZlIDj36ww96YU8Mz+CStkRdYVJWLjW5XpxzN0jUeHUdC07G4WKoKGdFCKuYfJgzqK2eopFrbhDR
	tSGyvkZxvLWLJxKrANX0fX1O7Ia7BiQAK4H5td3Ibgd9uddwT6LFhPW4o88=
X-Received: by 2002:a05:6a00:6f6a:b0:8c2:da80:978c with SMTP id d2e1a72fcca58-8c8796aab2dmr30978453b3a.1.1795725213712;
        Thu, 26 Nov 2026 12:33:33 -0800 (PST)
Received: from FAIZEL-KB ([2001:569:52f5:4b00:85d0:b069:3959:1d31])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87392d408sm11154247b3a.44.2026.11.26.12.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:33:32 -0800 (PST)
Date: Thu, 26 Nov 2026 13:33:31 -0700
From: Faizel K B <faizel.kb@gmail.com>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, libcamera-devel@lists.libcamera.org, 
	Robert Mader <robert.mader@collabora.com>
Subject: Re: [PATCH v2 2/2] media: rockchip: rkcif: Honour the requested
 bytesperline
Message-ID: <xf3wywxva4ogx7zn4urfkdgoldaamo673v2l5qm74trf6tjofx@g3gksm7mv2yr>
References: <20261118203134.315591-1-faizel.kb@gmail.com>
 <20261118203134.315591-3-faizel.kb@gmail.com>
 <5f21a764-41f3-4515-871d-64e83bb44f89@collabora.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <5f21a764-41f3-4515-871d-64e83bb44f89@collabora.com>

Hi Michael,

Thanks for the inputs.

On Tue, Nov 24, 2026 at 12:13:20PM +0100, Michael Riesch wrote:
>> +static u32 rkcif_stream_plane_lines(const struct v4l2_format_info *info,
>> +				    unsigned int plane, u32 height)
>> +{
>> +	return plane ? DIV_ROUND_UP(height, info->vdiv) : height;
>> +}
>
>Is this the same as v4l2_format_plane_height? And if yes, would it make
>sense to reuse this one (of course it must be made public for that)?
>

Yes, apart from the block height alignment, which is 1 for all rkcif
formats. I will export and reuse it.

>> +
>> +static void rkcif_stream_set_bytesperline(struct rkcif_stream *stream,
>> +					  struct v4l2_pix_format_mplane *pix,
>> +					  u32 req_bpl)
>> +{
>> +	const struct v4l2_format_info *info = v4l2_format_info(pix->pixelformat);
>> +	u32 bpl = pix->plane_fmt[0].bytesperline;
>> +	u32 total_lines = 0, max_bpl;
>> +	unsigned int i;
>> +
>> +	for (i = 0; i < info->comp_planes; i++)
>> +		total_lines += rkcif_stream_plane_lines(info, i, pix->height);
>
>Just to be on the same page: What exactly are you doing here?
>

When bytesperline is increased, sizeimage must grow with it, or the
buffer is too small for the DMA. For formats with a single memory plane
(e.g. NV16) the Y and UV planes are in the same buffer, so sizeimage is
bytesperline * (Y lines + UV lines). total_lines is that sum, and it's
also used to limit bytesperline so that sizeimage doesn't overflow.

>> +
>> +	max_bpl = min(stream->max_bytesperline,
>> +		      ALIGN_DOWN(U32_MAX / total_lines, CIF_BYTESPERLINE_ALIGN));
>> +	if (req_bpl > bpl && req_bpl <= max_bpl)
>> +		bpl = ALIGN(req_bpl, CIF_BYTESPERLINE_ALIGN);
>> +
>> +	/* The Y and UV planes share the same line width. */
>> +	if (info->mem_planes == 1) {
>> +		pix->plane_fmt[0].bytesperline = bpl;
>> +		pix->plane_fmt[0].sizeimage = bpl * total_lines;
>> +	} else {
>> +		for (i = 0; i < info->mem_planes; i++) {
>> +			pix->plane_fmt[i].bytesperline = bpl;
>> +			pix->plane_fmt[i].sizeimage =
>> +				bpl * rkcif_stream_plane_lines(info, i,
>> +							       pix->height);
>
>v4l2_format_plane_size?

It computes the stride from the width and an alignment, so it can't
take the requested bytesperline.

>
>> +		}
>> +	}
>> +}
>> +
>>  static int rkcif_stream_fill_format(struct rkcif_stream *stream,
>>  				    struct v4l2_pix_format_mplane *pix)
>>  {
>>  	const struct rkcif_output_fmt *fmt;
>> -	u32 height, width;
>> +	u32 height, width, req_bpl = 0;
>> +	unsigned int i;
>>  	int ret;
>>
>>  	fmt = rkcif_stream_find_output_fmt(stream, true, pix->pixelformat);
>>  	height = clamp_t(u32, pix->height, CIF_MIN_HEIGHT, CIF_MAX_HEIGHT);
>>  	width = clamp_t(u32, pix->width, CIF_MIN_WIDTH, CIF_MAX_WIDTH);
>> -	ret = v4l2_fill_pixfmt_mp(pix, fmt->fourcc, width, height);
>> +	for (i = 0; i < pix->num_planes; i++)
>> +		req_bpl = max(req_bpl, pix->plane_fmt[i].bytesperline);
>> +	ret = v4l2_fill_pixfmt_mp_aligned(pix, fmt->fourcc, width, height,
>> +					  CIF_BYTESPERLINE_ALIGN);
>>  	if (ret)
>>  		return ret;
>>
>> +	rkcif_stream_set_bytesperline(stream, pix, req_bpl);
>
>Wouldn't calling v4l2_fill_pixfmt_mp_aligned(pix, fmt->fourcc, width,
>height, req_bpl) do the trick?

I looked at that, but stride_alignment is a u8 and has to be a power of
2, which the requested bytesperline usually isn't. For example, with the
IMX415 in SGBRG10 the minimum is 7728 bytes, and libcamera requests 7936
for the 256-byte alignment of Panfrost.

>
>In summary: I think this is a common problem, so there should be a
>common solution. Reuse helpers, or extend them if required.
>

Agreed. I noticed that some other drivers, e.g. rkisp1, also handle the
requested bytesperline in the driver itself. For v3 I'll add a helper to
v4l2-common that fills the format like v4l2_fill_pixfmt_mp_aligned(),
but keeps a larger bytesperline requested by userspace, up to a maximum.
It computes sizeimage with v4l2_format_plane_height(), so rkcif doesn't
need total_lines and only calls this helper. Does that sound good?

Regards,
Faizel
