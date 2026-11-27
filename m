Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795778980;
	b=Ic+ZA05V7rIvEyfq7HKDjngzarfO5ZmpO7lZi55CWNk4M1CitkHVu+akhHfMZLM2JOUe
	 ofn9t9Ga1mOeHqNJ4MmLMyINVeI4T0QqE8YoWQFZf/fu/8PGmW1g3Y/srmpdcEFqrNY/y
	 pUbyiMWXFUR0k4diVSprskxCfMoZQ6s3dVThd9V8jzG0WIQHnOj1N2YaHjbAK3MYTK81b
	 g0XTGvxGI+JIeF8vps12u3yTtQFZg/aCGZv2DpYhxQYFN6l9zbouXDzcOD2MUgXB9QahX
	 1G2PW4YZ1G1Be8lmbvXPIVQ22sps3gX7zsxxvdojN4xAJiLp/8UrMo4riTgww0EPU1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778980;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=rVUVCvucOL4EqEyUDX7SKNMHMjvnYBzeRhNnoopCz5Y=;
	b=5POH8oX6IzemVDdKg/tZv0+RopeMb/wN+35iBRFIgcv7kceBH0J9FYc+HD02JOqK+xzh
	 /5jeiHGBlZYnFPme1W/K+CU1ihSl/DWvsQfF2wYWxf1KW0RYDmBPG90AxOaiuvXnJKP5+
	 YNOKEjRanLe9adobXahO2xHEyQDC6RGuf1eoQ4lVXtGZgdVj8xCBOyTqrXOaPCVgmze9s
	 0eJumc5Wxls2eDCYLOL3lxEgExXy/a8e8R2GWYSXqsndcZJVL2kV0po00dW096pcE9mPD
	 BvZG52hGs00SWUIlf1fAeKsZ9vrpy71FUpmjQ7W0ny6l9rJdBJHPPxIVP/jQRW93VYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gt3YOvxr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28AC606A31E
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 11:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gt3YOvxr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACE7C1F000C1;
	Fri, 27 Nov 2026 11:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795778979;
	bh=rVUVCvucOL4EqEyUDX7SKNMHMjvnYBzeRhNnoopCz5Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=gt3YOvxrccjSutvPxUCG09TFNTfuAT+wbNTQScppvqmAlpMWJJqs1RAHILfvdzhyO
	 ccNXZhcneGO9zcCUa+/YbqH0zp/8p97FZmwty9vsLELrgHx+NJViY0R2t5AAPvQ1N2
	 BGT8x9VP1W9gjv7tTcr+O2mr/fuOhQZqugQJ966eNmZLmNOtnzoXXOnu+d7ETy3Lzz
	 Qq6c59OQ0fXUNHwNm8eVWf/W3Lsk09++VvfAYYZdtmKhLc2eLktnT21kZ8nRVdnQmk
	 JqguYScAynA37GTtZ1/qgr3FjebuX5sIAwX9/+d0X9tPVmR1MJ+FUBbwm0XVZL8sXk
	 tXTzX/tlOt0sg==
Message-ID: <213fafaa-754b-411d-8080-7741f747ce24@kernel.org>
Date: Fri, 27 Nov 2026 12:29:31 +0100
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
Subject: Re: [PATCH v13 05/73] media: uapi: Add V4L2_CID_CONFIG_MODEL control
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com, Prabhakar
 <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Julien Massot <julien.massot@collabora.com>,
 Naushir Patuck <naush@raspberrypi.com>,
 "Yan, Dongcheng" <dongcheng.yan@intel.com>,
 Stefan Klug <stefan.klug@ideasonboard.com>,
 Mirela Rabulea <mirela.rabulea@nxp.com>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Ricardo Ribalda Delgado <ribalda@kernel.org>,
 Hans de Goede <hansg@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 David Plowman <david.plowman@raspberrypi.com>,
 "Yu, Ong Hock" <ong.hock.yu@intel.com>, "Ng, Khai Wen"
 <khai.wen.ng@intel.com>, Jai Luthra <jai.luthra@ideasonboard.com>,
 Rishikesh Donadkar <r-donadkar@ti.com>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Antti Laakso <antti.laakso@linux.intel.com>,
 "Bajpai, Manik" <manik.bajpai@intel.com>,
 Divyamani Tripathi <divyamani.tripathi@intel.com>
References: <20261118132819.213473-1-sakari.ailus@linux.intel.com>
 <20261118132819.213473-6-sakari.ailus@linux.intel.com>
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20261118132819.213473-6-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/11/2026 14:27, Sakari Ailus wrote:
> Add the V4L2_CID_CONFIG_MODEL control for the configuration model.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../userspace-api/media/v4l/ext-ctrls-image-process.rst      | 4 ++++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c                    | 5 +++++
>  include/uapi/linux/v4l2-controls.h                           | 3 +++
>  3 files changed, 12 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> index 57c2baf34acf..15566f409ca5 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> @@ -59,3 +59,7 @@ Image Process Control IDs
>      control value divided by e.g. 0x100, meaning that to get no
>      digital gain the control value needs to be 0x100. The no-gain
>      configuration is also typically the default.
> +
> +``V4L2_CID_CONFIG_MODEL (bitmask)``
> +    Which configuration models the sub-device supports. Please see
> +    :ref:`media_subdev_config_model`. This is a read-only control.

The reference is to media_subdev_config_model, but that isn't added until patch 23/73.

Regards,

	Hans

> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> index e062f2088490..66ec7b911e4f 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1167,6 +1167,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_TEST_PATTERN:		return "Test Pattern";
>  	case V4L2_CID_DEINTERLACING_MODE:	return "Deinterlacing Mode";
>  	case V4L2_CID_DIGITAL_GAIN:		return "Digital Gain";
> +	case V4L2_CID_CONFIG_MODEL:		return "Sub-device Configuration Model";
>  
>  	/* DV controls */
>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> @@ -1488,6 +1489,10 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_DV_RX_POWER_PRESENT:
>  		*type = V4L2_CTRL_TYPE_BITMASK;
>  		break;
> +	case V4L2_CID_CONFIG_MODEL:
> +		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +		*type = V4L2_CTRL_TYPE_BITMASK;
> +		break;
>  	case V4L2_CID_MIN_BUFFERS_FOR_CAPTURE:
>  	case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:
>  		*type = V4L2_CTRL_TYPE_INTEGER;
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index d17e41d51d2e..6b97ee905c43 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1269,6 +1269,9 @@ enum v4l2_jpeg_chroma_subsampling {
>  #define V4L2_CID_TEST_PATTERN			(V4L2_CID_IMAGE_PROC_CLASS_BASE + 3)
>  #define V4L2_CID_DEINTERLACING_MODE		(V4L2_CID_IMAGE_PROC_CLASS_BASE + 4)
>  #define V4L2_CID_DIGITAL_GAIN			(V4L2_CID_IMAGE_PROC_CLASS_BASE + 5)
> +#define V4L2_CID_CONFIG_MODEL			(V4L2_CID_IMAGE_PROC_CLASS_BASE + 6)
> +
> +#define V4L2_CONFIG_MODEL_COMMON_RAW_SENSOR	(1U << 0)
>  
>  /*  DV-class control IDs defined by V4L2 */
>  #define V4L2_CID_DV_CLASS_BASE			(V4L2_CTRL_CLASS_DV | 0x900)

