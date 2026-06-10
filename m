Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A5C372EF7
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 11:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781091242; cv=none; b=eKtYZ0FGI3mydRwHDNms2h7GdSGk3UZj2COBX0jiaw4upeWL1KFs2CL7h4PeZisXMwO37TA/09VQp0L0Bgb7Z2mOKkZflUKh7tnRPYLhFZT4o8NSsEnyf+8Z0LGK/VvekO5zuUuZ3TkuiD3icWyIfNx+OJULAP8u1eTyXkSADiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781091242; c=relaxed/simple;
	bh=dfy86uAOneKlfMVIYqOycKDSGTzyR7+4aNv5N8b4nzo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sk1/yOEwfjpeN0pWQbjIAowvoUQRFadYLCWN+pi/uwGOiYUrg5ezZJFxjL9tQxWNZNWAqcV7+fQqCYqqXo80O47nOF1pla+6bKfK4hg1StYBr+PUNdFWSr04wnb9KjfcvYLD/uJn6ch66jgPkr6QtMmtLCvRrqDtiecu0BBfChI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mB1MnMfo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mB1MnMfo"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 820A79A0;
	Wed, 10 Jun 2026 13:33:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781091209;
	bh=dfy86uAOneKlfMVIYqOycKDSGTzyR7+4aNv5N8b4nzo=;
	h=Date:From:To:Cc:Subject:From;
	b=mB1MnMfo0/MUwkrQXwvCs9ib1FZo0kmf7BjpoNtBcq+/Pubs+Aj3FTHM/LfaaY27v
	 wws70ELYq6Lw85sAu3bKPTBn0qjPixgLV+gJLe42/lm/4zd8K/VKitqoBpASnJfhQy
	 WLCqyaQeTJorpCZq0awanZOaXBzLLiMVTq7Wjf5k=
Date: Wed, 10 Jun 2026 14:33:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hans@jjverkuil.nl>
Cc: linux-media@vger.kernel.org
Subject: v4l2-compliance does not pick media device with -z and -u options
Message-ID: <20260610113356.GB1209951@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Hans,

I've noticed yesterday that v4l2-compliance does not pick a media device
when run on a subdev with the -z and -u options.

The options are documented as

  -u, --subdev-device <dev>
                     Use device <dev> as the v4l-subdev device.
                     If <dev> starts with a digit, then /dev/v4l-subdev<dev> is used.
                     [...]
                     Otherwise if -z was specified earlier, then <dev> is the entity name
                     or interface ID (if prefixed with 0x) as found in the topology of the
                     media device with the bus info string as specified by the -z option.

  -z, --media-bus-info <bus-info>
                     Find the media device with the given bus info string. If set, then
                     the options above can use the entity name or interface ID to refer
                     to the device nodes.


I reproduced the issue on an i.MX8MP and a Raspberry Pi 5. On i.MX8MP, I
ran

$ v4l2-compliance -z "platform:rkisp1" -u "imx219 1-0010"

where "imx219 1-0010" is the sensor entity in the ISP media graph. This
resulted in the following output:

--------
v4l2-compliance 1.33.0-5474, 64 bits, 64-bit time_t
v4l2-compliance SHA: 73e05fa3c79b 2026-06-02 06:15:45

Compliance test for device /dev/v4l-subdev3:

Driver Info:
        Driver version   : 7.1.0
        Capabilities     : 0x00000000
        Client Capabilities: 0x0000000000000003
streams interval-uses-which media_fd 4294967295 ent_id 0x00000000

Required ioctls:
        test VIDIOC_SUDBEV_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/v4l-subdev3 open: OK
        test VIDIOC_SUBDEV_QUERYCAP: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 20 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK (Not Supported)
        test VIDIOC_TRY_FMT: OK (Not Supported)
        test VIDIOC_S_FMT: OK (Not Supported)
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK (Not Supported)
        test Requests: OK (Not Supported)
        test blocking wait: OK (Not Supported)

Total for device /dev/v4l-subdev3: 46, Succeeded: 46, Failed: 0, Warnings: 0
--------

v4l2-compliance skipped pad-based ioctl tests, because it was unable to
count the number of pad of the entity. The root cause if
mi_get_media_fd() returning -1 in testNode(), because
/sys/dev/char/81:9/device/ does not contain any entry whose name starts
with "media".

I couldn't reproduce the issue with vimc running

$ v4l2-compliance -z platform:vimc.0 -u "Sensor A"

so I investigated further, and realized there's a major difference: the
"Sensor A" entity in vimc is created by the vimc driver that registers
the media device, while the sensor entity in the rkisp1 media graph is
created by a sensor driver.

Finding the media device through sysfs isn't guaranteed to work. We can
keep doing so as a last resort option when no -z option is specified,
but we should use the media device found by open_media_bus_info() when
running with -z.

-- 
Regards,

Laurent Pinchart
