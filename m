Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903733C3F70;
	Wed,  5 Aug 2026 03:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785901751; cv=none; b=DSNStPCuUDfB1MWGQQJ7/j8KG0pYxppa/Td1LW3MOhmLtZHViwVvizuUiN1l3xqDHmRih3qARfXgk5mPoWdOfFBpNzKfTGGYWxl9ZVyddzlUl0N5mKbSzRNGcLk1KHksYqllRxMiqfUHI/l9AKimTGzM3zenq3TmcTLP0ofkS9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785901751; c=relaxed/simple;
	bh=RwM20RcV8x/ofSOpCIxkK+h9+SkbQqM2wh2iPXFVYc8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rW1ZeJ/9QIuUUWpvr7HIR5E+cwMD69hMZ1CnLdbQWdES4qWosZmqHc0rIWIUDw2NPoAAeF1nIE4o4fZFYKx3Ps0WRqa7jEFa7nKuNqtZpyvppWP/I0t70R15IOQ2axO/La4/S7w4LlC19u3m2Fo5oT9OqAFz5hwQOlwBce9jMOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DXg7wg1H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DXg7wg1H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66B761F00A3A;
	Wed,  5 Aug 2026 03:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785901749;
	bh=k/1Awe7l7sXn9X4eievLN3iCkJBRTLUEAhbixS7az1U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=DXg7wg1Hm/Tw6yrj/hEErjHxYf63cJGarVeESEWSkrp17Js6TfT2SkM587+Z0MByJ
	 4XJm9u26QTEoTp0SGvTNn9geafj1NmmliezjKU4Kfr7PLbr9+JPDrFmhtCK08h5obZ
	 Hh+LQ2SCiwSAZomIoq57STVqIqEQ4K7J8+GZmDBPCpxj2+Jv1Nd4+3NI2P2kSNZDe1
	 iMCLKfR6ShhBqooB8qvJgT9UYfjyzd30oomi19k4zEAeM1zuIIwJnY+ekb1YBCm26n
	 s8gnpSGWxx6fjEPD6hRCQRZjR7s033Tt3ad9QJU9rIPSGOlwLSFSOFGK8VJYdV1nUW
	 7Gd7bVT1GcWdg==
Message-ID: <c590fac2-5c41-4b34-88af-fb00e83b8575@kernel.org>
Date: Wed, 5 Aug 2026 04:49:04 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] media: uapi: Introduce new control for video
 encoder ROI
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260804-enc_roi_enable-v3-0-e03b622a2d48@oss.qualcomm.com>
 <WoOjVIWC4XK-emqOnxnAfbETbnFi-sNNFh6ctmUDJOokI9GD4YAx8pVjdB-ygch4T0tcEeH6pVha-Ep_OaPysw==@protonmail.internalid>
 <20260804-enc_roi_enable-v3-1-e03b622a2d48@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <20260804-enc_roi_enable-v3-1-e03b622a2d48@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/08/2026 21:05, Deepa Guthyappa Madivalara wrote:
> Add custom control, V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP for
> video encoder Region of Interest to allow applications to specify
> different quality levels for specific regions in video frames. Define
> V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE to retrieve supported MB size based on
> codec from the hardware encoder and set the corresponding ROI MB delta_qp
> map that adjusts quantization relative to the frame QP's base value.
> 
> This enables use cases like prioritizing quality for faces in video
> conferencing or important objects in surveillance footage while reducing
> bitrate for less critical areas.
> 
> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
> ---
>   .../userspace-api/media/v4l/ext-ctrls-codec.rst       | 19 +++++++++++++++++++
>   .../media/v4l/videodev2.h.rst.exceptions              |  1 +
>   .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst    |  4 ++++
>   .../userspace-api/media/v4l/vidioc-queryctrl.rst      |  6 ++++++
>   include/media/v4l2-ctrls.h                            |  1 +
>   include/uapi/linux/v4l2-controls.h                    |  2 ++
>   include/uapi/linux/videodev2.h                        |  3 +++
>   7 files changed, 36 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index ab865a1a6ba929f1725ce2ab0fd3aeee4a69329a..0f8179de8f742253a5152231592fb8b4355298f7 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -1674,6 +1674,25 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>       Codecs need to always use the specified range, rather then a HW custom range.
>       Applicable to encoders
> 
> +``V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP (__s8)``
> +    This custom control is used to set ROI MB map delta_Qp for whole frame.

"a whole frame" or "the whole frame"

> +    The frame is divided into a grid of MB Size by MB Size pixels (MB Size is
> +    obtained from querying ``V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE``). Each block
> +    is configured with delta_Qp in raster order. The valid range for delta_Qp
> +    is encoder dependent.
> +    Applicable to encoders.
> +
> +``V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE`` (integer)
> +    A read-only control that reports the MB Size used for the ROI delta_QP map.
> +    The supported MB Size depends on the encoder codec.
> +    Only square macroblocks are supported. The value returned represents the

macro-blocks ?

> +    width and height of each block in pixels. The ROI delta_QP map provided
> +    through the ROI control must use the MB Size reported by this control.
> +    The number of entries in the ROI delta_QP array is determined by the
> +    frame dimensions and the reported MB Size. For example, for a QCIF frame
> +    (176x144) if reported MB Size is 16, the delta_QP array must contain
> +    99 entries (176 x 144 / 16 x 16).
> +
>   .. raw:: latex
> 
>       \normalsize
> diff --git a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
> index 6182b4e2d2ee002c0d3562e1cc3bc2fd9c4286d6..b036ed3ec2f0744175cad1cbc4e73fe828e0c955 100644
> --- a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
> +++ b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
> @@ -141,6 +141,7 @@ replace symbol V4L2_CTRL_TYPE_STRING :c:type:`V4L.v4l2_ctrl_type`
>   replace symbol V4L2_CTRL_TYPE_U16 :c:type:`V4L.v4l2_ctrl_type`
>   replace symbol V4L2_CTRL_TYPE_U32 :c:type:`V4L.v4l2_ctrl_type`
>   replace symbol V4L2_CTRL_TYPE_U8 :c:type:`V4L.v4l2_ctrl_type`
> +replace symbol V4L2_CTRL_TYPE_S8 :c:type:`V4L.v4l2_ctrl_type`
>   replace symbol V4L2_CTRL_TYPE_MPEG2_SEQUENCE :c:type:`V4L.v4l2_ctrl_type`
>   replace symbol V4L2_CTRL_TYPE_MPEG2_PICTURE :c:type:`V4L.v4l2_ctrl_type`
>   replace symbol V4L2_CTRL_TYPE_MPEG2_QUANTISATION :c:type:`V4L.v4l2_ctrl_type`
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> index d78328152b7552f8f0d30a9e2f7c104bfd4b70d3..fe5f8992389c32d8f35f432229ef2f734002644e 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> @@ -188,6 +188,10 @@ still cause this situation.
>         - ``p_u32``
>         - A pointer to a matrix control of unsigned 32-bit values. Valid if
>   	this control is of type ``V4L2_CTRL_TYPE_U32``.
> +    * - __s8 *
> +      - ``p_s8``
> +      - A pointer to a matrix control of signed 8-bit values. Valid if
> +	this control is of type ``V4L2_CTRL_TYPE_S8``.
>       * - __s32 *
>         - ``p_s32``
>         - A pointer to a matrix control of signed 32-bit values. Valid if
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> index 82c8b52e771ce9301491b3f752e501a8fe7e2434..57e1652ae72e0324742142446acf32a16b94941c 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> @@ -425,6 +425,12 @@ See also the examples in :ref:`control`.
>         - any
>         - An unsigned 32-bit valued control ranging from minimum to maximum
>   	inclusive. The step value indicates the increment between values.
> +    * - ``V4L2_CTRL_TYPE_S8``
> +      - any
> +      - any
> +      - any
> +      - A signed 8-bit valued control ranging from minimum to maximum
> +	inclusive. The step value indicates the increment between values.
>       * - ``V4L2_CTRL_TYPE_MPEG2_QUANTISATION``
>         - n/a
>         - n/a
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index 327976b14d50b73a631e4d2ed95d9f4d146c45ab..a1806ddbc797efa52e83cd3f685ef70d5b5483d2 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -64,6 +64,7 @@ union v4l2_ctrl_ptr {
>   	s32 *p_s32;
>   	s64 *p_s64;
>   	u8 *p_u8;
> +	s8 *p_s8;
>   	u16 *p_u16;
>   	u32 *p_u32;
>   	char *p_char;
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index affec0ab4781507be761cb791ff737460acf9cb7..00a2c48630bd198faa9a2b833a9aa346d8357555 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -920,6 +920,8 @@ enum v4l2_mpeg_video_av1_level {
>   };
> 
>   #define V4L2_CID_MPEG_VIDEO_AVERAGE_QP  (V4L2_CID_CODEC_BASE + 657)
> +#define V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP  (V4L2_CID_CODEC_BASE + 658)
> +#define V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE  (V4L2_CID_CODEC_BASE + 659)
> 
>   /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
>   #define V4L2_CID_CODEC_CX2341X_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1000)
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 5373dba640fae3d19247ab1c74ba336e05dc0fe0..3ed343f8c81e0c9240d5a7e5b2dfe365a529fb6c 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -1884,6 +1884,7 @@ struct v4l2_ext_control {
>   		__s64 value64;
>   		char __user *string;
>   		__u8 __user *p_u8;
> +		__s8 __user *p_s8;
>   		__u16 __user *p_u16;
>   		__u32 __user *p_u32;
>   		__s32 __user *p_s32;
> @@ -1961,6 +1962,7 @@ enum v4l2_ctrl_type {
>   	V4L2_CTRL_TYPE_U8	     = 0x0100,
>   	V4L2_CTRL_TYPE_U16	     = 0x0101,
>   	V4L2_CTRL_TYPE_U32	     = 0x0102,
> +	V4L2_CTRL_TYPE_S8		 = 0x0103,
>   	V4L2_CTRL_TYPE_AREA          = 0x0106,
>   	V4L2_CTRL_TYPE_RECT	     = 0x0107,
> 
> @@ -1997,6 +1999,7 @@ enum v4l2_ctrl_type {
>   	V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY = 0x281,
>   	V4L2_CTRL_TYPE_AV1_FRAME	    = 0x282,
>   	V4L2_CTRL_TYPE_AV1_FILM_GRAIN	    = 0x283,
> +

stray \n

>   };
> 
>   /*  Used in the VIDIOC_QUERYCTRL ioctl for querying controls */
> 
> --
> 2.34.1
> 

