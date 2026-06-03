Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FF4409602;
	Wed,  3 Jun 2026 08:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780474420; cv=none; b=qHEvYN0NfTmYH3/Lpihfds3dFOAEOWDUEKYU0YgirqGRf2LoavrZZt/CRh04j0h4Pj00RJ2H9UkvV8hAOtDj4NOdu6y5ztoEt0P5yu/CkBO9WwKn3PUlDSS7sP8NkUcMtj8gbS1FlbpY6uSjrbAZW2syju2PxKhh6VqGQkLr4s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780474420; c=relaxed/simple;
	bh=XpwWDS3xiGIhnM+QfyAorJpcOID8lVHKAGNhGyVyZMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ukdzl4ycCTcaCV2Zo8kb+kUO01IYPaqXFzlnogjirTNt5Y4Osx2mKkO2HmcygbdP0c2+wqwOdCgY6gebKqxgxhjdQyCnH8ibMSYckmR81ZWjGJFA431SpdATtn4ghe2x31k+QwIKTLCpRLLdV5W5OHOPfxKf3iToQN5rjvaRywY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lA+PPhyo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lA+PPhyo"
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 465CEDF3;
	Wed,  3 Jun 2026 10:13:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780474390;
	bh=XpwWDS3xiGIhnM+QfyAorJpcOID8lVHKAGNhGyVyZMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lA+PPhyo0iJ7wx58ivH7nadyWZSnwJiZSz9hqeFOHtZehnOsIZjHD4k8JIOFzP2Ma
	 PfKWilAZKyRJ/7O/2dGGH4BENOhRJrbvVzcQeBd9mMZ6TnfQ0tZflywhPSqyKTAEy1
	 bAH1MZnGXHDH+W6RP6Ans75fhQkyUSXsY2ih+ufw=
Date: Wed, 3 Jun 2026 10:13:31 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Keke Li <keke.li@amlogic.com>, Antoine Bouyer <antoine.bouyer@nxp.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, Ricardo Ribalda <ribalda@chromium.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] media: v4l2-isp: Add helpers for stats buffer
Message-ID: <ah_h4ggSeOc2fUOB@zed>
References: <20260505-extensible-stats-v1-0-e16f326b8dad@ideasonboard.com>
 <20260505-extensible-stats-v1-6-e16f326b8dad@ideasonboard.com>
 <20260515182907.GU332351@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260515182907.GU332351@ragnatech.se>

Hi Niklas

On Fri, May 15, 2026 at 08:29:07PM +0200, Niklas Söderlund wrote:
> Hello Jacopo,
>
> Thanks for your work.
>
> On 2026-05-05 16:12:17 +0200, Jacopo Mondi wrote:
> > Add two helper functions to v4l2-isp to handle statistics:
> >
> > - v4l2_isp_stats_init_buffer() to initialize a statistics buffer
> > - v4l2_isp_stats_init_block() to initialize a statistics block in the
> >   next available memory location of a buffer
> >
> > The v4l2_isp_stats_init_buffer() resets the data size counter of the
> > buffer and initializes its 'version' field.
> >
> > The v4l2_isp_stats_init_block() helper accepts the type of the stats
> > block about to be populated, an array of per-block-type information and
> > the maximum size of the v4l2-isp buffer. If enough space for the new
> > block is available, the function increments the
> > v4l2_isp_buffer.data_size counter, initializes the new stats block
> > header and returns a pointer to the block for the driver to populate it.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-isp.c | 52 +++++++++++++++++++++++++++++++++
> >  include/media/v4l2-isp.h           | 59 +++++++++++++++++++++++++++++++++++++-
> >  2 files changed, 110 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-isp.c b/drivers/media/v4l2-core/v4l2-isp.c
> > index 10760659f8a3..8482010776d4 100644
> > --- a/drivers/media/v4l2-core/v4l2-isp.c
> > +++ b/drivers/media/v4l2-core/v4l2-isp.c
> > @@ -131,6 +131,58 @@ int v4l2_isp_params_validate_buffer(struct device *dev, struct vb2_buffer *vb,
> >  }
> >  EXPORT_SYMBOL_GPL(v4l2_isp_params_validate_buffer);
> >
> > +void v4l2_isp_stats_init_buffer(struct v4l2_isp_buffer *buf,
> > +				enum v4l2_isp_version version)
> > +{
> > +	if (WARN_ON(!buf))
> > +		return;
> > +
> > +	if (WARN_ON(version > V4L2_ISP_VERSION_V1))
> > +		return;
> > +
> > +	buf->version = version;
> > +	buf->data_size = 0;
> > +}
> > +EXPORT_SYMBOL_GPL(v4l2_isp_stats_init_buffer);
> > +
> > +struct v4l2_isp_block_header *
> > +v4l2_isp_stats_init_block(struct device *dev, struct v4l2_isp_buffer *buf,
> > +			  const struct v4l2_isp_stats_block_type_info *type_info,
> > +			  size_t num_block_types, unsigned int block_type,
> > +			  size_t max_size)
> > +{
> > +	const struct v4l2_isp_stats_block_type_info *block_info;
> > +	struct v4l2_isp_block_header *header;
> > +	size_t used;
> > +
> > +	if (WARN_ON(!dev || !buf || !type_info))
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	if (block_type >= num_block_types) {
> > +		dev_err(dev, "Invalid block type %u\n", block_type);
> > +		return ERR_PTR(-EINVAL);
> > +	}
> > +
> > +	block_info = &type_info[block_type];
> > +	used = buf->data_size;
> > +
> > +	if (used + block_info->size > max_size) {
> > +		dev_err(dev, "No space for stats block type %u of size %zu\n",
> > +			block_type, block_info->size);
> > +		return ERR_PTR(-ENOMEM);
> > +	}
> > +
> > +	buf->data_size += block_info->size;
> > +
> > +	header = (struct v4l2_isp_block_header *)&buf->data[used];
> > +	header->type = block_type;
> > +	header->size = block_info->size;
> > +	header->flags = 0;
> > +
> > +	return header;
> > +}
> > +EXPORT_SYMBOL_GPL(v4l2_isp_stats_init_block);
> > +
> >  MODULE_LICENSE("GPL");
> >  MODULE_AUTHOR("Jacopo Mondi <jacopo.mondi@ideasonboard.com");
> >  MODULE_DESCRIPTION("V4L2 generic ISP parameters and statistics helpers");
> > diff --git a/include/media/v4l2-isp.h b/include/media/v4l2-isp.h
> > index 1f35a52f978a..7a54cf98c79a 100644
> > --- a/include/media/v4l2-isp.h
> > +++ b/include/media/v4l2-isp.h
> > @@ -53,7 +53,7 @@ int v4l2_isp_params_validate_buffer_size(struct device *dev,
> >  					 size_t max_size);
> >
> >  /**
> > - * struct v4l2_isp_params_block_type_info - V4L2 ISP per-block-type info
> > + * struct v4l2_isp_params_block_type_info - V4L2 ISP params per-block-type info
>
> nit: This could perhaps go in patch 4/6 as it at least also touch this
> struct?

It could, but I added it here because with the introduction of

 * struct v4l2_isp_stats_block_type_info - V4L2 ISP stats per-block-type info

I wanted to have a similar description for
v4l2_isp_params_block_type_info.

If it's ok I'll keep the change here!

>
> With or without this moved,
>
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>
> >   * @size: the block type expected size
> >   * @block_validate: driver's callback to implement per-block validation
> >   *
> > @@ -97,4 +97,61 @@ int v4l2_isp_params_validate_buffer(struct device *dev, struct vb2_buffer *vb,
> >  				    const struct v4l2_isp_params_block_type_info *type_info,
> >  				    size_t num_block_types);
> >
> > +/**
> > + * struct v4l2_isp_stats_block_type_info - V4L2 ISP stats per-block-type info
> > + * @size: the block type expected size
> > + *
> > + * The v4l2_isp_stats_block_type_info collects information of the ISP
> > + * statistics block types for validation purposes. It currently only contains
> > + * the expected block size.
> > + *
> > + * Drivers shall prepare a list of statistics block type info, indexed by block
> > + * type, one for each supported ISP statistics block type and correctly populate
> > + * them with the expected block size.
> > + */
> > +struct v4l2_isp_stats_block_type_info {
> > +	size_t size;
> > +};
> > +
> > +/**
> > + * v4l2_isp_stats_init_buffer - Initialize a statistics buffer
> > + *
> > + * Initialize a buffer of statistics. Only set the 'version' field and reset
> > + * 'data_size' to 0.
> > + *
> > + * @buf: the v4l2_isp_buffer to initialize
> > + * @version: the v4l2-isp serialization format version used by the driver
> > + */
> > +void v4l2_isp_stats_init_buffer(struct v4l2_isp_buffer *buf,
> > +				enum v4l2_isp_version version);
> > +
> > +/**
> > + * v4l2_isp_stats_init_block - Create and initialize a new block in a statistics
> > + *			       buffer
> > + * @dev: the driver's device pointer
> > + * @buf: the v4l2_isp_buffer where statistics are serialized
> > + * @type_info: the array of per-block-type validation info
> > + * @num_block_types: the number of block types in the type_info array
> > + * @block_type: the type of the statistics block to initialize
> > + * @max_size: the maximum size of the data[] member of @buf
> > + *
> > + * This function locates and initialize a new statistics block in @buf for the
> > + * driver to populate its content. The function checks that enough space for the
> > + * requested @block_type is available in @buf and increments the 'data_size'
> > + * member of @buf. The newly created statistics block's header is initialized
> > + * with the size and type information provided by the caller in @type_info.
> > + *
> > + * Drivers should call this function before populating a new statistics block
> > + * content.
> > + *
> > + * Returns a pointer to the next available location in @buf, or an error pointer
> > + * if the requested @block_size is not available in @buf or @block_type is not
> > + * valid.
> > + */
> > +struct v4l2_isp_block_header *
> > +v4l2_isp_stats_init_block(struct device *dev, struct v4l2_isp_buffer *buf,
> > +			  const struct v4l2_isp_stats_block_type_info *type_info,
> > +			  size_t num_block_types, unsigned int block_type,
> > +			  size_t max_size);
> > +
> >  #endif /* _V4L2_ISP_H_ */
> >
> > --
> > 2.53.0
> >
>
> --
> Kind Regards,
> Niklas Söderlund
