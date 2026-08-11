Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C2B37F307
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 03:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786420791; cv=none; b=BDfjShRskPcE03ozMXDDJfYvbpB+WyuiQgalJYirG9yEuS8hoMnPlkSQ5Dpl1HLtshKE2SCLu8VTW+rgfW3+D/Ub0OClahlcJwfvU/OUQD/FtMYfsSk2cKCUwg7+k6PKCF6/n4nqA670oupmrZIC7w0KUim7BsVclFujNZUs9ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786420791; c=relaxed/simple;
	bh=xiVDGWTEDmU1Wiq18KKoNLhZmIsnKRZUa9Y+ikLcILg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fw6WU7Ho+8GXdNGWPwgbhil9lMy1NGL88v8tpSKnFsumxOzXmY+BTUGdBKHgVoU3HpFrb8za2e7unkmUBIFzJGLnGwe8XuZqw8NQGrMdG1rWUnbMyXr4XO0CGS4TRHfaGvx52vXsAmXZBmWOxhS5sEA7ahYSOniGFeHOJ7/w8y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jkpfmzTV; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jkpfmzTV"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49553515a8bso40175645e9.1
        for <linux-media@vger.kernel.org>; Mon, 10 Aug 2026 20:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786420787; x=1787025587; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HKFgRZj/2i5Z0qiAnZwPZtS8KLmwU9/bQbhWxuzTWnw=;
        b=jkpfmzTVmwg0UQSjkTTrnKZ+pU8UW7ZzQlYawHUH5jFkXAFjlD7KtimEEBsA9b/pU5
         8sgqpfgrIbBRV0JIE5JF4lH7E/I1kaKE/U6QZWYhxr1t2jPc09Vbi1GmWZvHYdYDNJNX
         SK1Jk0kzIJHA2pVBLy6ZU5pJ88Br3vaRmGbBcClwMWkjetsca2C0oTUPq7NK1OXLVzPk
         g/QCF4FRIKsdu3IAZnJPUXNL5AmAzxO2mSI6zUaR5Mh2RIw0FDiGzvX6EfmxdEaefKhn
         77ogwLJobA9xC0T2a+pXXYLqGV9pLO2sDaaTogQgr0IGvVPhHjqivj+g0qC75X2TQ3dx
         dHxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786420787; x=1787025587;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HKFgRZj/2i5Z0qiAnZwPZtS8KLmwU9/bQbhWxuzTWnw=;
        b=D/KyFWiM1CMbxL8CvTznDv6utH/kFcfGD7sEgTiT/Ux9ujiLLY5AVkyheQmGImDiQh
         ZOZWdfSHXGZvxDg439eQGvZ8x3W4I5yhvNwWvWRaciZOR+jDyc/FiXO9Gtf4IpusRo6X
         rYZ6belan+kj1Al2cZ/9tp23zKDbVFkqV3FXRnYMAR5CT4MaociTWzviVvBPR5vNS/yB
         7arPijk1wPofeX6SeCxA52YXkROJgKSZ/sFvN9DCtboE+semlMkCKAmwBUy8WMRV8grC
         7ahlg7pt3YoBFgo/hZkS8fXpDMbX0nEax1i7NmK+VTTlBTs2Y4YRKRs7u1Gyokos+0rx
         yjwg==
X-Gm-Message-State: AOJu0YwL8kWgyInpUTAHnUYo3/aTOz3omjMikGY+KWeVR676xqibzVRY
	XErV8pXH/l8YXZrokCnaBcyfrbfISvZs6WCNgIywrylNGjfG9siimz6n
X-Gm-Gg: AR+sD12+pgc7EsmHUqbLzmOWvo5/z+IR77DOwwUnuwibzs9oC2k4PBQZBV9SYO9nHv9
	eCCtpxQ2LPXgZoZj0ak+fQgsN5SRCX/BEVnG+NhNnL2IvAW1Ud71W/GO3668U5SbAYhZ6m4es75
	cN+uy3sgQvH2nlVr5c64aaLlBkEzpqo1x7pqKWhgak9qth+C3RPYB2JAef94jA05WCM5FjEKPt2
	JWyhejX9olt4Hj+GoANuodb6vgQ7A9feWsqAH4t1hQwfcrBa+PFwf9sLBfAl8A3aNLBBRJuYwmI
	2+I6N6Hm2uJEicsYvKygu0VAsRQuuGtw7v6zubHpMa00e/L5JHzv3TGuedvNP/T5MQD9Pj70yDi
	kT0J+2QQRA9ceAX483rLcdtvqwl5AG+IDed2W7ZFoT+ti/SCISWL7GSMIcJdOV+w69KyJzHVJzV
	cKY7gOsFeD+XBvsY7JRaS5PPRA9MBwDpPQq27izxYf2wohsReb5EqGALaMExssOTnOQSGqCRhGd
	5L4r8a/ZDIJOvEQpkTeNh4=
X-Received: by 2002:a05:600c:3b0c:b0:499:48bb:417e with SMTP id 5b1f17b1804b1-4997842c0a1mr6227645e9.2.1786420787114;
        Mon, 10 Aug 2026 20:59:47 -0700 (PDT)
Received: from localhost ([77.237.184.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49977e641d1sm18510195e9.3.2026.08.10.20.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 20:59:46 -0700 (PDT)
Date: Tue, 11 Aug 2026 07:29:36 +0330
From: Ali Nasrollahi <a.nasrolahi01@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mchehab@kernel.org, Frank.Li@nxp.com, hverkuil+cisco@kernel.org, 
	guoniu.zhou@oss.nxp.com
Subject: Re: [PATCH] media: v4l2-core: make number of video devices
 configurable
Message-ID: <anqdNsu7VS63YKOo@zephyr>
References: <20260810162406.118981-2-A.Nasrolahi01@gmail.com>
 <20260810162858.GA3012183@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810162858.GA3012183@killaraus.ideasonboard.com>

On 26/08/10 07:28PM, Laurent Pinchart wrote:
> On Mon, Aug 10, 2026 at 07:54:07PM +0330, Ali Nasrollahi wrote:
> > The V4L2 core currently limits the number of registered video devices to
> > 256. This can become a restriction for workloads that create a large
> > number of virtual video devices, such as v4l2loopback instances.
> 
> We don't support v4l2loopback upstream though.
> 

Yes, you are correct.

But perhaps my description was a bit misleading. The main idea of this
patch is not to support out-of-tree modules by any means, but to allow a
configurable number of V4L2 devices to be created and used, whether
through loopback devices or other means.


> > Make the maximum number of video devices configurable through a module
> > parameter. The default and minimum remain at the existing limit of 256,
> > while the maximum is capped at 4096.
> > 
> > The parameter is only available when CONFIG_VIDEO_FIXED_MINOR_RANGES is
> > disabled, as the fixed minor allocation scheme relies on the existing
> > minor ranges.
> > 
> > The device array is allocated according to the configured limit, while
> > the allocation bitmaps remain statically sized to the maximum supported
> > limit of 4096.
> > 
> > Signed-off-by: Ali Nasrollahi <A.Nasrolahi01@gmail.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-dev.c | 70 +++++++++++++++++++++++-------
> >  1 file changed, 55 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> > index fd267fb74905..5a526b577970 100644
> > --- a/drivers/media/v4l2-core/v4l2-dev.c
> > +++ b/drivers/media/v4l2-core/v4l2-dev.c
> > @@ -31,7 +31,8 @@
> >  #include <media/v4l2-ioctl.h>
> >  #include <media/v4l2-event.h>
> >  
> > -#define VIDEO_NUM_DEVICES	256
> > +#define VIDEO_MIN_NUM_DEVICES	256
> > +#define VIDEO_MAX_NUM_DEVICES	4096
> >  #define VIDEO_NAME              "video4linux"
> >  
> >  #define dprintk(fmt, arg...) do {					\
> > @@ -39,6 +40,27 @@
> >  		       __func__, ##arg);				\
> >  } while (0)
> >  
> > +static unsigned int video_nr_devices = VIDEO_MIN_NUM_DEVICES;
> > +
> > +#ifndef CONFIG_VIDEO_FIXED_MINOR_RANGES
> > +static int param_set_video_nr_devices(const char *val,
> > +				      const struct kernel_param *kp)
> > +{
> > +	return param_set_uint_minmax(val, kp, VIDEO_MIN_NUM_DEVICES,
> > +				     VIDEO_MAX_NUM_DEVICES);
> > +}
> > +
> > +static const struct kernel_param_ops param_ops_video_nr_devices = {
> > +	.set = param_set_video_nr_devices,
> > +	.get = param_get_uint,
> > +};
> > +
> > +module_param_cb(video_nr_devices, &param_ops_video_nr_devices,
> > +		&video_nr_devices, 0444);
> > +
> > +MODULE_PARM_DESC(video_nr_devices, "Maximum number of V4L2 devices (256-4096)");
> > +#endif
> > +
> >  /*
> >   *	sysfs stuff
> >   */
> > @@ -98,9 +120,14 @@ static struct dentry *v4l2_debugfs_root_dir;
> >  /*
> >   *	Active devices
> >   */
> > -static struct video_device *video_devices[VIDEO_NUM_DEVICES];
> > +#ifdef CONFIG_VIDEO_FIXED_MINOR_RANGES
> > +static struct video_device *video_devices[VIDEO_MIN_NUM_DEVICES];
> > +static DECLARE_BITMAP(devnode_nums[VFL_TYPE_MAX], VIDEO_MIN_NUM_DEVICES);
> > +#else
> > +static struct video_device **video_devices;
> > +static DECLARE_BITMAP(devnode_nums[VFL_TYPE_MAX], VIDEO_MAX_NUM_DEVICES);
> > +#endif
> >  static DEFINE_MUTEX(videodev_lock);
> > -static DECLARE_BITMAP(devnode_nums[VFL_TYPE_MAX], VIDEO_NUM_DEVICES);
> >  
> >  /* Device node utility functions */
> >  
> > @@ -504,7 +531,7 @@ static const struct file_operations v4l2_fops = {
> >   * in the video_device array, but it was able to obtain a minor number.
> >   *
> >   * This means that we can always obtain a free stream index number since
> > - * the worst case scenario is that there are VIDEO_NUM_DEVICES - 1 slots in
> > + * the worst case scenario is that there are video_nr_devices - 1 slots in
> >   * use of the video_device array.
> >   *
> >   * Returns a free index number.
> > @@ -513,19 +540,19 @@ static int get_index(struct video_device *vdev)
> >  {
> >  	/* This can be static since this function is called with the global
> >  	   videodev_lock held. */
> > -	static DECLARE_BITMAP(used, VIDEO_NUM_DEVICES);
> > +	static DECLARE_BITMAP(used, VIDEO_MAX_NUM_DEVICES);
> >  	int i;
> >  
> > -	bitmap_zero(used, VIDEO_NUM_DEVICES);
> > +	bitmap_zero(used, VIDEO_MAX_NUM_DEVICES);
> >  
> > -	for (i = 0; i < VIDEO_NUM_DEVICES; i++) {
> > +	for (i = 0; i < video_nr_devices; i++) {
> >  		if (video_devices[i] != NULL &&
> >  		    video_devices[i]->v4l2_dev == vdev->v4l2_dev) {
> >  			__set_bit(video_devices[i]->index, used);
> >  		}
> >  	}
> >  
> > -	return find_first_zero_bit(used, VIDEO_NUM_DEVICES);
> > +	return find_first_zero_bit(used, video_nr_devices);
> >  }
> >  
> >  #define SET_VALID_IOCTL(ops, cmd, op) \
> > @@ -915,7 +942,7 @@ int __video_register_device(struct video_device *vdev,
> >  	int i = 0;
> >  	int ret;
> >  	int minor_offset = 0;
> > -	int minor_cnt = VIDEO_NUM_DEVICES;
> > +	int minor_cnt = video_nr_devices;
> >  	const char *name_base;
> >  
> >  	/* A minor value of -1 marks this video device as never
> > @@ -1020,10 +1047,10 @@ int __video_register_device(struct video_device *vdev,
> >  #else
> >  	/* The device node number and minor numbers are independent, so
> >  	   we just find the first free minor number. */
> > -	for (i = 0; i < VIDEO_NUM_DEVICES; i++)
> > +	for (i = 0; i < video_nr_devices; i++)
> >  		if (video_devices[i] == NULL)
> >  			break;
> > -	if (i == VIDEO_NUM_DEVICES) {
> > +	if (i == video_nr_devices) {
> >  		mutex_unlock(&videodev_lock);
> >  		pr_err("could not get a free minor\n");
> >  		return -ENFILE;
> > @@ -1032,7 +1059,7 @@ int __video_register_device(struct video_device *vdev,
> >  	vdev->minor = i + minor_offset;
> >  	vdev->num = nr;
> >  
> > -	if (WARN_ON(vdev->minor >= VIDEO_NUM_DEVICES)) {
> > +	if (WARN_ON(vdev->minor >= video_nr_devices)) {
> >  		mutex_unlock(&videodev_lock);
> >  		return -EINVAL;
> >  	}
> > @@ -1241,7 +1268,7 @@ static int __init videodev_init(void)
> >  	int ret;
> >  
> >  	pr_info("Linux video capture interface: v2.00\n");
> > -	ret = register_chrdev_region(dev, VIDEO_NUM_DEVICES, VIDEO_NAME);
> > +	ret = register_chrdev_region(dev, video_nr_devices, VIDEO_NAME);
> >  	if (ret < 0) {
> >  		pr_warn("videodev: unable to get major %d\n",
> >  				VIDEO_MAJOR);
> > @@ -1250,11 +1277,21 @@ static int __init videodev_init(void)
> >  
> >  	ret = class_register(&video_class);
> >  	if (ret < 0) {
> > -		unregister_chrdev_region(dev, VIDEO_NUM_DEVICES);
> > +		unregister_chrdev_region(dev, video_nr_devices);
> >  		pr_warn("video_dev: class_register failed\n");
> >  		return -EIO;
> >  	}
> >  
> > +#ifndef CONFIG_VIDEO_FIXED_MINOR_RANGES
> > +	video_devices = kzalloc_objs(*video_devices, video_nr_devices);
> > +	if (!video_devices) {
> > +		class_unregister(&video_class);
> > +		unregister_chrdev_region(dev, video_nr_devices);
> > +		pr_warn("video_dev: failed to allocate video_devices\n");
> > +		return -ENOMEM;
> > +	}
> > +#endif
> > +
> >  	return 0;
> >  }
> >  
> > @@ -1262,8 +1299,11 @@ static void __exit videodev_exit(void)
> >  {
> >  	dev_t dev = MKDEV(VIDEO_MAJOR, 0);
> >  
> > +#ifndef CONFIG_VIDEO_FIXED_MINOR_RANGES
> > +	kvfree(video_devices);
> > +#endif
> >  	class_unregister(&video_class);
> > -	unregister_chrdev_region(dev, VIDEO_NUM_DEVICES);
> > +	unregister_chrdev_region(dev, video_nr_devices);
> >  	debugfs_remove_recursive(v4l2_debugfs_root_dir);
> >  	v4l2_debugfs_root_dir = NULL;
> >  }
> 
> -- 
> Regards,
> 
> Laurent Pinchart

Cheers,
    Ali

