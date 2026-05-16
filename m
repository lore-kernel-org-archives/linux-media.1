Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1472580CF;
	Sat, 16 May 2026 11:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778931445; cv=none; b=LM9aWB0JuIiIeMN0Lh6uX9Jl+a0V4QT7q2n1r2aHwaPE8P5dhWupDxOZziXtPyckt3cViebWBTPNPmX93P3B05xEU0N1Vld5tLwJY8qdfi9dDdT936/wq+EAb1zCmE20yaC/TVACj2Z9guYmkXxvJbcmvXbX7gAhUZ10IdxfMc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778931445; c=relaxed/simple;
	bh=8LMT1TIsNVvknyrLg69MYjeZewa0zQXqnKxuS28eL+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CRMEVAkmQ+TPhMgeDQKSQg5Jc6EPlVPs7GueTGhDt8AYqeueS+VeY2coPYrq/C/WyZAYrXTbI4yTKmBB1INM6iFWX1QG4mT3IRYGzjFxi8CZFA7Y5Lnwxg+KZ4l03LZI7q8q06DtEWElE9EVFx8TC4IurzTZqhr5CoGk42skp8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MPbcEsl3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MPbcEsl3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFD8CC19425;
	Sat, 16 May 2026 11:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778931444;
	bh=8LMT1TIsNVvknyrLg69MYjeZewa0zQXqnKxuS28eL+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MPbcEsl37NrIoi6gkugdu76RGm+1B1heXb0avm7x3+5zUv3BKP6/+DAud92stKTIy
	 kVV9us91F1CU39b8ftDkbwPgqSfZj9wdQ9o3dELEOwiFS9+rHKDvQMw0oRxHPIFE8N
	 CasPNjOXD9veE4YohlCf8+S1cGeUkKhoENg/gaYk=
Date: Sat, 16 May 2026 13:37:28 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Julian Orth <ju.orth@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
	wayland-devel@lists.freedesktop.org
Subject: Re: [PATCH 12/12] misc/syncobj: add new device
Message-ID: <2026051653-walmart-morally-3be7@gregkh>
References: <20260516-jorth-syncobj-v1-0-88ede9d98a81@gmail.com>
 <20260516-jorth-syncobj-v1-12-88ede9d98a81@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516-jorth-syncobj-v1-12-88ede9d98a81@gmail.com>

On Sat, May 16, 2026 at 01:06:15PM +0200, Julian Orth wrote:
> This device makes the DRM_IOCTL_SYNCOBJ_* ioctls available via a
> dedicated device. This allows applications to use syncobjs without
> having to open device nodes in /dev/dri, on systems that don't have any
> such nodes, or on systems whose devices don't support the
> DRIVER_SYNCOBJ_TIMELINE feature.
> 
> Wayland uses syncobjs as its buffer synchronization mechanism. Most
> compositors use the DRM_IOCTL_SYNCOBJ_EVENTFD ioctl to perform a pure
> CPU wait for syncobj point. DRM devices are not involved in this process
> except insofar that a DRM device needs to be used to access the ioctl.
> 
> Similarly, a software-rendered client might perform rendering on a
> dedicated thread and use the wayland syncobj protocol to submit frames
> before they finish rendering. Again, this does not involve DRM devices
> except insofar ... as above.
> 
> As an added benefit, this device removes the need to translate between
> file descriptors and handles.
> 
> Signed-off-by: Julian Orth <ju.orth@gmail.com>
> ---
>  Documentation/userspace-api/ioctl/ioctl-number.rst |   1 +
>  drivers/misc/Kconfig                               |  10 +
>  drivers/misc/Makefile                              |   1 +
>  drivers/misc/syncobj.c                             | 404 +++++++++++++++++++++
>  include/uapi/linux/syncobj.h                       |  75 ++++
>  5 files changed, 491 insertions(+)
> 
> diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
> index 331223761fff..5e140ae5735e 100644
> --- a/Documentation/userspace-api/ioctl/ioctl-number.rst
> +++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
> @@ -395,6 +395,7 @@ Code  Seq#    Include File                                             Comments
>                                                                         <mailto:michael.klein@puffin.lb.shuttle.de>
>  0xCC  00-0F  drivers/misc/ibmvmc.h                                     pseries VMC driver
>  0xCD  01     linux/reiserfs_fs.h                                       Dead since 6.13
> +0xCD  00-0F  uapi/linux/syncobj.h
>  0xCE  01-02  uapi/linux/cxl_mem.h                                      Compute Express Link Memory Devices
>  0xCF  02     fs/smb/client/cifs_ioctl.h
>  0xDD  00-3F                                                            ZFCP device driver see drivers/s390/scsi/
> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> index 00683bf06258..c1e7749bd356 100644
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
> @@ -644,6 +644,16 @@ config MCHP_LAN966X_PCI
>  	    - lan966x-miim (MDIO_MSCC_MIIM)
>  	    - lan966x-switch (LAN966X_SWITCH)
>  
> +config SYNCOBJ_DEV
> +	tristate "DRM syncobj device (/dev/syncobj)"
> +	depends on DRM

If this is a drm-only thing, then please put it in the drm subdirs, not
in drivers/misc/ as that would imply that I have to maintain this, not
the DRM developers :)

thanks,

greg k-h
