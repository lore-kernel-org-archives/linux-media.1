Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8A4158535
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 06:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774247603; cv=none; b=UmwEjxmSweiceuPHe3tfSo6TnhIFnZbOzVt+huQ3Vlh55X5MtsZu6bLELeGfogoSID8xAUmw6kYWY5/ecMiXqgxF4uiT8uUxQgq+U0gcjLGNnMcpe6NZRpDjbylCw4ONb3HbnsIG8tY5Bhn7Fw2IR0pWxqRAK2N56ac/LJOoukU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774247603; c=relaxed/simple;
	bh=T7vrv3pLkmp1JuPU0lyB7fBXGD2b9fKXnkqEtXeC6iA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AZKuDh6DUdwju9YMGXFWxLbunJibDYZ8i5maS2PHoVVZ3koTEIDugIUfbl5VrNHpet6lACDFRRt6h6xI6go7pgAhxbvNFQlplwHmNVGYNWpKbDHMYP4HljeG2mh1c0l20lktQih4ncI3I/YwUG7Beg+C8mMcUHkC8rTzIcfK4ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Xbw11DZc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Xbw11DZc"
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A9123591;
	Mon, 23 Mar 2026 07:31:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774247516;
	bh=T7vrv3pLkmp1JuPU0lyB7fBXGD2b9fKXnkqEtXeC6iA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Xbw11DZc/HRkzMF3VFCBmtYo3bWhWRbpQnmGnygDJppPzHn04tKpNbVS3ckeXJIGr
	 irKzc6T5CuaJBzoijuMVlsZ0Z/JQ/AljehAMSGt77OFDzVRB2WtvZaAjkVezXmycqd
	 3YTaZ5/g9zOQjd0FZoYYpMCKDnA9mSb2SzMUYP/s=
Message-ID: <45deae7a-d197-49b6-8c22-f8c1b403223f@ideasonboard.com>
Date: Mon, 23 Mar 2026 08:33:08 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] media: v4l2-subdev: Return an error from set
 streaming if not supported
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: David Heidelberg <david@ixit.cz>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
References: <20260322223016.741370-1-sakari.ailus@linux.intel.com>
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20260322223016.741370-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 23/03/2026 00:30, Sakari Ailus wrote:
> If a sub-device sets neither {enable_streams, disable_streams} pad ops nor
> s_stream video op, v4l2_subdev_s_stream_helper() calls
> v4l2_subdev_{enable,disable}_streams() recursively, exhausting the stack.
> Return -ENOIOCTLCMD if neither op is defined when enable_streams or
> disable_streams is called to handle the situation gracefully.

How does this happen? I can't right away see where the recursion comes from.

 Tomi

> Reported-by: David Heidelberg <david@ixit.cz>
> Fixes: b62949ddaa52 ("media: subdev: Support single-stream case in v4l2_subdev_enable/disable_streams()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 831c69c958b8..f8ea4afc6cbb 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -2334,11 +2334,13 @@ int v4l2_subdev_enable_streams(struct v4l2_subdev *sd, u32 pad,
>  
>  	/* Fallback on .s_stream() if .enable_streams() isn't available. */
>  	use_s_stream = !v4l2_subdev_has_op(sd, pad, enable_streams);
> -
> -	if (!use_s_stream)
> +	if (!use_s_stream) {
>  		state = v4l2_subdev_lock_and_get_active_state(sd);
> -	else
> +	} else {
> +		if (!v4l2_subdev_has_op(sd, video, s_stream))
> +			return -ENOIOCTLCMD;
>  		state = NULL;
> +	}
>  
>  	/*
>  	 * Verify that the requested streams exist and that they are not
> @@ -2435,11 +2437,13 @@ int v4l2_subdev_disable_streams(struct v4l2_subdev *sd, u32 pad,
>  
>  	/* Fallback on .s_stream() if .disable_streams() isn't available. */
>  	use_s_stream = !v4l2_subdev_has_op(sd, pad, disable_streams);
> -
> -	if (!use_s_stream)
> +	if (!use_s_stream) {
>  		state = v4l2_subdev_lock_and_get_active_state(sd);
> -	else
> +	} else {
> +		if (!v4l2_subdev_has_op(sd, video, s_stream))
> +			return -ENOIOCTLCMD;
>  		state = NULL;
> +	}
>  
>  	/*
>  	 * Verify that the requested streams exist and that they are not

