Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A1D3F4854;
	Mon, 10 Aug 2026 16:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786379344; cv=none; b=ue1L3iGWIHC14hL/hRKliwmvHnNrFyW2HYljPrl2HcCMLn0DHifM7LzjQ8+g6QhRVhjqk/af3uVxWGTGjyoyUwxdmKqp/VJTY74zmMTec8QJ7iW1Bc38dMpWCcVdSZI28+b7VV5KyQ5r+TkvxvrcykhnqeODSHOV6/9zKi1K/xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786379344; c=relaxed/simple;
	bh=jJNjLStpPeNYF9zCNXMZJpQw2Z3R2h7Km5P/3NNSPV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=slHCBjaL7SYPuADxd4U8vqkxBFCbTY9lj4UP8qLynG4DN4A9SrAiPjB6g2fSjAy7oWeC3RUPECvTQwsQc357/m+JjqEBC46z6Epdq1loTb79j59wGhbKZIi+o+BqT0p+ubfbPvqpwgsWqFNwILDqdSGZmAIHF+Vw9v70SrAVuMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=u3WQ+rqt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="u3WQ+rqt"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 17EAF12F;
	Mon, 10 Aug 2026 18:27:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1786379266;
	bh=jJNjLStpPeNYF9zCNXMZJpQw2Z3R2h7Km5P/3NNSPV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u3WQ+rqtErN9Zyb11fbroqvBkXDHWR9YCJbBgCLBxXzFMUfX6VYaCgB5ePxaXxbIZ
	 5BsIs7Czssv13soTMIbcFXN51Y3r8LZe0EuVx6NmKQ55PB5hYqc97SIwUPE40x5iMl
	 9NoNG55yPrlfxfT3cYErSTwkbuMoTUeH3zJnIKiY=
Date: Mon, 10 Aug 2026 19:28:58 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ali Nasrollahi <a.nasrolahi01@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	mchehab@kernel.org, Frank.Li@nxp.com, hverkuil+cisco@kernel.org,
	guoniu.zhou@oss.nxp.com
Subject: Re: [PATCH] media: v4l2-core: make number of video devices
 configurable
Message-ID: <20260810162858.GA3012183@killaraus.ideasonboard.com>
References: <20260810162406.118981-2-A.Nasrolahi01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260810162406.118981-2-A.Nasrolahi01@gmail.com>

On Mon, Aug 10, 2026 at 07:54:07PM +0330, Ali Nasrollahi wrote:
> The V4L2 core currently limits the number of registered video devices to
> 256. This can become a restriction for workloads that create a large
> number of virtual video devices, such as v4l2loopback instances.

We don't support v4l2loopback upstream though.

> Make the maximum number of video devices configurable through a module
> parameter. The default and minimum remain at the existing limit of 256,
> while the maximum is capped at 4096.
> 
> The parameter is only available when CONFIG_VIDEO_FIXED_MINOR_RANGES is
> disabled, as the fixed minor allocation scheme relies on the existing
> minor ranges.
> 
> The device array is allocated according to the configured limit, while
> the allocation bitmaps remain statically sized to the maximum supported
> limit of 4096.
> 
> Signed-off-by: Ali Nasrollahi <A.Nasrolahi01@gmail.com>
> ---
>  drivers/media/v4l2-core/v4l2-dev.c | 70 +++++++++++++++++++++++-------
>  1 file changed, 55 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index fd267fb74905..5a526b577970 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -31,7 +31,8 @@
>  #include <media/v4l2-ioctl.h>
>  #include <media/v4l2-event.h>
>  
> -#define VIDEO_NUM_DEVICES	256
> +#define VIDEO_MIN_NUM_DEVICES	256
> +#define VIDEO_MAX_NUM_DEVICES	4096
>  #define VIDEO_NAME              "video4linux"
>  
>  #define dprintk(fmt, arg...) do {					\
> @@ -39,6 +40,27 @@
>  		       __func__, ##arg);				\
>  } while (0)
>  
> +static unsigned int video_nr_devices = VIDEO_MIN_NUM_DEVICES;
> +
> +#ifndef CONFIG_VIDEO_FIXED_MINOR_RANGES
> +static int param_set_video_nr_devices(const char *val,
> +				      const struct kernel_param *kp)
> +{
> +	return param_set_uint_minmax(val, kp, VIDEO_MIN_NUM_DEVICES,
> +				     VIDEO_MAX_NUM_DEVICES);
> +}
> +
> +static const struct kernel_param_ops param_ops_video_nr_devices = {
> +	.set = param_set_video_nr_devices,
> +	.get = param_get_uint,
> +};
> +
> +module_param_cb(video_nr_devices, &param_ops_video_nr_devices,
> +		&video_nr_devices, 0444);
> +
> +MODULE_PARM_DESC(video_nr_devices, "Maximum number of V4L2 devices (256-4096)");
> +#endif
> +
>  /*
>   *	sysfs stuff
>   */
> @@ -98,9 +120,14 @@ static struct dentry *v4l2_debugfs_root_dir;
>  /*
>   *	Active devices
>   */
> -static struct video_device *video_devices[VIDEO_NUM_DEVICES];
> +#ifdef CONFIG_VIDEO_FIXED_MINOR_RANGES
> +static struct video_device *video_devices[VIDEO_MIN_NUM_DEVICES];
> +static DECLARE_BITMAP(devnode_nums[VFL_TYPE_MAX], VIDEO_MIN_NUM_DEVICES);
> +#else
> +static struct video_device **video_devices;
> +static DECLARE_BITMAP(devnode_nums[VFL_TYPE_MAX], VIDEO_MAX_NUM_DEVICES);
> +#endif
>  static DEFINE_MUTEX(videodev_lock);
> -static DECLARE_BITMAP(devnode_nums[VFL_TYPE_MAX], VIDEO_NUM_DEVICES);
>  
>  /* Device node utility functions */
>  
> @@ -504,7 +531,7 @@ static const struct file_operations v4l2_fops = {
>   * in the video_device array, but it was able to obtain a minor number.
>   *
>   * This means that we can always obtain a free stream index number since
> - * the worst case scenario is that there are VIDEO_NUM_DEVICES - 1 slots in
> + * the worst case scenario is that there are video_nr_devices - 1 slots in
>   * use of the video_device array.
>   *
>   * Returns a free index number.
> @@ -513,19 +540,19 @@ static int get_index(struct video_device *vdev)
>  {
>  	/* This can be static since this function is called with the global
>  	   videodev_lock held. */
> -	static DECLARE_BITMAP(used, VIDEO_NUM_DEVICES);
> +	static DECLARE_BITMAP(used, VIDEO_MAX_NUM_DEVICES);
>  	int i;
>  
> -	bitmap_zero(used, VIDEO_NUM_DEVICES);
> +	bitmap_zero(used, VIDEO_MAX_NUM_DEVICES);
>  
> -	for (i = 0; i < VIDEO_NUM_DEVICES; i++) {
> +	for (i = 0; i < video_nr_devices; i++) {
>  		if (video_devices[i] != NULL &&
>  		    video_devices[i]->v4l2_dev == vdev->v4l2_dev) {
>  			__set_bit(video_devices[i]->index, used);
>  		}
>  	}
>  
> -	return find_first_zero_bit(used, VIDEO_NUM_DEVICES);
> +	return find_first_zero_bit(used, video_nr_devices);
>  }
>  
>  #define SET_VALID_IOCTL(ops, cmd, op) \
> @@ -915,7 +942,7 @@ int __video_register_device(struct video_device *vdev,
>  	int i = 0;
>  	int ret;
>  	int minor_offset = 0;
> -	int minor_cnt = VIDEO_NUM_DEVICES;
> +	int minor_cnt = video_nr_devices;
>  	const char *name_base;
>  
>  	/* A minor value of -1 marks this video device as never
> @@ -1020,10 +1047,10 @@ int __video_register_device(struct video_device *vdev,
>  #else
>  	/* The device node number and minor numbers are independent, so
>  	   we just find the first free minor number. */
> -	for (i = 0; i < VIDEO_NUM_DEVICES; i++)
> +	for (i = 0; i < video_nr_devices; i++)
>  		if (video_devices[i] == NULL)
>  			break;
> -	if (i == VIDEO_NUM_DEVICES) {
> +	if (i == video_nr_devices) {
>  		mutex_unlock(&videodev_lock);
>  		pr_err("could not get a free minor\n");
>  		return -ENFILE;
> @@ -1032,7 +1059,7 @@ int __video_register_device(struct video_device *vdev,
>  	vdev->minor = i + minor_offset;
>  	vdev->num = nr;
>  
> -	if (WARN_ON(vdev->minor >= VIDEO_NUM_DEVICES)) {
> +	if (WARN_ON(vdev->minor >= video_nr_devices)) {
>  		mutex_unlock(&videodev_lock);
>  		return -EINVAL;
>  	}
> @@ -1241,7 +1268,7 @@ static int __init videodev_init(void)
>  	int ret;
>  
>  	pr_info("Linux video capture interface: v2.00\n");
> -	ret = register_chrdev_region(dev, VIDEO_NUM_DEVICES, VIDEO_NAME);
> +	ret = register_chrdev_region(dev, video_nr_devices, VIDEO_NAME);
>  	if (ret < 0) {
>  		pr_warn("videodev: unable to get major %d\n",
>  				VIDEO_MAJOR);
> @@ -1250,11 +1277,21 @@ static int __init videodev_init(void)
>  
>  	ret = class_register(&video_class);
>  	if (ret < 0) {
> -		unregister_chrdev_region(dev, VIDEO_NUM_DEVICES);
> +		unregister_chrdev_region(dev, video_nr_devices);
>  		pr_warn("video_dev: class_register failed\n");
>  		return -EIO;
>  	}
>  
> +#ifndef CONFIG_VIDEO_FIXED_MINOR_RANGES
> +	video_devices = kzalloc_objs(*video_devices, video_nr_devices);
> +	if (!video_devices) {
> +		class_unregister(&video_class);
> +		unregister_chrdev_region(dev, video_nr_devices);
> +		pr_warn("video_dev: failed to allocate video_devices\n");
> +		return -ENOMEM;
> +	}
> +#endif
> +
>  	return 0;
>  }
>  
> @@ -1262,8 +1299,11 @@ static void __exit videodev_exit(void)
>  {
>  	dev_t dev = MKDEV(VIDEO_MAJOR, 0);
>  
> +#ifndef CONFIG_VIDEO_FIXED_MINOR_RANGES
> +	kvfree(video_devices);
> +#endif
>  	class_unregister(&video_class);
> -	unregister_chrdev_region(dev, VIDEO_NUM_DEVICES);
> +	unregister_chrdev_region(dev, video_nr_devices);
>  	debugfs_remove_recursive(v4l2_debugfs_root_dir);
>  	v4l2_debugfs_root_dir = NULL;
>  }

-- 
Regards,

Laurent Pinchart
