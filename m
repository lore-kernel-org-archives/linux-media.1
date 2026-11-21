Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795269240;
	b=zEkkX+uDUy/8PLMSTknp9t21f2FysoQt26jXohcZcumFMHdSjyo4RxAcGbPyVLvTaDR2
	 V/in03mCB/yTtYCcEuP9+TqWwLfhO44Y4vgdd9k5SlJ6wg/MAUWz2chLRmVXMcJw74s2f
	 vhOOJbToBb9RcoNhOG2GtEHexlguJg/SFxdx4vPSMD/0zYiR/CzwcZ9r+vthlJt1j2GaJ
	 uwTZ6R0LMtSzkfVYme/rSAmDGqGeTyOavHkt9s2DEAUVZ3mJ/ORrlrYapgYXRBqI1zZib
	 c2SWg7hetQlGbB+ShGPgj+tp4aLfialYhIv1CNYdA2VSE7og2ZcBf5SP8jNQae9sPNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795269240;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=rT38pic7oKYghostUyNggCTZ2Q1aSdkOMOeJYyd/5wQ=;
	b=maT6KGhKfkAGNbX3CoBfqds4iW2tlPGrMUnnfa1zZXpAaRJEzC0SBewmKjGoAfsnp6bP
	 1uOWUXXSLfUS/ym6zPgtKYzJyD1dp96hC61msjRS5CBZk8wyqPncTa9gaBfQhsgT3C13D
	 DacTsB/oEw9AOXK8lQw5lcaxpgl1gupAL2yJ3wha7XUEbfoid/8Fqfs22dWXNh5gqco9b
	 8lJHr+88N7hf7bECeFfF6jjhWNdsav/gJZ+j+Lky3/srQU3hdKCe/kSLhcGuVUfYfeHs8
	 yfEyOMS8YvEO+stYbdi+j/He/MtjIa2KGE5isA+IHe6V/AnDchiQ+W0HtXAbD1lUqKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=DkfWeY+H;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48856606A32A;
	Sat, 21 Nov 2026 13:53:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48856606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=DkfWeY+H
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4E275447;
	Sat, 21 Nov 2026 14:51:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795269080;
	bh=5L9zvO8/SgC+bhCcxTzFqCD3dBJU7r/zCmGy5kQ2BPg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DkfWeY+HgF4lhMgNzSv4ZZ3lZXb4iGjyNiyTqiWALo26sePZxI1tyxbFmWSOxUHvJ
	 gGDxGQJ5TivJIdQ/N3h4+5p6lBezptRP+p1+bcIPdMfHqrPAyhzr/UkajRbOa7peWB
	 YQYbe9q399U3FHreW/HjGs4kHiMMEqkQ6nFerG4Q=
Date: Sat, 21 Nov 2026 15:53:49 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maurizio Casciano <mauriziocasciano7@gmail.com>
Cc: linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v11 01/14] media: v4l2-core: Preserve existing subdevice
 nodes on rollback
Message-ID: <20261121135349.GE2472094@killaraus.ideasonboard.com>
References: <cover.1795267528.git.mauriziocasciano7@gmail.com>
 <48240d57d86e78cce814822360c1b22cea80268b.1795267528.git.mauriziocasciano7@gmail.com>
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
In-Reply-To: <48240d57d86e78cce814822360c1b22cea80268b.1795267528.git.mauriziocasciano7@gmail.com>

On Sat, Nov 21, 2026 at 02:31:31PM +0100, Maurizio Casciano wrote:
> Subdevice node registration skips nodes which already exist. On failure,
> however, it walks the subdevice list from the beginning and unregisters
> nodes regardless of whether the current call created them. On AtomISP
> this can remove the camera sensor nodes when a lens rebind fails.
> 
> Keep a list of the video devices registered by this call and unregister
> only those devices on failure. Record each device before creating its
> media interface link so a failure in that step rolls back the new node
> as well. Calls with no missing nodes need no bookkeeping allocation.
> 
> Codex drafted the change and tested allocation, registration and
> media-link failure using the registration helper with mocked operations.

And you didn't understand the change, because this is clearly not right.
NAK.

> Fixes: db0f4691d974 ("[media] v4l: Allow calling v4l2_device_register_subdev_nodes() multiple times")
> Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
> ---
>  drivers/media/v4l2-core/v4l2-device.c | 26 ++++++++++++++++++++------
>  include/media/v4l2-device.h           |  3 +++
>  2 files changed, 23 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-device.c b/drivers/media/v4l2-core/v4l2-device.c
> index b4036105c..8cfca95ce 100644
> --- a/drivers/media/v4l2-core/v4l2-device.c
> +++ b/drivers/media/v4l2-core/v4l2-device.c
> @@ -191,10 +191,23 @@ static void v4l2_device_release_subdev_node(struct video_device *vdev)
>  int __v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev,
>  					bool read_only)
>  {
> +	unsigned int count = 0, registered = 0;
> +	struct video_device **new_nodes;
>  	struct video_device *vdev;
>  	struct v4l2_subdev *sd;
>  	int err;
>  
> +	list_for_each_entry(sd, &v4l2_dev->subdevs, list)
> +		if ((sd->flags & V4L2_SUBDEV_FL_HAS_DEVNODE) && !sd->devnode)
> +			count++;
> +
> +	if (!count)
> +		return 0;
> +
> +	new_nodes = kcalloc(count, sizeof(*new_nodes), GFP_KERNEL);
> +	if (!new_nodes)
> +		return -ENOMEM;
> +
>  	/* Register a device node for every subdev marked with the
>  	 * V4L2_SUBDEV_FL_HAS_DEVNODE flag.
>  	 */
> @@ -228,6 +241,7 @@ int __v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev,
>  			kfree(vdev);
>  			goto clean_up;
>  		}
> +		new_nodes[registered++] = vdev;
>  #if defined(CONFIG_MEDIA_CONTROLLER)
>  		sd->entity.info.dev.major = VIDEO_MAJOR;
>  		sd->entity.info.dev.minor = vdev->minor;
> @@ -247,15 +261,15 @@ int __v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev,
>  		}
>  #endif
>  	}
> -	return 0;
> +	err = 0;
> +	goto out;
>  
>  clean_up:
> -	list_for_each_entry(sd, &v4l2_dev->subdevs, list) {
> -		if (!sd->devnode)
> -			break;
> -		video_unregister_device(sd->devnode);
> -	}
> +	while (registered)
> +		video_unregister_device(new_nodes[--registered]);
>  
> +out:
> +	kfree(new_nodes);
>  	return err;
>  }
>  EXPORT_SYMBOL_GPL(__v4l2_device_register_subdev_nodes);
> diff --git a/include/media/v4l2-device.h b/include/media/v4l2-device.h
> index 25f69b1b8..6d8834d40 100644
> --- a/include/media/v4l2-device.h
> +++ b/include/media/v4l2-device.h
> @@ -183,6 +183,9 @@ void v4l2_device_unregister_subdev(struct v4l2_subdev *sd);
>   * @read_only: subdevices read-only flag. True to register the subdevices
>   *	device nodes in read-only mode, false to allow full access to the
>   *	subdevice userspace API.
> + *
> + * Existing nodes are kept even if registration of a new node fails.
> + * The caller must serialize this operation with changes to the subdevice list.
>   */
>  int __must_check
>  __v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev,
> -- 
> 2.53.0
> 
> 

-- 
Regards,

Laurent Pinchart
