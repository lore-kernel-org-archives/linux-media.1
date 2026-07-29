Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797BA47D92F
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 12:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785328527; cv=none; b=aWeg8KGYO7dvUV/4wZQvCxufUNlPHat8r31LbeWwwjRw7FcL5NaONa5Lxb8o6HVfaiMKK5xOx9FrVVem5oAwK114n1CXBYwcM3ycfU/Zio/65r1TXaKTGDP8SlqmzbDXh8BmRMutSPQ28Dt3meWVGRmsOuoM4trlGf/gZNkipb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785328527; c=relaxed/simple;
	bh=g+vas7cIL2w8awnuF64mhKthexTRY2TYxxS6jf7/6Gg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZNq/l6HPeBfkn/8M5km60n2ta3bFU+0IwwB4qBO4rPc7kY3xlZ0TXHjgVM6ewuEtT7/a96Nzixc04+FuquWNmTmq5NHNXijXOCdz3fNL9RyuNcALowDveJBd6I0R1Beu4PIfR8U5oEowoKst2P2xurptPJPEmkHOrf7Td0YSCsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YRL/ucr/; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YRL/ucr/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785328523; x=1816864523;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g+vas7cIL2w8awnuF64mhKthexTRY2TYxxS6jf7/6Gg=;
  b=YRL/ucr/gtdofrTQf3mGqSoVYDnlZ0ouqofN8h8ZBhD8qiVhA/0h7F4U
   qDYN/KMDal8bERl9JUrucjHhXgKJz5gvTzDXwLgmwe4aFe60SLuPn6HdP
   bVPNwFej+yQe/41YX7B7u7LwY8ZhtepkaxVFDv7tRAwPfCZS+bgLUsnxQ
   TbFOl71S1+3GamVli1GuiWIQJfju/EMx7E3FhXwPn8e/J/gIJyw1lqqcV
   aBVarBlj5ZYDeIwF4UArXtSJ9hXiLvvTVM5WKv7rmDa4ZLmNOtwlNDEIl
   g0iXGHg/1O4GVGDHu1X73pROQY/5blqJv2UOPrFAShhEwu3MeYteX1SdR
   A==;
X-CSE-ConnectionGUID: MxsTszIKQ+KmFUiK2hPTag==
X-CSE-MsgGUID: qNbppLeNT+WY54sK9NQsQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85058611"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="85058611"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 05:35:22 -0700
X-CSE-ConnectionGUID: e3fbCansTButAvEtWnT2fw==
X-CSE-MsgGUID: bbLOY6X0SeOl8BB16MyXdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="284561088"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO alaakso-desk) ([10.245.246.35])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 05:35:20 -0700
Date: Wed, 29 Jul 2026 15:35:15 +0300
From: Antti Laakso <antti.laakso@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Miguel Vadillo <miguel.vadillo@intel.com>,
	Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH] media: i2c: cvs: Pass link frequency explicitly to
 csi_set_link_cfg()
Message-ID: <amnzg92_g1ZwBRdW@alaakso-desk>
References: <20260720073642.2290315-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720073642.2290315-1-laurent.pinchart@ideasonboard.com>

Hi Laurent,

On Mon, Jul 20, 2026 at 10:36:42AM +0300, Laurent Pinchart wrote:
> The link frequency, retrieved in cvs_csi_enable_streams(), is stored in
> the icvs structure to then be used right after in csi_set_link_cfg(),
> called only from the same function. Pass it as a function parameter
> instead to improve readability.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> This is a drive-by improvement, compile-tested only.
> ---
>  drivers/media/i2c/cvs/icvs.h |  2 --
>  drivers/media/i2c/cvs/v4l2.c | 17 ++++++++---------
>  2 files changed, 8 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/i2c/cvs/icvs.h b/drivers/media/i2c/cvs/icvs.h
> index cfa8ef5d975c..17beb0920dd2 100644
> --- a/drivers/media/i2c/cvs/icvs.h
> +++ b/drivers/media/i2c/cvs/icvs.h
> @@ -432,7 +432,6 @@ enum icvs_state {
>   * @freq_ctrl: (future) frequency control pointer
>   * @pads: Local media pads (sink/source)
>   * @nr_of_lanes: Active CSI-2 lane count
> - * @link_freq: Current link frequency (Hz)
>   * @ipu_link: PM runtime device link (IPU consumer, CVS supplier)
>   * @res: Resource capability (light/full)
>   * @caps: Reported device protocol capabilities
> @@ -458,7 +457,6 @@ struct icvs {
>  	struct v4l2_ctrl *freq_ctrl;
>  	struct media_pad pads[ICVS_CSI_NUM_PADS];
>  	u32 nr_of_lanes;
> -	u64 link_freq;
>  	struct device_link *ipu_link;
>  	enum icvs_resources res;
>  	struct icvs_dev_capabilities caps;
> diff --git a/drivers/media/i2c/cvs/v4l2.c b/drivers/media/i2c/cvs/v4l2.c
> index 3a1ec0059ef7..9fadca7a3bee 100644
> --- a/drivers/media/i2c/cvs/v4l2.c
> +++ b/drivers/media/i2c/cvs/v4l2.c
> @@ -46,6 +46,7 @@ static const struct v4l2_mbus_framefmt cvs_csi_format_mbus_default = {
>  /**
>   * csi_set_link_cfg - Program default CSI-2 link parameters
>   * @ctx: CVS device context
> + * @link_freq: Link frequency (Hz)
>   *
>   * Populates a HOST_SET_MIPI_CONFIG command using current lane count and
>   * link frequency, then submits it to the device.
> @@ -53,12 +54,12 @@ static const struct v4l2_mbus_framefmt cvs_csi_format_mbus_default = {
>   *
>   * Return: 0 on success or negative errno.
>   */
> -static int csi_set_link_cfg(struct icvs *ctx)
> +static int csi_set_link_cfg(struct icvs *ctx, u64 link_freq)
>  {
>  	struct icvs_cmd cmd = {
>  		.cmd_id = cpu_to_be16(ICVS_HOST_SET_MIPI_CONFIG),
>  		.param.conf.nr_of_lanes = ctx->nr_of_lanes,
> -		.param.conf.link_freq = ctx->link_freq,
> +		.param.conf.link_freq = link_freq,
>  	};
>  	size_t cmd_size = sizeof(cmd.cmd_id) + sizeof(cmd.param.conf);
>  
> @@ -91,7 +92,7 @@ static int cvs_csi_enable_streams(struct v4l2_subdev *sd,
>  	struct v4l2_subdev *remote_sd =
>  			    media_entity_to_v4l2_subdev(ctx->remote->entity);
>  	struct device *dev = cvs_dev(ctx);
> -	s64 freq;
> +	s64 link_freq;
>  	int ret;
>  
>  	/* cvs_set_link_owner(ICVS_CSI_LINK_HOST) */
> @@ -99,15 +100,14 @@ static int cvs_csi_enable_streams(struct v4l2_subdev *sd,
>  	if (ret < 0)
>  		return ret;
>  
> -	freq = v4l2_get_link_freq(ctx->remote, 0, 0);
> -	if (freq < 0) {
> -		ret = freq;
> +	link_freq = v4l2_get_link_freq(ctx->remote, 0, 0);
> +	if (link_freq < 0) {
> +		ret = link_freq;
>  		goto err_rpm_put;
>  	}
> -	ctx->link_freq = freq;
>  
>  	if (ctx->i2c_client) {
> -		ret = csi_set_link_cfg(ctx);
> +		ret = csi_set_link_cfg(ctx, link_freq);
>  		if (ret < 0)
>  			goto err_rpm_put_sync;
>  	}
> @@ -345,7 +345,6 @@ static int cvs_csi_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
>  	if (freq < 0)
>  		return -EINVAL;
>  
> -	ctx->link_freq = freq;
>  	cfg->link_freq = freq;
>  
>  	return 0;
> 
> base-commit: a52e6f7923c17a672135b485ffd96fbd72f46267
> -- 
> Regards,
> 
> Laurent Pinchart
> 
>
Tested-by: Antti Laakso <antti.laakso@linux.intel.com> 
