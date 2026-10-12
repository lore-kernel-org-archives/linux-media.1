Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E083E47887B
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 12:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791807631; cv=none; b=MMpPSenO/iMeVAJwL9K8HkVoSvrQea0nS7MTpb56lwnf3qTJmP5vtg7uwrxzOivMldxpzhFZr0Pzfbg3F04o83HxPH+knOfA0GgTI3PLPhfxXQE3NSwfcOiBrrPgp1smh9/JuXvZ2E5b9UNfsz3LzDIbIqnHJUkFKeEeBdiUmn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791807631; c=relaxed/simple;
	bh=FAE0h41Iyi8gh+VjC0qignrE6e4V88txlX8Sb9qoZw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R5G7kXferjPC5eipXfACuuvWoSteAFE3+RTxXyq2Rcjj+RS1bOKx5ljMIg2FZaIdb+ycanTuqvzqTdZS1Px/g+HoxvC8Cf5633MwqP0x5rS30lVqlnblNuJSOsrCGFUaQzdXUZGDJSHl+Ul8rf1fIMeqe5r22YN7W8CwlPdI5y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dI2pny4j; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dI2pny4j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791807630; x=1823343630;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FAE0h41Iyi8gh+VjC0qignrE6e4V88txlX8Sb9qoZw0=;
  b=dI2pny4jZw6C2K1hPcIR1QpVcjdpYPtbzyoDZg6WhH2s/ZSyzbW2Uvo0
   mI1ZBVFFNnE6/Yp+grMjGW7r1+GnvGuyGk5pGvds1koqeFoqfNxn/q0oF
   44FtXuHijVoz8J8/i9XqHTAgELYtfFbCFRdzmiHBucZNJxjp2YopOxKK3
   wiD3oZsUSqv2pXQPGCQC5gEy/iCe5pfgTecdBkSOOUyk6XijX5OJandOz
   r1cdIeUO0KuvRhE8osG38w2z0xgCyGSZMKuQ/JfWsKwsxnvtQ5floPdYc
   4zlKREXbhlxtLye+0x5UZIjhtFtn7JY5SNAFo6j0W4Xop2GMo1IIJfMP9
   A==;
X-CSE-ConnectionGUID: FPfxNbK2STa1wn7uqpx3Vg==
X-CSE-MsgGUID: bawLX9P6SWO+Os5jvRt8/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="388835"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="388835"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 05:20:30 -0700
X-CSE-ConnectionGUID: LgH91KESQq2gI3LavEJnZg==
X-CSE-MsgGUID: aoBVz2hqT1ie8fAsuRkYwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="1212781"
Received: from sghuge-mobl2.amr.corp.intel.com (HELO alaakso-desk) ([10.125.109.157])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 05:20:26 -0700
Date: Mon, 12 Oct 2026 15:20:22 +0300
From: Antti Laakso <antti.laakso@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, "Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	"Bajpai, Manik" <manik.bajpai@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>,
	"Sapre, Sarang" <sarang.sapre@intel.com>,
	"Yao, Hao" <hao.yao@intel.com>
Subject: Re: [PATCH v2 5/5] media: ipu6: Return errors from stream stop and
 close
Message-ID: <aszQhtZDu6KDrt5C@alaakso-desk>
References: <20261012114002.3970409-1-sakari.ailus@linux.intel.com>
 <20261012114002.3970409-6-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012114002.3970409-6-sakari.ailus@linux.intel.com>

On Mon, Oct 12, 2026 at 02:40:02PM +0300, Sakari Ailus wrote:
> If the firmware fails to start, stop or close a stream, either by telling
> about it with an error or due to a timeout, it probably requires a reset
> before being operational again. Mark isys needing a reset in such cases.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../media/pci/intel/ipu6/ipu6-isys-video.c    | 55 ++++++++++++++-----
>  .../media/pci/intel/ipu6/ipu6-isys-video.h    |  4 +-
>  2 files changed, 43 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> index 44541aff79b3..799a4be3160b 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> @@ -543,25 +543,31 @@ int ipu6_isys_start_stream_firmware(struct ipu6_isys_stream *stream,
>  out_stream_close:
>  	reinit_completion(&stream->stream_close_completion);
>  
> +	scoped_guard(mutex, &stream->isys->mutex)
> +		stream->isys->need_reset = true;
> +
>  	retout = fw_ops->stream_close(stream->isys, stream->stream_handle);
>  	if (retout < 0) {
>  		dev_dbg(dev, "can't close stream (%d)\n", retout);
> -		return retout;
> +		return ret;
>  	}
>  
>  	tout = wait_for_completion_timeout(&stream->stream_close_completion,
>  					   IPU6_FW_CALL_TIMEOUT_JIFFIES);
> -	if (!tout)
> +	if (!tout) {
>  		dev_err(dev, "stream close time out\n");
> -	else if (stream->error)
> +		ret = -ETIMEDOUT;
> +	} else if (stream->error) {
>  		dev_err(dev, "stream close error: %d\n", stream->error);
> -	else
> +		ret = -EINVAL;
> +	} else {
>  		dev_dbg(dev, "stream close complete\n");
> +	}
>  
>  	return ret;
>  }
>  
> -void ipu6_isys_stop_stream_firmware(struct ipu6_isys_stream *stream)
> +int ipu6_isys_stop_stream_firmware(struct ipu6_isys_stream *stream)
>  {
>  	struct ipu6_bus_device *adev = stream->asd->isys->adev;
>  	const struct ipu6_fw_isys_ops *fw_ops = adev->auxdrv_data->fw_ops;
> @@ -573,20 +579,30 @@ void ipu6_isys_stop_stream_firmware(struct ipu6_isys_stream *stream)
>  	ret = fw_ops->stream_flush(stream->isys, stream->stream_handle);
>  	if (ret < 0) {
>  		dev_err(dev, "can't stop stream (%d)\n", ret);
> -		return;
> +		return -EBUSY;
>  	}
>  
>  	tout = wait_for_completion_timeout(&stream->stream_stop_completion,
>  					   IPU6_FW_CALL_TIMEOUT_JIFFIES);
> -	if (!tout)
> +	if (!tout) {
>  		dev_warn(dev, "stream stop time out\n");
> -	else if (stream->error)
> +		ret = -ETIMEDOUT;
> +	} else if (stream->error) {
>  		dev_warn(dev, "stream stop error: %d\n", stream->error);
> -	else
> +		ret = -EINVAL;
> +	} else{

Space after else. With that:
Reviewed-by: Antti Laakso <antti.laakso@linux.intel.com>

>  		dev_dbg(dev, "stop stream: complete\n");
> +	}
> +
> +	if (ret) {
> +		scoped_guard(mutex, &stream->isys->mutex)
> +			stream->isys->need_reset = true;
> +	}
> +
> +	return ret;
>  }
>  
> -void ipu6_isys_close_stream_firmware(struct ipu6_isys_stream *stream)
> +int ipu6_isys_close_stream_firmware(struct ipu6_isys_stream *stream)
>  {
>  	struct ipu6_bus_device *adev = stream->asd->isys->adev;
>  	const struct ipu6_fw_isys_ops *fw_ops = adev->auxdrv_data->fw_ops;
> @@ -599,22 +615,33 @@ void ipu6_isys_close_stream_firmware(struct ipu6_isys_stream *stream)
>  	ret = fw_ops->stream_close(stream->isys, stream->stream_handle);
>  	if (ret < 0) {
>  		dev_err(dev, "can't close stream (%d)\n", ret);
> -		return;
> +		goto out_cleanup;
>  	}
>  
>  	tout = wait_for_completion_timeout(&stream->stream_close_completion,
>  					   IPU6_FW_CALL_TIMEOUT_JIFFIES);
> -	if (!tout)
> +	if (!tout) {
>  		dev_warn(dev, "stream close time out\n");
> -	else if (stream->error)
> +		ret = -ETIMEDOUT;
> +	} else if (stream->error) {
>  		dev_warn(dev, "stream close error: %d\n", stream->error);
> -	else
> +		ret = -EINVAL;
> +	} else {
>  		dev_dbg(dev, "close stream: complete\n");
> +	}
>  
> +out_cleanup:
>  	scoped_guard(spinlock_irqsave, &stream->isys->streams_lock) {
>  		stream->isys->streams_by_handle[stream->stream_handle] = NULL;
>  		csi2->streams_by_vc[stream->vc] = NULL;
>  	}
> +
> +	if (ret) {
> +		scoped_guard(mutex, &stream->isys->mutex)
> +			stream->isys->need_reset = true;
> +	}
> +
> +	return ret;
>  }
>  
>  struct ipu6_isys_stream *
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
> index 2821b9b1b943..2ab6f32716ad 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
> @@ -99,8 +99,8 @@ int ipu6_isys_fw_pins_prepare(struct ipu6_isys_stream *stream,
>  int ipu6_isys_start_stream_firmware(struct ipu6_isys_stream *stream,
>  				    struct ipu6_isys_buffer_list *bl,
>  				    struct v4l2_mbus_frame_desc *desc);
> -void ipu6_isys_stop_stream_firmware(struct ipu6_isys_stream *stream);
> -void ipu6_isys_close_stream_firmware(struct ipu6_isys_stream *stream);
> +int ipu6_isys_stop_stream_firmware(struct ipu6_isys_stream *stream);
> +int ipu6_isys_close_stream_firmware(struct ipu6_isys_stream *stream);
>  struct ipu6_isys_stream *
>  ipu6_isys_find_stream_firmware(struct ipu6_isys_csi2 *csi2, u8 vc);
>  void ipu6_isys_free_stream_firmware(struct ipu6_isys_stream *stream);
> -- 
> 2.47.3
> 
