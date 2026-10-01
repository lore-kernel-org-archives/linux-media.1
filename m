Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23D2346E63
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 22:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790895046; cv=none; b=pl+61Tp1MqSCUCtptKIUnYjoB8ucKHL8+/fL/VuFJsNCARm10ETJ85/EDAoezdKfVSn55HJ0kv/MfMSATeKIjQGUiDfVDndu6MXIfpJbemXmLQNFV0UubVZaQ3+NcWZJgJzGvulG5om7o3+AydntFY5zXiHZG9fFNzuYYv4B4Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790895046; c=relaxed/simple;
	bh=hbaWfqTT50rz/0Ibb9FN7fOZGgV8qI7vnWW/cMLRjW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bNP3p2HmRCrKbxUPphKBWAtiQR3RihLK4v8DcenWko/iVTCOlkljmoOJz3J18trOQm2kXPkPx3wFbxrzV8HzFW29Mgt0tPue9j7EoXoyiI4D7mhLVBtu9dsPbBVYB/dSNIc9ejSjMpUF4v9TPrjIzPeh24fjHyZhnrVUi7kgX9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=a06o7VOQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="a06o7VOQ"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 009E96A6;
	Fri,  2 Oct 2026 00:48:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790894927;
	bh=hbaWfqTT50rz/0Ibb9FN7fOZGgV8qI7vnWW/cMLRjW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a06o7VOQ/FMeaKGKiSjvwGfcThhG66bQ37QKDi4AhXZaK9EOLKgU+UavKTFc7Bq45
	 hhnb1vXT60FhqY6EdSXuxEBw22asioy9ygmm6oAZ/HKUHuU0IrebS24NNTMjbgIpbp
	 UtkaUCLgYlF01sIUVXQvo3ZYNBief+LX7Hgv+kQw=
Date: Fri, 2 Oct 2026 01:50:38 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Yunke Cao <yunkec@google.com>, Ricardo Ribalda <ribalda@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Add quirk for invalid dev_sof in
 Logitech C925e
Message-ID: <20261001225038.GA4649@killaraus.ideasonboard.com>
References: <20260803065811.3490286-1-yunkec@google.com>
 <e939bb77-94d4-428e-b1a2-fc7d2d052a83@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e939bb77-94d4-428e-b1a2-fc7d2d052a83@kernel.org>

On Tue, Sep 29, 2026 at 04:27:17PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 3-Aug-26 08:58, Yunke Cao wrote:
> > Logitech C925e SOF does not increases at a stable rate of 1kHz.
> > Add a quirk for this camera to make hwtimestamp usable.
> > 
> > Before applying the quirk:
> > ```
> > seq:     31 ts: 1075.543294 delta: 29.423 ms fps: 34.94
> > seq:     32 ts: 1075.573022 delta: 29.728 ms fps: 34.90
> > seq:     33 ts: 1075.602353 delta: 29.331 ms fps: 34.87
> > seq:     34 ts: 1075.632031 delta: 29.678 ms fps: 34.84
> > seq:     35 ts: 1076.177759 delta: 545.728 ms fps: 23.00
> > seq:     36 ts: 1076.213255 delta: 35.496 ms fps: 23.12
> > seq:     37 ts: 1076.209371 delta: -3.884 ms fps: 23.82
> > seq:     38 ts: 1076.232233 delta: 22.862 ms fps: 24.11
> > seq:     39 ts: 1076.264682 delta: 32.449 ms fps: 24.24
> > seq:     40 ts: 1076.287318 delta: 22.636 ms fps: 24.52
> > seq:     41 ts: 1076.285949 delta: -1.369 ms fps: 25.16
> > seq:     42 ts: 1076.317714 delta: 31.765 ms fps: 25.28
> > seq:     43 ts: 1076.317085 delta: -0.629 ms fps: 25.89
> > seq:     44 ts: 1076.339919 delta: 22.834 ms fps: 26.13
> > seq:     45 ts: 1076.212836 delta: -127.083 ms fps: 28.91
> > seq:     46 ts: 1076.242494 delta: 29.658 ms fps: 29.00
> > seq:     47 ts: 1076.271852 delta: 29.358 ms fps: 29.09
> > seq:     48 ts: 1076.301739 delta: 29.887 ms fps: 29.17
> > seq:     49 ts: 1076.330887 delta: 29.148 ms fps: 29.26
> > seq:     50 ts: 1076.360639 delta: 29.752 ms fps: 29.33
> > seq:     51 ts: 1076.390095 delta: 29.456 ms fps: 29.41
> > ```
> > 
> > After applying the quirk:
> > ```
> > seq:     31 ts: 203.782342 delta: 33.460 ms fps: 30.94
> > seq:     32 ts: 203.815492 delta: 33.150 ms fps: 30.91
> > seq:     33 ts: 203.849017 delta: 33.525 ms fps: 30.88
> > seq:     34 ts: 203.882190 delta: 33.173 ms fps: 30.86
> > seq:     35 ts: 203.915672 delta: 33.482 ms fps: 30.83
> > seq:     36 ts: 203.948902 delta: 33.230 ms fps: 30.81
> > seq:     37 ts: 203.982335 delta: 33.433 ms fps: 30.78
> > seq:     38 ts: 204.015475 delta: 33.140 ms fps: 30.76
> > seq:     39 ts: 204.048992 delta: 33.517 ms fps: 30.74
> > seq:     40 ts: 204.082208 delta: 33.216 ms fps: 30.72
> > seq:     41 ts: 204.115675 delta: 33.467 ms fps: 30.70
> > seq:     42 ts: 204.148995 delta: 33.320 ms fps: 30.69
> > seq:     43 ts: 204.182354 delta: 33.359 ms fps: 30.67
> > seq:     44 ts: 204.215605 delta: 33.251 ms fps: 30.66
> > seq:     45 ts: 204.249004 delta: 33.399 ms fps: 30.64
> > seq:     46 ts: 204.282259 delta: 33.255 ms fps: 30.63
> > seq:     47 ts: 204.315686 delta: 33.427 ms fps: 30.61
> > seq:     48 ts: 204.348945 delta: 33.259 ms fps: 30.60
> > seq:     49 ts: 204.382337 delta: 33.392 ms fps: 30.59
> > seq:     50 ts: 204.415570 delta: 33.233 ms fps: 30.58
> > seq:     51 ts: 204.449069 delta: 33.499 ms fps: 30.56
> > seq:     52 ts: 204.482218 delta: 33.149 ms fps: 30.55
> > seq:     53 ts: 204.515706 delta: 33.488 ms fps: 30.54
> > seq:     54 ts: 204.548940 delta: 33.234 ms fps: 30.53
> > seq:     55 ts: 204.582403 delta: 33.463 ms fps: 30.52
> > seq:     56 ts: 204.615563 delta: 33.160 ms fps: 30.51
> > seq:     57 ts: 204.649057 delta: 33.494 ms fps: 30.50
> > seq:     58 ts: 204.682301 delta: 33.244 ms fps: 30.49
> > seq:     59 ts: 204.715735 delta: 33.434 ms fps: 30.48
> > seq:     60 ts: 204.748890 delta: 33.155 ms fps: 30.48
> > ```
> 
> Thank you for your patch.
> 
> I have merged this into:
> 
> https://gitlab.freedesktop.org/linux-media/users/uvc/-/commits/for-next/
> 
> > lsusb -v
> > 
> > Bus 003 Device 005: ID 046d:085b
> > Device Descriptor:
> >   bLength                18
> >   bDescriptorType          1
> >   bcdUSB               2.00
> >   bDeviceClass            239
> >   bDeviceSubClass         2
> >   bDeviceProtocol         1
> >   bMaxPacketSize0        64
> >   idVendor           0x046d
> >   idProduct          0x085b
> >   bcdDevice            0.16
> >   iManufacturer           0
> >   iProduct                2 Logitech Webcam C925e
> >   iSerial                 1 2F2036AF
> >   bNumConfigurations      1
> > 
> > Signed-off-by: Yunke Cao <yunkec@google.com>
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index e289cc71ba98..5b9ea19ad9f2 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -2706,6 +2706,15 @@ static const struct usb_device_id uvc_ids[] = {
> >  	  .bInterfaceSubClass	= 1,
> >  	  .bInterfaceProtocol	= 0,
> >  	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_INVALID_DEVICE_SOF) },
> > +	/* Logitech HD Pro Webcam C925e */
> > +	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> > +				| USB_DEVICE_ID_MATCH_INT_INFO,
> > +	  .idVendor		= 0x046d,
> > +	  .idProduct		= 0x085b,
> > +	  .bInterfaceClass	= USB_CLASS_VIDEO,
> > +	  .bInterfaceSubClass	= 1,
> > +	  .bInterfaceProtocol	= 0,
> > +	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_INVALID_DEVICE_SOF) },

The entry isn't correctly sorted by VID:PID. I'll fix it and rebase the
for-next branch.

> >  	/* Logitech Rally Bar Huddle */
> >  	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> >  				| USB_DEVICE_ID_MATCH_INT_INFO,

-- 
Regards,

Laurent Pinchart
