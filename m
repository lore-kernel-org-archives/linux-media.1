Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795635957;
	b=vyU/piueGRB4rxMKj1Kk7Kzgy2CLpgnOAmdsbzhRbrrZ8wk/8QxKyB/f56hHDZyPuy0l
	 tVwGFpV7OthNHT8gnvG1r89wVkDJ3KUEEA9WUIjNRkXuIdRsSID2cNKRzqfjZI1eqG7yN
	 Jq5ZCFttcIfZkwbzB0qflkjP5inczOWpdxLCi94AW74BDSfaj620sxrfD/huWLIhbZts3
	 /lSQgMkaFRn4XYsHl26SXVRZ55ns49zPAhSCy+PNkpI2kpj23pnpu8NgAj7pRj3nTMvN6
	 fQlB1bX0WuWHCjMTp0R+7YASntyHu+y+Cx72o11EKQOWBINixMITw4xUmtHnw/L1S/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795635957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=gN36yXC9t1L82OyL4V7Kkk1VfbmOXABwZZN8OF/RkD0=;
	b=Lsn1+4jqSuReErWedovmoLozxFNP6LM+v7Os0xPnUCsJfYtHgCJ6uEx7xuinOb97Xp3j
	 eK9zEX61tTS6oUAuF4AvfnxkCn8R/wrSd25nINKw/7y2OvUlsYAk9MjuS1/s5T3Xy009I
	 kEJw9Qx9DYwXAb/J2/ukT89yD6pUvUA4DrSFJzn+cPjGf56djJ9HF6kWOBT92RsEZNl1c
	 r+a3L4w9hI9mRXXhYJtc+HNBuyg34qdj4rjN40FrXKzN7dtZ3Fz4yuHzQo0+nVsUBOEQ0
	 UEAqAHJDzDlLIioP08eTlZPKhhli5PhhE2GcYujcQeS+nooS//e6j75egXSt7IbOiIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l37Jeii8;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414E2606A31E
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 19:45:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 414E2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l37Jeii8
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-862b090e3c3so3262022a34.2
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 11:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795635956; x=1796240756; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gN36yXC9t1L82OyL4V7Kkk1VfbmOXABwZZN8OF/RkD0=;
        b=l37Jeii8hr3JIOIE/y9Ejae7NqogQx5AXBsiGyZWb3o/m89XpsDxi9S5z+W/Of8rrH
         DcrLA8rtIp0mFzLXqovTkuuGvzmqBu2tKpiQI6JF/qcbeH7xHzdkljPa7Qzhmh8NJp9U
         FlOl5J6qkOeiurcSNaXMbCJntdXe/paVG59MNEd+sE5nQvb70ySF6bn0UBHpDcrC4jrO
         5T7g2JqUTx2Nx9i06oqxlkcad+5HoUWXMEgcLj1i0UlmMoODs17G29TwCEt8CPY856Md
         DWlyYDpes5Tn4+Stcorld2Tgllc8h+SQZ3olnptFT45YdiQe1BcJXlKcVdJS82D6kV6R
         fxKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795635956; x=1796240756;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gN36yXC9t1L82OyL4V7Kkk1VfbmOXABwZZN8OF/RkD0=;
        b=wvuGP20B1teK2FrpUi9GvoC3tuVeXrH3gpDakfGn+ORHpqO/iCZmBfSe6tW8M7CWKt
         oe/iwImc2Scb7AcmEDnPMwyg5uRekB34gRYVbGO+hUqOnU6l2qVzgXxmfYcczcButMC8
         VxUDxeBYqQ2PeLw6NXrwfsFpUBGPMBFzPtiysGWYXEDzWvxHGhRuP2V8YMONo6TkWEB5
         1l5SOnlI5dQJJ36Zjz2Yk0o5ku3noOcm6EBWX18Fmd6UvjV495Shw2lYqpqC9BO73bQq
         zYVoiDVLc+shyxEW0BFrzXFHKJDKeoQGg59Gab1xNCQEQ7yzg4eB/i/5JiDfYDZXiap/
         vEiw==
X-Forwarded-Encrypted: i=1; AL+hErHG9rjv/GjMs7TL8sD3WlxeVvsoJefmCOwberaTczWe6wkj4mLN3OxXwtaKT4NlTKvAipRu5D5bmxT8Mw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9kzNp2LWeiNZ6QBSHnMRVuAO2kEaEYieS/zIh+K5sYgh4GdLOP
	NZK2zL2w3sWU0ju42cbTS5G5oPvfJn0RzzrWyx0kaFBieggRkCNR3Sc=
X-Gm-Gg: AZFdTZc5/HLUOzAm6d0ESKp4ykro/xQXgyda55trbkyIQ9qj/aWDIRTf1o3z0qvAEU4
	NDUq2ua4klI4PnMSnFtvHx0Rf3PHRT/Mbx1hZBfAO6V/7BZ5k2cUQyscJWu9SM+KLpL4wfJZnGg
	oNxprSVW3oHyj32WGuvp4yifQjddQDsjnIbplgbWcoBXcspSC+s/J/sKcz+Z3LWxY7RXFGgRy3W
	UTAkT//koHSfVTU9iDqMU17KK8lfrvGyj3cEaypBPg79LXHrA/+9nNQOFX5nfctO2UyeQOwyHzN
	UBbjeUnXW0l/bCucCUu0wbTv6qXizFiB9W0d8sGjkCz0rcgKIcyIIy67IE/P/jPqmXunl5egQ/U
	cGSYosKww4nMbVqE1vDEk/VFlrusQ739tr2kQH1+eNCzdPM+Xfv9Gk/35JYB6uwtcMEObuT019e
	6puIGHP2ryUGlBvcn/TeXwf12a8lN9vWkMVUpxto9nKExlweOzQdz6bjM9G0l7lkAv2J9/x9Oy+
	Gxa3DhSNAvQwcqa/1eA/noJ8P8HffowxQES5A0Qe8gXQsHL8J4KgJvRsqo2fqcrQBem1yeHui0m
	8guN5RCegBtzCInHcxtJoURnOsHXk8tbQeG3+MAEQ8UVFg6MsRk=
X-Received: by 2002:a05:6830:4c07:b0:805:9b38:6f7c with SMTP id 46e09a7af769-86315b0b8d8mr23407775a34.29.1795635956067;
        Wed, 25 Nov 2026 11:45:56 -0800 (PST)
Received: from miso ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86316910337sm13226969a34.23.2026.11.25.11.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:45:55 -0800 (PST)
Date: Wed, 25 Nov 2026 13:45:53 -0600
From: Matthew Laux <matthew.laux@gmail.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v7 12/12] media: add driver for StarTech USB3HDCAP
Message-ID: <awc68fa7jb5n1mRv@miso>
References: <20261121035523.26764-1-matthew.laux@gmail.com>
 <20261121035523.26764-13-matthew.laux@gmail.com>
 <99aad66b-675d-4a2d-8558-167c11ea725a@kernel.org>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <99aad66b-675d-4a2d-8558-167c11ea725a@kernel.org>

On Wed, Nov 25, 2026 at 02:39:45PM +0100, Hans Verkuil wrote:
> <snip>
> > +	if (vb2_is_streaming(&hdcap->vb2q))
> > +		return -EBUSY;
> 
> Why is this needed? Does querying the timings while streaming actually interfere
> with the streaming?
> 
> This is expected to work, but if it can't be made to work, then it the reason should be
> documented here.

Removed in v8. Tested and it doesn't interfere with streaming, and the
buffer size can't change, so it's safe.

> <snip> 
> > +	case V4L2_CID_DV_RX_POWER_PRESENT:
> > +		ctrl->val = 1;
> 
> Huh? It is a volatile control, but the value is fixed?
> 
> This makes no sense.

Removed in v8, I had this as a stub to stop v4l2-compliance from
warning, but the chip doesn't actually tell us whether RX power is
present, so I just removed it entirely.

> <snip>
> > +	case V4L2_EVENT_SOURCE_CHANGE:
> > +		return v4l2_src_change_event_subscribe(fh, sub);
> 
> The V4L2_EVENT_SOURCE_CHANGE is never raised. It is supposed to be sent
> if a signal goes away or if the format changes, but I see none of that in
> this driver. That can't be right.

Removed in v8, since nothing generates the event yet. This
v4l2-compliance test now fails:

fail: v4l2-test-controls.cpp(1175): doioctl(node, VIDIOC_SUBSCRIBE_EVENT,
    &sub)
test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL

I do want to support this feature eventually. The Windows driver has a
complicated signal monitoring background thread that I still need to
reverse engineer.

> <snip>
> > +	.vidioc_streamoff = vb2_ioctl_streamoff,
> 
> Add .vidioc_expbuf.

Added in v8

> <snip>
> > +	/* For applications that never call S_INPUT... */
> > +	if (!hdcap->hw_inited && !vb2_is_busy(&hdcap->vb2q))
> > +		usb3hdcap_init_input(hdcap);
> 
> This doesn't look right. I think this is something you want to do only
> on first open, and then you can use v4l2_fh_is_singular().

Agreed and fixed in v8

> <snip>
> > +	hdcap->vb2q.io_modes = VB2_MMAP | VB2_USERPTR | VB2_READ;
> 
> Add VB2_DMABUF. I would suggest dropping VB2_USERPTR: we don't really like
> that streaming mode.

Added DMABUF support and dropped USERPTR in v8.

> <snip>
> > +		hdcap->ctrl_rx_power->flags |= V4L2_CTRL_FLAG_VOLATILE |
> > +						V4L2_CTRL_FLAG_READ_ONLY;
> 
> It makes no sense for this to be a volatile control. I suspect there is some
> confusion about thi.

This control is now gone entirely.

Thanks,

Matthew
