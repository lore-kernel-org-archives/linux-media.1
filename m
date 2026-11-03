Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793725372;
	b=KwZduwc33pGUHQyRpz8Y/Sl39eS3Ch7wklnmbkY6+R20uP0pzyGvMsGR9U4goe/Iqrfa
	 +z6sEBOoEFrtp+gNWqpszgPsnw7aRNX5/EWgw4BykWt4MFD9ILnj0tfcW/scTGaIwcB8C
	 QseBFxxuUFoX1HymX0M2pCgCEBeUCUXHJjMFacZ6+wqI7hcZ0hni4q80j9MyVGF9lU+rD
	 wuwgk8MoBINpJJMPg7UFTSY7N9PUL6YMn8GWFpKnNX1ErnuB2YfyGzIj51bUJflHlYgU5
	 ArjikDOGYBaTWhx5AZO/dJ0wpH2+GJc5vnoxoHfHDjkTM/hwxfngIyrThOP4JeD7dRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793725372;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=52xK7NB04mNolNPDCC39n7+kwz3kbfpLQusqgrq+0Ao=;
	b=2UoLUfxuqZ/vbSfmOXrYyGwzqe46Vl1dsqW/kSP90i+s2D0k9ppqa7ncuyOAgvn6+Ylc
	 AG5WS3IzOuMLY6X9DfAVnH1rTMYKjEyrRJa+/cBJmW3K6uUmyfWwroMJj57Tf1hFD4Hpt
	 nc1+erQDwvltEj+VC6Kw/onwnGfQ/GBjEhQxfTvlp9LKtUXMhdGcSon1mBydKIT7n8kgk
	 BU0etcywqbqSFEjQMAuY/LMaKFKfpQ0lsyQjFcRknT87L69EFpHb+4JRdsA2cHw4ge56S
	 h9T52AHxpyUmLcO45hD6rGYSPJNkuVPvvBFjP5O7xm+4MbD9Y8AyTfbg/JijObqZjEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=MJPlYex+;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A09606A327
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 17:02:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94A09606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=MJPlYex+
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5F165BC;
	Tue,  3 Nov 2026 18:00:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793725231;
	bh=A6obJZZta6E1OekhE9aXtMecDxGPKWNSTu2IvnivtSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MJPlYex+4z2SjIh/V8BR6Voqv1LjuDOKzdSCRItwyAW+BjAZluZH4sOsi/NHsknOB
	 3bMiWSr9OuyIr7ea2gPv2Agy93GPmJsRm0s3iyC3j4OyDUpCc4e4iN0NaVG7mudKvU
	 gGOqRUl/mv0gxJnGfW2zzLKrab55zrLy4HMlvbSU=
Date: Tue, 3 Nov 2026 19:02:47 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>,
	"Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>,
	Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 02/16] media: v4l2-device: Add struct v4l2_device.flags
Message-ID: <20261103170247.GA3716866@killaraus.ideasonboard.com>
References: <20261103-rkisp1-suspend-and-resume-v1-0-08f863b6fdc5@ideasonboard.com>
 <20261103-rkisp1-suspend-and-resume-v1-2-08f863b6fdc5@ideasonboard.com>
 <25952c4c-36db-4361-9ab6-0ca1b1f960bf@oss.qualcomm.com>
 <3478043661b8d89ba5089f56383926785570b7b3.camel@ndufresne.ca>
 <d78d7ee3-0c48-484a-a5b0-9ba44ebf9171@ideasonboard.com>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <d78d7ee3-0c48-484a-a5b0-9ba44ebf9171@ideasonboard.com>

On Tue, Nov 03, 2026 at 02:42:30PM +0000, Daniel Scally wrote:
> On 03/11/2026 13:51, Nicolas Dufresne wrote:
> > Le mardi 03 novembre 2026 à 10:09 +0200, Gjorgji Rosikopulos (Consultant) a
> > écrit :
> >> On 11/3/2026 9:40 AM, Daniel Scally wrote:
> >>> Add a flags field to struct v4l2_device, along with a single flag
> >>> value that is designed to tell v4l2-async in which direction data
> >>> flows for this v4l2 device so that it knows how to set up device
> >>> links between subdevices connected using the async APIs.
> >>>
> >>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> >>> ---
> >>>   include/media/v4l2-device.h | 7 +++++++
> >>>   1 file changed, 7 insertions(+)
> >>>
> >>> diff --git a/include/media/v4l2-device.h b/include/media/v4l2-device.h
> >>> index 25f69b1b8db03d077f7570471d5c6910fcafe110..9b17916d63641ba637cf8c37aa925749bd4e2134 100644
> >>> --- a/include/media/v4l2-device.h
> >>> +++ b/include/media/v4l2-device.h
> >>> @@ -15,6 +15,9 @@
> >>>   
> >>>   struct v4l2_ctrl_handler;
> >>>   
> >>> +/* Set this flag if this V4L2 device is an "output" rather than an "input". */
> >>> +#define V4L2_DEVICE_FL_IS_OUTPUT			BIT(0)
> >>
> >> Just for the clarification do we change the meaning of output->capture to input->output?
> >> I know that output is confusing for everyone including me but somehow i get used to it.
> >> However to clarify what this means will be helpful :-)
> > 
> > I agree this is confusing. To avoid all the legacy, we could use PRODUCER /
> > CONSUMER, or does anyone has a better idea?
> 
> I have no better ideas - naming things was never my strong suit - so
> happy to use PRODUCER / CONSUMER.

How do you deal with memory-to-memory devices that are both consumers
and producers ?

> >>> +
> >>>   /**
> >>>    * struct v4l2_device - main struct to for V4L2 device drivers
> >>>    *
> >>> @@ -30,6 +33,9 @@ struct v4l2_ctrl_handler;
> >>>    * @ref: Keep track of the references to this struct.
> >>>    * @release: Release function that is called when the ref count
> >>>    *	goes to 0.
> >>> + * @flags: device flags. Can be:
> >>> + *   %V4L2_DEVICE_FL_IS_OUTPUT - Set this flag if this V4L2 device is an
> >>> + *   "output" rather than an "input"
> >>>    *
> >>>    * Each instance of a V4L2 device should create the v4l2_device struct,
> >>>    * either stand-alone or embedded in a larger struct.
> >>> @@ -54,6 +60,7 @@ struct v4l2_device {
> >>>   	struct v4l2_prio_state prio;
> >>>   	struct kref ref;
> >>>   	void (*release)(struct v4l2_device *v4l2_dev);
> >>> +	u32 flags;
> >>>   };
> >>>   
> >>>   /**

-- 
Regards,

Laurent Pinchart
