Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793551397;
	b=ZQQVbcPwVCCEyCVxr9kgjh2wxSHcPLDzY4IyePEHMsrLv8jbA1zFV5Jy+/YGJ3ld+IgB
	 /35JCQiGoc7W4QO/UyEG2ShoYH1Y9ix9C/uHXwTC8QK7Q0eosy9yFhQhB0x0QrSB0ULsX
	 o2BKe/Q0hmbv5BUKdwProAaViJpx++SpcHgCflhoHnQ3L0b8mtxMuvY4mVma4tYwLtYWN
	 0vAc88L9+7GVo6n9qOUsxckb0bXQoe1inWo9S37a/QrG+smQZToYcADRQLb4kx9xtSFM/
	 4pY1DGq7uwDDzS9/vn6s6JkoXgP3Z4f6YbFjWwaL/bqO8RqM+zk3xdg/FFETi5OM9MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793551397;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=Dcmlp8c6u5CiYMg8nR1aWm88X0gTKCMdFeSCV9XL/8Q=;
	b=Qz0xRZsJFd4laTRJA0gyu1GzzLthO9mnK/rBOgt4MK5IQNAlaXIgFoAzqVV+vP8x3Gs9
	 qEFOsZVqztOYTjT8Rg5ooM5+80ll9KtcRTCrvrqR25c2hdYs4hEsRgBg8Knp7HAPfouHh
	 uGcQRGPAucsntRWPSqk89ZBA3n3M9ZVGhL4NYOLyCiNMgRag0Bww0IxDmFI3QcgkvG6nS
	 qjui4nJkQkFv/3Wn02ZZTnX2Ibicyja9dV8W79ea8bPVaJaWfrpRqxzYqsZtMLtPrcpzL
	 RcRPDImkA1Bk/WcHkJdpGdqiEjlIDvmLM4OuBThwOd3s8DwuvW/hhIV5U4L4Ql/tZVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=jwlMSrM3;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33F7606A324
	for <linux-media@vger.kernel.org>; Sun,  1 Nov 2026 16:43:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C33F7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=jwlMSrM3
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 413C5BB;
	Sun,  1 Nov 2026 17:40:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793551257;
	bh=qEjA4rZH8hsV/GYTWSGhnnbxPD+UULWQnLeGmOaxhf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jwlMSrM30ik9+RQWf8GpLo5mkxFygjOVRd2Pwqpvb4fTlzGYUfWzRQUAOa0NQBjTW
	 8+1jv+5vFCEuLITjQEJPZfbVfNwuZTwqT/iepT/BvZO0w5/vXtdenzZHW5lkYRgt5H
	 LKF3IobP3MMY/WrEskwUtpWoah9HiL78/v/E9Lug=
Date: Sun, 1 Nov 2026 18:43:11 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Alain Cousinie <alain.cousinie@laposte.net>,
	Milan Zamazal <mzamazal@redhat.com>,
	libcamera-devel@lists.libcamera.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	=?utf-8?B?8J+Qpy1tZWRpYQ==?= <linux-media@vger.kernel.org>
Subject: Re: libcamera: pipeline: simple: Disable packed mono for VGA sensors
 on Intel IPU6/IPU7
Message-ID: <20261101164311.GA3368923@killaraus.ideasonboard.com>
References: <c218b8a2-9e69-4ef3-b36c-7df7e7637d4d@laposte.net>
 <3a98bb5e-a4c4-40b7-ad4d-1b251c03b4ff@oss.qualcomm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3a98bb5e-a4c4-40b7-ad4d-1b251c03b4ff@oss.qualcomm.com>

CC'ing Sakari and the linux-media list.

On Sun, Nov 01, 2026 at 05:31:14PM +0100, Hans de Goede wrote:
> Hi,
> 
> Note please use johannes.goede@oss.qualcomm.com note the "oss." in there,
> this is also the email which I use as author / S-o-b for all my patches.
> 
> On 1-Nov-26 17:23, Alain Cousinie wrote:
> > Hi Hans,
> > 
> > Forcing packed monochrome (`CSI2P`) on VGA sensors (640x480)
> > triggers a systematic `stream stop time out` on Intel IPU6/IPU7.
> > 
> > The hardware reason:
> > * IPU6 DMA burst requires strides to be a multiple of 64 bytes in
> >   pass-through mode (`PIN_TYPE_MIPI`).
> > * 640 pixels × 10-bit packed = 800 bytes per line.
> > * 800 % 64 = 32. The MIPI End-of-Packet (EOP) arrives mid-burst.
> > * The kernel driver requests a stride of 832 bytes. The firmware
> >   detects the conflict, starves the DMA controller, and hangs at
> >   stream stop.
> > 
> > Unpacked mode (`MEDIA_BUS_FMT_Y10_1X10`) works flawlessly because
> > the IPU6 unpacks to 16-bit before DMA, resulting in a perfectly
> > aligned stride of 1280 bytes (1280 % 64 = 0).
> > 
> > GPU benchmarks on Intel Arc (MTL) show that packed vs unpacked math
> > is entirely Memory Bandwidth Bound. Arithmetic LSB decoding is
> > executed for free during memory fetch wait cycles. There is no
> > performance benefit to forcing packed mono if it breaks the IPU6/7
> > firmware.

The whole point of using a packed format is to lower the memory
bandwidth usage.

> > Can we update the Simple pipeline to exclude CSI2P for monochrome
> > formats when an Intel IPU6/IPU7 input bridge is detected?
> 
> This sounds like a kernel issue if packed mode cannot work, then the
> kernel should not list the packed fmt when the sensor is producing
> MEDIA_BUS_FMT_Y10_1X10.

It's not just mono formats, it applies equally to bayer formats. Won't
that break the patch that fixes crashes in the CPU soft ISP on IPU6 and
IPU7 ?

> Offering the option to do packed and then expecting userspace to know
> the hardware does not support this is not how this is supposed to
> work.
> 
> So please modify the ipu6 kernel driver to not report the packed
> framebuffer fmt for the MEDIA_BUS_FMT_Y10_1X10 bus fmt.

Better, fix the driver to handle the stride correctly and not stall.

-- 
Regards,

Laurent Pinchart
