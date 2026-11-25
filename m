Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795613988;
	b=VgjyjFUDzlve3AaDD3uILF83NBRXuNbwmlH1S3kG7oxhVMv6f3DNkQfyc9WFlgBYy8/n
	 U0otHJ6Xto3SHpFah4CM9pA74iDxnM4m5dodqgDQoTkCQEGPWbAeGT7uiZp6rx1hpIL84
	 MYXbllPMpp8ShyfcTdUhSQZnYLj6DQ+6vXZbftnfZFAhLGpfUmX5y3bBEE0nkjdFJUoGC
	 O0QboYFBx1MyG9J8R7mxiMDFgceCsOO6x2Anm/cZcVcKS5euiNu5RanYavERIbp/SyAje
	 bS3mH2wWjWNfRhERBrBvyM0tJCktptr1nXlh8gynBTjTinmBOdOJwaE9vh36ph9OlIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795613988;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=nWRpaQvraiAxfcxVnymEQOKg1pwiEIewvWL0Ltl2SGo=;
	b=vhoyMQgiAh216ABdV16fF3oqM5bncD2DUj1FeOJfX5aoV6C1WKrLNRCfNb0WduHe8Jxh
	 RUOPpyGjXpFoXZEQR0uGCAtgnP4+I/g9Ag1xBoCXSm2Y9onaruPwN5xDCbO2r5lx1h99h
	 shfUobcqsNJjH5W/GHAW9+wiedPKHM5y342bhS5sSLk7cLC7GI5+ZdyYSl6SgG/9M32Eg
	 pN5sDWFeAkAWlJ78WMJ5HZc6lKZ5S9SIr/EC6WYAD+gcDvloZoYS9ggEsINcZcL1jFTsh
	 qsKi77DWgftTe9d49jYILQqs+2zl/sKDKhhFn3DYN/qQJHEt3lX0WNvYaGKaYoHwOZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E8NQdai2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6B7606A321;
	Wed, 25 Nov 2026 13:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E8NQdai2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F65B1F00A3C;
	Wed, 25 Nov 2026 13:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795613988;
	bh=nWRpaQvraiAxfcxVnymEQOKg1pwiEIewvWL0Ltl2SGo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=E8NQdai2+88lzdKFuWa8gspAonfKiFFARIYSh4n1jH7Y5XvxxpPrI3CCkf9p3Q/WD
	 FMTtnBn8/lou+9kYScS5F0QSPpJ4ZdWmpJF2uoet2oR48isnJzXBKkgzy0ScrvjlkI
	 bsDjmuzz4cryo4wwIPWOhcToq//EoazbLruOHFuAtLPf8Hbk9W9aGWLTMilegyN8yU
	 CB8b77imXwsGP2mHrnbOTVyZ2BbRe6VoRwIncWIrVccSfYrJgdNWbQnHieDL6xZm0C
	 IAWjaNk7Dk286nkWDXsIbzlaUJ1g4/EZzzxjrjZMSIOzfwQVOigRB0sySmjOfvw8JA
	 oEKwyT471IdaA==
Message-ID: <99aad66b-675d-4a2d-8558-167c11ea725a@kernel.org>
Date: Wed, 25 Nov 2026 14:39:45 +0100
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
Subject: Re: [PATCH v7 12/12] media: add driver for StarTech USB3HDCAP
To: Matthew Laux <matthew.laux@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>, Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20261121035523.26764-1-matthew.laux@gmail.com>
 <20261121035523.26764-13-matthew.laux@gmail.com>
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20261121035523.26764-13-matthew.laux@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/11/2026 04:55, Matthew Laux wrote:
> Add a V4L2 driver for the StarTech USB3HDCAP video capture device. This is
> a popular capture card based on the MST3367 HDMI receiver and TW9900
> composite video decoder. Support is included for the composite, S-Video,
> component, and HDMI inputs, and these inputs have been tested at various
> resolutions. Audio support is provided by an ALSA device.
> 
> Also includes preliminary support for the Micomsoft XCAPTURE-1 hardware
> variant. All inputs have been tested on that variant as well except for
> component.

A few comments here as well:

> 
> Signed-off-by: Matthew Laux <matthew.laux@gmail.com>
> ---
>  MAINTAINERS                                   |    6 +
>  drivers/media/usb/Kconfig                     |    1 +
>  drivers/media/usb/Makefile                    |    1 +
>  drivers/media/usb/usb3hdcap/Kconfig           |   15 +
>  drivers/media/usb/usb3hdcap/Makefile          |    8 +
>  drivers/media/usb/usb3hdcap/usb3hdcap-audio.c |  323 +++++
>  .../media/usb/usb3hdcap/usb3hdcap-composite.c |  212 +++
>  drivers/media/usb/usb3hdcap/usb3hdcap-core.c  | 1173 +++++++++++++++++
>  drivers/media/usb/usb3hdcap/usb3hdcap-hdmi.c  |  200 +++
>  drivers/media/usb/usb3hdcap/usb3hdcap-video.c |  499 +++++++
>  drivers/media/usb/usb3hdcap/usb3hdcap.h       |  241 ++++
>  11 files changed, 2679 insertions(+)
>  create mode 100644 drivers/media/usb/usb3hdcap/Kconfig
>  create mode 100644 drivers/media/usb/usb3hdcap/Makefile
>  create mode 100644 drivers/media/usb/usb3hdcap/usb3hdcap-audio.c
>  create mode 100644 drivers/media/usb/usb3hdcap/usb3hdcap-composite.c
>  create mode 100644 drivers/media/usb/usb3hdcap/usb3hdcap-core.c
>  create mode 100644 drivers/media/usb/usb3hdcap/usb3hdcap-hdmi.c
>  create mode 100644 drivers/media/usb/usb3hdcap/usb3hdcap-video.c
>  create mode 100644 drivers/media/usb/usb3hdcap/usb3hdcap.h
> 

<snip>

> +
> +static int usb3hdcap_query_dv_timings(struct file *file, void *priv,
> +				      struct v4l2_dv_timings *timings)
> +{
> +	struct usb3hdcap *hdcap = video_drvdata(file);
> +	int ret;
> +
> +	if (!(hdcap->input == INPUT_COMPONENT || hdcap->input == INPUT_HDMI))
> +		return -ENODATA;
> +
> +	if (vb2_is_streaming(&hdcap->vb2q))
> +		return -EBUSY;

Why is this needed? Does querying the timings while streaming actually interfere
with the streaming?

This is expected to work, but if it can't be made to work, then it the reason should be
documented here.

> +
> +	ret = v4l2_subdev_call(hdcap->sd_mst3367, pad, query_dv_timings, 0,
> +			       timings);
> +	hdcap->no_signal = ret < 0;
> +	return ret;
> +}
> +

<snip>

> +
> +static int usb3hdcap_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	switch (ctrl->id) {
> +	case V4L2_CID_DV_RX_POWER_PRESENT:
> +		ctrl->val = 1;

Huh? It is a volatile control, but the value is fixed?

This makes no sense.

> +		return 0;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static const struct v4l2_ctrl_ops usb3hdcap_ctrl_ops = {
> +	.g_volatile_ctrl = usb3hdcap_g_volatile_ctrl,
> +};
> +
> +static int usb3hdcap_subscribe_event(struct v4l2_fh *fh,
> +				     const struct v4l2_event_subscription *sub)
> +{
> +	switch (sub->type) {
> +	case V4L2_EVENT_SOURCE_CHANGE:
> +		return v4l2_src_change_event_subscribe(fh, sub);

The V4L2_EVENT_SOURCE_CHANGE is never raised. It is supposed to be sent
if a signal goes away or if the format changes, but I see none of that in
this driver. That can't be right.


> +	default:
> +		return v4l2_ctrl_subscribe_event(fh, sub);
> +	}
> +}
> +
> +static const struct v4l2_ioctl_ops usb3hdcap_ioctl_ops = {
> +	.vidioc_querycap = usb3hdcap_querycap,
> +	.vidioc_enum_input = usb3hdcap_enum_input,
> +	.vidioc_enum_fmt_vid_cap = usb3hdcap_enum_fmt_vid_cap,
> +	.vidioc_g_fmt_vid_cap = usb3hdcap_fmt_vid_cap,
> +	.vidioc_try_fmt_vid_cap = usb3hdcap_fmt_vid_cap,
> +	.vidioc_s_fmt_vid_cap = usb3hdcap_fmt_vid_cap,
> +	.vidioc_g_std = usb3hdcap_g_std,
> +	.vidioc_s_std = usb3hdcap_s_std,
> +	.vidioc_querystd = usb3hdcap_querystd,
> +	.vidioc_g_dv_timings = usb3hdcap_g_dv_timings,
> +	.vidioc_s_dv_timings = usb3hdcap_s_dv_timings,
> +	.vidioc_enum_dv_timings = usb3hdcap_enum_dv_timings,
> +	.vidioc_dv_timings_cap = usb3hdcap_dv_timings_cap,
> +	.vidioc_query_dv_timings = usb3hdcap_query_dv_timings,
> +	.vidioc_g_input = usb3hdcap_g_input,
> +	.vidioc_s_input = usb3hdcap_s_input,
> +	.vidioc_g_parm = usb3hdcap_g_parm,
> +	.vidioc_s_parm = usb3hdcap_s_parm,
> +	.vidioc_enum_framesizes = usb3hdcap_enum_framesizes,
> +	.vidioc_enum_frameintervals = usb3hdcap_enum_frameintervals,
> +	.vidioc_log_status = usb3hdcap_log_status,
> +
> +	.vidioc_reqbufs = vb2_ioctl_reqbufs,
> +	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
> +	.vidioc_querybuf = vb2_ioctl_querybuf,
> +	.vidioc_create_bufs = vb2_ioctl_create_bufs,
> +	.vidioc_qbuf = vb2_ioctl_qbuf,
> +	.vidioc_dqbuf = vb2_ioctl_dqbuf,
> +	.vidioc_streamon = vb2_ioctl_streamon,
> +	.vidioc_streamoff = vb2_ioctl_streamoff,

Add .vidioc_expbuf.

> +
> +	.vidioc_subscribe_event = usb3hdcap_subscribe_event,
> +	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
> +};
> +
> +static int usb3hdcap_open(struct file *file)
> +{
> +	struct usb3hdcap *hdcap = video_drvdata(file);
> +	int ret;
> +
> +	if (mutex_lock_interruptible(&hdcap->lock))
> +		return -ERESTARTSYS;
> +
> +	if (!hdcap->usb_dev) {
> +		ret = -ENODEV;
> +		goto unlock;
> +	}
> +
> +	ret = v4l2_fh_open(file);
> +	if (ret < 0)
> +		goto unlock;
> +
> +	/* For applications that never call S_INPUT... */
> +	if (!hdcap->hw_inited && !vb2_is_busy(&hdcap->vb2q))
> +		usb3hdcap_init_input(hdcap);

This doesn't look right. I think this is something you want to do only
on first open, and then you can use v4l2_fh_is_singular().

> +
> +unlock:
> +	mutex_unlock(&hdcap->lock);
> +	return ret;
> +}
> +
> +static const struct v4l2_file_operations usb3hdcap_fops = {
> +	.owner = THIS_MODULE,
> +	.unlocked_ioctl = video_ioctl2,
> +	.mmap = vb2_fop_mmap,
> +	.open = usb3hdcap_open,
> +	.release = vb2_fop_release,
> +	.read = vb2_fop_read,
> +	.poll = vb2_fop_poll,
> +};
> +
> +static void usb3hdcap_notify(struct v4l2_subdev *sd, unsigned int notification,
> +			     void *arg)
> +{
> +	struct usb3hdcap *hdcap = container_of(sd->v4l2_dev,
> +		struct usb3hdcap, v4l2_dev);
> +
> +	switch (notification) {
> +	case MST3367_HOTPLUG:
> +		usb3hdcap_hdmi_hotplug(hdcap, *(bool *)arg);
> +		break;
> +	default:
> +		break;
> +	}
> +}
> +
> +static void usb3hdcap_release(struct v4l2_device *v4l2_dev)
> +{
> +	struct usb3hdcap *hdcap = container_of(v4l2_dev,
> +		struct usb3hdcap, v4l2_dev);
> +
> +	v4l2_ctrl_handler_free(&hdcap->ctrl);
> +	v4l2_device_unregister(&hdcap->v4l2_dev);
> +	i2c_del_adapter(&hdcap->i2c_adap);
> +	kfree(hdcap);
> +}
> +
> +static int video_init(struct usb3hdcap *hdcap)
> +{
> +	int ret;
> +
> +	mutex_init(&hdcap->lock);
> +	mutex_init(&hdcap->mcu_lock);
> +	spin_lock_init(&hdcap->buflock);
> +	INIT_LIST_HEAD(&hdcap->bufs);
> +
> +	hdcap->vb2q.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> +	hdcap->vb2q.io_modes = VB2_MMAP | VB2_USERPTR | VB2_READ;

Add VB2_DMABUF. I would suggest dropping VB2_USERPTR: we don't really like
that streaming mode.

> +	hdcap->vb2q.drv_priv = hdcap;
> +	hdcap->vb2q.buf_struct_size = sizeof(struct hdcap_buf);
> +	hdcap->vb2q.ops = &usb3hdcap_vb2_ops;
> +	hdcap->vb2q.mem_ops = &vb2_vmalloc_memops;
> +	hdcap->vb2q.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> +	hdcap->vb2q.min_queued_buffers = 2;
> +	hdcap->vb2q.lock = &hdcap->lock;
> +	ret = vb2_queue_init(&hdcap->vb2q);
> +	if (ret < 0) {
> +		dev_warn(hdcap->dev, "Could not initialize videobuf2 queue\n");
> +		return ret;
> +	}
> +
> +	v4l2_ctrl_handler_init(&hdcap->ctrl, 1);
> +	hdcap->ctrl_rx_power = v4l2_ctrl_new_std(&hdcap->ctrl,
> +						 &usb3hdcap_ctrl_ops,
> +						 V4L2_CID_DV_RX_POWER_PRESENT,
> +						 0, 1, 0, 1);
> +	if (hdcap->ctrl_rx_power)
> +		hdcap->ctrl_rx_power->flags |= V4L2_CTRL_FLAG_VOLATILE |
> +						V4L2_CTRL_FLAG_READ_ONLY;

It makes no sense for this to be a volatile control. I suspect there is some
confusion about thi.

> +	ret = hdcap->ctrl.error;
> +	if (ret < 0) {
> +		dev_warn(hdcap->dev, "Could not initialize controls\n");
> +		goto v4l2_fail;
> +	}
> +
> +	hdcap->v4l2_dev.ctrl_handler = &hdcap->ctrl;
> +	hdcap->v4l2_dev.release = usb3hdcap_release;
> +	hdcap->v4l2_dev.notify = usb3hdcap_notify;
> +	ret = v4l2_device_register(hdcap->dev, &hdcap->v4l2_dev);
> +	if (ret < 0) {
> +		dev_warn(hdcap->dev, "Could not register v4l2 device\n");
> +		goto v4l2_fail;
> +	}
> +
> +	usb3hdcap_device_init(hdcap);
> +
> +	ret = usb3hdcap_i2c_register(hdcap);
> +	if (ret < 0) {
> +		dev_warn(hdcap->dev, "Could not register I2C adapter\n");
> +		goto vdev_fail;
> +	}
> +
> +	ret = usb3hdcap_composite_register(hdcap);
> +	if (ret < 0)
> +		goto subdev_fail;
> +
> +	ret = usb3hdcap_hdmi_register(hdcap);
> +	if (ret < 0)
> +		goto subdev_fail;
> +
> +	strscpy(hdcap->video_dev.name, "usb3hdcap", sizeof(hdcap->video_dev.name));
> +	hdcap->video_dev.v4l2_dev = &hdcap->v4l2_dev;
> +	hdcap->video_dev.release = video_device_release_empty;
> +	hdcap->video_dev.fops = &usb3hdcap_fops;
> +	hdcap->video_dev.ioctl_ops = &usb3hdcap_ioctl_ops;
> +	hdcap->video_dev.tvnorms = USB3HDCAP_V4L2_STDS;
> +	hdcap->video_dev.queue = &hdcap->vb2q;
> +	hdcap->video_dev.lock = &hdcap->lock;
> +	hdcap->video_dev.device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_READWRITE |
> +				  V4L2_CAP_STREAMING;
> +	video_set_drvdata(&hdcap->video_dev, hdcap);
> +	ret = video_register_device(&hdcap->video_dev, VFL_TYPE_VIDEO, -1);
> +	if (ret < 0) {
> +		dev_warn(hdcap->dev, "Could not register video device\n");
> +		goto subdev_fail;
> +	}
> +
> +	dev_info(hdcap->dev, "%s: registered as %s\n",
> +		 __func__, video_device_node_name(&hdcap->video_dev));
> +
> +	return 0;
> +
> +subdev_fail:
> +	v4l2_device_unregister(&hdcap->v4l2_dev);
> +	i2c_del_adapter(&hdcap->i2c_adap);
> +	goto v4l2_fail;
> +
> +vdev_fail:
> +	v4l2_device_unregister(&hdcap->v4l2_dev);
> +
> +v4l2_fail:
> +	v4l2_ctrl_handler_free(&hdcap->ctrl);
> +	return ret;
> +}
> +
> +static int usb3hdcap_probe(struct usb_interface *intf,
> +			   const struct usb_device_id *id)
> +{
> +	struct device *dev;
> +	struct usb3hdcap *hdcap;
> +	int ret, is_xcapture;
> +
> +	/* not using the interrupt interface, just data */
> +	if (intf->cur_altsetting->desc.bInterfaceNumber != 0)
> +		return -ENODEV;
> +
> +	/* none, Mult=0 for SD, Mult=1 for HD */
> +	if (intf->num_altsetting != 3)
> +		return -ENODEV;
> +
> +	dev = &intf->dev;
> +
> +	hdcap = kzalloc_obj(*hdcap, GFP_KERNEL);
> +	if (!hdcap)
> +		return -ENOMEM;
> +
> +	hdcap->dev = dev;
> +	hdcap->usb_dev = usb_get_dev(interface_to_usbdev(intf));
> +	hdcap->input = INPUT_COMPOSITE;
> +	hdcap->std = V4L2_STD_NTSC;
> +	hdcap->width = SD_WIDTH;
> +	hdcap->height = NTSC_HEIGHT / 2;
> +	hdcap->bpl = DEFAULT_BPL;
> +
> +	usb_set_intfdata(intf, hdcap);
> +
> +	ret = video_init(hdcap);
> +	if (ret < 0)
> +		goto video_fail;
> +
> +	ret = usb3hdcap_audio_init(hdcap);
> +	if (ret < 0)
> +		dev_warn(dev, "audio init failed: %d (continuing without audio)\n", ret);
> +
> +	is_xcapture = le16_to_cpu(hdcap->usb_dev->descriptor.idProduct) == XCAPTURE1_PID;
> +	dev_info(dev, "%s USB 3.0 HD Video Capture Device",
> +		 is_xcapture ? "Micomsoft XCAPTURE-1" : "StarTech USB3HDCAP");
> +
> +	return 0;
> +
> +video_fail:
> +	usb_set_intfdata(intf, NULL);
> +	usb_put_dev(hdcap->usb_dev);
> +	kfree(hdcap);
> +	return ret;
> +}
> +
> +static void usb3hdcap_disconnect(struct usb_interface *intf)
> +{
> +	struct usb3hdcap *hdcap = usb_get_intfdata(intf);
> +
> +	usb_set_intfdata(intf, NULL);
> +
> +	if (!hdcap)
> +		return;
> +
> +	vb2_video_unregister_device(&hdcap->video_dev);
> +	usb3hdcap_audio_free(hdcap);
> +	v4l2_device_disconnect(&hdcap->v4l2_dev);
> +
> +	mutex_lock(&hdcap->lock);
> +	i2c_lock_bus(&hdcap->i2c_adap, I2C_LOCK_ROOT_ADAPTER);
> +	usb_put_dev(hdcap->usb_dev);
> +	hdcap->usb_dev = NULL;
> +	i2c_unlock_bus(&hdcap->i2c_adap, I2C_LOCK_ROOT_ADAPTER);
> +	mutex_unlock(&hdcap->lock);
> +
> +	/* hdcap is freed by usb3hdcap_release when last user closes fd */
> +	v4l2_device_put(&hdcap->v4l2_dev);
> +}
> +
> +static const struct usb_device_id usb3hdcap_id_table[] = {
> +	{ USB_DEVICE(USB3HDCAP_VID, USB3HDCAP_PID) },
> +	{ USB_DEVICE(USB3HDCAP_VID, XCAPTURE1_PID) },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(usb, usb3hdcap_id_table);
> +
> +MODULE_AUTHOR("Matthew Laux <matthew.laux@gmail.com>");
> +MODULE_DESCRIPTION("StarTech USB3HDCAP Driver");
> +MODULE_LICENSE("GPL");
> +
> +static struct usb_driver usb3hdcap_usb_driver = {
> +	.name = "usb3hdcap",
> +	.id_table = usb3hdcap_id_table,
> +	.probe = usb3hdcap_probe,
> +	.disconnect = usb3hdcap_disconnect,
> +};
> +module_usb_driver(usb3hdcap_usb_driver);
> diff --git a/drivers/media/usb/usb3hdcap/usb3hdcap-hdmi.c b/drivers/media/usb/usb3hdcap/usb3hdcap-hdmi.c
> new file mode 100644
> index 000000000000..8f7ea642cb12
> --- /dev/null
> +++ b/drivers/media/usb/usb3hdcap/usb3hdcap-hdmi.c
> @@ -0,0 +1,200 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * USB3HDCAP MST3367 support: HDMI and component
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/usb.h>
> +#include <linux/v4l2-dv-timings.h>
> +#include <media/i2c/mst3367.h>
> +#include <media/v4l2-dv-timings.h>
> +
> +#include "usb3hdcap.h"
> +
> +static struct i2c_board_info mst3367_info = {
> +	I2C_BOARD_INFO("mst3367", ADDR_MST3367 >> 1),
> +};
> +
> +int usb3hdcap_hdmi_register(struct usb3hdcap *hdcap)
> +{
> +	hdcap->sd_mst3367 = v4l2_i2c_new_subdev_board(&hdcap->v4l2_dev,
> +						      &hdcap->i2c_adap,
> +						      &mst3367_info, NULL);
> +	if (!hdcap->sd_mst3367) {
> +		dev_warn(hdcap->dev, "Could not register MST3367\n");
> +		return -ENODEV;
> +	}
> +
> +	return 0;
> +}
> +
> +void usb3hdcap_hdmi_hotplug(struct usb3hdcap *hdcap, bool hotplug)
> +{
> +	if (!hdcap->has_mcu)
> +		return;
> +
> +	if (hotplug)
> +		u3hc_i2c_rmw(hdcap, ADDR_CPLD, 0x01, 0xfd, 0x01);
> +	else
> +		u3hc_i2c_rmw(hdcap, ADDR_CPLD, 0x01, 0xff, 0x03);
> +	u3hc_i2c_write(hdcap, ADDR_CPLD, 0x11, 0xfc);
> +}
> +
> +static void cpld_init(struct usb3hdcap *hdcap, u8 mux_val)
> +{
> +	int k, status;
> +
> +	/*
> +	 * cVar3 = i2c_read(param_1,0x98,0x3b,0);
> +	 * if (cVar3 != '\0') {
> +	 *   uVar5 = *(uint *)(param_1 + 0x6840);
> +	 *   if ((uVar5 == 2) || (uVar5 == 3)) {
> +	 *     local_res8[0] = -0x80;
> +	 *     i2c_write(param_1,0x98,0x3b,local_res8,1);
> +	 *     uVar5 = *(uint *)(param_1 + 0x6840);
> +	 *   }
> +	 *   if (uVar5 < 2) {
> +	 *     local_res8[0] = '\x02';
> +	 *     i2c_write(param_1,0x98,0x3b,local_res8,1);
> +	 *   }
> +	 * }
> +	 */
> +
> +	if (u3hc_i2c_read(hdcap, ADDR_CPLD, 0x3b) != 0)
> +		u3hc_i2c_write(hdcap, ADDR_CPLD, 0x3b, mux_val);
> +
> +	/*
> +	 * local_res8[0] = '\x05';
> +	 * i2c_write(param_1,0x98,0x20,local_res8,1);
> +	 * cVar3 = FUN_140226fc4(param_1);
> +	 * local_res8[0] = '\x01';
> +	 * i2c_write(param_1,0x98,0,local_res8,1);
> +	 * local_res8[0] = (-(cVar3 != '\0') & 0xfeU) - 2;
> +	 * i2c_write(param_1,0x98,0x10,local_res8,1);
> +	 */
> +	u3hc_i2c_write(hdcap, ADDR_CPLD, 0x20, 0x05);
> +	u3hc_i2c_write(hdcap, ADDR_CPLD, 0x00, 0x01);
> +
> +	u3hc_i2c_write(hdcap, ADDR_CPLD, 0x10, hdcap->has_mcu ? 0xfc : 0xfe);
> +
> +	for (k = 0; k < 50; k++) {
> +		status = u3hc_i2c_read(hdcap, ADDR_CPLD, 0x01);
> +		if (status >= 0x03)
> +			break;
> +		msleep(20);
> +	}
> +
> +	u3hc_i2c_write(hdcap, ADDR_CPLD, 0x01, hdcap->has_mcu ? 0x03 : 0x02);
> +	u3hc_i2c_write(hdcap, ADDR_CPLD, 0x11, 0xfc);
> +}
> +
> +/* Make timings the current timings and derive the capture format from them */
> +int usb3hdcap_hd_set_timings(struct usb3hdcap *hdcap,
> +			     struct v4l2_dv_timings *timings)
> +{
> +	struct v4l2_subdev_format fmt = {
> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +		.pad = MST3367_PAD_SOURCE,
> +	};
> +	int ret;
> +
> +	ret = v4l2_subdev_call(hdcap->sd_mst3367, pad, s_dv_timings, 0, timings);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = v4l2_subdev_call(hdcap->sd_mst3367, pad, get_fmt, NULL, &fmt);
> +	if (ret < 0)
> +		return ret;
> +
> +	hdcap->mst_bt601 = fmt.format.colorspace == V4L2_COLORSPACE_SMPTE170M;
> +
> +	hdcap->timings = *timings;
> +	hdcap->width = timings->bt.width;
> +	hdcap->interlaced = timings->bt.interlaced;
> +	hdcap->height = timings->bt.interlaced
> +		? timings->bt.height / 2 : timings->bt.height;
> +	hdcap->bpl = hdcap->width * 2;
> +
> +	return 0;
> +}
> +
> +/* Start out with what is connected, default to 720p60 if no signal */
> +static void usb3hdcap_hd_detect(struct usb3hdcap *hdcap,
> +				struct v4l2_dv_timings *timings)
> +{
> +	static const struct v4l2_dv_timings def = V4L2_DV_BT_CEA_1280X720P60;
> +	int ret;
> +
> +	ret = v4l2_subdev_call(hdcap->sd_mst3367, pad, query_dv_timings, 0,
> +			       timings);
> +	hdcap->no_signal = ret < 0;
> +	if (hdcap->no_signal) {
> +		dev_dbg(hdcap->dev, "no timings detected (%d)\n", ret);
> +		*timings = def;
> +	}
> +
> +	dev_dbg(hdcap->dev, "%dx%d%s\n", timings->bt.width, timings->bt.height,
> +		timings->bt.interlaced ? "i" : "p");
> +}
> +
> +/* ------------------------------------------------------------------ */
> +/* Main HDMI init entry point                                         */
> +/* ------------------------------------------------------------------ */
> +
> +int usb3hdcap_hdmi_init(struct usb3hdcap *hdcap)
> +{
> +	struct v4l2_dv_timings timings;
> +	int ret;
> +
> +	/* CPLD init with HDMI input mux */
> +	cpld_init(hdcap, 0x02);
> +
> +	ret = v4l2_subdev_call(hdcap->sd_mst3367, video, s_routing,
> +			       MST3367_INPUT_HDMI, 0, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	usb3hdcap_hd_detect(hdcap, &timings);
> +
> +	return usb3hdcap_hd_set_timings(hdcap, &timings);
> +}
> +
> +/* ------------------------------------------------------------------ */
> +/* Main component init entry point                                    */
> +/* ------------------------------------------------------------------ */
> +
> +int usb3hdcap_component_init(struct usb3hdcap *hdcap)
> +{
> +	struct v4l2_dv_timings timings;
> +	int ret;
> +
> +	/* CPLD init with component input mux */
> +	cpld_init(hdcap, 0x80);
> +
> +	ret = v4l2_subdev_call(hdcap->sd_mst3367, video, s_routing,
> +			       MST3367_INPUT_COMPONENT, 0, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Component CPLD routing, bit 4 = component input? */
> +	u3hc_i2c_read(hdcap, ADDR_CPLD, 0x20);
> +	u3hc_i2c_write(hdcap, ADDR_CPLD, 0x20, 0x15);
> +
> +	/*
> +	 * Wait for ADC to stabilize, windows driver does this but might be able
> +	 * to decrease wait
> +	 */
> +	msleep(1000);
> +
> +	/* Final CPLD verify */
> +	u3hc_i2c_read(hdcap, ADDR_CPLD, 0x20);
> +	u3hc_i2c_write(hdcap, ADDR_CPLD, 0x20, 0x15);
> +
> +	usb3hdcap_hd_detect(hdcap, &timings);
> +
> +	u3hc_i2c_rmw(hdcap, ADDR_CPLD, 0x00, 0xff, 0x02);
> +
> +	return usb3hdcap_hd_set_timings(hdcap, &timings);
> +}
> diff --git a/drivers/media/usb/usb3hdcap/usb3hdcap-video.c b/drivers/media/usb/usb3hdcap/usb3hdcap-video.c
> new file mode 100644
> index 000000000000..3a861db36d6c
> --- /dev/null
> +++ b/drivers/media/usb/usb3hdcap/usb3hdcap-video.c
> @@ -0,0 +1,499 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * USB3HDCAP video streaming - stream parser, ISO URB handling, vb2 ops
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/slab.h>
> +#include <linux/usb.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/videobuf2-v4l2.h>
> +
> +#include "usb3hdcap.h"
> +
> +/* ------------------------------------------------------------------ */
> +/* Stream parser                                                      */
> +/* ------------------------------------------------------------------ */
> +
> +static void vyuy_to_yuyv(u8 *dst, const u8 *src, int len)
> +{
> +	int k;
> +
> +	/* VYUY: V Y0 U Y1 -> YUYV: Y0 U Y1 V */
> +	for (k = 0; k < len; k += 4) {
> +		dst[k + 0] = src[k + 1]; /* Y0 */
> +		dst[k + 1] = src[k + 2]; /* U */
> +		dst[k + 2] = src[k + 3]; /* Y1 */
> +		dst[k + 3] = src[k + 0]; /* V */
> +	}
> +}
> +
> +static struct hdcap_buf *get_next_buf(struct usb3hdcap *hdcap)
> +{
> +	struct hdcap_buf *buf = NULL;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&hdcap->buflock, flags);
> +	if (!list_empty(&hdcap->bufs)) {
> +		buf = list_first_entry(&hdcap->bufs, struct hdcap_buf, list);
> +		list_del(&buf->list);
> +	}
> +	spin_unlock_irqrestore(&hdcap->buflock, flags);
> +
> +	return buf;
> +}
> +
> +static void deliver_frame(struct usb3hdcap *hdcap)
> +{
> +	struct hdcap_buf *buf = hdcap->cur_buf;
> +	u8 *vaddr;
> +	int k;
> +
> +	if (!buf)
> +		return;
> +
> +	hdcap->frames_delivered++;
> +
> +	/* Pad remaining lines with black */
> +	vaddr = vb2_plane_vaddr(&buf->vb.vb2_buf, 0);
> +	while (hdcap->frame_line < hdcap->height) {
> +		u8 *row = vaddr + hdcap->frame_line * hdcap->bpl;
> +
> +		for (k = 0; k < hdcap->bpl; k += 4) {
> +			row[k + 0] = 0x10;
> +			row[k + 1] = 0x80;
> +			row[k + 2] = 0x10;
> +			row[k + 3] = 0x80;
> +		}
> +		hdcap->frame_line++;
> +	}
> +
> +	vb2_set_plane_payload(&buf->vb.vb2_buf, 0,
> +			      hdcap->bpl * hdcap->height);
> +	buf->vb.vb2_buf.timestamp = ktime_get_ns();
> +	if (hdcap->interlaced) {
> +		bool bottom = hdcap->field_f;
> +
> +		if (!bottom && hdcap->top_done)
> +			hdcap->sequence++;
> +		buf->vb.field = bottom ? V4L2_FIELD_BOTTOM : V4L2_FIELD_TOP;
> +		buf->vb.sequence = hdcap->sequence;
> +		hdcap->top_done = !bottom;
> +		if (bottom)
> +			hdcap->sequence++;
> +	} else {
> +		buf->vb.field = V4L2_FIELD_NONE;
> +		buf->vb.sequence = hdcap->sequence++;
> +	}
> +	vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
> +
> +	hdcap->cur_buf = NULL;
> +}
> +
> +/*
> + * Process one video line (shared between composite and HDMI).
> + * 'video' points to the XY byte followed by pixel data.
> + */
> +static void process_video_line(struct usb3hdcap *hdcap, const u8 *video)
> +{
> +	u8 sav_xy = video[0];
> +	int blanking = sav_xy & BT656_V_BIT;
> +
> +	/* Blanking -> active transition */
> +	if (!blanking && hdcap->was_blanking) {
> +		if (!hdcap->synced)
> +			hdcap->synced = 1;
> +		if (hdcap->cur_buf && hdcap->frame_line >= 100)
> +			deliver_frame(hdcap);
> +		hdcap->frame_line = 0;
> +		if (!hdcap->cur_buf)
> +			hdcap->cur_buf = get_next_buf(hdcap);
> +		/* Dropping a field ends the frame */
> +		if (!hdcap->cur_buf && hdcap->top_done) {
> +			hdcap->top_done = 0;
> +			hdcap->sequence++;
> +		}
> +	}
> +	hdcap->was_blanking = blanking;
> +
> +	if (!hdcap->synced || !hdcap->cur_buf || blanking)
> +		return;
> +
> +	/* Deliver when field is full */
> +	if (hdcap->frame_line >= hdcap->height) {
> +		deliver_frame(hdcap);
> +		hdcap->frame_line = 0;
> +		hdcap->cur_buf = get_next_buf(hdcap);
> +		if (!hdcap->cur_buf)
> +			return;
> +	}
> +
> +	if (hdcap->frame_line == 0) {
> +		hdcap->field_f = !!(sav_xy & BT656_F_BIT);
> +		/* skip bottom field where the top was dropped */
> +		if (hdcap->interlaced && hdcap->field_f && !hdcap->top_done)
> +			return;
> +	}
> +
> +	vyuy_to_yuyv(vb2_plane_vaddr(&hdcap->cur_buf->vb.vb2_buf, 0)
> +			+ hdcap->frame_line * hdcap->bpl,
> +		     video, hdcap->bpl);
> +	hdcap->frame_line++;
> +}
> +
> +static void process_data(struct usb3hdcap *hdcap)
> +{
> +	u8 *buf = hdcap->parse_buf;
> +	int line_size = SAV_LEN + hdcap->bpl;
> +	int pos = 0;
> +
> +	while (pos + 3 <= hdcap->parse_len) {
> +		if (buf[pos] != 0xff || buf[pos + 1] != 0x00) {
> +			pos++;
> +			continue;
> +		}
> +
> +		if (buf[pos + 2] == 0x00) {
> +			/* SAV: video line */
> +			if (pos + line_size > hdcap->parse_len)
> +				break;
> +			/* -1 because XY byte occupies the first pixel's V position */
> +			process_video_line(hdcap, buf + pos + SAV_LEN - 1);
> +			pos += line_size;
> +		} else if (buf[pos + 2] == 0xff) {
> +			u8 type;
> +			int alen;
> +
> +			if (pos + MARKER_LEN > hdcap->parse_len)
> +				break;
> +			type = buf[pos + 3];
> +			if (type < 0x02 || type > 0x04) {
> +				pos++;
> +				continue;
> +			}
> +			alen = type * 4;
> +			if (pos + MARKER_LEN + alen > hdcap->parse_len)
> +				break;
> +			hdcap->markers_found++;
> +			usb3hdcap_audio_data(hdcap, buf + pos + MARKER_LEN, alen);
> +			pos += MARKER_LEN + alen;
> +		} else {
> +			pos++;
> +		}
> +	}
> +
> +	/* Shift unconsumed data to front */
> +	if (pos > 0) {
> +		hdcap->parse_len -= pos;
> +		if (hdcap->parse_len > 0)
> +			memmove(buf, buf + pos, hdcap->parse_len);
> +	}
> +}
> +
> +/* ------------------------------------------------------------------ */
> +/* Isochronous URB handling                                           */
> +/* ------------------------------------------------------------------ */
> +
> +static void usb3hdcap_iso_cb(struct urb *urb)
> +{
> +	struct usb3hdcap *hdcap = urb->context;
> +	int k, ret;
> +
> +	switch (urb->status) {
> +	case 0:
> +		break;
> +	case -ENODEV:
> +	case -ENOENT:
> +	case -ECONNRESET:
> +	case -ESHUTDOWN:
> +		return;
> +	default:
> +		dev_warn(hdcap->dev, "ISO URB status %d\n", urb->status);
> +		goto resubmit;
> +	}
> +
> +	hdcap->iso_cb_count++;
> +
> +	for (k = 0; k < urb->number_of_packets; k++) {
> +		int status = urb->iso_frame_desc[k].status;
> +		int len = urb->iso_frame_desc[k].actual_length;
> +		u8 *data = urb->transfer_buffer +
> +			   urb->iso_frame_desc[k].offset;
> +
> +		if (status != 0 || len == 0)
> +			continue;
> +
> +		if (hdcap->parse_len + len > hdcap->parse_buf_size)
> +			hdcap->parse_len = 0;
> +
> +		memcpy(hdcap->parse_buf + hdcap->parse_len, data, len);
> +		hdcap->parse_len += len;
> +		hdcap->iso_bytes += len;
> +
> +		process_data(hdcap);
> +	}
> +
> +resubmit:
> +	ret = usb_submit_urb(urb, GFP_ATOMIC);
> +	/* endpoint going away when stopping is expected */
> +	if (ret < 0 && ret != -ENOENT)
> +		dev_warn(hdcap->dev, "ISO URB resubmit: %d\n", ret);
> +}
> +
> +static struct urb *usb3hdcap_alloc_urb(struct usb3hdcap *hdcap, int npkts)
> +{
> +	struct urb *urb;
> +	int size = hdcap->iso_size;
> +	int k;
> +
> +	urb = usb_alloc_urb(npkts, GFP_KERNEL);
> +	if (!urb)
> +		return NULL;
> +
> +	urb->dev = hdcap->usb_dev;
> +	urb->context = hdcap;
> +	urb->pipe = usb_rcvisocpipe(hdcap->usb_dev, EP_VIDEO);
> +	urb->interval = 1;
> +	urb->transfer_flags = URB_ISO_ASAP;
> +	/* __NOWARN because it retries with fewer packets */
> +	urb->transfer_buffer = kcalloc(npkts, size, GFP_KERNEL | __GFP_NOWARN);
> +	if (!urb->transfer_buffer) {
> +		usb_free_urb(urb);
> +		return NULL;
> +	}
> +	urb->complete = usb3hdcap_iso_cb;
> +	urb->number_of_packets = npkts;
> +	urb->transfer_buffer_length = size * npkts;
> +	for (k = 0; k < npkts; k++) {
> +		urb->iso_frame_desc[k].offset = size * k;
> +		urb->iso_frame_desc[k].length = size;
> +	}
> +
> +	return urb;
> +}
> +
> +static void usb3hdcap_free_urbs(struct usb3hdcap *hdcap)
> +{
> +	int k;
> +
> +	for (k = 0; k < NUM_XFERS; k++) {
> +		struct urb *urb = hdcap->isoc_urbs[k];
> +
> +		if (!urb)
> +			continue;
> +		usb_kill_urb(urb);
> +		kfree(urb->transfer_buffer);
> +		usb_free_urb(urb);
> +		hdcap->isoc_urbs[k] = NULL;
> +	}
> +}
> +
> +static int usb3hdcap_alloc_urbs(struct usb3hdcap *hdcap)
> +{
> +	int npkts, k;
> +
> +	/* Retry allocations until one succeeds */
> +	for (npkts = NUM_ISO_PKTS; npkts >= MIN_ISO_PKTS; npkts /= 2) {
> +		for (k = 0; k < NUM_XFERS; k++) {
> +			hdcap->isoc_urbs[k] = usb3hdcap_alloc_urb(hdcap, npkts);
> +			if (!hdcap->isoc_urbs[k])
> +				break;
> +		}
> +		if (k == NUM_XFERS)
> +			return 0;
> +		usb3hdcap_free_urbs(hdcap);
> +	}
> +
> +	return -ENOMEM;
> +}
> +
> +static void usb3hdcap_return_bufs(struct usb3hdcap *hdcap,
> +				  enum vb2_buffer_state buf_state)
> +{
> +	unsigned long flags;
> +
> +	/* Return any in-progress buffer */
> +	if (hdcap->cur_buf) {
> +		vb2_buffer_done(&hdcap->cur_buf->vb.vb2_buf, buf_state);
> +		hdcap->cur_buf = NULL;
> +	}
> +
> +	spin_lock_irqsave(&hdcap->buflock, flags);
> +	while (!list_empty(&hdcap->bufs)) {
> +		struct hdcap_buf *buf = list_first_entry(&hdcap->bufs,
> +						struct hdcap_buf, list);
> +		list_del(&buf->list);
> +		vb2_buffer_done(&buf->vb.vb2_buf, buf_state);
> +	}
> +	spin_unlock_irqrestore(&hdcap->buflock, flags);
> +}
> +
> +static void usb3hdcap_stop(struct usb3hdcap *hdcap,
> +			   enum vb2_buffer_state buf_state)
> +{
> +	usb3hdcap_free_urbs(hdcap);
> +	usb_set_interface(hdcap->usb_dev, 0, 0);
> +
> +	if (hdcap->input == INPUT_COMPOSITE || hdcap->input == INPUT_SVIDEO)
> +		v4l2_subdev_call(hdcap->sd_tw9900, video, s_stream, 0);
> +
> +	usb3hdcap_return_bufs(hdcap, buf_state);
> +
> +	kvfree(hdcap->parse_buf);
> +	hdcap->parse_buf = NULL;
> +}
> +
> +static int usb3hdcap_start(struct usb3hdcap *hdcap)
> +{
> +	struct usb_host_endpoint *ep;
> +	int maxp, burst, mult;
> +	int k, ret, alt;
> +
> +	if (!hdcap->hw_inited) {
> +		/* the last attempt to set up the input failed */
> +		ret = -EIO;
> +		goto fail;
> +	}
> +
> +	hdcap->parse_len = 0;
> +	hdcap->frame_line = 0;
> +	hdcap->synced = 0;
> +	hdcap->was_blanking = 0;
> +	hdcap->field_f = 0;
> +	hdcap->top_done = 0;
> +	hdcap->cur_buf = NULL;
> +
> +	if (hdcap->input == INPUT_COMPOSITE || hdcap->input == INPUT_SVIDEO) {
> +		ret = v4l2_subdev_call(hdcap->sd_tw9900, video, s_stream, 1);
> +		if (ret < 0)
> +			goto fail;
> +	}
> +
> +	/*
> +	 * Select alt setting based on bandwidth:
> +	 * alt 1: maxp=1024 burst=16 mult=1 -> 16KB/pkt (SD)
> +	 * alt 2: maxp=1024 burst=16 mult=2 -> 32KB/pkt (HD)
> +	 */
> +	alt = (hdcap->width > 720 || hdcap->height > 576) ? 2 : 1;
> +	dev_info(hdcap->dev, "%s: setting alt %d\n", __func__, alt);
> +	ret = usb_set_interface(hdcap->usb_dev, 0, alt);
> +
> +	if (ret < 0) {
> +		dev_err(hdcap->dev, "%s: usb_set_interface failed: %d\n",
> +			__func__, ret);
> +		goto fail;
> +	}
> +
> +	/* Compute ISO packet size from SS endpoint companion descriptor */
> +	ep = usb_pipe_endpoint(hdcap->usb_dev,
> +			       usb_rcvisocpipe(hdcap->usb_dev, EP_VIDEO));
> +	if (!ep || !usb_endpoint_xfer_isoc(&ep->desc)) {
> +		dev_err(hdcap->dev, "ISO endpoint 0x%02x not found\n",
> +			EP_VIDEO);
> +		ret = -ENODEV;
> +		goto fail;
> +	}
> +
> +	maxp = usb_endpoint_maxp(&ep->desc);
> +	burst = ep->ss_ep_comp.bMaxBurst;
> +	mult = USB_SS_MULT(ep->ss_ep_comp.bmAttributes);
> +	hdcap->iso_size = maxp * (burst + 1) * mult;
> +
> +	hdcap->parse_buf_size = hdcap->iso_size + SAV_LEN + hdcap->bpl;
> +	hdcap->parse_buf = kvmalloc(hdcap->parse_buf_size, GFP_KERNEL);
> +	if (!hdcap->parse_buf) {
> +		ret = -ENOMEM;
> +		goto fail;
> +	}
> +
> +	ret = usb3hdcap_alloc_urbs(hdcap);
> +	if (ret < 0)
> +		goto fail;
> +
> +	for (k = 0; k < NUM_XFERS; k++) {
> +		ret = usb_submit_urb(hdcap->isoc_urbs[k], GFP_KERNEL);
> +		if (ret < 0)
> +			goto fail;
> +	}
> +
> +	return 0;
> +
> +fail:
> +	usb3hdcap_stop(hdcap, VB2_BUF_STATE_QUEUED);
> +	return ret;
> +}
> +
> +/* ------------------------------------------------------------------ */
> +/* vb2 ops                                                            */
> +/* ------------------------------------------------------------------ */
> +
> +static int usb3hdcap_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
> +				 unsigned int *nplanes, unsigned int sizes[],
> +	struct device *alloc_devs[])
> +{
> +	struct usb3hdcap *hdcap = vb2_get_drv_priv(vq);
> +	unsigned int img_size = hdcap->bpl * hdcap->height;
> +
> +	if (*nplanes) {
> +		dev_info(hdcap->dev, "queue_setup: recheck sizes[0]=%u vs %u\n",
> +			 sizes[0], img_size);
> +		return sizes[0] < img_size ? -EINVAL : 0;
> +	}
> +	*nplanes = 1;
> +	sizes[0] = img_size;
> +
> +	return 0;
> +}
> +
> +static int usb3hdcap_buf_prepare(struct vb2_buffer *vb)
> +{
> +	struct usb3hdcap *hdcap = vb2_get_drv_priv(vb->vb2_queue);
> +
> +	if (vb2_plane_size(vb, 0) < hdcap->bpl * hdcap->height)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static void usb3hdcap_buf_queue(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +	struct usb3hdcap *hdcap = vb2_get_drv_priv(vb->vb2_queue);
> +	struct hdcap_buf *buf = container_of(vbuf, struct hdcap_buf, vb);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&hdcap->buflock, flags);
> +	list_add_tail(&buf->list, &hdcap->bufs);
> +	spin_unlock_irqrestore(&hdcap->buflock, flags);
> +}
> +
> +static int usb3hdcap_start_streaming(struct vb2_queue *vq, unsigned int count)
> +{
> +	struct usb3hdcap *hdcap = vb2_get_drv_priv(vq);
> +	int ret;
> +
> +	/* read() on fd that outlived the disconnect */
> +	if (!hdcap->usb_dev) {
> +		usb3hdcap_return_bufs(hdcap, VB2_BUF_STATE_QUEUED);
> +		return -ENODEV;
> +	}
> +
> +	hdcap->sequence = 0;
> +	ret = usb3hdcap_start(hdcap);
> +	return ret;
> +}
> +
> +static void usb3hdcap_stop_streaming(struct vb2_queue *vq)
> +{
> +	struct usb3hdcap *hdcap = vb2_get_drv_priv(vq);
> +
> +	usb3hdcap_stop(hdcap, VB2_BUF_STATE_ERROR);
> +}
> +
> +const struct vb2_ops usb3hdcap_vb2_ops = {
> +	.queue_setup = usb3hdcap_queue_setup,
> +	.buf_prepare = usb3hdcap_buf_prepare,
> +	.buf_queue = usb3hdcap_buf_queue,
> +	.start_streaming = usb3hdcap_start_streaming,
> +	.stop_streaming = usb3hdcap_stop_streaming,
> +};
> diff --git a/drivers/media/usb/usb3hdcap/usb3hdcap.h b/drivers/media/usb/usb3hdcap/usb3hdcap.h
> new file mode 100644
> index 000000000000..c680ddf9c42d
> --- /dev/null
> +++ b/drivers/media/usb/usb3hdcap/usb3hdcap.h
> @@ -0,0 +1,241 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef USB3HDCAP_H
> +#define USB3HDCAP_H
> +
> +#include <linux/i2c.h>
> +#include <linux/usb.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/videobuf2-core.h>
> +#include <media/videobuf2-v4l2.h>
> +
> +struct dentry;
> +struct snd_card;
> +struct snd_pcm_substream;
> +
> +#define USB3HDCAP_V4L2_STDS (V4L2_STD_NTSC | V4L2_STD_PAL)
> +
> +/* NTSC SD frame format */
> +#define SD_WIDTH       720
> +#define NTSC_HEIGHT    480
> +/* YUYV = 4 bytes/2 pixels */
> +#define DEFAULT_BPL    (SD_WIDTH * 2)
> +/* PAL SD frame format */
> +#define PAL_HEIGHT    576
> +
> +enum usb3hdcap_input {
> +	INPUT_COMPOSITE = 0,
> +	INPUT_SVIDEO    = 1,
> +	INPUT_COMPONENT = 2,
> +	INPUT_HDMI      = 3,
> +};
> +
> +/* I2C 8-bit addresses */
> +#define ADDR_MST3367 0x9c
> +#define ADDR_TW9900  0x88
> +#define ADDR_CS53L21 0x94
> +#define ADDR_CPLD    0x98
> +#define ADDR_MCU     0x64 /* Nuvoton NUC100 on XCAPTURE-1 */
> +
> +/* TW9900 registers */
> +#define TW9900_CSTATUS    0x01
> +#define TW9900_INFORM     0x02
> +#define TW9900_OPFORM     0x03
> +#define TW9900_OPCNTL_I   0x05
> +#define TW9900_ACNTL_I    0x06
> +#define TW9900_CROP_HI    0x07
> +#define TW9900_VDELAY_LO  0x08
> +#define TW9900_VACTIVE_LO 0x09
> +#define TW9900_HDELAY_LO  0x0a
> +#define TW9900_HACTIVE_LO 0x0b
> +#define TW9900_CNTRL2     0x0d
> +#define TW9900_SDT_NOISE  0x0e
> +#define TW9900_LUMA_CTL   0x0f
> +#define TW9900_BRIGHT     0x10
> +#define TW9900_CONTRAST   0x11
> +#define TW9900_SHARPNESS  0x12
> +#define TW9900_SAT_U      0x13
> +#define TW9900_SAT_V      0x14
> +#define TW9900_HUE        0x15
> +#define TW9900_VBICNTL    0x19
> +#define TW9900_ACNTL_II   0x1a
> +#define TW9900_OPCNTL_II  0x1b
> +#define TW9900_SDT        0x1c
> +#define TW9900_SDTR       0x1d
> +#define TW9900_VCNTL1     0x28
> +#define TW9900_VCNTL2     0x29
> +#define TW9900_MISC1      0x2d
> +#define TW9900_MISC2      0x2f
> +#define TW9900_CSTATUS_II 0x31
> +#define TW9900_ANAPLLCTL  0x4c
> +#define TW9900_VVBI       0x55
> +#define TW9900_HSBEGIN    0x6b
> +#define TW9900_HSEND      0x6c
> +#define TW9900_OVSDLY     0x6d
> +#define TW9900_OVSEND     0x6e
> +
> +/* CS53L21 registers */
> +#define CS53L21_MIC_PWR_CTL  0x03
> +#define CS53L21_IFACE_CTL    0x04
> +#define CS53L21_ADC_IN_SEL   0x07
> +#define CS53L21_SPE_CTL      0x09
> +#define CS53L21_ALC_PGAA     0x0a
> +#define CS53L21_ALC_PGAB     0x0b
> +#define CS53L21_ADCA_ATT     0x0c
> +#define CS53L21_ADCB_ATT     0x0d
> +#define CS53L21_ADCA_MIX_VOL 0x0e
> +#define CS53L21_ADCB_MIX_VOL 0x0f
> +#define CS53L21_CH_MIXER     0x18
> +#define CS53L21_ALC_EN_ATK   0x1c
> +
> +#define USB3HDCAP_VID 0x1164
> +#define USB3HDCAP_PID 0xf533
> +#define XCAPTURE1_PID 0xf531
> +
> +/* Vendor request codes */
> +#define REQ_I2C    0xc0
> +#define REQ_GPIO   0xc1
> +#define REQ_INIT   0xc2
> +#define REQ_WATCH  0xc6
> +#define REQ_UNK_C7 0xc7
> +#define REQ_UNK_EC 0xec
> +
> +/* Isochronous transfer parameters */
> +#define EP_VIDEO     0x83
> +#define NUM_XFERS    8
> +#define NUM_ISO_PKTS 64
> +#define MIN_ISO_PKTS 8
> +
> +/*
> + * Stream framing:
> + *   SAV (ff 00 00 XY): bpl-1 pixel bytes, -1 because the XY is actually
> + *   in the first pixel's V position... weird but it's correct
> + *   Marker (ff 00 ff NN):  audio - NN = number of stereo s16le
> + *                          samples, audio data = NN * 4 bytes
> + */
> +#define SAV_LEN        4
> +#define MARKER_LEN     4
> +
> +/* BT.656 SAV XY bits */
> +#define BT656_F_BIT 0x40
> +#define BT656_V_BIT 0x20
> +
> +struct hdcap_buf {
> +	struct vb2_v4l2_buffer vb;
> +	struct list_head list;
> +};
> +
> +struct usb3hdcap {
> +	struct device *dev;
> +	struct usb_device *usb_dev;
> +	struct v4l2_device v4l2_dev;
> +	struct video_device video_dev;
> +	struct vb2_queue vb2q;
> +
> +	struct i2c_adapter i2c_adap;
> +	struct v4l2_subdev *sd_tw9900;
> +	struct v4l2_subdev *sd_mst3367;
> +
> +	struct v4l2_ctrl_handler ctrl;
> +	struct v4l2_ctrl *ctrl_brightness;
> +	struct v4l2_ctrl *ctrl_contrast;
> +	struct v4l2_ctrl *ctrl_saturation;
> +	struct v4l2_ctrl *ctrl_hue;
> +	struct v4l2_ctrl *ctrl_sharpness;
> +	struct v4l2_ctrl *ctrl_rx_power;
> +
> +	/*
> +	 * Serializes V4L2 ioctls, videobuf2 queue operations and device
> +	 * state. Also taken on disconnect to clear usb_dev.
> +	 */
> +	struct mutex lock;
> +	/* serializes write then read for XCAPTURE-1 */
> +	struct mutex mcu_lock;
> +
> +	/* buffer list */
> +	spinlock_t buflock;
> +	struct list_head bufs;
> +
> +	/* ISO URBs */
> +	int iso_size;
> +	struct urb *isoc_urbs[NUM_XFERS];
> +
> +	/* frame tracking */
> +	unsigned int sequence;
> +
> +	enum usb3hdcap_input input;
> +	/* current standard, composite and S-Video only */
> +	v4l2_std_id std;
> +	/* current timings, component and HDMI only */
> +	struct v4l2_dv_timings timings;
> +	bool no_signal;
> +	int width;
> +	int height;
> +	int interlaced;
> +	int bpl; /* width * 2 */
> +
> +	/* stream parser state */
> +	u8 *parse_buf;
> +	int parse_buf_size;
> +	int parse_len;
> +	struct hdcap_buf *cur_buf;
> +	int frame_line;
> +	int synced;
> +	int was_blanking;
> +	/* BT.656 F bit of the field being captured */
> +	u8 field_f;
> +	u8 top_done;
> +
> +	/* hardware init state */
> +	int hw_inited;
> +	int has_mcu; /* Nuvoton MCU present (XCAPTURE-1) */
> +
> +	/* MST3367 state */
> +	int mst_current_bank;
> +	bool mst_bt601;
> +
> +	/* ALSA audio */
> +	struct snd_card *snd;
> +	struct snd_pcm_substream *snd_substream;
> +	atomic_t snd_stream;
> +	size_t snd_buffer_pos;
> +	size_t snd_period_pos;
> +
> +	/* diagnostics */
> +	unsigned int iso_cb_count;
> +	unsigned long iso_bytes;
> +	unsigned int markers_found;
> +	unsigned int frames_delivered;
> +};
> +
> +/* USB control helpers (usb3hdcap-core.c) */
> +int vendor_out(struct usb3hdcap *hdcap, u8 request, u16 value, u16 index,
> +	       u8 *data, u16 len);
> +int u3hc_i2c_write(struct usb3hdcap *hdcap, u8 addr, u8 reg, u8 val);
> +int u3hc_i2c_read(struct usb3hdcap *hdcap, u8 addr, u8 reg);
> +int u3hc_i2c_rmw(struct usb3hdcap *hdcap, u8 addr, u8 reg, u8 mask, u8 bits);
> +
> +/* Composite (usb3hdcap-composite.c) */
> +int usb3hdcap_composite_register(struct usb3hdcap *hdcap);
> +int usb3hdcap_composite_init(struct usb3hdcap *hdcap);
> +int usb3hdcap_composite_querystd(struct usb3hdcap *hdcap, v4l2_std_id *std);
> +int usb3hdcap_composite_set_std(struct usb3hdcap *hdcap, v4l2_std_id std);
> +
> +/* HDMI + Component (usb3hdcap-hdmi.c) */
> +int usb3hdcap_hdmi_register(struct usb3hdcap *hdcap);
> +int usb3hdcap_hdmi_init(struct usb3hdcap *hdcap);
> +int usb3hdcap_component_init(struct usb3hdcap *hdcap);
> +int usb3hdcap_hd_set_timings(struct usb3hdcap *hdcap,
> +			     struct v4l2_dv_timings *timings);
> +void usb3hdcap_hdmi_hotplug(struct usb3hdcap *hdcap, bool hotplug);
> +
> +/* Video/streaming (usb3hdcap-video.c) */
> +extern const struct vb2_ops usb3hdcap_vb2_ops;
> +
> +/* Audio (usb3hdcap-audio.c) */
> +int usb3hdcap_cs53l21_init(struct usb3hdcap *hdcap);
> +int usb3hdcap_audio_init(struct usb3hdcap *hdcap);
> +void usb3hdcap_audio_free(struct usb3hdcap *hdcap);
> +void usb3hdcap_audio_data(struct usb3hdcap *hdcap, const u8 *data, int len);
> +
> +#endif

Regards,

	Hans
