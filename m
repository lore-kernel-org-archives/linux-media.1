Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CD72580CF;
	Sat, 16 May 2026 11:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778931527; cv=none; b=TrumY/GgT5lMzEjhE9zGw9k+d5LSh/LN+ro033Q9xWpzlcJQIuhks5RLHN921963cvM9RHjboRzqRnY7SpUsJhMDRFqLIaIfeo8gq8BftFKYaTqc//CJ16AfiFlJCnESoKqS1lH8Cf7GUv3HSGfjKGOwztBsf9ay1aivmQusGMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778931527; c=relaxed/simple;
	bh=H8mAOeWk44Og/4ED7nEp6u4We/tCu4LArRG+KtxZ93k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q9/6kCfB3sy/VxZ7n+fjS7C5798WBN15TJBG8vuecpl7pyU3+iASuuX/DhOCJINV8lkzjigcMe5mzSoXP0FEGtMiT+uXbWGwybmKWWdSr/+X668vkCjHsvmWQW50uewTOYLi99AsAspQk9S3JFbaPV7FtrW5Cy7PiL8BNN9Cvss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=e4bYTYQ1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="e4bYTYQ1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8AA8C19425;
	Sat, 16 May 2026 11:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778931527;
	bh=H8mAOeWk44Og/4ED7nEp6u4We/tCu4LArRG+KtxZ93k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e4bYTYQ1IFzOyGzcyeZWMrAiPpnmyMYcSLRQQi95dm+iq76V/XKOTcaYNXgLfmw1k
	 6nWDho9fq4Y/BNEYASWVYokzVul0kp7foBRtyJAjvkXtBm+yAgA0mKMk4foDvBZ7zp
	 AWJnKP6k4OqUtaYUH7/b14TYFm1903wG8+eCD/RA=
Date: Sat, 16 May 2026 13:38:51 +0200
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
Message-ID: <2026051652-pork-omission-b762@gregkh>
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

As this is a bunch of user-facing code, why not do this in rust to at
least get some semblance of proper parsing of user data sanity?  Or is
the api to the drm layer just to complex for that at the moment?

Just curious, not a criticism of this in C at all.

thanks,

greg k-h
